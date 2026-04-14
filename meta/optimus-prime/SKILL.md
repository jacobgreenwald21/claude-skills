---
trigger: "Use this skill when the user wants a holistic cross-skill analysis — looking for patterns, overlaps, dead weight, and systemic gaps across the entire skill portfolio. Trigger phrases include: 'optimus-prime', 'optimus', 'autobots roll out', 'cross-skill review', 'skill system audit'. Do NOT trigger for individual skill audits (use Commander instead) or for building new skills (use skill-builder). This is a system-level review, not a single-skill review."
skill: optimus-prime
---

# Optimus Prime Skill

## Purpose
Analyze the skill portfolio holistically — find trigger overlaps, underused skills, usage habits, and systemic gaps. Where Commander audits individual skills, Optimus Prime finds cross-skill patterns. Output is specific findings with concrete next steps, not general observations.

## Phase 1 — Load the Portfolio
Read all of the following:

1. **Skill files** — read every SKILL.md in `~/.claude/skills/*/SKILL.md`. For each skill, note: trigger phrases, purpose, output format, and any stated relationships to other skills.
2. **Memory files** — read `~/.claude/projects/-Users-jacob/memory/` for any feedback memories (misfires, corrections, confirmed approaches) and project memories that reference skill usage.
3. **CLAUDE.md** — read the skill portfolio list and any usage notes there.

Build a working map of: what each skill does, what triggers it, and what it produces.

## Phase 2 — Find Cross-Skill Patterns
Analyze the portfolio for the following, in order of priority:

**Trigger overlap and competition**
- Identify any two or more skills whose trigger phrases could plausibly fire on the same input.
- Flag pairs where the distinction is unclear or where a natural phrase might route to the wrong skill.
- Note: ambiguity between related skills (e.g., checkpoint vs. roundtable) is worth flagging even if the triggers are technically different.

**Underused or dead-weight skills**
- Cross-reference memory feedback for any skills that were built but rarely or never triggered, or that consistently misfired.
- Flag skills whose trigger phrases are too narrow, too vague, or phrased in ways Jacob probably wouldn't naturally say.

**Usage habit patterns**
- Look for evidence (in memory feedback or skill structure) of recurring behaviors: Jacob frequently needing to re-explain context, repeating the same setup phrase, or calling multiple skills in a fixed sequence.
- If a pattern recurs, it may signal a missing skill, a missing skill combination, or a habit that a skill could streamline.

**Portfolio gaps**
- Given what's been built and what's in memory about Jacob's work, identify categories of repeatable work that have no skill coverage.
- Do not suggest gaps for hypothetical tasks — only for things that appear in actual session history or memory.

## Phase 3 — Produce Findings
For each finding, be specific about:
- What the problem or pattern is
- Which skills are involved
- What the fix looks like (edit a trigger, merge two skills, build a new one, retire a skill, etc.)

Do not produce findings without a concrete next step.

## Phase 4 — Output
Print inline in chat. Group findings by type:

---
**Optimus Prime — Cross-Skill Review**

**Trigger overlaps** *(skills that could compete or misfire together)*
- [Skill A] vs [Skill B]: [What the overlap is. Suggested fix: specific trigger wording change or clarification to add.] Consider running myth-busters on [skill name] to measure the performance gap.
(Omit section if no overlaps found)

**Underused or weak skills** *(dead weight or poor trigger design)*
- [Skill name]: [Why it's at risk — trigger too narrow, never fires, etc. Suggested fix: reword trigger, retire the skill, or expand scope.] Consider running myth-busters on [skill name] to measure the performance gap.
(Omit section if none found)

**Usage habit patterns** *(recurring behaviors a skill could streamline)*
- [Pattern observed]: [What Jacob keeps doing manually or repeatedly. Suggested fix: new skill, skill update, or workflow change.]
(Omit section if none found)

**Portfolio gaps** *(missing coverage for real recurring work)*
- [Gap]: [What work has no skill, based on actual session/memory evidence. Suggested fix: build X skill or extend Y skill.]
(Omit section if none found)

**Recommended priority order**
[Numbered list of the top 3 actions to take, ranked by impact. One line each.]
---

## Output Format
Chat only. No files written. No memory updates. No skill edits made automatically — findings are advisory.

## Guardrails
- Never produce findings without a specific next step — "consider improving X" is not a finding
- Never flag trigger overlap unless there is a realistic natural phrase that would misfire — don't invent edge cases
- Never suggest gaps based on hypothetical future work — only on evidence from session history or memory
- Do not duplicate Commander's individual-skill audit work — focus only on cross-skill patterns and systemic issues
- Run when the portfolio has meaningfully grown or when Commander has flagged recurring cross-skill issues — not on a fixed schedule
- Omit any section that has no real findings rather than padding with weak observations
