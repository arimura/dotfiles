#!/bin/sh

input=$(cat)

model=$(printf '%s' "$input" | jq -r '.model.display_name // .model.id // ""')
used=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')

parts=""

[ -n "$model" ] && parts="$model"

if [ -n "$used" ]; then
  used_int=$(printf '%.0f' "$used" 2>/dev/null || printf '%s' "$used")
  [ -n "$parts" ] && parts="$parts | "
  parts="${parts}ctx: ${used_int}%"
fi

printf '%s' "$parts"