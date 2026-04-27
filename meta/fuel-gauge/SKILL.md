---
name: fuel-gauge
description: Use this skill when Jacob says "fuel gauge", "token audit", "check context usage", "how much have we used", or "check the fuel gauge". Also invoked explicitly by Commander as a named audit step. Do NOT auto-trigger on general questions about tokens, context limits, or API costs — only on explicit audit requests.
version: 1.0
---

# Fuel Gauge — Token Usage Auditor

## Purpose
Estimate token costs for skills that fired during the current session, rank them by expense, and surface efficiency recommendations. All figures are heuristic estimates — not exact counts from the API.

## How Estimates Work
- **SKILL.md load cost**: Read the skill's SKILL.md file. File size in bytes ÷ 4 ≈ tokens to load the skill into context.
- **Usage cost**: Based on what the skill did — number of tool calls visible in context, length of outputs produced, whether subagents were spawned.
- **Rough benchmarks** (from Logan Matson's ecosystem, useful as calibration):
  - Simple status skill (e.g., jarvis): ~5K tokens
  - Medium skill with file reads + output: ~20–40K tokens
  - Multi-phase skill with several tool calls: ~50–100K tokens
  - Subagent-heavy orchestration: ~100–200K tokens

## Phase 1 — Identify Skills That Fired
Scan the current session context and list every skill that was triggered. Note how many times each fired and what it produced (file writes, tool calls, long outputs, subagents).

## Phase 2 — Estimate Costs
For each skill that fired:
1. Read its SKILL.md: `~/.claude/skills/[skill-name]/SKILL.md`
2. Calculate estimated load cost: file size ÷ 4
3. Estimate usage cost based on observed activity in context
4. Sum for a total estimated cost per skill

If no skills fired (pure Q&A session), note that and skip to Phase 4.

## Phase 3 — Rank by Cost
Sort skills highest to lowest by total estimated cost. Flag any that fired multiple times or produced unusually large outputs.

## Phase 4 — Efficiency Recommendations
Generate 2–3 ranked recommendations. Prioritize by impact. Examples of what to look for:
- Skills that fired but produced minimal value relative to their cost
- Skills with large SKILL.md files that could be trimmed
- Repeated reads of the same files across multiple skill runs
- Chains that could be consolidated (one skill doing two things instead of two skills doing one thing each)
- Skills that are capability uplift (base model might handle without the skill) vs. encoded preference (irreplaceable)

## Phase 5 — Chain Opportunities
If 2+ skills fired that share context or outputs, note whether a skill chain could reduce total cost by passing output from one directly into the next instead of re-reading context.

## Output Format

**Token Audit — [Date]** *(all figures are estimates)*

| Skill | Fired | Est. Load | Est. Usage | Total Est. | Notes |
|-------|-------|-----------|------------|------------|-------|
| skill-name | 1x | ~2K | ~15K | ~17K | — |

**Session Total (est.):** ~XK tokens

**Efficiency Recommendations:**
1. [Highest impact — specific and actionable]
2. [Second recommendation]
3. [Third if applicable]

**Chain Opportunity:** [Only include if one exists — skip otherwise]

Keep the full output under 300 words. This lives inside Commander's report — don't pad it.

## Guardrails
- Always label every number as an estimate — never claim exact counts without the Anthropic API usage endpoint
- If no skills fired this session, say so in one line and skip the table
- Do not invent recommendations — only flag real patterns visible in the session context
- Never recommend retiring a skill based on one session's data alone; flag for monitoring instead
- Keep output compact — this is a section inside Commander, not a standalone report
