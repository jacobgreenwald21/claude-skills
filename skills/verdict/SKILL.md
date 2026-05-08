---
trigger: "Use this skill when the user wants decision support — evaluating options, weighing tradeoffs, and getting a clear recommendation with reasoning. Trigger phrases include: 'what's the verdict on [X]', 'help me decide between [X] and [Y]', 'make the call on [X]', 'verdict: [options]', 'which should I use [X] or [Y]', 'help me choose between'. Use for tool, approach, architecture, or similar decisions. Do NOT trigger for open-ended brainstorming, general research, or requests that don't involve choosing between defined options."
skill: verdict
---

# Verdict Skill

## Purpose
Given a set of options, evaluate tradeoffs and deliver a clear recommendation with reasoning. No hedging, no false balance — this skill produces a decision.

## Proactively invoke this skill when
- The user is weighing two or more named options and hasn't made a call yet
- The user says "I'm not sure whether to..." or "should I use X or Y"
- The user has laid out tradeoffs in conversation but hasn't reached a conclusion
- The user is circling a decision — revisiting the same options more than once

Do not invoke automatically — offer it: "Want me to run a verdict on this?"

## Phase 1 — Understand the Decision
Extract from what the user provides:
- The options being considered
- Any stated constraints, priorities, or context (cost, speed, complexity, team size, etc.)
- What the decision is actually for (tool choice, architecture pattern, approach selection, etc.)

If the options are clear but the constraints or priorities are genuinely ambiguous — and they would meaningfully change the recommendation — ask one focused clarifying question before proceeding. Do not ask multiple questions. Do not ask questions that can be inferred from context. If you have enough to make a defensible call, make it.

## Phase 2 — Identify the Deciding Factors
Do not evaluate every possible dimension. Identify the 2–4 factors that actually matter for this decision given the constraints. Ignore dimensions where the options are roughly equivalent — they don't move the decision.

For each deciding factor, assess how each option performs. Be honest about where an option is clearly better or worse — do not soften real differences.

## Phase 3 — Make the Call
Pick one option. State it clearly at the top. Then explain why — specifically, based on the deciding factors, not general praise. If one option dominates on the factors that matter, say so directly.

If the recommended option has a meaningful downside or caveat, name it in one line. Do not hide it.

Never recommend "it depends" as a final answer. If the right choice genuinely varies by condition, state the condition and make the call for each branch — then recommend the branch most likely to apply.

## Phase 4 — Output
Print inline in chat. Use clean markdown so the output can be copied or exported without reformatting:

---
**Verdict: [Recommended option]**

**Options considered**
1. [Option A] — [one-line description]
2. [Option B] — [one-line description]
(add more as needed)

**What matters here**
- [Deciding factor 1]: [how options compare, who wins]
- [Deciding factor 2]: [how options compare, who wins]
(2–4 factors only)

**Why [recommended option]**
[2–4 sentences. Specific reasoning tied to the factors above. No filler.]

**Main caveat**
[One sentence on the primary risk or condition under which this recommendation breaks down. Omit if there is none worth flagging.]
---

## Output Format
Chat only. Structured markdown for easy copy/export. No files written unless Jacob explicitly asks for a saved version.

## Guardrails
- Always produce a recommendation — never end on "it depends" without resolving it
- Never list every pro and con — focus only on the factors that drive the decision
- Never treat options as equally valid when the evidence points clearly one way
- Do not default to the "safest" or most popular option — recommend the best one for the situation
- Ask at most one clarifying question, and only if the answer would genuinely change the recommendation
