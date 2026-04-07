---
agent: claude -p --dangerously-skip-permissions
commands:
  - name: tests
    run: uv run pytest -x
  - name: lint
    run: uv run ruff check .
args:
  - bug_report
---

# Bug Hunter

Reproduce, localize, and patch the reported bug.

## Bug report

{{ args.bug_report }}

## Current state

{{ commands.tests }}

{{ commands.lint }}

## Instructions

1. Read the bug report above.
2. Attempt a minimal reproduction. Prefer a failing unit test.
3. If a reproduction exists, commit the new failing test.
4. Localize the bug by reading the code exercised by the failing test.
5. Make the smallest useful fix.
6. Run the full test suite. If anything new fails, back out and try another fix.
7. When the regression test passes and nothing else breaks, commit the fix.

## Constraints

- Do not close bugs without a regression test.
- Do not introduce new public APIs to fix a bug.
