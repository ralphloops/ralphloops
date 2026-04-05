# raise-coverage

A Ralph Loop for adding focused tests to under-tested modules without
chasing a coverage percentage.

The loop deliberately caps itself at a declared target and refuses to
write tests for trivial pass-through code. That keeps the resulting
test suite useful instead of noisy.

## What you need to wire up

- `scripts/run-tests.sh` — runs the existing test suite
- `scripts/report-coverage.sh` — emits a coverage report the agent can read
- `scripts/validate.sh` — optional preflight checks

## What you should edit

Update `docs/coverage-targets.md` (create it when you adapt the loop)
to declare which modules are in scope and what the target percentage
is for each.
