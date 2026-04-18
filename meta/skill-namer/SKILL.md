---
trigger: "Use this skill when Jacob wants to generate name options for a new skill. Trigger phrases include: 'let's name this', 'name this skill', 'what should I call this', 'help me name this', 'skill name ideas', 'generate names for this skill'. Can also be invoked from within skill-builder during the naming step. Do NOT trigger for general naming tasks outside the skill ecosystem (e.g., naming a variable, naming a project, naming a file)."
skill: skill-namer
---

# Skill-Namer Skill

## Purpose
Given a new skill's purpose, read the existing skill portfolio for style reference and collision avoidance, then generate 3–5 whimsical name candidates plus 1–2 serious alternatives — each with suggested trigger phrases modeled after how existing skills fire.

## Phase 1 — Load Portfolio
Read `~/.claude/skills/` and extract all current skill names. Use these for two things: avoid collisions, and calibrate the naming style (tone, length, format — reference: yoda, jarvis, roundtable, myth-busters, verdict, checkpoint, optimus-prime).

## Phase 2 — Understand the New Skill
Extract the new skill's purpose from context — if invoked from within skill-builder, pull it from the conversation. If invoked standalone, ask: "What does this skill do in one sentence?"

## Phase 3 — Generate Whimsical Names (3–5)
Each name must:
- Be one word or a short hyphenated phrase
- Be evocative and feel like it belongs alongside yoda, jarvis, roundtable, myth-busters, verdict
- Make intuitive sense once you know what the skill does — the "aha" should land immediately
- Not collide with any existing skill name

## Phase 4 — Generate Serious Names (1–2)
Functional, clear, descriptive alternatives for contexts where a whimsical name would feel out of place.

## Phase 5 — Derive Trigger Phrases
For each name (whimsical and serious), generate 3–5 trigger phrases following the existing pattern:
- The name itself (name-based triggers fire even without task context — match how "roundtable" and "jarvis" work)
- Natural task-based variations
- Casual invocations Jacob would actually say

## Phase 6 — Output
Print inline in chat:

---
**Name Options for: [skill purpose one-liner]**

**Whimsical**
| Name | Rationale | Trigger phrases |
|------|-----------|----------------|
| [name] | [why it fits — one line] | [3–5 phrases] |

**Serious**
| Name | Rationale | Trigger phrases |
|------|-----------|----------------|
| [name] | [why it fits] | [3–5 phrases] |

*Flag any name within one edit-distance of an existing skill name.*
---

## Output Format
Chat only. No files written. Present options for Jacob to choose from — do not install or rename anything.

## Guardrails
- Always read the skills directory before generating — no collisions, ever
- Always include at least 1 serious option
- Never use a purely functional name for a whimsical pick ("name-generator" is not whimsical)
- Trigger phrases must always include the skill name itself
- No acronyms or abbreviations in whimsical names
- Constraints will evolve — if Jacob rejects names with a pattern, note it inline so the next run avoids it
