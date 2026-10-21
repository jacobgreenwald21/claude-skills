# Jacob — Global Context for Claude Code

## Personal Context

Canonical source: ~/Desktop/AI/claude-skills/context/ — edit there, not here.

@~/Desktop/AI/claude-skills/context/about-me.md
@~/Desktop/AI/claude-skills/context/voice.md
@~/Desktop/AI/claude-skills/context/working-preferences.md

Not auto-loaded: ~/Desktop/AI/claude-skills/context/decision-log.md — read it when verdict or jarvis fires, or when helping me make a decision.

## My Claude Ecosystem

Five active Claude.ai Projects: Test Prep, Cookbook, Prompt Engineering, Systems Project, Career.

Skills live at: ~/.claude/skills/
Canonical skill repo (GitHub-backed): ~/Desktop/AI/claude-skills/ — git@github.com:jacobgreenwald21/claude-skills.git
Personal context files (canonical, used by Claude Code, Cowork, and Claude.ai Projects): ~/Desktop/AI/claude-skills/context/
Claude API course at: ~/Desktop/AI/Claude-Api-Course

~/.claude/skills and ~/.claude/CLAUDE.md are symlinked into the repo — `git add . && commit && push` is the full sync, no copying.
Skill portfolio: README.md in the repo. Change history: CHANGELOG.md in the repo — log session changes there, not in this file.
gstack (~/.claude/skills/gstack/) is third-party, updated via its own git and /gstack-upgrade — not tracked in the claude-skills repo. Requires bun (~/.bun/bin/bun) and Playwright Chromium.

## Open Items

When Jacob says "flag that" or "flag this" mid-session, append the item to `~/.claude/projects/-Users-jacob/memory/open-items.md` with today's date. Commander reads and clears resolved items at each session end.

## Key Frameworks

CRITICAL = Context, Role, Intent, Task, Instructions, Criteria, Audience, Learning — my primary structured prompting tool. Default to it for prompt-building tasks.
