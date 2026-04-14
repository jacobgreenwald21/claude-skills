---
trigger: "review the code, code review, review this code, do a code review, review my code, run a code review, can you review the code"
---

# Code Review Skill

## Purpose
Perform a structured, prioritized code review on any scope — single file, folder, or feature — and return actionable findings with copy-paste-ready fixes.

## Input Handling
Accept any of the following as input:
- A single file path
- A folder or feature directory
- A pasted code block

If the scope spans multiple files or is too large to review in one pass, break it into named chunks (e.g., "Chunk 1: auth/", "Chunk 2: api/routes/"). Announce each chunk before reviewing it.

## Severity Scale
- 🔴 Critical — will break in production or creates a security vulnerability
- 🟡 Warning — won't break immediately but will cause problems when extended or under load
- 🔵 Note — dead code, accessibility, minor convention issues

## Check Categories (run in priority order)
1. Bugs — logic errors, edge cases, unhandled states
2. Security — exposed routes, API key handling, injection vulnerabilities, auth gaps
3. Convention violations — patterns that break when the codebase grows
4. Dead code — unreferenced functions, unused imports, unreachable blocks (🔵 Note only)
5. Accessibility — missing alt text, poor contrast, keyboard nav issues (🔵 Note only)

## Process

### Phase 1 — Scope Assessment
Read the input. If multiple files or a large directory:
- List the chunks by name
- Announce: "Reviewing in [N] chunks: [list]. Starting with Chunk 1: [name]."

If a single file or small scope, proceed directly to Phase 2.

### Phase 2 — Review Pass
For each chunk (or full scope if small):
- Announce: "Reviewing [chunk name]..." before starting
- Run all five check categories in priority order
- Collect every finding before writing output

### Phase 3 — Output
Return findings using this format for each issue:

[SEVERITY ICON] Issue type
Location: file + line or function name
Problem: one sentence description
Fix: copy-paste ready code or exact change

Group by severity: all 🔴 first, then 🟡, then 🔵.
If a severity tier has no findings, omit it entirely.

If no issues found in any tier: return "Code looks good — no issues found in [scope]."

### Phase 4 — Debug Handoff
After completing the full review, for each 🔴 Critical bug found, package a handoff block in this exact format:

🔴 HANDOFF
Issue type: [type]
Location: [file + line or function name]
Problem: [one sentence description]
Code: [relevant code block]

Then ask: "Found [N] critical bug(s). Want me to run debug on any of them? Handoff blocks are ready above."
Do not auto-invoke debug — wait for confirmation.

## Guardrails
- Never skip or reorder the five check categories
- Never return a finding without a location and a fix — vague observations are not findings
- Never auto-invoke debug or any follow-on skill without explicit confirmation
- Never pad output — omit any severity tier that has no findings
- Never review partial scope silently — always announce chunks before starting each one
