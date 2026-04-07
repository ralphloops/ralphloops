# Quickstart

This guide walks you through authoring your first Ralph Loop package.
You will end up with a directory that any compatible runtime can
discover and execute.

## 1. Create a loop directory

```bash
mkdir fix-failing-tests
cd fix-failing-tests
```

The directory name is the loop's package name. Choose an outcome-
oriented name like `fix-failing-tests` or `raise-coverage`.

## 2. Add a RALPH.md file

Create `RALPH.md` with frontmatter and a loop body:

```markdown
---
agent: claude -p
commands:
  - name: tests
    run: scripts/run-tests.sh
  - name: validate
    run: scripts/validate.sh
args:
  - module
---

# Fix Failing Tests

Fix failing tests in {{ args.module }} one failure at a time.

{{ commands.validate }}

{{ commands.tests }}

## Instructions

1. Review the test output above.
2. Identify the highest-signal failure.
3. Make the smallest useful change.
4. Re-run validation.
5. Commit only if checks pass.
```

## 3. Add supporting files

Bundle the scripts, docs, and fixtures the loop needs alongside
`RALPH.md`:

```
fix-failing-tests/
├── RALPH.md
├── scripts/
│   ├── run-tests.sh
│   └── validate.sh
└── docs/
    └── repo-conventions.md
```

Scripts referenced from `commands` must exist, or the package fails
validation.

## 4. Validate the package

Any Level 1 (Reader) runtime can validate your package. For example,
with a conforming CLI:

```bash
ralphloops validate fix-failing-tests/
```

## 5. Run it with a compatible runtime

Use any runtime that supports Ralph Loops at Level 2 (Executor) or
higher. For example, with [Ralphify](https://ralphify.co/):

```bash
ralph run fix-failing-tests/
```

## 6. Share it

Because a Ralph Loop is just a directory, you can share it by:

- committing it to a git repository as a subdirectory
- publishing it as its own repository
- zipping it up and sending it
- publishing it to a registry (when one exists)

## Next steps

- Read the [best practices guide](best-practices.md)
- Browse the [example packages](../examples/)
- Read the full [specification](../specification/format.md)
