#!/bin/sh

input=$(cat)

model=$(printf '%s' "$input" | jq -r '.model.display_name // .model.id // ""')
remaining=$(printf '%s' "$input" | jq -r '.context_window.remaining_percentage // empty')
input_tokens=$(printf '%s' "$input" | jq -r '.context_window.total_input_tokens // 0')
output_tokens=$(printf '%s' "$input" | jq -r '.context_window.total_output_tokens // 0')

total_tokens=$((input_tokens + output_tokens))

parts=""

[ -n "$model" ] && parts="$model"

if [ -n "$remaining" ]; then
  remaining_int=$(printf '%.0f' "$remaining" 2>/dev/null || printf '%s' "$remaining")
  [ -n "$parts" ] && parts="$parts | "
  parts="${parts}ctx remaining: ${remaining_int}%"
fi

if [ "$total_tokens" -gt 0 ]; then
  [ -n "$parts" ] && parts="$parts | "
  parts="${parts}tokens: ${total_tokens}"
fi

printf '%s' "$parts"