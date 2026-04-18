---
trigger: "Use this skill when the user asks for a status check, session checkpoint, or wants to know where things stand mid-session. Trigger phrases include: 'status check', 'checkpoint', 'where are we', 'what's left', 'quick status', 'catch me up', 'what have we done'. Do NOT trigger on 'what's next' alone — that routes to jarvis. Do NOT trigger for status checks in other contexts (e.g., git status, server status, API status)."
skill: checkpoint
---

# Checkpoint Skill

## Purpose
Produce a structured, numbered mid-session snapshot: what's done, what's actively in progress, and what comes next. Orientation only — no action taken, no files written, no memory or git updates.

## Phase 1 — Gather State
Check both sources:
1. **TodoWrite task list** — if an active task list exists in the session, use it as the primary source of truth for done/in-progress/up-next status.
2. **Conversation context** — regardless of whether a todo list exists, also scan the conversation for completed decisions, work produced, and topics raised but not yet acted on. Lean toward Claude's understanding of the session arc.

If both sources exist, reconcile them: todo list for task status, conversation for decisions, blockers, and dependencies that may not be in the list.

## Phase 2 — Identify Dependencies and Links
Before outputting, map which items depend on or unblock other items:
- If item 3 cannot start until item 2 is complete, note that.
- If two items are related or part of the same thread, group or cross-reference them.
- Only include links that are real and meaningful — do not force connections.

## Phase 3 — Output the Snapshot
Print the status check inline in chat. Use this structure exactly:

---
**STATUS CHECK** — [one-phrase session topic, e.g., "checkpoint skill build"]

**Done**
1. [Item] — [one-line description of what was produced or decided]
2. [Item] — ...

**In Progress**
3. [Item] — [current state; note what it's waiting on or blocking]

**Up Next**
4. [Item] — [what it is and why it comes next; note any dependency on earlier items]
5. [Item] — ...

**Notes** *(only include if there's something worth flagging)*
- [Blocker, open question, or decision that still needs to be made]
---

Rules for the output:
- Numbered sequentially across all three sections so items can be referenced by number
- One line per item — no sub-bullets unless a dependency cannot be expressed inline
- No prose paragraphs — the whole thing should be scannable in 10 seconds
- Dependencies expressed inline: "depends on #2", "unblocks #4", "same thread as #1"
- If nothing is in progress, omit that section rather than leaving it empty
- Notes section is optional — only include if there's a real open question or blocker

## Output Format
Chat only. No files written. No memory updates. No git commands.

## Guardrails
- Never write narrative summaries — numbered structure only
- Never trigger on non-session status checks (git status, server health, etc.)
- Never take action or make changes as part of running this skill
- Never pad with "here's what we accomplished" framing — output the list, nothing else
- If the session is too early to have meaningful state, say so in one line and stop
