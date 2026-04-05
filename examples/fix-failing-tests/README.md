# fix-failing-tests

A Ralph Loop that drives an autonomous agent to fix failing tests one
at a time until the suite is green.

## What it assumes

- A runnable test command (wired through `scripts/run-tests.sh`).
- A clean working tree (checked by `scripts/validate.sh`).
- A git repository — the loop commits after each successful fix.

## How to use it

Point a compatible runtime at this directory:

```
ralph run examples/fix-failing-tests/
```

Edit `scripts/run-tests.sh` to match your project's test runner before
running the loop. The script is the seam between the loop and the
project.

## Why this loop is safe by construction

The loop is constrained to:

- never disable or delete failing tests
- never refactor beyond the fix
- stop if it makes no progress for three iterations

Those constraints live in `RALPH.md` so any compatible runtime picks
them up.
