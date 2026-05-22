---
name: setup
description: One-time project setup — configure the agent system for your tech stack
---

Configure the agent system for this repository's specific tech stack.

$ARGUMENTS

## What this command does

1. Identifies which coding agent tool the team uses (OpenCode, Claude Code, or both)
2. Collects information about the repository's tech stack
3. Generates `REPOSITORY-CONTEXT.md` with correct paths, commands, and conventions
4. Generates `.claude/instructions-stack.md` with language and framework-specific engineering rules
5. Identifies which agent bash permissions need updating for the build tools
6. Records the tool choice in `AGENTS.md`

## Modes

### Descriptive mode
If `$ARGUMENTS` contains a stack description, use it directly and skip interview questions already answered.

### Interactive mode
If `$ARGUMENTS` is empty, walk through the interview questions below.

## Interview questions

When information is missing, ask these questions. Group related questions to minimise back-and-forth. Do not ask about things already stated in `$ARGUMENTS`.

### Tool (ask first, always)
0. **Coding agent tool**: Which tool does your team use to run agents?
   - **OpenCode** — agents live in `.opencode/agents/`
   - **Claude Code** — agents live in `.claude/agents/`
   - **Both** — keep both sets (useful for mixed teams or if you plan to switch)

   This is recorded in `AGENTS.md` so agents know which configuration is authoritative.

### Core stack (required)
1. **Backend**: What language and framework? (e.g., C# + ASP.NET, Go + Chi, Python + FastAPI, Java + Spring Boot, Node + Express)
2. **Frontend**: What framework? (e.g., Angular, React, Vue, Svelte, Next.js, none)
3. **Repository type**: Monorepo (backend + frontend together), or separate repos?

### Architecture (required)
4. **Backend structure**: How are backend projects/modules organized? (e.g., layered Api/Application/Core/Infrastructure, hexagonal, feature-folders, flat)
5. **Frontend structure**: How is the frontend organized? (e.g., feature-level folders, pages router, app router, nx workspace)

### Data (ask if not stated)
6. **Database**: What database and access layer? (e.g., PostgreSQL + EF Core, MySQL + Prisma, MongoDB + Mongoose)
7. **Migrations**: How are schema changes managed? (e.g., EF migrations, Flyway, Alembic, Prisma migrate)

### Testing (ask if not stated)
8. **Backend testing**: What test framework? (e.g., xUnit + Moq, pytest, Go testing, JUnit + Mockito)
9. **Frontend testing**: What test framework? (e.g., Jest, Vitest, Karma, Playwright for e2e)
10. **Integration testing**: Any container-based testing? (e.g., Testcontainers, docker-compose test)

### Build and tooling (ask if not stated)
11. **Package manager**: What package manager for frontend? (e.g., npm, yarn, pnpm, bun)
12. **Build commands**: What are the main build/test/lint commands?

## Output: REPOSITORY-CONTEXT.md

Generate `REPOSITORY-CONTEXT.md` at the project root using the template at
`${CLAUDE_PLUGIN_ROOT}/REPOSITORY-CONTEXT.md`. Replace all `<placeholder>` values
with the actual answers collected above.

## Output: .claude/instructions-stack.md

Generate `.claude/instructions-stack.md` with stack-specific engineering rules.

Cover at minimum:
- Language-specific idioms and conventions for the confirmed stack
- Framework conventions (e.g., Angular signals vs RxJS, ASP.NET controller vs minimal API pattern)
- Testing conventions: file naming, arrangement (AAA/GWT), mock usage
- Build and lint commands derived from the stack
- Package manager policy
- Any strict patterns the implementer must follow

This file is gitignored by default. Review it, then commit when the team is happy with the rules.

## Output: .opencode/instructions-stack.md (if OpenCode is also in use)

If the user selected OpenCode or Both, also generate `.opencode/instructions-stack.md`
with the same content as `.claude/instructions-stack.md`.

## Output: agent bash permission notes

Identify which bash commands each relevant agent needs for the confirmed build tools
and tell the user what to update in the agent files.

For example: if the stack is .NET + Angular with Yarn, the implementer and reviewer
need `dotnet build*`, `dotnet test*`, `ng build*`, `yarn test*`, `yarn lint*`.

## After generation

Tell the user:
- which files were written
- that `.claude/instructions-stack.md` is gitignored — review and commit when ready
- to run `./install.sh` if they haven't already
- what to do next: start with `/dev <task>` for feature work
