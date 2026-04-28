---
trigger: "Use this skill when the user wants an end-of-session recap for themselves — a readable summary of what was built, where the project stands, and what comes next. Trigger phrases include: 'roundtable', 'session recap', 'gather the table', 'wrap up the session', 'end of session summary', 'recap the session'. Do NOT trigger for mid-session status checks (use checkpoint instead), and do NOT trigger for handoff file generation (different skill, different purpose)."
skill: roundtable
---

# Roundtable Skill

## Purpose
Produce a structured, human-readable end-of-session recap for Jacob — what got built, where the project stands now, and what comes next. This is for Jacob to read, not for other sessions or AI contexts. Pairs with Commander: roundtable gives the readable summary, Commander does the audit and backup.

## Phase 1 — Survey the Session
Scan the full conversation for:
- Decisions made and things produced (files written, skills built, plans agreed on, concepts explained)
- The current state of whatever project or task was the focus of the session
- Anything explicitly left open, deferred, or identified as a next step
- Any blockers, open questions, or dependencies that came up and weren't resolved

If a TodoWrite task list exists, use it as a reference — but lean on the conversation itself. The todo list tracks tasks; the conversation captures decisions, context, and nuance the list misses.

## Phase 2 — Organize Into Three Sections
Group what you found into:

1. **What we built** — concrete outputs from this session. Files written, skills created, decisions locked in, frameworks established. Specific and factual — not "we discussed X" but "we built X" or "we decided X."

2. **Where things stand** — the current state of the project or work as of this session ending. What exists now that didn't before. What's partially done. What changed from the start of the session.

3. **What's next** — the natural continuation. Immediate next steps if they were stated, or logical ones if they weren't. Flag any dependencies (can't do Y until X is resolved). Keep this to what's actually actionable, not a wishlist.

## Phase 3 — Output the Recap
Print inline in chat. Structure:

---
**Session Recap** — [one-phrase session topic]

**What we built**
[2–5 items. Each is one sentence: what it is and what it does. No bullet fragments — full thoughts.]

**Where things stand**
[2–4 sentences of plain prose. Describe the state of the project now. What exists, what's in place, what's ready to use.]

**What's next**
[2–4 items. Each is one sentence: what to do and why, or what it unblocks. Flag dependencies inline if relevant.]
---

Tone: structured but readable — closer to a well-organized paragraph than a raw task list. Each item should be a complete thought, not a fragment.

After the closing `---`, add one line:
*Want a handoff file for next session? Say "generate handoff."*

## Output Format
Chat only. No files written. No memory updates. No git commands.
This is not a handoff — do not generate context files or handoff markdown. That is a separate skill.

## Guardrails
- Never confuse this with checkpoint (mid-session) or handoff (context files for other sessions) — this is end-of-session, for Jacob to read
- Never write "we discussed" — only write what was actually decided, built, or produced
- Never pad the "What's next" section with speculative future work — only include steps that are genuinely next
- If the session was genuinely short or narrow, say so and keep the recap brief — don't inflate it
- Never run Commander or generate handoff files as part of this skill
