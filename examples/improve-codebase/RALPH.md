---
agent: codex --full-auto
commands:
  - name: tests
    run: uv run pytest -x
  - name: lint
    run: uv run ruff check .
---

# Improve Codebase

Find and fix one code quality issue per iteration.

## Current state

{{ commands.tests }}

{{ commands.lint }}

## Instructions

1. Review the test and lint output above.
2. If there are lint warnings or test failures, pick the highest-signal one and fix it.
3. If everything passes, look for one of: unnecessary complexity, unclear naming, duplicated logic, or dead code.
4. Make one focused improvement.
5. Run tests and lint. Commit only if everything passes.

## Constraints

- Do not change any functionality.
- One improvement per iteration.
- Do not change public APIs.
- Do not add new dependencies.
- Prefer removing code over adding code.
