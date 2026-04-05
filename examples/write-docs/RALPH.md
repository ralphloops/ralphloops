---
name: write-docs
description: Generate and revise documentation for existing code.
ralphloops_version: 0.1
version: 0.1.0
license: MIT
tags:
  - docs
compatible_runtimes:
  - ralphify >=0.3.0
triggers:
  - docs out of date
  - missing documentation
entry:
  validate: scripts/validate.sh
  build: scripts/build-docs.sh
---

# Goal

Bring project documentation back in line with the code: document
undocumented public symbols, update stale examples, and fix broken
links. Do not invent behavior — every claim in the docs must be
grounded in the code as it exists today.

# Loop

1. Run `scripts/build-docs.sh`. Note any warnings or broken links.
2. Pick **one** of:
   - an undocumented public symbol
   - a stale example that no longer runs
   - a broken internal link
   - a page that references a file that no longer exists
3. Fix exactly that one thing. Read the relevant code before writing
   anything.
4. Rebuild the docs. The warning you fixed must be gone and no new
   warnings introduced.
5. Commit as `docs: <short description>`.
6. Repeat until the docs build cleanly.

# Constraints

- Never invent behavior. If you can't find it in the code, don't
  write it in the docs.
- Never delete a doc page to make a warning go away.
- Keep prose short and direct.

# Validation

- `scripts/build-docs.sh` exits 0 with zero warnings.

# Exit conditions

- The docs build cleanly.
- OR: three consecutive iterations produce no committable change.
