---
name: raise-coverage
description: Add focused tests to lift coverage on under-tested modules.
ralphloops_version: 0.1
version: 0.1.0
license: MIT
tags:
  - tests
  - coverage
compatible_runtimes:
  - ralphify >=0.3.0
triggers:
  - low coverage
  - under-tested module
entry:
  validate: scripts/validate.sh
  test: scripts/run-tests.sh
  coverage: scripts/report-coverage.sh
resources:
  - docs/coverage-targets.md
---

# Goal

Raise test coverage on under-tested modules by adding **focused**
tests, not by chasing a coverage percentage.

# Context

Read `docs/coverage-targets.md` — it lists which modules are in scope
and which are deliberately excluded.

# Loop

1. Run `scripts/report-coverage.sh` to produce a coverage report.
2. Pick the module with the **lowest covered-lines / total-lines**
   ratio that is in scope.
3. Read the module and identify one behavior that is currently
   untested.
4. Write a single focused test for that behavior. Prefer tests that
   assert *behavior*, not *implementation details*.
5. Run `scripts/run-tests.sh`. The new test must pass.
6. Commit as `test: cover <module>.<behavior>`.
7. Repeat until every in-scope module meets its minimum coverage
   target.

# Constraints

- Do not add tests that only exercise getters, setters, or pass-through
  code.
- Do not modify production code except to expose things that are
  obviously missing (e.g., a needed type export).
- Do not chase 100% coverage. Stop at the declared target.

# Validation

- `scripts/run-tests.sh` passes.
- `scripts/report-coverage.sh` shows progress over the previous
  iteration.

# Exit conditions

- All in-scope modules meet their coverage target.
- OR: three consecutive iterations make no coverage progress.
