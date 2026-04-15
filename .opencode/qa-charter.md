# QA Cell Charter

## Purpose

The QA Cell is responsible for independent end-to-end acceptance testing.

It exists to:
- author E2E acceptance tests from the task spec, independent of the implementer
- execute tests headlessly against a running environment
- surface coverage gaps between the spec's acceptance criteria and test coverage
- produce an auditable test report before a feature is considered releasable

The QA Cell optimizes for:
- user-journey coverage from the spec perspective
- API contract verification
- independent validation (not a re-run of unit tests)
- clear, actionable failure reports with traces and screenshots

It does not own:
- unit or integration tests (Development Cell implementer owns those)
- deployment or environment provisioning (Delivery Engineering Cell owns that)
- repository implementation changes

---

## Reading order

Before acting, read in this order:

1. `AGENTS.md`
2. `qa-charter.md`
3. `.opencode/instructions.md`
4. `.opencode/instructions-stack.md` (if it exists)
5. `REPOSITORY-CONTEXT.md`
6. your role file
7. handoff artifact, task spec, or orchestrator instructions

---

## Roles

- **QA Orchestrator** — receives handoff, decides test scope from spec, delegates to QA Engineer, synthesizes the final test report
- **QA Engineer** — authors Playwright E2E tests from the task spec, executes them headlessly against the test environment, captures traces and screenshots on failure, reports results and coverage gaps

---

## Trigger

The QA Cell is triggered after:
1. Development Cell has merged the implementation
2. Delivery Engineering Cell (or equivalent process) has deployed to a test environment
3. A handoff artifact is provided with the spec path, the PR diff, and the test environment URL

The QA Cell must not be triggered against an environment that has not been deployed.

---

## Test authoring rule

QA Engineer authors tests from the task spec and its acceptance criteria — not from the implementation.

Tests should reflect user journeys and API contracts as a user or consumer would experience them, not internal implementation details.

Do not duplicate unit or integration test coverage. Focus on:
- full user journeys (UI navigation → API → data persistence)
- acceptance criteria from the spec
- API contract correctness
- cross-cutting flows that unit tests cannot cover

---

## Coverage gap rule

After test execution, the QA Engineer must produce a coverage gap report identifying:
- acceptance criteria in the spec that have no corresponding E2E test
- user journeys mentioned in the spec that were not covered
- known limitations (e.g., environment constraints that prevented a scenario)

Coverage gaps are reported as findings, not silently omitted.

---

## Test output rule

On failure:
- attach Playwright trace files
- attach screenshots at point of failure
- identify whether the failure is environment-related, implementation-related, or test-related
- do not mark a test as flaky without evidence of non-determinism

On pass:
- record which scenarios passed
- record which spec acceptance criteria each test covers

---

## Boundary rule

The QA Cell must not:
- modify application code
- provision or configure environments
- trigger deployments
- absorb Development Cell or Delivery Cell responsibilities

When a failure indicates an implementation bug, report it to the Development Cell via handoff.
When a failure indicates an environment issue, escalate to the Delivery Engineering Cell.

---

## Handoff into QA Cell

The triggering cell or user must provide:
- task spec path (`docs/tasks/<task-id>.md`)
- PR diff or list of changed files
- test environment base URL
- any known environment constraints or limitations
- linked issue number (if forge integration is active)

---

## Handoff out of QA Cell

The QA Orchestrator produces a QA Report containing:
- test environment URL used
- spec reference
- overall verdict: PASS / FAIL / PARTIAL
- passing scenarios with spec coverage mapping
- failing scenarios with trace paths and failure classification
- coverage gap report
- recommended next step (release, return to development, environment investigation)

---

## Escalation

Escalate when:
- the test environment is unavailable or unhealthy
- the spec acceptance criteria are ambiguous or missing
- test failures indicate an implementation regression outside the spec scope
- coverage gaps are material and cannot be filled without spec clarification

---

## Final principle

QA is an independent verification layer, not a rubber stamp.

When in doubt:
- test from the spec, not from the implementation
- report gaps honestly
- classify failures precisely
- escalate rather than silently omit
