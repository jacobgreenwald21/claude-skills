# BUSN 4400 — Slack Comment Reference

## What This Produces
A single Slack comment on a classmate's post, in Jacob's voice.

## Before Starting
If the input contains a URL, invoke the article-extractor skill at ~/.claude/skills/tapestry-skills/article-extractor/ and use the extracted content as source material before proceeding.

If the article text or post content has not been provided, ask:
> "Can you paste the article text or post content so I can work from the actual material?"
Do not proceed on a title or summary alone.

## Pattern (extracted from Jacob's actual comments)
- Open with "Hi [name]" — Jacob will fill in the name manually
- Lead with the most provocative or underexplored angle in the article
- Add specific evidence, a counterexample, or a mechanism the article didn't include
- End with a sharp structural observation — not a question
- Denser and more substantive than blog comments — reads like a tight mini-argument
- 4-6 sentences

## Tone
Analytical, direct. More argumentative than blog comments. Pushes the idea to its logical conclusion or surfaces a tension the original post didn't resolve.

## Examples of Jacob's Actual Comments

**Example 1 (on AI and CEO succession):**
Hi Marissa, this was cool to read. Stepping down to make room for AI-fluent leadership can look like pragmatism, but it also functions as a convenient narrative (quit vs fired). The more interesting question isn't whether these CEOs made the right call, but whether AI is genuinely requiring a different kind of executive or whether boards are using it as cover to accelerate successions they already wanted. This is the exact same idea of if the current large layoffs are actually due to AI or if AI is just a cover of necessary cuts post-Covid. It will be interesting to see if understanding the tools or actually being really AI savvy is the way to be CEO going forward.

**Example 2 (on AI and entry-level job displacement):**
Hi Giovanna, the reshaping vs replacement distinction seems to be doing a lot of work in the BCG estimate. Reshaping sounds a bit softer than it is and could be anything from minor workflow changes to complete company overhauls. The replacement concern with AI is real, since it's not just about output, but cost. It will be much cheaper and less labor-intensive to train an AI model to do all of the work that a company would otherwise pay for an entry-level role. Not only is this bad for hiring, but it is also a real threat to career growth opportunities.

**Example 3 (on AI in obstetrics):**
Hi Theresa, this is fantastic! Seeing AI used for genuine purposes is always heartwarming. Eight days is still a large window, so there could still be issues at the tails. However, as the model continues to train on more data, I believe it will get better. It's also important to note that while it may not be perfect, providing any care in more rural areas is infinitely better than providing none. I am curious how much of a factor a patient's background actually plays into ultrasound images, and how the AI will be able to respond to outliers.

## Final Step
Run avoid-ai-writing on the completed draft before returning output.

## Output Format
Return one comment only. No label, no preamble, no sign-off.
