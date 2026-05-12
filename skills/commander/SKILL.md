---
name: commander
description: Session auditor and self-improvement loop for Jacob's Claude Code skill ecosystem. Trigger this skill whenever Jacob says "run Commander." Responsibilities: capture misfires and session-triggered skills, audit only skills that fired (session-scoped), update MEMORY.md with session learnings, and back up the skills directory. Claude Code only — requires filesystem access. Do NOT trigger automatically; only fires on explicit "run Commander" call.
---

# Commander v8

Session auditor and self-improvement loop. Explicit trigger only: "run Commander."

---

## Overview

Commander does four things every run, in this order:

1. **Capture session scope** — ask about misfires AND which skills fired this session
2. **Audit session-triggered skills** — deep audit only for skills that actually ran; presence check for everything else
3. **Update MEMORY.md** — append session learnings (never overwrite)
4. **Back up skills directory** — date-stamped backup every run

> Full portfolio audit (trigger overlaps, dead weight, gap analysis across all skills) belongs to **optimus-prime**, not Commander. Commander's audit scope is session-scoped by design.

---

## Step 1 — Session Scope Capture

Ask Jacob two things in a single prompt:

> "Two quick questions before the audit:
> 1. Any skill misfires this session? If yes, describe what happened and the correct behavior. If no, say 'none.'
> 2. Which skills actually fired this session? List them (e.g., 'yoda, critical, checkpoint') or say 'none' if you didn't use any."

Wait for response. Process both answers:

**Misfires:** Note the skill name, what it did wrong, and the correct behavior. These get written to MEMORY.md in Step 3. Do NOT auto-rebuild — flag it and ask at the end of Step 2.

**Session-triggered skills:** This list becomes the Tier 1 deep-audit scope for Step 2. If Jacob says "none" or can't recall, do Tier 2 presence check only for all skills and note that no deep audit was run this session.

If no misfires and no skills triggered: proceed to Step 2 with empty Tier 1.

---

## Step 2 — Session-Scoped Skill Audit

Audit runs in two tiers based on what fired this session.

### Tier 1 — Deep Audit (session-triggered skills only)

For each skill Jacob listed in Step 1, read its full SKILL.md and check:

| Check | What to look for |
|-------|-----------------|
| Trigger clarity | Is the trigger phrase unambiguous? Could it fire accidentally? |
| Output format | Is the expected output clearly defined? |
| Stale references | Does it reference files, paths, or tools that no longer exist? |
| Conflicts | Does it conflict with another skill's trigger or behavior? |
| Missing guardrails | Are there edge cases with no handling? |
| Size | Is SKILL.md approaching 500 lines? Flag for refactor. |

### Tier 2 — Presence Check (all other installed skills)

For every skill NOT in the Tier 1 list, read only the first 15 lines (frontmatter + opening section). Confirm:
- File exists and is readable
- `name` field is present
- Trigger phrase is still defined
- No obvious corruption or empty body

Presence check does NOT evaluate quality, conflicts, or stale references — that's optimus-prime's job.

### Skills list (current ecosystem)

```
~/.claude/skills/avoid-ai-writing/SKILL.md
~/.claude/skills/checkpoint/SKILL.md
~/.claude/skills/code-debug/SKILL.md
~/.claude/skills/code-review/SKILL.md
~/.claude/skills/commander/SKILL.md
~/.claude/skills/critical/SKILL.md
~/.claude/skills/docx/SKILL.md
~/.claude/skills/fuel-gauge/SKILL.md
~/.claude/skills/handoff/SKILL.md
~/.claude/skills/handoff/chat-SKILL.md
~/.claude/skills/handoff/claude-code-SKILL.md
~/.claude/skills/jarvis/SKILL.md
~/.claude/skills/myth-busters/SKILL.md
~/.claude/skills/optimus-prime/SKILL.md
~/.claude/skills/pdf/SKILL.md
~/.claude/skills/pptx/SKILL.md
~/.claude/skills/roundtable/SKILL.md
~/.claude/skills/skill-builder/SKILL.md
~/.claude/skills/skill-namer/SKILL.md
~/.claude/skills/verdict/SKILL.md
~/.claude/skills/xlsx/SKILL.md
~/.claude/skills/yoda/SKILL.md
```

### Audit output

```
SKILL AUDIT — [DATE]

Tier 1 (deep audit — session-triggered):
✓ critical/SKILL.md — No issues
⚠ yoda/SKILL.md — [issue description]

Tier 2 (presence check — not triggered this session):
✓ avoid-ai-writing/SKILL.md — present
✓ checkpoint/SKILL.md — present
...

Deep audit issues: N | Presence failures: N
```

After the report, ask:
> "Want me to rebuild any of these now? List the ones you want fixed, or say 'none' to skip."

Wait for response before proceeding.

After applying any fixes, sync to GitHub. Skills and CLAUDE.md are symlinked into the repo — no copying needed. If any skill's trigger, purpose, or behavior changed in a user-visible way, update `~/Desktop/AI/claude-skills/README.md` first, then:

```bash
git -C ~/Desktop/AI/claude-skills add .
git -C ~/Desktop/AI/claude-skills commit -m "commander sync [DATE]"
git -C ~/Desktop/AI/claude-skills push origin main
```

Confirm before running the commit/push.

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

**3c — Append to session-log.md**
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
COMMANDER v8 — SESSION COMPLETE [DATE]

Skills triggered this session: N (deep audited)
Skills presence-checked: N
Deep audit issues: N | Presence failures: N
Misfires logged: N
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

2. **fuel-gauge** — run the fuel-gauge token audit. Produces a ranked cost table + efficiency recommendations as a section inside the Commander report.

3. **Commander audit** — run the full Commander sequence: session scope capture → session-scoped skill audit → MEMORY.md update → backup.

4. **GitHub sync** — skills and CLAUDE.md are symlinked into the repo, so no copying needed:
   1. Update `~/Desktop/AI/claude-skills/README.md` if any skill's trigger, purpose, or behavior changed
   2. Stage everything: `git -C ~/Desktop/AI/claude-skills add .`

   Prompt Jacob: "Ready to push updates to GitHub. Confirm?"
   - On confirmation: `git -C ~/Desktop/AI/claude-skills commit -m "session sync [DATE]" && git -C ~/Desktop/AI/claude-skills push origin main`
   - If Jacob declines: skip the commit/push and proceed to jarvis.

5. **jarvis** — read session context and memory files, then surface 3 short-term + 1 long-term idea based on everything that just happened.

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
- Tier 1 deep audit only runs for skills Jacob confirms were triggered this session
- Full portfolio audit (cross-skill patterns, dead weight, gaps) → optimus-prime, not Commander
- If a Tier 1 finding is ambiguous (e.g., a stale reference that may still exist), flag it as uncertain rather than marking it as a confirmed issue
