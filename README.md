# claude-skills

Jacob's personal Claude Code skill portfolio. All skills live flat under `skills/` — `~/.claude/skills` is symlinked here, so edits are live instantly. Each skill has a `SKILL.md` defining its trigger, purpose, and workflow.

---

## Meta

Skills that manage, evaluate, or build other skills.

| Skill | Trigger | Purpose |
|---|---|---|
| commander | "run Commander" | Session auditor — captures misfires, session-scoped skill audit, reads and clears open-items.md, updates MEMORY.md, and runs end-of-session chain (includes fuel-gauge). Skills are git-tracked; backup step being deprecated. |
| fuel-gauge | "fuel gauge", "token audit", "check context usage", "check the fuel gauge" | Heuristic token usage auditor — estimates cost per skill fired, ranks by expense, surfaces efficiency recommendations and chain opportunities. Auto-runs inside Commander. |
| optimus-prime | "optimus-prime", "optimus", "autobots roll out", "cross-skill review", "skill system audit" | Holistic cross-skill analysis — finds trigger overlaps, underused skills, and systemic gaps across the full portfolio. |
| myth-busters | "myth-busters", "test the skill", "benchmark [skill name]", "run myth-busters on [skill]" | Runs an A/B evaluation of a specific skill — transcript-aware scoping, binary assertion grading, and a pass rate comparison. |
| skill-builder | "build a new skill", "create a skill", "I want a skill that", "add a skill for", "new skill for", "skill that does" | Interviews on intent, drafts a new SKILL.md, archives before every write, runs test cases, tunes the trigger, and iterates until the skill works correctly. |
| skill-namer | "let's name this", "name this skill", "what should I call this", "help me name this", "skill name ideas" | Generates 3–5 whimsical name candidates plus 1–2 serious alternatives for new skills, each with trigger phrases styled after the existing portfolio. |
| jarvis | "jarvis", "I'm stuck", "what's next", "what should I work on", "next move" | Surfaces 3 specific short-term ideas and 1 directional long-term idea based on session and memory context. |
| handoff (chat) | "generate handoff" *(chat sessions only)* | Generates two handoff markdown files — a context file and a dev instructions file — presented as downloadable outputs at session end. |
| handoff (claude-code) | "generate handoff" *(Claude Code sessions only)* | Reads project state from the filesystem and git history, then writes both handoff files directly to `~/Desktop/AI/scratch/markdown-handoffs/`. |

---

## Code

Skills for reviewing and debugging code.

| Skill | Trigger | Purpose |
|---|---|---|
| code-review | "review the code", "code review", "review this code", "do a code review", "run a code review" | Structured, prioritized code review with severity tiers and copy-paste-ready fixes. |
| code-debug | "debug this", "run debug", "code debug", "debug the bug", "debug this error" | Five-step debug workflow — reproduce, isolate, hypothesize, fix, verify — with strict step ordering. |

---

## Writing

Skills for producing or improving written content.

| Skill | Trigger | Purpose |
|---|---|---|
| avoid-ai-writing | "remove AI-isms", "clean up AI writing", "edit writing for AI patterns", "audit writing for AI tells", "make this sound less like AI" | Audits content for AI writing patterns. Rewrite mode proposes structure and waits for approval before rewriting; detect mode flags only. Preserves casual voice on personal/reflective pieces. |

---

## Session

Skills that manage session flow, orientation, and decisions.

| Skill | Trigger | Purpose |
|---|---|---|
| checkpoint | "status check", "checkpoint", "where are we", "what's left", "quick status", "catch me up" | Produces a structured mid-session snapshot — what's done, what's in progress, and what comes next. |
| roundtable | "roundtable", "session recap", "gather the table", "wrap up the session", "end of session summary" | End-of-session readable summary of what was built, where the project stands, and what comes next. |
| verdict | "what's the verdict on [X]", "help me decide between [X] and [Y]", "make the call on [X]", "help me choose between" | Evaluates options, weighs tradeoffs, and delivers a clear recommendation with reasoning — no hedging. |
| yoda | "yoda explain [concept]", "yoda [concept]", "explain [concept] yoda-style", "yoda mode", "yoda: [concept]" | Explains any concept with a plain-English analogy first, then builds to accurate detail — no jargon. |

---

## Document

Skills for working with file formats.

| Skill | Trigger | Purpose |
|---|---|---|
| pdf | Any mention of a .pdf file or request to produce one | Handles all PDF operations — reading, merging, splitting, creating, filling forms, OCR, and image extraction. |
| docx | "Word doc", "word document", ".docx", or requests for a report/memo/letter as a Word file | Creates, reads, edits, and manipulates Word documents with full formatting support. |
| pptx | "deck", "slides", "presentation", or any .pptx filename | Handles all .pptx operations — creating, editing, reading, and combining presentations. |
| xlsx | Any .xlsx, .xlsm, .csv, or .tsv file reference, or any spreadsheet task | Creates, reads, edits, and cleans spreadsheet files with formula integrity and formatting standards. |

---

## Tools

Utility skills and frameworks.

| Skill | Trigger | Purpose |
|---|---|---|
| critical | "help me build a prompt", "design a prompt for", "let's use CRITICAL", "build me a prompt", "prompt for" | Runs the full CRITICAL framework elicitation process to build a structured, high-quality prompt for any task. |

---

## gstack

Browser automation and shipping skills from [gstack](https://github.com/garrytan/gstack). Installed at `~/.claude/skills/gstack/` and maintained via gstack's own git — not tracked in this repo. The skills below are worth invoking explicitly. `careful`, `freeze`, and `guard` are also installed but run as automatic hook-based safety rails.

| Skill | Trigger | Purpose |
|---|---|---|
| qa | `/qa` | Headless browser QA — navigates the live deployed URL, tests user flows end-to-end, and files bug reports with screenshots and repro steps. Run after any significant change. |
| health | `/health` | Runs type checker, linter, and test runner against the project and returns a weighted 0–10 code quality score with trend tracking across sessions. |
| retro | `/retro` | Weekly engineering retro — analyzes commit history, surfaces what shipped and what stalled, and tracks trends across multiple retros. |
| ship | `/ship` | Full PR workflow in one command — VERSION bump, CHANGELOG update, commit, push, and PR creation. Cookbook repo only. |
| document-release | `/document-release` | Post-ship doc sync — reads all project docs, cross-references the diff, and updates README, CHANGELOG, and CLAUDE.md. Cookbook repo only. |
| review | `/review` | Adversarial code review with a chaos-engineer pass. Complement to the local `code-review` skill — use for a second opinion or full adversarial framing. |
| browse | `/browse` | Direct headless browser control — navigate URLs, interact with elements, diff before/after, and take annotated screenshots on demand. |
