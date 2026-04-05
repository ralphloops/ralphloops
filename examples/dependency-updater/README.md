# dependency-updater

A Ralph Loop for upgrading dependencies one at a time with tests green
at every step.

## Why one-at-a-time

Batched dependency upgrades are painful to diagnose when something
breaks. This loop deliberately commits each upgrade separately so the
test suite tells you exactly which change caused any regression.

## Wiring

- `scripts/list-outdated.sh` — emits the list of outdated dependencies
  in whatever form your package manager supports.
- `scripts/run-tests.sh` — runs the full test suite.
- `scripts/validate.sh` — optional preflight checks.
