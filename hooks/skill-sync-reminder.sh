#!/bin/bash
# Stop hook: remind once per batch of unsynced edits to run Commander or handoff.
# Ignores skills/synced and skills/.trash (claude.ai sync churn). A clean repo
# clears the marker, so the next batch of edits reminds again.

repo="$HOME/Desktop/AI/claude-skills"
sid=$(jq -r '.session_id // "unknown"')
marker="${TMPDIR:-/tmp}/claude-skill-reminder-$sid"

changed=$(git -C "$repo" status --porcelain -- . ':(exclude)skills/synced' ':(exclude)skills/.trash' | wc -l | tr -d ' ')

if [ "$changed" -eq 0 ]; then
  rm -f "$marker"
  exit 0
fi

[ -e "$marker" ] && exit 0
touch "$marker"
printf '{"systemMessage":"%s skill-repo file(s) uncommitted. Run Commander or generate handoff before you close this session."}\n' "$changed"
