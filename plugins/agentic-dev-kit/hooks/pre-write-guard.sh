#!/usr/bin/env bash
# hooks/pre-write-guard.sh
# PreToolUse: warns before writing to plugin governance files.
set -euo pipefail
input=$(cat)
command -v jq &>/dev/null || exit 0
file_path=$(echo "$input" | jq -r '.tool_input.file_path // ""' 2>/dev/null || true)
[[ -z "$file_path" ]] && exit 0

PROTECTED=("AGENTS.md" "CLAUDE.md" ".claude-plugin/plugin.json" "context/development-charter.md" "context/delivery-charter.md" "context/qa-charter.md" "context/instructions.md")

for p in "${PROTECTED[@]}"; do
  if [[ "$file_path" == *"$p"* ]]; then
    echo "⚠️  GOVERNANCE GUARD: '$file_path' is a plugin governance file."
    echo "   Modifying it changes behaviour for all users of this plugin."
    echo "   Confirm this is intentional before proceeding."
    exit 0
  fi
done
exit 0
