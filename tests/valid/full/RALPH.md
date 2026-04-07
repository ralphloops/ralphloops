---
agent: claude -p
commands:
  - name: validate
    run: scripts/validate.sh
  - name: tests
    run: scripts/run-tests.sh
args:
  - module
  - focus
---

# Full Fixture

Exercise every frontmatter field in a single valid package.

{{ commands.validate }}

{{ commands.tests }}

Focus on {{ args.module }} with priority {{ args.focus }}.
