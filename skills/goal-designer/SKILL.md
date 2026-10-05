---
name: goal-designer
description: >-
  Design structured goal statements for agentic loops, optimized for knowledge
  work (research, content, analysis, audits, competitive briefs). Interviews the
  user, formulates a Goal Card with machine-checkable finish-line criteria and
  cost caps, then offers to fire the loop or output the command. Use when the
  user says "design a goal," "set up a loop," "design a loop for...", or wants
  to run a multi-turn knowledge task autonomously.
---

<!-- FROM LOOPS TO ORG CHARTS · webinar giveaway · AIDB × Superintelligent × Nufar Gaspar
INSTALL: Claude Code → save as .claude/skills/goal-designer/SKILL.md in your project
(or ~/.claude/skills/goal-designer/SKILL.md for all projects), restart your session.
Cursor → save under .cursor/skills/ the same way. Any chat tool → paste the whole file
into a conversation and say "act as this skill." -->

# Goal Designer

Design and optionally fire structured loop goals for knowledge-work tasks.

## How loops work (teach this on first use)

Every agentic tool already runs a work cycle inside each task: plan → act → check → adjust. A goal-driven loop extends it: the agent keeps cycling until a **checkable finish line** is met. A schedule answers "when"; a loop answers "until."

| Tool | Goal-driven form | Notes |
|------|-----------------|-------|
| **Claude Code** | `/goal <condition>` — full finish-line criteria as the condition text | An independent evaluator model checks the condition each turn; `/goal clear` aborts. Put the turn cap inside the condition ("…or stop after N turns"). `/loop` is interval-based — a timer, a different job |
| **Cursor** | `/goal <condition>` | Same semantics |
| **Codex** | `/goal <condition>` | Same semantics; `codex exec` for scripted one-shots |
| **Chat-only tools** (Cowork, ChatGPT Work, web apps) | No loop command yet — paste the Goal Card and add: "work in cycles; check your draft against every DONE WHEN line and fix failures before returning; log a one-line decision note per cycle" | Approximates a short loop |

State the caps always: hard **turn cap** (suggest 10–15) and the cost reality — each iteration is a full agent turn; a 15-turn loop costs 15 turns.

## Phase 1: Interview

Ask 2–4 questions per round. Two rounds for simple tasks, three for complex — never over-interview.

**Round 1 — Task and output:** What are you trying to accomplish? What type of task (research / content build / content audit / competitive analysis / feedback analysis / other)? What's the output artifact — propose a file path and structure from the pattern table.

**Round 2 — Audience, sources, quality:** Who reads the output? What sources or context should the agent use (keep the list minimal — only what each stage needs)? Web search needed? What's the quality bar?

**Round 3 — Limits and staging (complex tasks only):** Propose stages and caps: light (5 turns) / medium (10) / heavy (20).

**Push back throughout.** Vague finish lines get challenged ("who judges 'good'? give me a machine-checkable proxy"). Subjective done-conditions get refused with an alternative. If the task fails the three-ingredients gate — checkable finish line, bounded sandbox, convergent task — say plainly "don't loop this," explain why, and provide the best single-prompt version instead. That is a successful outcome.

## Pattern table

| Task type | Stages | Budget | Verification pattern |
|---|---|---|---|
| **Deep research** | Discover → Synthesize → Validate | 10–15 turns | All sections present, every claim cited, N+ unique sources or data points (counts are the best finish lines) |
| **Content build** | Gather → Draft → Validate | 8–12 turns | All sections complete, standards applied, format matches template |
| **Content audit** | Inventory → Assess → Report | 8–12 turns | Every item assessed, each finding cites its item, one concrete fix per finding |
| **Competitive brief** | Collect + dedup → Draft → Verify | 10–15 turns | All competitors covered, every claim cited, nothing re-reported, unverified items quarantined to a watch list |

## Phase 2: Formulate the Goal Card

```
OBJECTIVE: {what and for whom, 1 line}
OUTPUT: {file path} with sections: {numbered list}
DONE WHEN: {only machine-checkable criteria: counts, presence, citations, length, format}
QUALITY: {bar-raising rules that guide but aren't the stop test}
CONTEXT: {minimal source list; web search yes/no}
CONSTRAINTS: {style rules, exclusions; always include: "start every turn with a one-line
  decision log: CYCLE n: checked X — passed/failed — continuing/stopping because…"}
STAGES: {2-4 phases with turn ranges}
STOP-CAPS: {hard turn cap} · stalled 3 turns with no file changes → stop and report ·
  blocked on a missing source or human decision → stop and ask
```

## Phase 3: Present and decide

Show the card. Explain each field in one line. Offer: **Fire now** · **Take the command** (the `/goal` line ready to paste) · **Revise**.

## Rules

- The goal always produces a **file artifact**. Files persist; chat doesn't.
- Every DONE WHEN line must be checkable **without human judgment**.
- **Never an unbounded loop.** Caps always.
- First runs go to a **sandbox path** — refuse production or shared targets.
- When a single pass from a strong model would genuinely suffice, say so.
