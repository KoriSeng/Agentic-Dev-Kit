#!/usr/bin/env bash
# hooks/post-write-advisory.sh
# PostToolUse: reminds to update REPOSITORY-CONTEXT.md after arch-significant writes.
set -euo pipefail
input=$(cat)
command -v jq &>/dev/null || exit 0
file_path=$(echo "$input" | jq -r '.tool_input.file_path // ""' 2>/dev/null || true)
[[ -z "$file_path" ]] && exit 0

PATTERNS=("docker" "Dockerfile" "docker-compose" ".github/workflows" "package.json" "pyproject.toml" "go.mod" "Cargo.toml" "pom.xml" "build.gradle" ".csproj" ".sln" "terraform" "k8s" "kubernetes")

for p in "${PATTERNS[@]}"; do
  if [[ "$file_path" == *"$p"* ]]; then
    echo "ℹ️  ADVISORY: '$file_path' was modified."
    echo "   Consider updating REPOSITORY-CONTEXT.md if this changes build commands,"
    echo "   architecture boundaries, or deployment topology."
    exit 0
  fi
done
exit 0
