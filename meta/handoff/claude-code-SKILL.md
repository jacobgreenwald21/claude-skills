# Handoff Skill — Claude Code Version
*For use in Claude Code inside VS Code*

---

## Trigger
Activate when the user says **"generate handoff"** in a Claude Code session.

---

## What This Skill Does

Reads the actual project state from the filesystem and git history, then writes two clean markdown files so the next session picks up exactly where this one left off.

**Output 1:** `[project-name]-context.md` — high-level project overview readable by anyone  
**Output 2:** `[project-name]-handoff.md` — technical dev instructions, personal use only

Both files are written directly to `~/Desktop/AI/scratch/markdown-handoffs/`.  
Any existing files with the same name are moved to `~/Desktop/AI/scratch/markdown-handoffs/archive/` first, renamed with today's date: `[project-name]-context-[YYYY-MM-DD].md`.

---

## Step 1 — Gather Project State

Run these before writing anything:

```bash
# Current branch and status
git branch --show-current
git status

# Recent commit history
git log --oneline -10

# Diff between dev and main if on dev
git log main..dev --oneline

# Project name from folder
basename $(pwd)
```

Also read:
- `CLAUDE.md` in the project folder (if it exists)
- `CHANGELOG.md` (if it exists)
- Any README

Use what you find. Do not ask Jacob to describe the state — read it directly.

---

## Step 2 — Archive Existing Files

Before writing new files, check if current versions exist and archive them:

```bash
# Create archive folder if it doesn't exist
mkdir -p ~/Desktop/AI/scratch/markdown-handoffs/archive

# Archive existing files if present (replace [project-name] with actual name)
DATE=$(date +%Y-%m-%d)
[ -f ~/Desktop/AI/scratch/markdown-handoffs/[project-name]-context.md ] && \
  mv ~/Desktop/AI/scratch/markdown-handoffs/[project-name]-context.md \
     ~/Desktop/AI/scratch/markdown-handoffs/archive/[project-name]-context-$DATE.md

[ -f ~/Desktop/AI/scratch/markdown-handoffs/[project-name]-handoff.md ] && \
  mv ~/Desktop/AI/scratch/markdown-handoffs/[project-name]-handoff.md \
     ~/Desktop/AI/scratch/markdown-handoffs/archive/[project-name]-handoff-$DATE.md
```

---

## Step 3 — Generate the Context File

**Filename:** `[project-name]-context.md`  
**Write to:** `~/Desktop/AI/scratch/markdown-handoffs/`

**Tone:** Clear, readable, no assumed technical knowledge. Written so anyone could drop it into a chat and ask Claude to summarize or elaborate. No jargon unless necessary.

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
Key milestones completed, in plain language. Pull from CHANGELOG or git log.

## What's Next
What still needs to happen. Plain language, not implementation detail.

## Key Decisions Made
Any important choices that shaped the project direction and why.
```

---

## Step 4 — Generate the Handoff File

**Filename:** `[project-name]-handoff.md`  
**Write to:** `~/Desktop/AI/scratch/markdown-handoffs/`

**Tone:** Direct, technical, personal. Written for Jacob to drop into a new chat and immediately resume working. Claude should read this and know exactly how to behave.

**Structure:**
```
# [Project Name] — Handoff
*Updated [Month Year]*

## How to Use This File
One sentence: drop this into [Project name] and say [exact phrase to resume].

## Context for Claude
- Who Jacob is (1-2 bullets — enough for tone calibration)
- Relevant tools and environment for this project

## Current State
Exact status pulled from git log and project files.
Branch, what's merged, what's on dev only, anything broken.
Be specific — feature names, file names, branch status.

## Resume Here
Exactly where to pick up. First thing to do or say.
If multiple options, list in priority order.

## Working Style for This Project
How sessions run:
- How changes are made (Claude Code in VS Code)
- Decision-making pattern (plan before code, one feature at a time)
- Commit and deploy workflow
- Any project-specific rules

## Critical Reference
Only what would cause real problems if forgotten:
- File paths
- IDs, project names, deploy commands
- Git workflow commands
- Hard-won lessons from this project
```

---

## Step 5 — Write the Files

Write both files to disk:

```bash
# Confirm output directory exists
mkdir -p ~/Desktop/AI/scratch/markdown-handoffs

# Write files (Claude Code writes file content directly)
# context file → ~/Desktop/AI/scratch/markdown-handoffs/[project-name]-context.md
# handoff file → ~/Desktop/AI/scratch/markdown-handoffs/[project-name]-handoff.md
```

After writing, confirm with:
```bash
ls ~/Desktop/AI/scratch/markdown-handoffs/
```

Report back: "Handoff files written. Context and handoff are both in `~/Desktop/AI/scratch/markdown-handoffs/`."

---

## Rules

- Read actual state from filesystem and git — never ask Jacob to describe it
- Keep both files concise — a handoff that requires reading is too long
- The handoff file should feel like picking up mid-sentence, not starting over
- Do not include information that isn't relevant to continuing the work
- Always archive before overwriting — never delete old files outright
