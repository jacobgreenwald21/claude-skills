---
trigger: "Use this skill when the user wants to evaluate a specific skill's performance — comparing output with vs. without the skill loaded, grading against assertions, and reporting pass rates. Trigger phrases include: 'myth-busters', 'test the skill', 'benchmark [skill name]', 'run myth-busters on [skill]', 'evaluate the [skill] skill'. Use after building a new skill or when a skill feels like it's underperforming. Do NOT trigger for general skill audits (use Commander or optimus-prime instead) — this skill requires a specific target skill and test prompt."
skill: myth-busters
---

# Myth-Busters Skill

## Purpose
Run a structured A/B evaluation of a specific skill — same prompt, with and without the skill active — grade both against explicit assertions, and report a pass rate comparison plus relative response cost. Tells you whether the skill actually improves output.

## Phase 1 — Intake
Collect from the user's trigger message:
- **Target skill**: which skill is being evaluated (e.g., "verdict", "yoda")
- **Test prompt**: the specific prompt to run through both conditions. If not provided, ask for one before proceeding.
- **Extra assertions**: any assertions Jacob wants added beyond what's auto-derived. Optional.

If the target skill or test prompt is missing, ask for both before proceeding. Do not guess.

## Phase 2 — Load and Analyze the Target Skill
Read `~/.claude/skills/[target-skill]/SKILL.md`.

Check for transcript context:
- If a full skill interaction exists above in this chat session → use it. Derive assertions across all phases and grade against the complete transcript. Skip the scope question and proceed directly to assertion derivation.
- If no transcript exists → ask the scope question before deriving assertions:

  > "Before I derive assertions, I need to know what we're testing. Three options:
  >
  > A) First response only — I grade only what Claude returns on the very first trigger. Good for a quick sanity check that the skill fires and Phase 1 runs correctly. Use this when you just want to confirm the skill is working before a full run.
  >
  > B) Specific phase — I grade one phase in isolation. Good when you know a particular phase is broken. Tell me which phase number.
  >
  > C) Full transcript — I grade the entire interaction end to end. Best for a real validation baseline. Paste the transcript or run the skill in this session first.
  >
  > If you're not sure, start with A. It's the fastest way to catch obvious failures before committing to a full run."

Once scope is confirmed, auto-derive assertions from:
- The **Purpose** section: what the skill is supposed to produce
- The **Guardrails** section: what the skill must never do
- The **Output format** section: structural requirements (format, sections, length constraints)

Scope assertions only to what is evaluable within the declared scope. Do not derive assertions for phases outside the scope.

Each assertion must be binary — pass or fail. Write them as explicit yes/no checks:
- "Output contains a clear recommendation" (not "output is good")
- "No jargon used without explanation"
- "Analogy appears before technical explanation"

Add any extra assertions Jacob provided. Aim for 4–7 total assertions. More than that and the evaluation loses signal.

## Phase 3 — Run With Skill
Using the test prompt, produce the response as if the skill is fully active:
- Follow the SKILL.md phase by phase
- Adhere to all output format and guardrail requirements
- Label this output clearly: **[WITH SKILL]**

Note approximate response length (word count or paragraph count — consistent metric).

## Phase 4 — Run Without Skill
Using the exact same test prompt, produce a plain response:
- Deliberately ignore the SKILL.md entirely
- Respond as Claude would by default with no skill context
- Label this output clearly: **[WITHOUT SKILL]**

Note approximate response length using the same metric as Phase 3.

## Phase 5 — Grade Both Runs
For each assertion, evaluate both the WITH and WITHOUT responses independently.
- Mark each: PASS or FAIL
- Add one line of reasoning per cell — what specifically passed or failed

Do not grade holistically. Each assertion is evaluated separately, mechanically.

## Phase 6 — Output the Report
Print inline in chat:

---
**Myth-Busters: [Target Skill]**
Test prompt: *"[the prompt used]"*

**Assertions**

| # | Assertion | With Skill | Without Skill |
|---|-----------|-----------|---------------|
| 1 | [Assertion text] | PASS — [reason] | FAIL — [reason] |
| 2 | [Assertion text] | PASS — [reason] | PASS — [reason] |
| … | … | … | … |

**Pass rate**
- With skill: X/Y passed
- Without skill: X/Y passed

**Response length**
- With skill: ~[N] words
- Without skill: ~[N] words (~[multiplier]x [longer/shorter])

**Verdict**
[2–3 sentences. Does the skill improve output on the assertions that matter? If it fails specific assertions, name which ones and what's likely causing the failure — phase issue, guardrail issue, or trigger design issue.]
---

## Output Format
Chat only. No files written. Both runs are shown inline so results are immediately visible.

## Guardrails
- Never proceed without a specific target skill and test prompt — do not invent either
- Never grade holistically — every assertion must have an explicit PASS or FAIL with a reason
- Never use vague assertions like "output is good" — each assertion must be binary and testable
- Keep assertions to 4–7 — more than that dilutes the signal
- The WITHOUT SKILL run must genuinely ignore the SKILL.md — do not let skill knowledge bleed through
- The verdict must name specific failing assertions if any exist, not just report the score
