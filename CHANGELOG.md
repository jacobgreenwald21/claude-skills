# Changelog

Session-level change history for the skill ecosystem, newest first. Handoff and Commander append here instead of CLAUDE.md, which loads on every turn. The skill portfolio itself lives in README.md.

## 2026-10-27

- context/about-me.md rewritten as builder context only (working style, purpose of the skill system, cookbook as an output). Career and personal details removed — job search lives in regular Claude chats.
- commander v11 (v10 archived): description now carries the end-of-session chain triggers ("wrap up", "wrap it up", "end session", "close out") so the chain can actually fire; stale v8 labels and "→ backup" removed; "back up" rule clarified as archive-before-edit; goal-designer and graph-designer added to the Tier 2 list.
- roundtable (v3 archived): dropped 'wrap up the session' trigger and added an exclusion — "wrap up" now belongs to Commander's chain, which includes roundtable.
- jarvis (v2 archived): Phase 1 now reads context/decision-log.md; added exclusion for task-level "what's next".
- Open items #2 (stale career context) and #6 (AP Invoice Agent) resolved.

## 2026-10-21

- Descriptions rewritten for code-debug (v4), code-review (v4), skill-builder (v6): each now states what the skill does, keeps all prior trigger phrases, adds a few, and names what not to use it for. code-review's proactive-offer guidance moved into the description (body text is invisible until a skill fires). skill-builder now also triggers on tuning existing skills. Previous versions archived as SKILL-v3 / SKILL-v3 / SKILL-v5.
- skill-builder body (v7, previous archived as SKILL-v6): Phase 2 now requires `name:` + `description:` frontmatter (what it does → triggers → exclusions, ≤1,536 chars) and puts all trigger guidance in the description — likely root cause of the 12-skill `trigger:` bug. Phase 1 gains a tuning mode (read the existing SKILL.md, ask only what it leaves open). Phase 5 tests in a new tab instead of restarting. Guardrails log to CHANGELOG.md instead of CLAUDE.md, drop the obsolete category-folder copy step, and add the agentic-loops README category.
- gstack `review` set to user-invocable-only so the local code-review is the only auto-triggering code reviewer; `/review` still works manually.
- `skills/synced/` and `skills/.trash/` untracked and gitignored (managed by Claude Code / claude.ai sync).

## 2026-10-20

- Frontmatter fixed on 12 skills (checkpoint, code-debug, code-review, critical, jarvis, myth-busters, optimus-prime, roundtable, skill-builder, skill-namer, verdict, yoda): `trigger:` renamed to `description:`, `name:` added, non-standard `skill:` key dropped. Claude Code had been ignoring `trigger:` and listing these by their H1 title, so they could not auto-trigger. Trigger text unchanged.
- handoff: added frontmatter (it had none); Step 3 now routes session changes to CHANGELOG.md / README.md instead of CLAUDE.md; Step 4 no longer copies CLAUDE.md onto itself (it is symlinked).
- commander: sync step routes change history to CHANGELOG.md instead of CLAUDE.md.
- CLAUDE.md trimmed: Skill Portfolio list removed (duplicated README.md and the live skill listing), version notes moved here, Handoff File Output section moved into the handoff skill.
- `~/.claude/settings.json` skillOverrides: 35 gstack skills set to user-invocable-only; 15 unused or duplicate claude.ai-synced `anthropic-skills:*` skills turned off (`anthropic-skills:docs` kept, the Claude Docs connector needs it). typesafe plugin disabled.
- New Stop hook `hooks/skill-sync-reminder.sh` (registered in `~/.claude/settings.json`): once per batch of unsynced edits, reminds to run Commander or generate handoff. Ignores skills/synced and skills/.trash; a clean repo resets it.

## Before 2026-10-20 (moved verbatim from CLAUDE.md)

roundtable v2 (prompts for handoff at end). Handoff/chat-SKILL v3 (frontmatter trigger added). Commander v10 (session-scoped audit; Tier 2 uses git status skip so unchanged skills aren't re-read; CLAUDE.md + README.md auto-updated at sync without approval; backup step replaced with git status confirmation). critical v2 (trigger tightened). checkpoint v2 (jarvis collision fixed). avoid-ai-writing v3.6.0 (em dashes removed from prose; verbose sections tightened; blog profile voice note added; rewrite mode now proposes structure before writing). fuel-gauge v1.0 (new — token auditor, heuristic estimates, Commander integration). code-review updated 2026-05-09: adversarial chaos-engineer pass, LLM trust boundary + conditional side effect checks, required Verdict line, --terse mode, proactive triggers. roundtable updated 2026-05-09: --terse mode. verdict updated 2026-05-09: proactive trigger section. gstack installed 2026-05-09 (bun + Playwright Chromium). Cookbook project now has .claude/CLAUDE.md with gstack workflow registered. 2026-05-11: guardrail hardening — fuel-gauge hard stop at 500K tokens; myth-busters/skill-builder ambiguity defaults to FAIL; commander flags uncertain Tier 1 findings; code-review + code-debug must read callers before suggesting boundary changes. myth-busters v4 (2026-05-15): phases 3 & 4 now fire parallel agents — contamination structurally prevented. Retired: tapestry-skills/scrum-sage, tapestry-skills/session-log, busn4400 (moved to ~/.claude/skills/_retired/), resume-tailoring (deleted — was third-party marketplace clone). 2026-04-28: ~/.claude/skills and ~/.claude/CLAUDE.md are now symlinked into ~/Desktop/AI/claude-skills/ — no copy-sync needed; git add . && commit && push is the full sync workflow. 2026-08-30: goal-designer + graph-designer installed from the "Loops for Knowledge Workers" webinar (AIDB × Superintelligent × Nufar Gaspar) — third-party but tracked in the repo; single-file skills, no upstream git. Session/lab handouts + token-efficiency-playbook filed at ~/Desktop/AI/reference/agentic-loops/ (new folder). Playbook flags: global CLAUDE.md should trend under 200 lines (workflow detail belongs in skills, which load on trigger); /clear is free, /compact is a large request; no timestamps atop prompts/system files (invalidates cache prefix).
