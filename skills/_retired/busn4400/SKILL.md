---
trigger: "Use this skill for BUSN 4400 class deliverables only. Trigger phrases include: 'BUSN 4400', 'busn4400', 'do it again', 'another Slack comment', 'next blog reaction', 'class blog', 'slack post for class', 'blog post for class', 'reaction post', 'weekly reaction', 'class discussion post', 'peer comment for class'. Do NOT trigger on generic writing requests like 'write a blog post' or 'draft a slack message' that lack explicit class context."
---

# BUSN 4400 Router Skill

## Purpose
Route BUSN 4400 deliverable requests to the correct sub-process based on context. One skill handles all four recurring deliverable types.

## Deliverable Types
1. Slack comment — a reply to a classmate's Slack post
2. Slack post — a weekly reaction post to a reading or class topic
3. Blog post — an 800-1200 word WordPress blog post
4. Blog comment — a reply to a classmate's blog post

## Routing Logic

### Phase 1 — Read Context
Before asking anything:
- Check current directory for any relevant files (drafts, readings, notes)
- Check if the user's message mentions a specific deliverable type
- Check if there is a prior deliverable in this session to use as a "do it again" reference

### Phase 2 — Identify Deliverable Type
If the deliverable type is clear from context, state it and proceed.
If ambiguous, ask one question only: "Which deliverable — Slack comment, Slack post, blog post, or blog comment?"

### Phase 3 — Route to Sub-Process
Before routing, check:
- If the input contains a URL AND the deliverable type is Slack post or Slack comment, invoke the article-extractor skill at ~/.claude/skills/tapestry-skills/article-extractor/ and use the extracted content as source material before proceeding.

Load the appropriate reference file and execute it:
- Slack comment → references/slack-comment.md
- Slack post → references/slack-post.md
- Blog post → references/blog-post.md
- Blog comment → references/blog-comment.md

### Phase 4 — Deliver Output
Produce the deliverable per the reference file's specs. Copy-ready output only — no lead-in, no explanation unless asked.

## Guardrails
- Never produce output before identifying the deliverable type
- Never ask more than one clarifying question
- Always read context files before asking the user for information
- "Do it again" means same deliverable type, new content — never recycle prior output
- Output must be copy-ready and within the word/length constraints of the sub-process
- After generating any draft output, run the avoid-ai-writing skill at ~/.claude/skills/avoid-ai-writing/SKILL.md before returning the final output to the user — applies to all four deliverable types
