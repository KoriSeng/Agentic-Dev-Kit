---
name: status
description: Show current task progress across all cells.
---

Show the current state of in-progress work.

Read `memory/progress.md` and report:
- Active task name and current phase
- Which cell currently holds the task
- Handoff history from `memory/handoffs/`
- Next action

If no task is active, report idle and suggest starting with `/dev`, `/deliver`, or `/qa`.

If `REPOSITORY-CONTEXT.md` is missing, flag it and suggest running `/setup`.
