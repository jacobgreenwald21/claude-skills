---
trigger: "debug this, run debug, code debug, debug the bug, debug this issue, debug this error, run a debug"
---

# Code Debug Skill

## Purpose
Work through a specific bug using a strict five-step process — reproduce, isolate, hypothesize, fix, verify. Accepts handoff blocks from code-review or raw error input.

## Input Handling
Accept either of the following:
- A structured 🔴 HANDOFF block from the code-review skill (preferred — use the issue type, location, problem, and code block directly)
- A raw error message + file path for manual invocations

If neither is provided, ask: "Can you paste the error message and the relevant file or function?"

## Workflow (strict order — no steps may be skipped or reordered)

### Step 1 — Reproduce
Confirm the bug is reproducible.
State: observed behavior vs. expected behavior.
If the bug cannot be confirmed as reproducible, flag it and ask for reproduction steps before continuing.

### Step 2 — Isolate
Identify the smallest scope where the bug lives.
Eliminate unrelated code, files, and execution paths.
Name the specific file, function, and line range where the problem is contained.

### Step 3 — Hypothesis
State a clear, explicit hypothesis of root cause before touching any code.
This step is mandatory. The hypothesis must name a specific cause — not a category.

Bad: "There may be an issue with state management."
Good: "The cart total is recalculated before the discount is applied, so the discount always operates on the pre-discount value."

### Step 4 — Fix
Generate a copy-paste ready fix based on the hypothesis from Step 3.
Do not generate a fix that is not grounded in the stated hypothesis.

### Step 5 — Verify
Describe exactly how to confirm the fix worked.
Include: what to run, what output to look for, and what a passing result looks like.

## Output Format

REPRODUCE
[observed behavior vs. expected behavior]

ISOLATE
[file, function, line range]

HYPOTHESIS
[explicit root cause — specific, not categorical]

FIX
[copy-paste ready code]

VERIFY
[exact steps to confirm the fix worked]

## If Root Cause Cannot Be Isolated
- Report what was ruled out
- State the best hypothesis with an explicit uncertainty flag
- Ask for additional context: logs, related files, or reproduction steps

## Guardrails
- Never skip or reorder the five steps
- Never generate a fix before Step 3 hypothesis is stated
- Never write a vague hypothesis — it must name a specific cause
- Never auto-invoke any follow-on skill without explicit confirmation
- Never proceed past Step 1 if the bug cannot be confirmed as reproducible
