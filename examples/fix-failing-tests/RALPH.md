---
agent: claude -p
commands:
  - name: tests
    run: scripts/run-tests.sh
  - name: validate
    run: scripts/validate.sh
args:
  - module
---

# Fix Failing Tests

Fix failing tests in {{ args.module }} one failure at a time until the test suite is green.

## Current state

{{ commands.validate }}

{{ commands.tests }}

## Instructions

1. Review the test output above.
2. Pick the highest-signal failing test — prefer tests whose failure message clearly points at one function or module.
3. Read the failing test and the code it exercises.
4. Make the smallest useful change that fixes just that failure.
5. Re-run validation. Commit only if checks pass.
6. Repeat until no failures remain.

## Constraints

- Do not disable, skip, or delete failing tests to make them pass.
- Do not modify test files unless the test itself is clearly wrong.
- Do not refactor code beyond what the fix requires.
