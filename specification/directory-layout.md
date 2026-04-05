# Directory Layout

A Ralph Loop package is a directory. This document describes the
conventions and constraints for that directory's layout.

## Minimum

The minimum valid package is a directory containing a single `RALPH.md`
file:

```
minimal-loop/
└── RALPH.md
```

## Typical layout

Most real packages bundle supporting resources. A typical package might
look like:

```
fix-failing-tests/
├── RALPH.md
├── README.md
├── scripts/
│   ├── run-tests.sh
│   └── validate.sh
├── prompts/
│   └── edge-cases.md
├── templates/
│   └── issue-comment.md
├── docs/
│   └── repo-conventions.md
└── examples/
    └── sample-failure.txt
```

There are no required subdirectories beyond `RALPH.md`.

## Conventional subdirectories

These names are not required, but are recommended for clarity:

| Directory    | Convention                                        |
|--------------|---------------------------------------------------|
| `scripts/`   | Executable helpers invoked by the loop.           |
| `prompts/`   | Prompt snippets and supplementary instructions.   |
| `templates/` | Reusable text/code templates.                     |
| `docs/`      | Reference documentation for the agent.            |
| `examples/`  | Sample inputs or fixtures.                        |
| `fixtures/`  | Test data.                                        |
| `plans/`     | Plan documents for multi-step loops.              |

## Required entrypoint

- `RALPH.md` MUST exist at the package root.
- The filename is case-sensitive: `RALPH.md`, not `ralph.md` or
  `Ralph.md`.

## Package root

The package root is the directory containing `RALPH.md`. All relative
paths in metadata resolve against this directory.

## What does NOT belong in a package

- Absolute paths to resources outside the package root
- Symlinks whose targets lie outside the package root
- Files referenced via `..` traversal in metadata
- Runtime-specific lock files or caches (these belong to the runtime,
  not the package)

## Nested packages

A directory MAY contain multiple Ralph Loop packages as subdirectories,
each with its own `RALPH.md`. Runtimes performing recursive discovery
MUST treat each `RALPH.md` as the root of its own package.

## README files

A package MAY include a `README.md` alongside `RALPH.md`. The README is
for humans browsing the repository; `RALPH.md` is for the runtime and
the agent. They serve different audiences.
