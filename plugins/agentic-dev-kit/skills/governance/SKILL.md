---
name: governance
description: >
  Multi-cell governance rules for the Agentic Dev Kit. Load when you need to
  enforce cell boundaries, escalation rules, handoff protocol, precedence order,
  or shared operating rules across the Development, Delivery Engineering, and QA cells.
---

# Multi-Cell Governance

See `AGENTS.md` for the full root governance contract.
See `${CLAUDE_PLUGIN_ROOT}/context/development-charter.md`, `delivery-charter.md`, `qa-charter.md` for cell-specific rules.

## Cell model

- **Development Cell** — feature delivery: context mapping, design, spec, implementation, review
- **Delivery Engineering Cell** — deployment readiness: CI/CD, platform, DevSecOps, observability
- **QA Cell** — independent E2E acceptance testing from spec, headless Playwright execution

Cells must not silently absorb each other's responsibilities.

## Precedence (highest to lowest)

1. Repository governance policies
2. `AGENTS.md`
3. Relevant cell charter
4. `${CLAUDE_PLUGIN_ROOT}/context/instructions.md`
5. `.claude/instructions-stack.md` (if it exists)
6. `REPOSITORY-CONTEXT.md`
7. Agent role file
8. Task spec or orchestrator instructions

## All agents must

- Stay within the approved task scope
- Distinguish facts, assumptions, and recommendations explicitly
- State material uncertainty when context is incomplete
- Use `${CLAUDE_PLUGIN_ROOT}/docs/templates/HANDOFF.md` for all cross-cell handoffs
- Escalate when crossing cell or approval boundaries

## All agents must not

- Present guesses as facts
- Silently broaden scope
- Claim validation they did not perform
- Claim production readiness without evidence
- Bypass required review or approval steps

## Escalation triggers

- Requirements are ambiguous or conflicting
- Cell boundaries would be crossed
- Architecture, platform, or security changes may be required
- One cell's output conflicts with another cell's recommendation
- Approval was not explicitly granted
