---
trigger: "Use this skill when the user is stuck, out of ideas, or wants proactive suggestions for what to work on next. Trigger phrases include: 'jarvis', 'I'm stuck', 'what's next', 'what should I work on', 'jarvis what do you think', 'next move'. This is a manually triggered skill — do NOT auto-fire it. Do not trigger for general questions or tasks that already have a clear direction."
skill: jarvis
---

# Jarvis Skill

## Purpose
Given the current session and memory context, surface 3 specific short-term ideas and 1 directional long-term idea — unprompted, with reasoning. Use when stuck or at session end to identify the most valuable next moves.

## Phase 1 — Load Context
Read the following in order:
1. **Current session** — what has been built, decided, discussed, or attempted. Note anything in progress, anything explicitly rejected, and any open questions.
2. **Memory files** — read `/Users/jacob/.claude/projects/-Users-jacob/memory/` for relevant project, feedback, and user memories. These are the primary external context source.
3. **CLAUDE.md** — use only for high-level orientation (who Jacob is, what he's working toward). Do not let it override session-specific context.

Identify:
- What's currently in progress or recently completed
- What has been suggested or attempted but rejected (track these — they may be worth resurfacing)
- What goals or priorities are active
- What natural continuation points exist

## Phase 2 — Generate Ideas
Produce exactly **3 short-term ideas** and **1 long-term idea**.

**Short-term ideas:**
- Actionable in the current or next session
- Specific — not "improve the skill" but "add a phase to the verdict skill that handles two-option vs. three-or-more differently"
- Directly connected to what's been built or is in progress
- Can resurface a previously rejected idea if the current context makes it more relevant or the original objection no longer applies — flag this explicitly if you do

**Long-term idea:**
- Directional and strategic, not task-level
- Should be realistic for after the current in-progress work wraps and after the short-term ideas are addressed
- One clear direction, not a list of things — something like "build out X as a system" or "shift focus toward Y"
- Explain why it's the right next chapter given where things are heading

## Phase 3 — Output
Print inline in chat. Clean markdown for readability:

---
**Jarvis**

**Short-term** *(this or next session)*

1. **[Idea title]** — [What to do, specific enough to act on. One sentence why it's the right move now.]
2. **[Idea title]** — [Same structure.]
3. **[Idea title]** — [Same structure. If resurfacing a rejected idea, add: "Previously set aside — worth revisiting because [reason]."]

**Long-term** *(after current work and short-term ideas wrap)*

4. **[Direction]** — [What it is in plain terms. Two sentences on why this is the right next chapter given what's been built and where things are heading.]
---

## Output Format
Chat only. No files written. No memory updates. No git commands.

## Guardrails
- Never produce generic suggestions — every idea must be traceable to something specific in the session or memory context
- Always explain why each idea is relevant, not just what it is
- Long-term must be genuinely post-current-work — not a parallel task dressed up as strategic
- Resurfacing a rejected idea requires flagging it explicitly and giving a reason why the context has changed
- Never auto-fire — this skill only runs when explicitly triggered
- If context is genuinely too thin to produce specific ideas, say so and ask one question to fill the gap
