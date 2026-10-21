---
name: skill-builder
description: "Build a new skill or tune an existing one in Jacob's portfolio: intent interview, draft SKILL.md with phased instructions and guardrails, trigger-description tuning, test cases, archive-then-install, iterate. Trigger phrases: 'build a new skill', 'create a skill', 'I want a skill that', 'add a skill for', 'new skill for', 'skill that does', 'tune the [skill] skill', 'tune the descriptions for', 'fix this skill', 'this skill isn't triggering'. Do NOT use for naming a skill (skill-namer), A/B testing one (myth-busters), or portfolio-wide audits (optimus-prime / Commander)."
---

# Skill-Builder Skill

## Purpose
Interview Jacob on intent, draft a new SKILL.md with proper structure, run test cases, tune the trigger description, and iterate until the skill is working correctly.

## Skill Anatomy (Every skill must have these four parts)
1. Trigger description — YAML frontmatter, most important line. Determines whether Claude auto-activates the skill.
2. Phased instructions — step-by-step pipeline with clear inputs and outputs per phase
3. Output format — what the skill produces (files, tables, text, HTML — never just chat)
4. Guardrails — rules that prevent bad output

## Process

### Phase 1 — Intent Interview
Ask these questions before writing anything:

1. What repeatable task is this skill for?
2. What does a great output look like? What does a bad output look like?
3. What information does Claude need to do this well — and where does that information come from (files, user input, context)?
4. What are the constraints or rules that must always apply?
5. Who triggers this skill — Jacob directly, or should it auto-fire on certain phrases?
6. What phrases would Jacob naturally say when he wants this skill to run?

Do not proceed to Phase 2 until all six questions are answered.

**Tuning an existing skill:** read its SKILL.md first. Answer the six questions from what it already says, and ask Jacob only the ones it leaves open or the judgment calls (overlaps with other skills, scope changes).

### Phase 2 — Draft the Skill
Write a complete SKILL.md using this structure:
- YAML frontmatter with exactly these keys — `name:` (the folder name) and `description:` (one quoted line). Claude Code ignores any other key such as `trigger:`; a skill without `description:` gets listed by its H1 title and can never auto-trigger. The description must, in this order: say what the skill does, list trigger phrases (exact natural language Jacob would say), and name what NOT to use it for (and which skill to use instead). Keep it under 1,536 characters — the listing truncates past that.
- Anything that should make the skill fire (when to offer it, proactive cases) goes in the description. Body text is invisible to Claude until the skill is already running.
- Purpose section (1-2 sentences)
- Phased instructions (Phase 1, Phase 2, etc. — each with clear input and output)
- Output format (specific and concrete)
- Guardrails (3-5 rules that prevent the most likely failure modes)

### Phase 3 — Trigger Tuning
Review the trigger description critically:
- Is it specific enough to not fire accidentally?
- Is it broad enough to catch natural variations?
- Does it use phrases Jacob would actually say?

Revise if needed. State why each trigger phrase was chosen.

### Phase 4 — Test Cases
Generate 3 test prompts:
- One that should trigger the skill
- One that should NOT trigger the skill (too vague or different domain)
- One edge case

For each, predict whether the skill fires and why.

### Phase 5 — Install and Verify
1. Before writing, check if `~/.claude/skills/<skill-name>/SKILL.md` already exists.
   If it does, determine the next version number by checking `~/.claude/skills/<skill-name>/archive/` for existing versioned files.
   Create `~/.claude/skills/<skill-name>/archive/` if it does not exist.
   Copy the current SKILL.md to `~/.claude/skills/<skill-name>/archive/SKILL-v[N].md` before overwriting.
2. Write the new file to `~/.claude/skills/<skill-name>/SKILL.md`
3. Open a new session (Command Palette → Open in New Tab) so the new description loads
4. Run the first test prompt
5. Report whether the skill fired correctly
6. If not, diagnose and revise trigger description

### Phase 6 — Iterate
If output quality is off after firing, identify which phase of the skill produced the problem and rewrite that section only. Never rewrite the whole skill for a small issue.

Before overwriting during iteration, archive the current version following the same archive step in Phase 5.

## Output Format
A complete, installable SKILL.md file written to the correct path. Plus a test report showing which test cases passed.

## Guardrails
- Never write a skill without completing the Phase 1 interview first
- Never use generic trigger phrases like "help me" or "do a task" — always use specific, natural language
- Never skip Phase 4 test cases — a skill nobody triggers is dead weight
- Never rewrite a working section when only one phase is broken
- Always confirm the install path before writing the file
- Before writing any SKILL.md, check for an existing file and archive it first — never overwrite without archiving
- Never add skill lists or version notes to `~/.claude/CLAUDE.md` — it loads every turn. After writing any new SKILL.md, add a dated entry to `~/Desktop/AI/claude-skills/CHANGELOG.md` (newest at top; reuse today's entry if one exists)
- `~/.claude/skills/` is symlinked into the repo, so the file is already in place — no copying. Identify the correct category (meta, code, writing, session, document, tools, or agentic loops) and add a new row to that category's table in `~/Desktop/AI/claude-skills/README.md` with three columns: skill name, trigger phrase(s), and a one-line purpose pulled from the new SKILL.md. Then run: `git -C ~/Desktop/AI/claude-skills add . && git -C ~/Desktop/AI/claude-skills commit -m "add [skill-name] skill"` — then prompt: "Ready to push to GitHub. Confirm?"
- After the GitHub sync step, prompt: "Skill built and synced. Want to run myth-busters on this now to validate against baseline? Run in this session so myth-busters has access to the full transcript above."
- When iterating on an existing skill in Phase 6, check whether the skill's row in `~/Desktop/AI/claude-skills/README.md` needs updating. If the purpose or trigger phrases changed, update the row before committing to GitHub.
- If the skill fires but the output is partially correct or ambiguous at Phase 5, report it as uncertain rather than marking it as verified — do not round up to success
