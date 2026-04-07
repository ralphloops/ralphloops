# dependency-updater

A Ralph Loop for keeping dependencies current and secure.

## Why one-at-a-time

Batched dependency upgrades are painful to diagnose when something
breaks. This loop deliberately commits each upgrade separately so the
test suite tells you exactly which change caused any regression.

## Commands

- `tests` — runs `uv run pytest -x`
- `outdated` — runs `pip list --outdated`

Adjust these in the RALPH.md frontmatter to match your project's
tooling.
