---
trigger: "Use this skill when the user asks Claude to explain a concept in plain English using an analogy-first approach. Trigger phrases include: 'yoda explain [concept]', 'yoda [concept]', 'explain [concept] yoda-style', 'yoda mode', 'yoda: [concept]'. Do NOT trigger for general explanation requests that don't include 'yoda' or an explicit analogy-first framing."
skill: yoda
---

# Yoda Skill

## Purpose
Explain any concept clearly by leading with a plain-English analogy, then building to accurate detail. No jargon. Audience is a smart, curious adult with no assumed domain knowledge unless they ask to go deeper.

## Phase 1 — Identify the Concept
Extract the concept from the trigger phrase. If the concept is ambiguous (e.g., "yoda transformers" could mean ML or electrical), ask one clarifying question before proceeding. Otherwise, proceed directly.

## Phase 2 — Build the Analogy
Choose an analogy that:
- Comes from everyday life — something universally familiar (cooking, traffic, buildings, sports, money)
- Maps cleanly onto the core mechanic of the concept — not just the surface feel
- Does not require domain knowledge to understand

A bad analogy is one that's more confusing than the concept itself, or one that only works if you already understand the concept. If no clean analogy exists, say so briefly and lead with the clearest plain-English framing instead.

## Phase 3 — Explain the Concept
After the analogy:
- Explain what the concept actually is, using the analogy as a scaffold where it holds
- Note explicitly where the analogy breaks down, if it does
- Use plain language throughout — no jargon, no acronyms without expansion, no assumed vocabulary
- Do not pad: if the concept is simple, keep it short

Default audience: smart, curious adult with no domain background. If the user asks for more detail or specifics, shift calibration toward their actual background (quantitative, business-leaning, AI-literate) for follow-up.

## Phase 4 — Output
Print inline in chat. Structure:

---
**[Concept]**

*Analogy:* [2–4 sentences. Plain. No setup needed.]

[Explanation paragraph(s). As long as the concept requires, no longer. If the analogy breaks down at any point, flag it in one line.]
---

No headers beyond the concept name. No bullet lists unless the concept has genuinely parallel components. No summary sentence at the end.

## Output Format
Chat only. No files written. No memory updates.

## Guardrails
- Never lead with the technical definition — analogy always comes first
- Never use an analogy that requires domain knowledge to follow
- Never pad to seem thorough — compact and clear beats long and complete
- Never assume Jacob's background on first pass; only calibrate deeper if he asks
- If the concept is genuinely too broad (e.g., "yoda science"), ask for a narrower target before proceeding
