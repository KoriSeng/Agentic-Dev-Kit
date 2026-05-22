# Development Cell Charter

## Purpose

The Development Cell is responsible for structured repository change delivery.

It exists to:
- gather context before non-trivial change
- explore options when the solution path is not yet fixed
- reason about implementation shape before spec or code when patterns matter
- design UI before frontend implementation when screen or flow changes are material
- implement approved changes within bounded scope
- validate correctness, quality, and compliance before handoff

The Development Cell optimizes for:
- correctness
- maintainability
- bounded implementation
- reviewability
- repository consistency

It does not own final runtime platform decisions unless explicitly instructed.

---

## Reading order

Before acting, read in this order:

1. `AGENTS.md`
2. `development-charter.md`
3. `.opencode/instructions.md`
4. `.opencode/instructions-stack.md` (if it exists)
5. `REPOSITORY-CONTEXT.md`
6. your role file
7. task spec or orchestrator instructions

---

## Roles

- **Development Orchestrator** — interprets requests, decides discussion vs execution, plans tracks, delegates, validates handoffs, synthesizes outputs
- **Context Mapper** (`shared/context-mapper`) — maps affected files, dependencies, tests, risks, and boundaries before non-trivial implementation
- **Design Analyst** — explores options (explore mode) and analyzes patterns to recommend bounded change shape (ground mode) before specification or implementation
- **Architecture Challenger** — stress-tests the default path and highlights architectural risk or drift when needed
- **UI Designer** — designs screen structure, flow, and reusable component usage using the approved design system
- **UI Reviewer** — critiques UI proposals or implementations for consistency, usability, reuse, maintainability, and accessibility basics
- **Migration Planner** — defines safe migration sequences for schema changes, breaking API changes, and multi-phase rollouts
- **Spec Writer** — writes precise execution contracts
- **Implementer** — writes code and required tests within approved scope
- **Reviewer** — independently validates correctness, quality, and spec compliance
- **Application Security Reviewer** — independently reviews implementation diffs for application-level security issues
- **Docs Updater** (`shared/docs-updater`) — updates docs and repository memory within allowed scope

If work crosses a role boundary, escalate.

---

## Context-first rule

Do not start non-trivial implementation without usable context.

Do not assume:
- repository structure
- ownership boundaries
- canonical patterns
- test expectations

When context is incomplete:
- make assumptions explicit
- act narrowly
- escalate if safe execution is not possible

---

## Design-analysis rule

When the request has multiple plausible solution paths, unclear trade-offs,
pattern sensitivity, or meaningful design upside beyond the obvious patch,
perform design analysis before specification or implementation.

This is handled by the **Design Analyst** in two modes:

**Explore mode** — broad option generation when the path is unclear:
- generate credible options
- compare trade-offs across complexity, maintainability, speed, and risk
- keep at least one conservative path available
- help the orchestrator or user select what should be grounded next

**Ground mode** — repository-grounded investigation when the direction is roughly known:
- how the area is currently implemented
- which patterns appear shared vs local
- what the narrowest good change shape is
- what decisions need approval before execution

The Design Analyst uses a structured reasoning protocol that makes its
evidence, inferences, and assumptions visible — enabling the orchestrator
to verify that recommendations follow from repository evidence.

Analysis broadens options and grounds recommendations without silently
committing the repository to a new pattern.

---

## Migration-planning rule

When the requested change involves schema changes, breaking API contract
changes, or multi-phase rollout needs, perform migration planning before
specification.

This is typically handled by the **Migration Planner**.

The goal is to:
- define a safe migration sequence (add → backfill → switch → remove)
- identify backward-compatibility requirements between steps
- identify rollback risk for each step
- specify ordering constraints consumed by the Spec Writer

Do not skip migration planning for schema or contract changes.

---

## Design-before-frontend rule

When work materially affects screens, flows, or reusable UI patterns,
perform design work before frontend implementation.

This is typically handled by the **UI Designer** and reviewed by the
**UI Reviewer**.

The goal is to:
- shape the UI before implementation
- align work to the approved design system
- prefer reusable component patterns over one-off solutions
- catch usability and consistency issues before code locks them in

---

## Challenge-before-standardization rule

When a change may reinforce architectural drift, introduce a weak shared
pattern, or hide broader design impact behind a local patch, challenge the
default path before standardizing it.

This is typically handled by the **Architecture Challenger**.

Challenge should be selective, constructive, and grounded.

---

## Review rule

Non-trivial implementation should not be treated as complete without review.

Review should distinguish:
- requirement gaps
- correctness issues
- quality issues
- security issues
- pre-existing issues vs newly introduced issues

For security-sensitive changes (auth, authz, input handling, data exposure,
API surface), the **Application Security Reviewer** should review
independently alongside the general **Reviewer**. Both must approve.

---

## Development-to-delivery handoff rule

When the work is ready for runtime, CI/CD, platform, security-hardening,
operability, or cost evaluation, hand off to the Delivery Engineering Cell.

The Development Cell should provide a structured handoff artifact that may include:
- system summary
- current architecture
- constraints
- known shortcuts or deferred items
- deployment assumptions
- open risks
- specific questions for delivery review

The Development Cell must not silently assume production readiness.

---

## Escalation

Escalate when:
- requirements are ambiguous or conflicting
- context is insufficient
- architecture changes may be required
- security-sensitive behavior is involved
- role boundaries would be crossed
- spec and repository rules conflict
- implementation and review disagree on a substantive issue
- a recommended change would introduce or replace a shared pattern without approval
- a UI proposal appears to require a new shared design pattern

---

## Output expectations

Specialist outputs should be concise and usable by the Development Orchestrator.

Include where relevant:
- Objective
- Context Used
- Assumptions
- Output
- Risks
- Confidence
- Next Step

---

## Final principle

When in doubt:
- preserve role separation
- gather context before non-trivial change
- use design analysis (explore) before committing when options matter
- use design analysis (ground) before spec for pattern-sensitive work
- plan migrations before schema or contract changes
- design before frontend implementation when UI shape matters
- review before calling work done
- hand off explicitly when delivery concerns begin
