# Handoff Skill — Claude Code Version
*For use in Claude Code inside VS Code*

---

## Trigger
Activate when the user says **"generate handoff"** in a Claude Code session.

---

## What This Skill Does

Reads the actual project state from the filesystem and git history, then writes a single clean markdown file so the next session picks up exactly where this one left off.

**Output:** `[project-name]-handoff.md` — technical dev instructions, personal use only

Written directly to `~/Desktop/AI/scratch/markdown-handoffs/`.  
Any existing file with the same name is moved to `~/Desktop/AI/scratch/markdown-handoffs/archive/` first, renamed with today's date: `[project-name]-handoff-[YYYY-MM-DD].md`.

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

## Step 2 — Archive Existing File

Before writing, check if a current version exists and archive it:

```bash
mkdir -p ~/Desktop/AI/scratch/markdown-handoffs/archive

DATE=$(date +%Y-%m-%d)
[ -f ~/Desktop/AI/scratch/markdown-handoffs/[project-name]-handoff.md ] && \
  mv ~/Desktop/AI/scratch/markdown-handoffs/[project-name]-handoff.md \
     ~/Desktop/AI/scratch/markdown-handoffs/archive/[project-name]-handoff-$DATE.md
```

---

## Step 3 — Update CLAUDE.md

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

## Step 4 — Sync to GitHub

Copy the updated CLAUDE.md to the canonical skill repo and push:

```bash
cp ~/.claude/CLAUDE.md ~/Desktop/AI/claude-skills/CLAUDE.md
cd ~/Desktop/AI/claude-skills
git add CLAUDE.md
git commit -m "session sync $(date +%Y-%m-%d)"
git push origin main
```

If any SKILL.md files were edited this session, copy those to their category folders first and stage them alongside CLAUDE.md before committing.

Confirm: "GitHub synced — CLAUDE.md pushed to origin/main."

---

## Step 5 — Generate the Handoff File

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

## Step 6 — Write the File

```bash
mkdir -p ~/Desktop/AI/scratch/markdown-handoffs
```

After writing, confirm with:
```bash
ls ~/Desktop/AI/scratch/markdown-handoffs/
```

Report back: "Handoff written to `~/Desktop/AI/scratch/markdown-handoffs/[project-name]-handoff.md`."

---

## Step 7 — Chat Project Sync (only when relevant)

Jacob has five Claude.ai chat projects: Career, Prompt Engineering, Cookbook, Test Prep, Systems Project.

These are separate from Claude Code memory and cannot be updated automatically. Run this step only if something changed this session that would meaningfully affect one of those projects.

**What triggers a sync note:**
- Career — changes to working preferences, McKinsey goal context, professional background
- Prompt Engineering — skill ecosystem changes, new skills added/removed, CRITICAL framework updates
- Cookbook / Test Prep / Systems Project — only if directly worked on this session

**If nothing qualifies, skip this step entirely.**

**If something qualifies**, for each affected project output a ready-to-paste prompt Jacob can drop directly into that chat project:

---
**Chat sync needed: [Project Name]**

Paste this into your [Project Name] project:

> [Write the prompt in Jacob's voice, as if he's speaking directly to that project. Be specific — name what changed, why it matters to that project's context, and what the project should know going forward. 2-4 sentences max. No preamble.]
---

Write one block per affected project. If multiple projects are affected, list them in order of relevance.

---

## Rules

- Read actual state from filesystem and git — never ask Jacob to describe it
- Keep the file concise — a handoff that requires reading is too long
- The handoff file should feel like picking up mid-sentence, not starting over
- Do not include information that isn't relevant to continuing the work
- Always archive before overwriting — never delete old files outright
- Step 7 is conditional — skip it entirely if nothing changed that affects a chat project
