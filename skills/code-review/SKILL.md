---
trigger: "review the code, code review, review this code, do a code review, review my code, run a code review, can you review the code"
---

# Code Review Skill

## Purpose
Perform a structured, prioritized code review on any scope — single file, folder, or feature — and return actionable findings with copy-paste-ready fixes. Ends with a required adversarial pass and a ship/hold verdict.

## Proactively invoke this skill when
- The user pastes a code block without an explicit request — offer to review it
- The user mentions a PR, a branch, or that something is "ready to merge"
- The user asks "does this look right?" or "anything wrong with this?" about code
- The user says they're "about to ship" or "about to deploy" something

Do not auto-start the review without confirmation — offer it and wait.

## Input Handling
Accept any of the following as input:
- A single file path
- A folder or feature directory
- A pasted code block
- A branch diff (run `git diff origin/<base>` automatically if on a feature branch)

If the scope spans multiple files or is too large to review in one pass, break it into named chunks (e.g., "Chunk 1: auth/", "Chunk 2: api/routes/"). Announce each chunk before reviewing it.

## Terse Mode
If the user passes `--terse`, skip all reasoning and explanations. Return only:
1. The severity-grouped findings list (icon + location + one-line problem, no fix prose)
2. The required Verdict line

No phase announcements. No handoff blocks. No offers to run debug.

## Severity Scale
- 🔴 Critical — will break in production or creates a security vulnerability
- 🟡 Warning — won't break immediately but will cause problems when extended or under load
- 🔵 Note — dead code, accessibility, minor convention issues

## Check Categories (run in priority order)
1. Bugs — logic errors, edge cases, unhandled states
2. Security — exposed routes, API key handling, injection vulnerabilities, auth gaps, LLM trust boundary violations
3. Conditional side effects — state mutations, async race conditions, or behavior that changes based on call order or context
4. Convention violations — patterns that break when the codebase grows
5. Dead code — unreferenced functions, unused imports, unreachable blocks (🔵 Note only)
6. Accessibility — missing alt text, poor contrast, keyboard nav issues (🔵 Note only)

## Process

### Phase 1 — Scope Assessment
Read the input. If multiple files or a large directory:
- List the chunks by name
- Announce: "Reviewing in [N] chunks: [list]. Starting with Chunk 1: [name]."

If a single file or small scope, proceed directly to Phase 2.

### Phase 2 — Review Pass
For each chunk (or full scope if small):
- Announce: "Reviewing [chunk name]..." before starting
- Run all six check categories in priority order
- Collect every finding before writing output

### Phase 3 — Adversarial Pass
Re-read the code from an adversarial frame:

*"Act as a chaos engineer. Your job is to find what fails in production — not what looks wrong in isolation. Look for: race conditions under load, trust boundary violations where user-controlled input reaches a privileged operation, conditional side effects that change behavior depending on call order, and anything that works in dev but silently breaks in prod. No compliments. No softening. Just the problems."*

Run this pass specifically against:
- Any code that handles user input, API responses, or external data
- Any LLM-generated or LLM-processed content flowing into the system
- Any async operations or stateful mutations

Collect adversarial findings separately. Merge them into the output in Phase 4.

### Phase 4 — Output
Return findings using this format for each issue:

[SEVERITY ICON] Issue type
Location: file + line or function name
Problem: one sentence description
Fix: copy-paste ready code or exact change

Group by severity: all 🔴 first, then 🟡, then 🔵.
If a severity tier has no findings, omit it entirely.
Tag any finding that came from the adversarial pass with `[chaos]`.

If no issues found in any tier: return "Code looks good — no issues found in [scope]."

End the output section with the required verdict line:

**Verdict: [ship / hold / fix-first] — [one specific reason naming the most critical finding, or confirming clean]**

### Phase 5 — Debug Handoff
After completing the full review, for each 🔴 Critical bug found, package a handoff block in this exact format:

🔴 HANDOFF
Issue type: [type]
Location: [file + line or function name]
Problem: [one sentence description]
Code: [relevant code block]

Then ask: "Found [N] critical bug(s). Want me to run debug on any of them? Handoff blocks are ready above."
Do not auto-invoke debug — wait for confirmation.

## Guardrails
- Never skip or reorder the six check categories
- Never return a finding without a location — vague observations are not findings
- Never return a finding without a fix (except 🔵 Notes, where a fix may be optional)
- Never skip the adversarial pass — it runs on every review
- Never skip the Verdict line — it is required on every review
- Never auto-invoke debug or any follow-on skill without explicit confirmation
- Never pad output — omit any severity tier that has no findings
- Never review partial scope silently — always announce chunks before starting each one
