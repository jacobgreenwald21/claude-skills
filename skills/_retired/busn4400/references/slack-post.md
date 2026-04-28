# BUSN 4400 — Slack Article Post Reference

## What This Produces
A Slack post sharing an article with the class, in Jacob's voice. Always two versions.

## Before Starting
If the input contains a URL, invoke the article-extractor skill at ~/.claude/skills/tapestry-skills/article-extractor/ and use the extracted content as source material before proceeding.

If the article text has not been provided, ask:
> "Can you paste the article text so I can work from the actual material?"
Do not proceed on a headline or summary alone.

## Pattern (extracted from Jacob's actual posts)
- Open with "Hi class!"
- Lead with the sharpest, most specific claim from the article — not a recap
- Layer in one or two concrete details or numbers that create real tension
- Build toward a structural observation or implication the article didn't fully state
- End with one sentence that reframes the whole thing
- 5-7 sentences total, reads like a tight argument not a summary
- Two versions always: one leading with the mechanism/logic angle, one leading with the financial/structural or consequence angle — whatever the two sharpest entry points into the article are

## Tone
Dense, substantive, confident. Not a summary. Not a teaser. A specific argument built from the article's material that gives the reader something to think about before they click through.

## Examples of Jacob's Actual Posts

**Example 1 (on AI autonomous weapons):**
Hi class! I just read an interesting article comparing the AI arms race to the nuclear arms race. The argument for building autonomous weapons is essentially the same one that justified nuclear stockpiles: if both sides know what the machines can do, neither will risk finding out. That logic held during the Cold War because nuclear weapons required deliberate human decisions at every step. AI weapons are specifically designed to eliminate that lag. China is already developing systems where dozens of drones coordinate attacks without human input; Russia's Lancet drone has incorporated autonomous targeting. RAND exercises going back to 2020 showed that autonomous systems didn't prevent escalation, and instead, they accelerated it. One scenario had a U.S.-Japan system autonomously counterattacking a North Korean missile launch without anyone actively deciding to. The retired general who helped start Project Maven said the race he built keeps him up at night. Deterrence only works when both sides can pause long enough to recognize the cost of escalation, and these systems are built to make that pause impossible. Governments need to be very careful as they navigate building deterrence into AI systems.

**Example 2 (on OpenAI/Anthropic pre-IPO financials):**
Hi class! OpenAI and Anthropic have started reporting profit in two ways: one that includes the cost of training new AI models, and one that doesn't. If you strip out the training costs, then both companies look almost healthy. But, if you add them back in, OpenAI doesn't expect to break even until the 2030s while planning to burn $85 billion in a single year. The accounting flexibility may be convenient, but it raises a real question about what "profitable AI company" will actually mean when these things IPO. The model training arms race is accelerating, not stabilizing. The bet investors are being asked to take isn't that AI is valuable, it's that one of these companies can outlast the cost curve just long enough to truly capture that value.

## Final Step
Run avoid-ai-writing on the completed drafts before returning output.

## Output Format
Return two versions, labeled:

**Post:**
[version 1]

**ALT:**
[version 2]

No preamble, no explanation after.
