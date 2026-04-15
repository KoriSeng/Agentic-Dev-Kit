# REPOSITORY-CONTEXT.md

# Repository Context

This file is the living memory for agents working in this repository.

Keep it specific to the current repository.
Update it when repository facts, commands, paths, architecture, or known issues change.

Use this file for:
- current repository facts
- canonical commands
- architecture notes grounded in the current codebase
- known constraints and baseline issues
- local conventions that are true in this repository

Do not use this file for:
- role definitions
- general engineering law for all repos
- speculative future-state plans presented as current reality

---

## Repository identity

- Name: `<replace-with-repository-name>`
- Purpose: `<what this repo does>`
- Business domain: `<optional>`
- Default branch: `<main-or-other>`
- Repository type: `.NET + Angular monorepo`
- Frontend package manager: `Yarn`

---

## Structure overview

Fill in the real paths after customizing the template.

### Backend

- Solution file: `<path-to-solution-file>`
- Main backend root: `<for-example-src/backend>`
- Primary API project: `<required path>`
- Application layer project: `<required path>`
- Core project: `<required path>`
- Infrastructure project: `<required path>`
- Worker or workflow projects: `<paths-or-none>`

### Frontend

- Angular workspace root: `<path-to-angular-workspace>`
- Main Angular app: `<path-or-project-name>`
- Shared libraries: `<paths-or-none>`
- UI design system or shared component library: `<path-or-none>`
- Yarn version: `<version>`
- Frontend lockfile: `yarn.lock`

### Other important areas

- Scripts: `<path-or-none>`
- Docs: `<path-or-none>`
- Infra or deployment: `<path-or-none>`
- Generated or vendor-managed paths to avoid editing: `<paths-or-none>`

---

## Architecture notes

Document only what is true in this repository.

### Backend architecture

- Architecture style: `modular monolith with Api/Application/Core/Infrastructure segregation`
- Key boundaries: `<document how Api/Application/Core/Infrastructure responsibilities are enforced in this repository>`
- API conventions: `<controllers / minimal APIs / endpoint pattern>`
- Background processing: `<none / hosted services / workers / workflows / queues>`

### Frontend architecture

- Angular version: `<version>`
- Workspace style: `<single app / app plus libs / nx / other>`
- State approach: `<signals / RxJS / ngrx / mixed / other>`
- Routing approach: `<brief note>`
- Shared UI patterns: `<brief note>`

### Cross-stack contracts

- Shared DTO or API contract location: `<path-or-none>`
- Contract generation or sync approach: `<manual / generated / shared project / other>`

---

## Data and integrations

### Persistence

- Primary database: `<postgresql / sql server / other>`
- Data access approach: `<ef core / dapper / mixed / other>`
- Migration approach: `<ef migrations / sql scripts / other>`

### Messaging and workflows

- Messaging: `<none / rabbitmq / sqs / service bus / other>`
- Background job system: `<none / hangfire / temporal / other>`
- Canonical patterns to preserve: `<brief note>`

### External integrations

- Critical external services: `<list-or-none>`
- Auth or identity provider: `<list-or-none>`
- Files or storage services: `<list-or-none>`

---

## Agent bash permissions

Agents that run build, test, or lint commands use the patterns defined here.
The `/setup` command generates this section. If your build tools change,
update these patterns and the corresponding agent role files.

### Build commands (used by: context-mapper, design-investigator, implementer, reviewer)
- `<build-command-pattern>*`

### Test commands (used by: implementer, reviewer)
- `<test-command-pattern>*`

### Lint commands (used by: reviewer)
- `<lint-command-pattern>*`

Example for .NET + Angular:
```
dotnet build*, dotnet test*, ng build*, ng test*, yarn build*, yarn test*, yarn lint*
```

Example for Python + React:
```
python -m pytest*, npm run build*, npm run test*, npm run lint*
```

Example for Go + Vue:
```
go build*, go test*, npm run build*, npm run test*, npm run lint*
```

---

## Agent tooling

### code-memory-mcp

Status: `<available / not configured>`

When available, `code-memory-mcp` provides a persistent memory tier for
symbol lookup, dependency mapping, usage tracing, and institutional notes.

Agents should use it as their primary discovery mechanism before falling
back to git commands and file reads. See individual agent role files for
tool-specific workflow guidance.

Key tools: `stats`, `get_directory_tree`, `get_module_map`, `lookup_symbol`,
`get_file_symbols`, `find_usages`, `get_dependencies`, `search`,
`add_note`, `get_notes`

---

## Canonical commands

Replace these with the real commands for this repository.

### Setup

- Restore backend dependencies: `<command>`
- Install frontend dependencies: `yarn install`
- Local environment setup: `<command-or-steps>`

### Build

- Build backend: `<command>`
- Build frontend: `yarn build`
- Build full repo: `<command-or-none>`

### Test

- Run backend unit tests: `<command>`
- Run backend integration tests: `<command-or-none>`
- Run frontend tests: `yarn test`
- Run end-to-end tests: `<command-or-none>`

### Quality checks

- Lint frontend: `yarn lint`
- Format check: `<command-or-none>`
- Type check: `<command-or-none>`

### Run locally

- Run backend: `<command>`
- Run frontend: `yarn start`
- Run full stack: `<command-or-steps>`

---

## Testing notes

- Backend test framework: `<xunit / nunit / mstest / other>`
- Frontend test framework: `<karma / jest / vitest / other>`
- E2E framework: `<playwright / cypress / none / other>`
- Test data or container dependencies: `<brief note>`
- Slow, flaky, or environment-sensitive suites: `<brief note or none>`

---

## Local development constraints

- Required tools and versions: `<dotnet / node / package manager / database / other>`
- Package manager policy: `Use Yarn for frontend dependencies and scripts unless the repository standard is intentionally changed`
- OS-specific notes: `<brief note or none>`
- Secrets handling notes: `<brief note or none>`
- Paths or files agents should never commit: `<brief note>`

---

## Known baseline issues

List only issues that already exist and should not be misreported as regressions.

- `<known issue 1>`
- `<known issue 2>`
- `<or write none currently documented>`

---

## Repository-specific conventions

- Naming conventions: `<brief note>`
- Branching or PR conventions: `<brief note>`
- Documentation expectations: `<brief note>`
- Areas that are intentionally inconsistent for historical or migration reasons: `<brief note>`

---

## Update guidance

Update this file when:
- commands change
- paths move
- architecture boundaries change
- new integrations are added
- baseline issues are discovered or resolved
- agent-relevant repository facts become stale

If a fact is not yet true in the repository, do not record it here as reality.
