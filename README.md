# Ralph Loops

> Specification and documentation for **Ralph Loops**, an open proposed format
> for portable Ralph-style agent loops.

Ralph Loops is an open proposed format for portable Ralph-style agent loops.
A Ralph Loop is a directory containing a required `RALPH.md` file plus any
supporting scripts, prompts, plans, templates, examples, or other resources
needed to run the loop. The format is designed to make loops easier to share,
version, inspect, and run across compatible tools.

> **Status.** Ralph Loops is an *open proposed format*, not a standard. The
> current format version is `0.1` and all `0.x` versions are draft.

## What a Ralph Loop looks like

```
fix-failing-tests/
├── RALPH.md
├── scripts/
│   ├── run-tests.sh
│   └── validate.sh
└── docs/
    └── repo-conventions.md
```

Every Ralph Loop is a directory. The only required file is `RALPH.md` — the
canonical entrypoint. Everything else is optional bundled context: scripts,
templates, fixtures, reference docs, or any other files the loop needs.

Minimal `RALPH.md`:

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

## Why this format exists

Autonomous agent loops are powerful, but most of them live as one-off prompts
pasted into chat windows or hard-coded into a single tool. Ralph Loops
proposes a small, portable package format so that loops can be:

- **portable** across tools and runtimes
- **shareable** as reusable packages
- **versionable** in git
- **inspectable** by humans
- **bundled** with the scripts, prompts, and reference files they need

The format is heavily inspired by the [Agent Skills](https://agentskills.io)
format. It follows the same philosophy: a simple directory-based format with a
canonical entrypoint file, optional frontmatter metadata, and template
placeholders for injecting command outputs and arguments.

## For creators

- [Quickstart](loop-creation/quickstart.md) — author your first loop
- [Best practices](loop-creation/best-practices.md) — authoring guidelines
- [Templates](loop-creation/templates/) — starter packages

## For implementors

- [Overview](implementors/overview.md) — how runtimes should load loops
- [Discovery](implementors/discovery.md)
- [Parsing](implementors/parsing.md)
- [Execution model](implementors/execution-model.md)
- [Test cases](implementors/test-cases.md) — conformance corpus

## Specification

The canonical specification lives under [`specification/`](specification/):

- [Overview](specification/overview.md)
- [Format](specification/format.md)
- [Metadata](specification/metadata.md)
- [Directory layout](specification/directory-layout.md)
- [Runtime contract](specification/runtime-contract.md)
- [Compatibility](specification/compatibility.md)
- [Changelog](specification/changelog.md)

A JSON Schema for frontmatter metadata is available in
[`schemas/metadata.schema.json`](schemas/metadata.schema.json).

## Examples

Six complete example packages live under [`examples/`](examples/):

- [`fix-failing-tests/`](examples/fix-failing-tests/)
- [`bug-hunter/`](examples/bug-hunter/)
- [`raise-coverage/`](examples/raise-coverage/)
- [`refactor-module/`](examples/refactor-module/)
- [`write-docs/`](examples/write-docs/)
- [`dependency-updater/`](examples/dependency-updater/)

## Governance

Ralph Loops is maintained through this public repository. Breaking changes go
through a lightweight RFC process under [`rfcs/`](rfcs/). See
[`GOVERNANCE.md`](GOVERNANCE.md) and [`VERSIONING.md`](VERSIONING.md).

## Relationship to Ralphify and other runtimes

[Ralphify](https://ralphify.co/) is one reference implementation and runtime
for Ralph Loops. Any other tool is welcome to implement the format — it is
intentionally runtime-agnostic. Runtimes declare which
[compatibility class](specification/compatibility.md) they support.

## Attribution

Ralph Loops is a community-oriented format proposal **inspired by**
[Geoffrey Huntley's Ralph loop methodology](https://ghuntley.com/ralph/). This
repository defines the package format, **not** the Ralph methodology itself.

## License

[MIT](LICENSE).
