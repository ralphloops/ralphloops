---
agent: claude -p
commands:
  - name: tests
    run: scripts/run-tests.sh
  - name: lint
    run: scripts/lint.sh
args:
  - module
---

# Refactor Module

Refactor {{ args.module }} so that its public behavior is unchanged but its internals are clearer.

## Current state

{{ commands.tests }}

{{ commands.lint }}

## Instructions

1. List the module's public surface and the tests that exercise it. Those tests are your safety net.
2. Identify one small refactoring opportunity: a rename, an extracted function, a removed duplication, a clarified condition.
3. Apply exactly that change.
4. Run the tests. If anything breaks, revert the change.
5. Run the linter. Fix any issues introduced.
6. Commit and repeat until the module feels finished.

## Invariants

- The module's public API is unchanged.
- All tests that existed at the start still exist and still pass.
- No new dependencies are added.
