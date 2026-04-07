---
agent: claude -p
commands:
  - name: build-docs
    run: scripts/build-docs.sh
args:
  - scope
---

# Write Docs

Bring project documentation in {{ args.scope }} back in line with the code.

## Current state

{{ commands.build-docs }}

## Instructions

1. Review the docs build output above. Note any warnings or broken links.
2. Pick one of: an undocumented public symbol, a stale example, a broken internal link, or a page referencing a file that no longer exists.
3. Fix exactly that one thing. Read the relevant code before writing anything.
4. Rebuild the docs. The warning you fixed must be gone and no new warnings introduced.
5. Commit and repeat until the docs build cleanly.

## Constraints

- Never invent behavior. If you can't find it in the code, don't write it in the docs.
- Never delete a doc page to make a warning go away.
- Keep prose short and direct.
