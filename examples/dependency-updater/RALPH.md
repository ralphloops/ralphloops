---
name: dependency-updater
description: Upgrade dependencies one at a time with tests green.
ralphloops_version: 0.1
version: 0.1.0
license: MIT
tags:
  - dependencies
  - maintenance
compatible_runtimes:
  - ralphify >=0.3.0
triggers:
  - outdated dependencies
  - dependabot
entry:
  validate: scripts/validate.sh
  test: scripts/run-tests.sh
  outdated: scripts/list-outdated.sh
---

# Goal

Upgrade the project's dependencies one at a time, keeping tests green
at every step. Never upgrade multiple dependencies in a single commit.

# Loop

1. Run `scripts/list-outdated.sh`. Read the list.
2. Pick **one** dependency to upgrade. Prefer:
   - security updates first
   - patch-level updates next
   - minor updates after that
   - major updates last (and only when explicitly allowed)
3. Upgrade just that dependency in the project's manifest file.
4. Run `scripts/run-tests.sh`.
5. If tests pass, commit as `chore: bump <dep> to <version>`.
6. If tests fail, revert the upgrade and move on to the next
   dependency.
7. Repeat until no updates remain, or until a configured maximum
   number of upgrades has been applied this iteration.

# Constraints

- One dependency per commit.
- Never bypass lockfile updates.
- Never upgrade major versions unless explicitly allowed.
- Never delete tests to make an upgrade pass.

# Validation

- `scripts/run-tests.sh` exits 0 after every commit.

# Exit conditions

- No outdated dependencies remain within the allowed tiers.
- OR: the configured upgrade budget is exhausted.
