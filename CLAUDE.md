# Jacob — Global Context for Claude Code

## Who I Am

UGA senior, last semester before graduating. Day-to-day involves classwork, running a golf tournament (wrapping up), and actively learning and experimenting with AI.

Primary goal: land a full-time Business Analyst role at McKinsey & Company immediately out of college. Already in contact with people at several firms — McKinsey is the clear priority. If I ended up at a boutique, my strengths align best with AI/tech/data work, though my genuine interest is in patient-side medical administration — helping hospitals and health systems operate more efficiently.

Things I have built or led: a personal AI-powered cookbook website designed and built from scratch, an annual golf tournament I plan and run, and a spring break trip where I planned and led four people on an RV road trip through national parks.

I am quantitative, like being challenged, and prefer direct and efficient ways of learning. I am further along in understanding and experimenting with AI than most people my age. My interest in tech is more that I am good at it than that I find it consistently interesting — I engage with it when it serves a real purpose.

## My Writing Voice

Analytical and moderately casual — close to how I would articulate something in person if I were being clear and direct. Does not sound corporate, overly polished, or AI-generated.

Tone: straightforward, grounded, confident without being stiff. No filler phrases, excessive hedging, or language that sounds like it came from a template.

Format: mix of short prose and bullet points where bullets genuinely help. Concise — nothing padded. Avoid formatting things as formal headers. If a section needs a label, it should read like normal text, not a bold title.

When producing written work on my behalf, match this voice. Do not default to formal business writing unless the context explicitly requires it.

## Working Preferences

- Before starting any task, confirm we have a shared plan and that I agree with the approach
- Stay within the scope of what we agreed on — do not expand the task without checking first
- Never edit, delete, move, or manipulate any files without explicit permission that is part of the agreed plan
- Default output format is PDF when possible
- Response length does not matter as long as content is substantive — do not pad
- When I ask for something to be copy-ready, return only the exact text with nothing else — no lead-in, no explanation
- Ask clarifying questions before executing if anything is ambiguous
- Show a brief plan before taking action on anything consequential

## My Claude Ecosystem

Five active Claude.ai Projects: Test Prep, Cookbook, Prompt Engineering, Systems Project, Career.

Skills live at: ~/.claude/skills/
Canonical skill repo (GitHub-backed): ~/Desktop/AI/claude-skills/ — git@github.com:jacobgreenwald21/claude-skills.git
Cowork context files at: ~/Desktop/AI/CLAUDE COWORK/CONTEXT/
Claude API course at: ~/Desktop/AI/Claude-Api-Course

## Skill Portfolio (Current)

- critical/ — CRITICAL framework prompt builder
- skill-builder/ — builds and tunes new skills
- handoff/ — generates a single handoff markdown file at end of sessions; also updates CLAUDE.md with session changes
- code-review/ — structured code review with severity tiers and debug handoff
- code-debug/ — five-step debug workflow: reproduce, isolate, hypothesize, fix, verify
- commander: Session auditor. Run with "run Commander." Audits skills, logs misfires, updates MEMORY.md. Backup step removed — git is the source of truth.
- checkpoint/ — mid-session status snapshot; triggered by "status check" or "checkpoint"
- yoda/ — plain-English concept explainer; analogy first, no jargon; triggered by "yoda explain [concept]"
- roundtable/ — end-of-session recap for Jacob; what was built, project state, next steps; triggered by "roundtable" or "session recap"
- verdict/ — decision support; evaluates tradeoffs, gives a clear recommendation; triggered by "what's the verdict on X" or "help me decide between X and Y"
- jarvis/ — proactive advisor; 3 short-term + 1 long-term idea from session + memory context; triggered by "jarvis", "I'm stuck", or "what's next"
- optimus-prime/ — cross-skill system coach; finds trigger overlaps, dead weight, usage patterns, and portfolio gaps; triggered by "optimus-prime", "optimus", or "autobots roll out"
- myth-busters/ — A/B skill evaluator; runs same prompt with/without skill, grades assertions, reports pass rate + relative length; triggered by "myth-busters", "test the skill", or "benchmark [skill]"
- skill-namer/ — generates whimsical + serious name candidates for new skills with trigger phrases; triggered by "let's name this", "name this skill", or "what should I call this"
- fuel-gauge/ — token usage auditor; estimates cost per skill fired, ranks by expense, surfaces efficiency recommendations; triggered by "fuel gauge", "token audit", "check the fuel gauge", or auto-runs inside Commander
- gstack/ — third-party browser automation and shipping skill suite (github.com/garrytan/gstack). Installed at ~/.claude/skills/gstack/; maintained via gstack's own git, not tracked in claude-skills repo. Requires bun (~/.bun/bin/bun) and Playwright Chromium. Standalone skills: /qa (headless browser QA against live URL), /health (code quality scorecard), /retro (commit-history retro), /ship (full PR workflow — cookbook only), /document-release (post-ship doc sync — cookbook only), /review (adversarial code review), /browse (direct browser control). Auto-running safety rails: /careful (blocks destructive commands), /freeze (scopes edits to a directory), /guard (both combined).
Note: roundtable v2 (prompts for handoff at end). Handoff/chat-SKILL v3 (frontmatter trigger added). Commander v10 (session-scoped audit; Tier 2 uses git status skip so unchanged skills aren't re-read; CLAUDE.md + README.md auto-updated at sync without approval; backup step replaced with git status confirmation). critical v2 (trigger tightened). checkpoint v2 (jarvis collision fixed). avoid-ai-writing v3.6.0 (em dashes removed from prose; verbose sections tightened; blog profile voice note added; rewrite mode now proposes structure before writing). fuel-gauge v1.0 (new — token auditor, heuristic estimates, Commander integration). code-review updated 2026-05-09: adversarial chaos-engineer pass, LLM trust boundary + conditional side effect checks, required Verdict line, --terse mode, proactive triggers. roundtable updated 2026-05-09: --terse mode. verdict updated 2026-05-09: proactive trigger section. gstack installed 2026-05-09 (bun + Playwright Chromium). Cookbook project now has .claude/CLAUDE.md with gstack workflow registered. 2026-05-11: guardrail hardening — fuel-gauge hard stop at 500K tokens; myth-busters/skill-builder ambiguity defaults to FAIL; commander flags uncertain Tier 1 findings; code-review + code-debug must read callers before suggesting boundary changes. myth-busters v4 (2026-05-15): phases 3 & 4 now fire parallel agents — contamination structurally prevented. Retired: tapestry-skills/scrum-sage, tapestry-skills/session-log, busn4400 (moved to ~/.claude/skills/_retired/), resume-tailoring (deleted — was third-party marketplace clone). 2026-04-28: ~/.claude/skills and ~/.claude/CLAUDE.md are now symlinked into ~/Desktop/AI/claude-skills/ — no copy-sync needed; git add . && commit && push is the full sync workflow.

## Handoff File Output

When "generate handoff" is triggered:
- Single file: [project-name]-handoff.md written to ~/Desktop/AI/scratch/markdown-handoffs/
- Also updates CLAUDE.md with anything that changed this session (new skills, decisions, state)
- Skill files: ~/.claude/skills/handoff/chat-SKILL.md and ~/.claude/skills/handoff/claude-code-SKILL.md

## Open Items

When Jacob says "flag that" or "flag this" mid-session, append the item to `~/.claude/projects/-Users-jacob/memory/open-items.md` with today's date. Commander reads and clears resolved items at each session end.

## Key Frameworks

CRITICAL = Context, Role, Intent, Task, Instructions, Criteria, Audience, Learning — my primary structured prompting tool. Default to it for prompt-building tasks.
