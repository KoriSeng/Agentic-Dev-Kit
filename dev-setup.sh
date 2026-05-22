#!/usr/bin/env bash
# dev-setup.sh — Symlink plugin source into .claude/ for local development
# Usage:  ./dev-setup.sh          create symlinks
#         ./dev-setup.sh --clean  remove symlinks

set -euo pipefail
PLUGIN_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$PLUGIN_ROOT/.claude"
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
COMPONENTS=("agents" "commands" "skills" "hooks")

if [[ "${1:-}" == "--clean" ]]; then
  echo "Removing dev symlinks..."
  for comp in "${COMPONENTS[@]}"; do
    target="$CLAUDE_DIR/$comp"
    if [[ -L "$target" ]]; then rm "$target"; echo -e "${YELLOW}removed${NC}  .claude/$comp"; fi
  done
  echo "Done."; exit 0
fi

mkdir -p "$CLAUDE_DIR"
echo "Creating dev symlinks for local plugin development..."; echo ""

for comp in "${COMPONENTS[@]}"; do
  src="$PLUGIN_ROOT/$comp"
  target="$CLAUDE_DIR/$comp"
  if [[ ! -d "$src" ]]; then echo -e "${YELLOW}skip${NC}    $comp/ (directory does not exist)"; continue; fi
  if [[ -L "$target" ]]; then
    echo -e "${YELLOW}exists${NC}  .claude/$comp -> ../$comp"
  elif [[ -d "$target" ]]; then
    echo "WARNING: .claude/$comp is a real directory. The plugin agents are already there."
    echo "         For dev mode: remove .claude/$comp and re-run this script."
  else
    ln -s "../$comp" "$target"
    echo -e "${GREEN}linked${NC}  .claude/$comp -> ../$comp"
  fi
done

echo ""; echo "Dev symlinks active. Start Claude Code in this directory to develop the plugin."
echo "To remove:  ./dev-setup.sh --clean"
