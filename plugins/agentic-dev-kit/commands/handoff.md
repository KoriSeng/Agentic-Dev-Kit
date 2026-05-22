---
name: handoff
description: Generate a structured cross-cell handoff document.
---

Generate a cross-cell handoff document using the canonical template at `${CLAUDE_PLUGIN_ROOT}/docs/templates/HANDOFF.md`.

$ARGUMENTS

Specify: `--from <cell> --to <cell>` plus any relevant context.

Cell values: `development`, `delivery`, `qa`

The handoff document will be saved to: `memory/handoffs/YYYY-MM-DD-<from>-to-<to>.md`

Every handoff must include:
- Objective
- Current state (grounded in evidence — commit refs, file paths, test results)
- Relevant context and constraints
- Assumptions (explicit, not implied)
- Unresolved risks
- What this handoff does not claim
- Requested output from the receiving cell

Skill: `${CLAUDE_PLUGIN_ROOT}/skills/handoff/SKILL.md`
