---
name: qa
description: Invoke the QA Cell Orchestrator to scope and run Playwright E2E tests against a deployed test environment.
---

Invoke the QA Cell Orchestrator for independent end-to-end acceptance testing.

$ARGUMENTS

Provide: task spec path, test environment URL, and any known environment constraints.

The QA Cell tests from acceptance criteria in the spec — independent of the implementation.

Prerequisites:
- Playwright: `npm install -D @playwright/test && npx playwright install`
- A deployed test environment URL (staging, preview, or local)

Agent: `qa-orchestrator`
