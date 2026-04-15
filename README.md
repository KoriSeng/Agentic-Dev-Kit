# Agent Dev Kit

A multi-agent system for structured software delivery. Works with **OpenCode** and **Claude Code**.

Agents are organised into three cells — Development, Delivery Engineering, and QA — each with a clear scope, its own specialists, and explicit handoffs between them. The system is stack-agnostic: run `/setup` to configure it for your project.

---

## Quick start

**1. Use this repo as a template**

Click **Use this template** on GitHub, or clone and re-initialise:

```bash
git clone https://github.com/KoriSeng/Agent-Dev-Kit my-project
cd my-project
rm -rf .git && git init && git checkout -b main
```

**2. Open in your coding agent tool**

- OpenCode: `opencode` in the project directory
- Claude Code: `claude` in the project directory

**3. Run setup**

```
/setup
```

That's it. `/setup` interviews you about your stack and generates the configuration the agents need. It takes 2–5 minutes. You only do it once (or again when your stack changes).

---

## What `/setup` does

`/setup` asks you about your project and generates three things:

| Output | Purpose |
|---|---|
| `REPOSITORY-CONTEXT.md` | Tells all agents about your repo — structure, commands, architecture, conventions |
| `.opencode/instructions-stack.md` | Stack-specific engineering rules (language, framework, testing, build) |
| Agent permission updates | Which bash commands each agent needs for your build tools |

It also asks which coding agent tool your team uses (OpenCode / Claude Code / both) and records that in `AGENTS.md`.

You can pass your stack description directly to skip the interview:

```
/setup Go backend with Chi, React frontend with Vite, PostgreSQL with sqlc, Vitest for testing
```

---

## The three cells

### Development Cell

The day-to-day engineering cell. Handles every phase of a feature from first analysis through code review.

| Role | Does |
|---|---|
| **Orchestrator** | Your primary entry point. Interprets requests, plans work, coordinates all specialists |
| **Context Mapper** | Maps affected files, dependencies, tests, and risks before non-trivial changes |
| **Design Analyst** | Explores solution options and grounds recommendations in the actual codebase |
| **Architecture Challenger** | Stress-tests assumptions, flags drift, and surfaces stronger alternatives |
| **Migration Planner** | Sequences schema changes, breaking API changes, and multi-phase rollouts safely |
| **UI Designer** | Shapes screens and flows aligned to the design system before implementation |
| **UI Reviewer** | Critiques UI for consistency, reuse, and accessibility |
| **Spec Writer** | Writes the precise execution contract the Implementer follows |
| **Implementer** | Writes code and tests in an isolated worktree, exactly to spec |
| **Reviewer** | Independently validates correctness, quality, and spec compliance |
| **Security Reviewer** | Reviews diffs for application-level security issues |

### Delivery Engineering Cell

Engaged when implementation is done and you need to evaluate deployment readiness. Review-led — it recommends, it does not rewrite application logic.

| Role | Does |
|---|---|
| **Orchestrator** | Coordinates delivery reviews and synthesises guidance |
| **Pipeline Engineer** | Reviews CI/CD design, build flow, artifacts, rollback readiness |
| **Platform Evaluator** | Evaluates runtime fit, hosting topology, scaling, and cost |
| **DevSecOps Reviewer** | Reviews secrets handling, IAM/RBAC, supply chain, and deployment-path security |
| **Observability Engineer** | Reviews logging, metrics, tracing, alerting, and operational readiness |

### QA Cell

Engaged after a feature is deployed to a test environment. Authors and runs Playwright E2E tests from the task spec — independent of what the implementer wrote.

| Role | Does |
|---|---|
| **QA Orchestrator** | Scopes test coverage from the spec, drives the QA Engineer, synthesises the report |
| **QA Engineer** | Writes Playwright tests from acceptance criteria, runs them headlessly, reports results and coverage gaps |

---

## How the cells work together

```
Your request
     │
     ▼
Development Cell
  map context → design → spec → implement → review
     │
     │ handoff (when implementation is ready for deployment evaluation)
     ▼
Delivery Engineering Cell
  pipeline → platform → security → observability
     │
     │ handoff (after deployment to test environment)
     ▼
QA Cell
  scope tests → author → execute headlessly → report
```

Each handoff uses the template at `docs/templates/HANDOFF.md`. Cells do not silently absorb each other's responsibilities.

---

## Governance

`AGENTS.md` is the root governance contract. Every agent reads it first. It defines:
- which cells exist and what they own
- shared rules that apply across all agents
- cell boundary rules and escalation expectations
- reading order for all agents

Cell charters refine how each cell operates within that governance:

```
.opencode/development-charter.md
.opencode/delivery-charter.md
.opencode/qa-charter.md
```

Universal engineering rules live in `.opencode/instructions.md`. Stack-specific rules are generated by `/setup` into `.opencode/instructions-stack.md` and are gitignored by default until you review and commit them.

---

## Tool support

Both OpenCode and Claude Code agent definitions are included. They carry the same role content — only the frontmatter format differs.

```
.opencode/agents/   ← OpenCode format (permission blocks, mode:)
.claude/agents/     ← Claude Code format (tools:, name:, description:)
```

Run `/setup` to record which tool your team uses. Both sets remain in the repo regardless — switching tools later requires no cleanup.

---

## Repo layout

```
.opencode/
  agents/
    development-cell/   ← 10 specialist agents + orchestrator
    delivery-cell/      ← 4 specialist agents + orchestrator
    qa-cell/            ← qa-engineer + orchestrator
    shared/             ← context-mapper, docs-updater (used across cells)
  commands/
    setup.md            ← /setup command
  development-charter.md
  delivery-charter.md
  qa-charter.md
  instructions.md       ← universal engineering rules
  instructions-stack.md ← generated by /setup (stack-specific rules)
.claude/
  agents/               ← Claude Code versions of all agents above
docs/
  templates/
    HANDOFF.md          ← cross-cell handoff template
AGENTS.md               ← root governance contract (read this first)
REPOSITORY-CONTEXT.md   ← generated/updated by /setup
```
