---
agent: claude -p --dangerously-skip-permissions
commands:
  - name: tests
    run: uv run pytest -x
  - name: outdated
    run: pip list --outdated
args:
  - tier
---

# Dependency Updater

Upgrade dependencies one at a time with tests green.

## Current state

{{ commands.outdated }}

{{ commands.tests }}

## Instructions

1. Review the outdated dependencies above.
2. Pick one dependency to upgrade. Prefer: security updates first, then patch, then minor, then major (only if {{ args.tier }} allows it).
3. Upgrade just that dependency in the project's manifest file.
4. Run the tests.
5. If tests pass, commit.
6. If tests fail, revert the upgrade and move on to the next dependency.
7. Repeat until no updates remain within the allowed tier.

## Constraints

- One dependency per commit.
- Never bypass lockfile updates.
- Never upgrade major versions unless explicitly allowed.
- Never delete tests to make an upgrade pass.
