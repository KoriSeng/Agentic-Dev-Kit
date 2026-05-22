#!/usr/bin/env bash
# install.sh — Prerequisite check for Agentic Dev Kit
# Run after: claude plugin install agentic-dev-kit

set -euo pipefail
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
FAILED=0
pass() { echo -e "${GREEN}✓${NC} $1"; }
warn() { echo -e "${YELLOW}⚠${NC}  $1"; }
fail() { echo -e "${RED}✗${NC} $1"; FAILED=1; }

echo ""; echo "Agentic Dev Kit — Prerequisite Check"; echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"; echo ""

if command -v claude &>/dev/null; then
  pass "claude ($(claude --version 2>/dev/null | head -1))"
else
  fail "claude not found — install from https://docs.anthropic.com/en/docs/claude-code"
fi

if command -v jq &>/dev/null; then
  pass "jq ($(jq --version))"
else
  warn "jq not found — hooks that parse JSON will not work"
  echo "     macOS: brew install jq | Linux: apt install jq"
fi

if command -v git &>/dev/null; then
  pass "git ($(git --version))"
else
  fail "git not found — agents cannot introspect the repository"
fi

if command -v npx &>/dev/null && npx playwright --version &>/dev/null 2>&1; then
  pass "playwright ($(npx playwright --version))"
else
  warn "playwright not found — QA Cell E2E tests will not run"
  echo "     npm install -D @playwright/test && npx playwright install"
fi

if command -v gh &>/dev/null; then
  gh auth status &>/dev/null 2>&1 && pass "gh CLI (authenticated)" || warn "gh CLI found but not authenticated — run: gh auth login"
else
  warn "gh CLI not found — delivery cell PR operations unavailable (https://cli.github.com)"
fi

echo ""; echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [[ $FAILED -eq 0 ]]; then
  echo -e "${GREEN}All required prerequisites met.${NC}"
  echo ""; echo "Next step: run /setup inside Claude Code to configure the kit for your project."
else
  echo -e "${RED}Some required prerequisites are missing. Fix them before using the kit.${NC}"
  exit 1
fi
echo ""
