# Handoff Skill — Chat Version
*For use in Claude.ai chat sessions (not Claude Code)*

---

## Trigger
Activate when the user says **"generate handoff"** in any chat session.

---

## What This Skill Does

Generates two clean markdown files at the end of a chat session so the next session can pick up exactly where this one left off — with no re-explaining, no lost context, and the same working style.

**Output 1:** `[project-name]-context.md` — high-level project overview readable by anyone  
**Output 2:** `[project-name]-handoff.md` — technical dev instructions, personal use only

Both files are presented as downloadable outputs via the present_files tool.

---

## Step 1 — Identify the Project

Infer the project name from the conversation. If ambiguous, ask once:
> "What should I name this handoff? (e.g. 'cookbook', 'recruiting-skill', 'prompt-engineering')"

Use the name as a slug: lowercase, hyphens, no spaces.

---

## Step 2 — Generate the Context File

**Filename:** `[project-name]-context.md`

**Tone:** Clear, readable, no assumed technical knowledge. Written so anyone could drop it into a chat and ask Claude to summarize or elaborate on it. No jargon unless necessary.

**Structure:**
```
# [Project Name] — Project Context
*[Month Year]*

## What It Is
2-3 sentences. What this project is, what it does, who it's for.

## Why It Exists
The problem it solves or the goal it serves. 1-2 sentences.

## Current State
What is working right now. Bulleted list, plain language.

## What's Been Done
Key milestones or phases completed, in plain language.

## What's Next
What still needs to happen. Plain language, not implementation detail.

## Key Decisions Made
Any important choices that shaped the project and why.
```

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

## Step 4 — Output the Files

Write both files and present them using the present_files tool so Jacob can download them directly.

Do not output the file contents inline in the chat. Just present the files.

After presenting, say:
> "Save both to `~/Desktop/AI/scratch/markdown-handoffs/`. If an older version exists, move it to `.../archive/` first."

---

## Rules

- Never ask more than one clarifying question
- Infer as much as possible from the conversation
- Keep both files concise — a handoff that requires reading is too long
- The handoff file should feel like picking up mid-sentence, not starting over
- Do not include information that isn't relevant to continuing the work
