---
name: fix-failing-tests
description: Find and fix failing tests one failure at a time.
ralphloops_version: 0.1
version: 0.1.0
license: MIT
tags:
  - tests
  - bugs
compatible_runtimes:
  - ralphify >=0.3.0
triggers:
  - failing tests
  - test suite is red
  - CI is broken
entry:
  validate: scripts/validate.sh
  test: scripts/run-tests.sh
resources:
  - docs/repo-conventions.md
---

# Goal

Fix failing tests in this repository one failure at a time, until the
entire test suite is green.

# Context

Read `docs/repo-conventions.md` before making changes. It describes
the repo's conventions for test naming, fixtures, and commit messages.

# Loop

1. Run `scripts/validate.sh` to confirm the workspace is clean and the
   tools are available.
2. Run `scripts/run-tests.sh` to collect the current set of failures.
3. Pick the **highest-signal** failing test — prefer tests whose
   failure message clearly points at one function or module.
4. Read the failing test and the code it exercises.
5. Make the **smallest useful change** that fixes just that failure.
6. Re-run `scripts/run-tests.sh`.
7. If the chosen test now passes and no new failures appeared, commit
   with a message of the form `fix: <short description>`.
8. Repeat from step 2 until no failures remain.

# Constraints

- Do not disable, skip, or delete failing tests to make them pass.
- Do not modify test files unless the test itself is clearly wrong.
- Do not refactor code beyond what the fix requires.
- Do not touch files outside the repository root.

# Validation

- `scripts/validate.sh` exits with status 0.
- `scripts/run-tests.sh` exits with status 0.

# Exit conditions

- All tests pass in a clean run.
- OR: no progress has been made for three consecutive iterations.

# Recovery / Failure handling

- If a change makes new tests fail, revert the change and try a
  different approach.
- If a failure resists two attempts, leave it and move to the next
  failing test.
