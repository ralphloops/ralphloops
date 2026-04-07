# Ralph Loop Format (v0.1 draft)

This document defines the Ralph Loop package format, version `0.1`.

## 1. Definition

A **Ralph Loop** is a directory-based package with:

- one required file: `RALPH.md`
- zero or more optional bundled files and subdirectories

A loop package MAY contain scripts, templates, fixtures, reference
materials, sample inputs, plans, checklists, or any other files that help
a compatible runtime execute the loop.

## 2. Required entrypoint

Each Ralph Loop package MUST contain a file named:

```
RALPH.md
```

This file is the canonical entrypoint for the package.

## 3. Package root

The package root is the directory containing `RALPH.md`. All relative
paths in the format are resolved relative to the package root unless
otherwise specified.

## 4. Allowed structure

There are no required subdirectories beyond `RALPH.md`. A typical
package might look like:

```
bug-hunter/
├── RALPH.md
├── README.md
└── prompts/
    └── edge-cases.md
```

## 5. `RALPH.md` file structure

`RALPH.md` consists of:

1. optional YAML frontmatter
2. markdown body content

Example:

```markdown
---
agent: claude -p --dangerously-skip-permissions
commands:
  - name: tests
    run: uv run pytest -x
  - name: lint
    run: uv run ruff check .
args:
  - bug_report
---

# Bug Hunter

Reproduce, localize, and patch the reported bug.

## Bug report
{{ args.bug_report }}

## Test results
{{ commands.tests }}

## Lint
{{ commands.lint }}

## Instructions

1. Read the bug report above.
2. Write a failing test to reproduce the bug.
3. Localize the root cause.
4. Make the smallest useful fix.
5. Run tests and lint. Commit only if everything passes.
```

## 6. Markdown body semantics

The RALPH.md body contains the human-readable loop definition.

The format deliberately avoids over-structuring the markdown body.
Compatible runtimes MUST treat the body as agent-facing instructions,
not as a strict AST. There is no enforced section schema.

Recommended sections (non-normative):

- `Goal`
- `Context`
- `Loop`
- `Constraints`
- `Validation`
- `Exit Conditions`
- `Recovery / Failure Handling`
- `Notes for the Agent`

## 7. Optional bundled files

A package MAY include any supporting files, including:

- scripts
- prompts
- templates
- examples
- fixtures
- plans
- checklists
- JSON/YAML config
- reference docs
- generated examples

Compatible runtimes MUST allow the agent to reference these files
relative to the loop package root.

## 8. Path resolution rules

All paths in metadata are relative to the package root unless they are
absolute URIs.

Runtimes MUST:

- normalize relative paths safely
- reject path traversal that escapes the package root
- treat missing referenced files as package errors or warnings

## 9. Validation rules

A valid v0.1 package MUST:

- contain `RALPH.md`
- use valid UTF-8 text for `RALPH.md`
- contain parseable YAML if frontmatter is present
- not reference missing required entry files if declared in metadata
- not contain path traversal references in metadata

## 10. Packaging and distribution

A Ralph Loop package MAY be distributed as:

- a git repository subdirectory
- a standalone repository
- a tarball or zip archive
- a registry package (when registries exist)

The directory itself is the unit of portability.

