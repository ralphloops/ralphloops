---
name: refactor-module
description: Refactor a single module against a set of invariants.
ralphloops_version: 0.1
version: 0.1.0
license: MIT
tags:
  - refactor
compatible_runtimes:
  - ralphify >=0.3.0
triggers:
  - refactor needed
  - module is messy
entry:
  validate: scripts/validate.sh
  test: scripts/run-tests.sh
  lint: scripts/lint.sh
resources:
  - templates/pr-description.md
---

# Goal

Refactor a single named module so that its public behavior is
unchanged but its internals are clearer. The module to refactor is
passed in via the runtime.

# Context

Refactoring is behavior-preserving by definition. Before making any
change, list the module's public surface and the tests that exercise
it. Those tests are your safety net — they must stay green at every
step.

# Loop

1. Run `scripts/validate.sh` and `scripts/run-tests.sh`. Both must
   pass before any refactor begins.
2. Identify one **small** refactoring opportunity: a rename, an
   extracted function, a removed duplication, a clarified condition.
3. Apply exactly that change.
4. Run `scripts/run-tests.sh`. If anything breaks, revert the change.
5. Run `scripts/lint.sh`. Fix any issues introduced by the change.
6. Commit as `refactor: <short description>`.
7. Repeat until the declared invariants are satisfied or the module
   feels finished.

# Invariants

- The module's public API is unchanged.
- All tests that existed at the start still exist and still pass.
- No new dependencies are added.
- Line count does not grow by more than 10%.

# Exit conditions

- The loop has made at least one commit AND feels the module is
  clearer than it started.
- OR: three consecutive iterations produce no committable change.

# Notes for the agent

Small, reviewable refactors beat large, clever ones. When in doubt,
do less.
