---
name: handoff
description: "Use this skill when Jacob says 'generate handoff' at the end of a Claude Code session. Writes a single [project-name]-handoff.md to ~/Desktop/AI/scratch/markdown-handoffs/ from real git and file state, logs session changes to the claude-skills CHANGELOG.md/README.md, and syncs the repo. Do NOT trigger for mid-session status (use checkpoint) or a readable recap (use roundtable)."
---

# Handoff Skill — Claude Code Version
*For use in Claude Code inside VS Code*

Skill files: `~/.claude/skills/handoff/claude-code-SKILL.md` (this version; SKILL.md is the loaded copy and must stay identical) and `~/.claude/skills/handoff/chat-SKILL.md` (Claude.ai version).

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

## Step 3 — Log Session Changes

CLAUDE.md loads on every turn, so history written there costs tokens forever. Route each change from this session by type:
- **Change history** (skill versions, what changed and why, decisions made, project milestones) → add a dated entry at the top of `~/Desktop/AI/claude-skills/CHANGELOG.md`. Reuse today's entry if one exists.
- **Skill portfolio** (skill added, removed, renamed, or its trigger/purpose changed) → update the matching table row in `~/Desktop/AI/claude-skills/README.md`.
- **Durable directives** (a rule every future session must follow, a path every session needs) → targeted edit to `~/.claude/CLAUDE.md`. This should be rare. Never add skill lists or version notes there — each skill's description already loads from its SKILL.md.

Make targeted edits only. Never rewrite any of these files from scratch.

Confirm what was changed before proceeding:
> "Logged: CHANGELOG [entries added] · README [changes or 'none'] · CLAUDE.md [changes or 'none']"

---

## Step 4 — Sync to GitHub

`~/.claude/CLAUDE.md` and `~/.claude/skills/` are symlinked into the repo, so no copying is needed:

```bash
cd ~/Desktop/AI/claude-skills
git add CLAUDE.md CHANGELOG.md README.md
git commit -m "session sync $(date +%Y-%m-%d)"
git push origin main
```

If any SKILL.md files were edited this session, stage them alongside before committing.

Confirm: "GitHub synced — pushed to origin/main."

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
