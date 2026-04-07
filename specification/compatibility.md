# Compatibility Classes

Runtimes declare their support level for Ralph Loops using one of three
compatibility classes. This lets users and loop authors set accurate
expectations without forcing every tool to implement the whole format.

## Level 1 — Reader

A **Reader** can discover and parse Ralph Loop packages.

A Reader MUST:

- Locate `RALPH.md` files in a given directory.
- Parse optional YAML frontmatter using a safe YAML loader.
- Load the markdown body as text.
- Validate required metadata if frontmatter is present.
- Reject path traversal in metadata.

A Reader is NOT required to execute loops.

Example use cases:

- Registries and galleries
- IDE extensions that preview loops
- Static analyzers and linters

## Level 2 — Executor

An **Executor** is everything a Reader is, plus it can execute loop
instructions and load bundled files.

An Executor MUST:

- Implement every Reader requirement.
- Make the markdown body available as instructions to an agent.
- Resolve bundled files relative to the package root.
- Refuse to execute packages that escape the package root.

An Executor SHOULD:

- Document its execution model publicly.
- Support declared `commands`.
- Provide clear error messages for validation failures.

Example use cases:

- Runtime harnesses like [Ralphify](https://ralphify.co/)
- CI integrations that run loops as part of automation

## Level 3 — Publisher

A **Publisher** is everything an Executor is, plus it can package and
publish Ralph Loops for reuse.

A Publisher MUST:

- Implement every Executor requirement.
- Validate a package against the format before publishing.
- Refuse to publish packages with path traversal, missing required
  fields, or unparseable frontmatter.

A Publisher SHOULD:

- Sign or attest to published packages.
- Provide a way to resolve a published package back to a directory
  locally.

Example use cases:

- Registries that host shared loop packages
- CLI tools for packaging and distributing loops

## Declaring compatibility

Runtimes SHOULD state their compatibility class in their own
documentation. For example:

> *FooRuntime implements Ralph Loops at Level 2 (Executor).*

## Conformance

The [`tests/`](../tests/) directory in this repository contains valid
and invalid fixtures. Implementations are encouraged to run against
them and publish a conformance report.
