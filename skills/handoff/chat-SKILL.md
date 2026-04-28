---
trigger: "Use this skill when the user says 'generate handoff' in a Claude.ai chat session (not Claude Code). Trigger phrases: 'generate handoff', 'make a handoff', 'create handoff'. Do NOT trigger in Claude Code sessions — use claude-code-SKILL.md there. Do NOT trigger for mid-session status checks (use checkpoint) or end-of-session recaps (use roundtable)."
---

# Handoff Skill — Chat Version
*For use in Claude.ai chat sessions (not Claude Code)*

---

## Trigger
Activate when the user says **"generate handoff"** in any chat session.

---

## What This Skill Does

Generates a single clean markdown file at the end of a chat session so the next session can pick up exactly where this one left off — with no re-explaining, no lost context, and the same working style.

**Output:** `[project-name]-handoff.md` — technical dev instructions, personal use only

Presented as a downloadable output via the present_files tool.

---

## Step 1 — Identify the Project

Infer the project name from the conversation. If ambiguous, ask once:
> "What should I name this handoff? (e.g. 'cookbook', 'recruiting-skill', 'prompt-engineering')"

Use the name as a slug: lowercase, hyphens, no spaces.

---

## Step 2 — Update CLAUDE.md

Read `~/.claude/CLAUDE.md`. Based on the session history, identify anything that changed that affects persistent context:
- New skills added or removed
- Stack or tool decisions made
- Project state changes (milestones completed, features shipped)
- New file locations or paths that matter long-term
- Anything that would affect how a future session should behave

Make targeted edits only — surgical updates to the relevant lines or sections. Never rewrite CLAUDE.md from scratch.

Confirm what was changed before proceeding:
> "Updated CLAUDE.md: [list of specific changes, or 'no changes needed']"

---

## Step 3 — Generate the Handoff File

**Filename:** `[project-name]-handoff.md`

**Tone:** Direct, technical, personal. Written for Jacob to drop into a new chat and immediately resume working. Claude should read this and know exactly how to behave without being told.

**Structure:**
```
# [Project Name] — Handoff
*Updated [Month Year]*

## How to Use This File
One sentence: drop this into [Cookbook Project / Prompt Engineering Project / etc.] 
and say [exact phrase to resume].

## Context for Claude
- Who Jacob is (1-2 bullets only — enough for tone calibration)
- Relevant tools and environment for this project

## Current State
Exact status. What's done, what's deferred, what's broken if anything.
Be specific — feature names, file names, branch names.

## Resume Here
Exactly where to pick up. The first thing to do or say.
If multiple options, list them in priority order.

## Working Style for This Project
How this specific project's sessions run:
- How changes are made (Claude Code vs chat vs terminal)
- Decision-making pattern (plan before code, one feature at a time, etc.)
- Commit and deploy workflow if relevant
- Any project-specific rules or hard-won lessons

## Critical Reference
Only include what would cause real problems if forgotten:
- File paths
- IDs, keys, project names
- Commands
- Gotchas
```

---

## Step 4 — Output the File

Write the file and present it using the present_files tool so Jacob can download it directly.

Do not output the file contents inline in the chat. Just present the file.

After presenting, say:
> "Save to `~/Desktop/AI/scratch/markdown-handoffs/`. If an older version exists, move it to `.../archive/` first."

---

## Rules

- Never ask more than one clarifying question
- Infer as much as possible from the conversation
- Keep the file concise — a handoff that requires reading is too long
- The handoff file should feel like picking up mid-sentence, not starting over
- Do not include information that isn't relevant to continuing the work
