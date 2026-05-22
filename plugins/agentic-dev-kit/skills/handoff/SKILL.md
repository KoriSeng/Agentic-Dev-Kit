---
name: handoff
description: >
  Cross-cell handoff protocol for the Agentic Dev Kit. Load when producing or
  consuming a handoff document between the Development, Delivery Engineering,
  or QA cells.
---

# Cross-Cell Handoff Protocol

Template: `${CLAUDE_PLUGIN_ROOT}/docs/templates/HANDOFF.md`
Storage: `memory/handoffs/YYYY-MM-DD-<from>-to-<to>.md`

## When to use a handoff

- Development → Delivery Engineering: implementation ready for deployment review
- Delivery Engineering → QA: deployed to test environment, ready for E2E testing
- QA → Development: test failures requiring code changes
- Any cell → any cell: escalation or scope boundary crossed

## Required fields

| Field | Content |
|---|---|
| **From** | Originating cell and agent name |
| **To** | Receiving cell and orchestrator |
| **Objective** | What was being accomplished |
| **Current state** | Exactly what is true right now — grounded in evidence |
| **Relevant context** | Files changed, decisions made, constraints |
| **Assumptions** | Stated explicitly — not buried in prose |
| **Unresolved risks** | Known unknowns the receiving cell must evaluate |
| **What this handoff does not claim** | Explicit scope boundary |
| **Requested output** | What the receiving cell is being asked to do |

## Bad handoff patterns

- "Implementation is done, please deploy" — no evidence, no constraints
- Omitting known risks to avoid delay
- Stating tests pass without naming which tests under which conditions
- Implying production readiness without observability or rollback evidence
