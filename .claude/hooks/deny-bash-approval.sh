#!/usr/bin/env bash
set -euo pipefail

cmd="$(jq -r '.tool_input.command // ""')"

jq -n --arg msg "Bash command requiring approval was denied: $cmd" '{
  hookSpecificOutput: {
    hookEventName: "PermissionRequest",
    decision: {
      behavior: "deny",
      message: $msg,
      interrupt: false
    }
  }
}'
