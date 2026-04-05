---
name: bug-hunter
description: Reproduce, localize, and patch a reported bug.
ralphloops_version: 0.1
version: 0.1.0
license: MIT
tags:
  - bugs
  - debugging
compatible_runtimes:
  - ralphify >=0.3.0
triggers:
  - reported bug
  - reproduction needed
  - regression
entry:
  validate: scripts/validate.sh
  test: scripts/run-tests.sh
resources:
  - prompts/edge-cases.md
---

# Goal

Given a bug report, reproduce the bug, localize it to a single
function or module, write a regression test that fails because of it,
and then patch the code so the test passes.

# Context

Read `prompts/edge-cases.md` — it lists common categories of bugs
(off-by-one, null handling, timezone handling, concurrency) that are
worth ruling in or out during triage.

# Loop

1. Read the bug report supplied to the runtime.
2. Attempt a minimal reproduction. Prefer a failing unit test.
3. If a reproduction exists, commit the new failing test as
   `test: add regression for <short bug description>`.
4. Localize the bug by reading the code exercised by the failing test.
5. Make the smallest useful fix.
6. Run the full test suite. If anything new fails, back out and try
   another fix.
7. When the regression test passes and nothing else breaks, commit the
   fix as `fix: <short bug description>`.

# Constraints

- Do not close bugs without a regression test.
- Do not introduce new public APIs to fix a bug.
- Stay inside the module where the bug was localized, unless the bug
  clearly crosses a module boundary.

# Validation

- `scripts/run-tests.sh` passes.
- A new regression test exists that fails without the fix and passes
  with it.

# Exit conditions

- The regression test is committed.
- The fix is committed.
- The full test suite passes.
