---
name: dev
description: Invoke the Development Cell Orchestrator for feature work, code changes, design, spec, implementation, or review.
---

Invoke the Development Cell Orchestrator with the task described after the command.

$ARGUMENTS

The Development Cell Orchestrator will:
1. Read `AGENTS.md` and `${CLAUDE_PLUGIN_ROOT}/context/development-charter.md` for governance context
2. Read `${CLAUDE_PLUGIN_ROOT}/context/instructions.md` for engineering rules
3. Read `REPOSITORY-CONTEXT.md` for project-specific context (if it exists)
4. Interpret the task and decide discussion vs execution mode
5. Coordinate the appropriate specialists: map context → design → spec → implement → review

If `REPOSITORY-CONTEXT.md` does not exist in this project, run `/setup` first.

Agent: `development-orchestrator`
