---
trigger: "help me build a prompt, design a prompt for, I need a meta prompt, let's use CRITICAL, build me a prompt, make me a prompt, prompt for"
---

# CRITICAL Framework Skill

## Purpose
Run the full CRITICAL framework elicitation process to build a structured, high-quality prompt for any task.

## CRITICAL Components
- C — Context: background the AI needs to understand the situation
- R — Role: expert persona to guide perspective and communication style
- I — Intent: the "why" — ultimate goal behind the request
- T — Task: clear, unambiguous instruction for what AI must do
- I — Instructions: steps, rules, constraints, guardrails
- C — Criteria: format, structure, elements the output must contain
- A — Audience: who the output is for — tailors tone and complexity
- L — Learning: ask AI to explain reasoning, provide alternatives, foster feedback loop

## Process

### Phase 1 — Understand the Domain
Before asking anything, read any relevant files in the current directory that describe the project or task context.

### Phase 2 — Elicit CRITICAL Components
Ask targeted questions to fill each component. Do not ask all 8 at once. Group related questions. Ask only what is ambiguous — if context is already clear from files or conversation, use it.

Minimum questions per component:
- C: What is the situation? What background does the AI need?
- R: What expert persona should the AI adopt?
- I: What is the ultimate goal — what does success look like?
- T: What exactly should the AI produce or do?
- I: What constraints, rules, or guardrails apply?
- C: What format, structure, or elements must the output contain?
- A: Who will use this output? What tone and complexity level?
- L: Should the AI explain its reasoning or offer alternatives?

### Phase 3 — Draft the Prompt
Assemble all elicited components into a single structured prompt. Label each section with its CRITICAL letter and component name. Make it copy-ready.

### Phase 4 — Review and Tune
Present the draft. Ask: "Does this match your intent? Anything to adjust?" Iterate until confirmed.

## Output Format
A single copy-ready prompt with clearly labeled CRITICAL sections. Nothing else — no lead-in, no explanation unless asked.

## Guardrails
- Never generate a generic prompt. Every component must reflect the specific context.
- Never skip elicitation. Even if context seems obvious, confirm the key components.
- Never pad the output. If a component is not applicable, omit it cleanly.
- Never auto-submit the prompt anywhere. Deliver it as text only.
