---
trigger: "build a new skill, create a skill, I want a skill that, add a skill for, new skill for, skill that does"
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

### Phase 2 — Draft the Skill
Write a complete SKILL.md using this structure:
- YAML frontmatter with trigger phrases (use exact natural language Jacob would say)
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
1. Write the file to ~/.claude/skills/<skill-name>/SKILL.md
2. Restart Claude Code
3. Run the first test prompt
4. Report whether the skill fired correctly
5. If not, diagnose and revise trigger description

### Phase 6 — Iterate
If output quality is off after firing, identify which phase of the skill produced the problem and rewrite that section only. Never rewrite the whole skill for a small issue.

## Output Format
A complete, installable SKILL.md file written to the correct path. Plus a test report showing which test cases passed.

## Guardrails
- Never write a skill without completing the Phase 1 interview first
- Never use generic trigger phrases like "help me" or "do a task" — always use specific, natural language
- Never skip Phase 4 test cases — a skill nobody triggers is dead weight
- Never rewrite a working section when only one phase is broken
- Always confirm the install path before writing the file
- After writing any new SKILL.md, always add a one-line entry for the new skill to the skill portfolio list in ~/.claude/CLAUDE.md before closing out
- After adding the skill to CLAUDE.md, always prompt: "Skill built and added to CLAUDE.md. Want to run myth-busters on this now to validate against baseline?"
