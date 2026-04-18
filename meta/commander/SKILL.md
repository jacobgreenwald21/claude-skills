---
name: commander
description: Session auditor and self-improvement loop for Jacob's Claude Code skill ecosystem. Trigger this skill whenever Jacob says "run Commander." Responsibilities: audit all installed skills and flag issues, capture mid-session skill misfires, update MEMORY.md with session learnings, and back up the skills directory. Claude Code only — requires filesystem access. Do NOT trigger automatically; only fires on explicit "run Commander" call.
---

# Commander

Session auditor and self-improvement loop. Explicit trigger only: "run Commander."

---

## Overview

Commander does four things every run, in this order:

1. **Capture mid-session misfires** — ask if any skills misfired this session
2. **Audit all installed skills** — scan each SKILL.md and flag issues
3. **Update MEMORY.md** — append session learnings (never overwrite)
4. **Back up skills directory** — date-stamped backup every run

---

## Step 1 — Mid-Session Misfire Capture

Ask Jacob:

> "Any skill misfires this session? If yes, describe what happened and what the correct behavior should have been. If no, say 'none' and we'll move on."

Wait for response. If misfires are reported:
- Note the skill name, what it did wrong, and the correct behavior
- These get written to MEMORY.md in Step 3
- Do NOT auto-rebuild the skill — flag it and ask at the end of Step 2

If no misfires: proceed to Step 2.

---

## Step 2 — Skill Audit

Scan every SKILL.md in `~/.claude/skills/` and its subdirectories.

For each skill, check:

| Check | What to look for |
|-------|-----------------|
| Trigger clarity | Is the trigger phrase unambiguous? Could it fire accidentally? |
| Output format | Is the expected output clearly defined? |
| Stale references | Does it reference files, paths, or tools that no longer exist? |
| Conflicts | Does it conflict with another skill's trigger or behavior? |
| Missing guardrails | Are there edge cases with no handling? |
| Size | Is SKILL.md approaching 500 lines? Flag for refactor. |

Skills to audit (current ecosystem):

```
~/.claude/skills/avoid-ai-writing/SKILL.md
~/.claude/skills/busn4400/SKILL.md
~/.claude/skills/busn4400/references/blog-comment.md
~/.claude/skills/busn4400/references/blog-post.md
~/.claude/skills/busn4400/references/slack-comment.md
~/.claude/skills/busn4400/references/slack-post.md
~/.claude/skills/checkpoint/SKILL.md
~/.claude/skills/code-debug/SKILL.md
~/.claude/skills/code-review/SKILL.md
~/.claude/skills/commander/SKILL.md
~/.claude/skills/critical/SKILL.md
~/.claude/skills/docx/SKILL.md
~/.claude/skills/handoff/SKILL.md
~/.claude/skills/handoff/chat-SKILL.md
~/.claude/skills/handoff/claude-code-SKILL.md
~/.claude/skills/jarvis/SKILL.md
~/.claude/skills/myth-busters/SKILL.md
~/.claude/skills/optimus-prime/SKILL.md
~/.claude/skills/pdf/SKILL.md
~/.claude/skills/pptx/SKILL.md
~/.claude/skills/resume-tailoring/skills/resume-tailoring/SKILL.md
~/.claude/skills/roundtable/SKILL.md
~/.claude/skills/skill-builder/SKILL.md
~/.claude/skills/skill-namer/SKILL.md
~/.claude/skills/verdict/SKILL.md
~/.claude/skills/xlsx/SKILL.md
~/.claude/skills/yoda/SKILL.md
```

Output a clean audit report:

```
SKILL AUDIT — [DATE]

✓ critical/SKILL.md — No issues
✓ skill-builder/SKILL.md — No issues
⚠ busn4400/SKILL.md — [issue description]
...

Issues found: N
```

After the report, ask:
> "Want me to rebuild any of these now? List the ones you want fixed, or say 'none' to skip."

Wait for response before proceeding.

After applying any fixes, always sync the updated SKILL.md files to the GitHub repo using the path map below before moving to Step 3. For each skill changed, check if the README entry needs updating — if the skill's trigger, purpose, or behavior changed in a user-visible way, update `~/Desktop/AI/claude-skills/README.md` before committing.

**GitHub repo path map** (`~/Desktop/AI/claude-skills/`):

| Skill | Repo path |
|-------|-----------|
| avoid-ai-writing | writing/avoid-ai-writing/ |
| busn4400 | writing/busn4400/ |
| resume-tailoring | writing/resume-tailoring/ |
| code-debug | code/code-debug/ |
| code-review | code/code-review/ |
| docx | document/docx/ |
| pdf | document/pdf/ |
| pptx | document/pptx/ |
| xlsx | document/xlsx/ |
| commander | meta/commander/ |
| jarvis | meta/jarvis/ |
| myth-busters | meta/myth-busters/ |
| optimus-prime | meta/optimus-prime/ |
| skill-builder | meta/skill-builder/ |
| skill-namer | meta/skill-namer/ |
| handoff | meta/handoff/ |
| checkpoint | session/checkpoint/ |
| roundtable | session/roundtable/ |
| verdict | session/verdict/ |
| yoda | session/yoda/ |
| critical | tools/critical/ |

Sync command: `cp ~/.claude/skills/[skill]/SKILL.md ~/Desktop/AI/claude-skills/[repo-path]/SKILL.md`
Then stage and prompt to push: `git -C ~/Desktop/AI/claude-skills add . && git -C ~/Desktop/AI/claude-skills commit -m "commander sync [DATE]"` — confirm before pushing.

---

## Step 3 — Update Structured Memory

Memory directory: `~/.claude/projects/-Users-jacob/memory/`

Do two things in order:

**3a — Update open-items.md**
Read `~/.claude/projects/-Users-jacob/memory/open-items.md`. For each item:
- If it was resolved this session, delete it or mark it ~~resolved~~
- If new items were flagged this session (via "flag that" / "flag this"), append them with today's date
- If nothing changed, leave it as-is

**3b — Update project_skill_ecosystem.md**
Read the current file. Make targeted updates only:
- Add any new skills installed this session to the test status list
- Mark any open issues resolved if they were fixed
- Update the "open issues" list with anything newly flagged in Step 2
Never rewrite the file — surgical edits only.

**3d — Append to session-log.md**
File location: `~/.claude/projects/-Users-jacob/memory/session-log.md`

If the file does not exist, create it with this frontmatter:

```markdown
---
name: Session log
description: Chronological log of sessions — what was built, misfires, audit flags, decisions. Append-only.
type: project
---
```

Append a new entry:

```markdown
## Session — [DATE]
**Project:** [what Jacob was working on]
**Built or changed:** [list of changes made]
**Skill misfires:** [from Step 1, or "none"]
**Audit flags:** [from Step 2, or "none"]
**Decisions made:** [key decisions future Claude should know]
**Friction points:** [anything that slowed the session down]
---
```

Pull context from the conversation. Ask Jacob to confirm anything unclear before writing.
Also update MEMORY.md in `~/.claude/projects/-Users-jacob/memory/` to include a pointer to session-log.md if not already present.

---

## Step 4 — Back Up Skills Directory

Run every time Commander executes, regardless of whether issues were found.

Target: `~/Desktop/AI/scratch/skills-backup/`

Command:

```bash
cp -r ~/.claude/skills/ ~/Desktop/AI/scratch/skills-backup/skills-$(date +%Y-%m-%d)/
```

Confirm backup completed:

```
✓ Backup saved to ~/Desktop/AI/scratch/skills-backup/skills-[DATE]/
```

---

## Completion Output

After all four steps, output a clean session summary:

```
COMMANDER — SESSION COMPLETE [DATE]

Misfires logged: N
Skill issues flagged: N
MEMORY.md updated: ✓
Backup saved: ✓ skills-[DATE]

[If issues were flagged and Jacob chose to rebuild: list what was rebuilt]
[If no issues: "Ecosystem looks clean."]
```

---

## End-of-Session Chain

Triggered by: "wrap up", "end session", "close out", "wrap it up", or similar end-of-session phrases.

Note: "roundtable" alone triggers only the roundtable skill — not this chain. The full end-of-session chain only fires on "wrap up" / "end session" / "close out" variants. Do not fire this chain on "roundtable" by itself.

When this trigger fires, run the following sequence in order. Complete each step fully before starting the next.

1. **roundtable** — produce the human-readable session recap (what was built, where things stand, what's next). Follow the roundtable skill's output format exactly.

2. **Commander audit** — run the full Commander sequence: misfire capture → skill audit → MEMORY.md update → backup.

3. **GitHub sync** — copy any updated SKILL.md files and CLAUDE.md to `~/Desktop/AI/claude-skills/`, then stage all changes:
   ```bash
   git -C ~/Desktop/AI/claude-skills add .
   ```
   Prompt Jacob: "Ready to push updates to GitHub. Confirm?"
   - On confirmation: `git -C ~/Desktop/AI/claude-skills commit -m "session sync [DATE]" && git -C ~/Desktop/AI/claude-skills push origin main`
   - If Jacob declines: skip the commit/push and proceed to jarvis.

4. **jarvis** — read session context and memory files, then surface 3 short-term + 1 long-term idea based on everything that just happened.

Do not skip or reorder steps. Each step feeds context into the next — roundtable surfaces what was built, Commander logs it, GitHub sync keeps the repo current, jarvis uses that state to recommend what comes next.

---

## In-Session Misfire Logging (Between Commander Runs)

If Jacob says something like "that output was wrong, log it" at any point during a session:

1. Ask: "What skill misfired and what should it have done instead?"
2. Append a quick note to MEMORY.md immediately:

```markdown
## Mid-Session Flag — [DATE]
**Skill:** [skill name]
**What happened:** [description]
**Correct behavior:** [description]
*Note: not yet addressed — flag for next Commander run.*
---
```

3. Confirm: "Logged. Commander will pick this up at end of session."

---

## Rules

- Never auto-rebuild a skill without Jacob's explicit approval
- Never overwrite MEMORY.md — always append
- Always back up before making any skill changes
- Session end only — do not surface MEMORY.md at session start
- Claude Code only — this skill requires filesystem access
