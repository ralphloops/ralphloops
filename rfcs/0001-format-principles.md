# RFC 0001 — Format Principles

- **Status:** Accepted
- **Target version:** 0.1
- **Author:** Ralph Loops contributors

## Summary

This RFC records the design principles that Ralph Loops v0.1 is built
on, and which future RFCs should be judged against.

## Motivation

Without written principles, small decisions accrete into a format
that contradicts itself. This RFC fixes the principles so that future
changes have something to argue with.

## Principles

### 1. The unit of portability is a directory

A Ralph Loop is a folder with a required entrypoint file, not a
single file and not a ZIP archive. Folders are git-friendly,
human-inspectable, and trivially bundleable.

### 2. Frontmatter is small

The required metadata is kept as small as possible. Recommended
metadata is long-tailed and optional. Runtimes preserve unknown keys.

### 3. The body is prose, not an AST

The markdown body of `RALPH.md` is agent-facing instructions, not a
strict schema. Runtimes MUST NOT enforce a fixed section layout.

### 4. Paths resolve against the package root

Every relative path in metadata resolves relative to the package
root. Traversal outside the root is always a fatal error.

### 5. One runtime is not special

The format is runtime-agnostic. No runtime's convention becomes
normative in the spec. Runtime-specific behavior belongs in runtime
docs.

### 6. Conformance is tiered

Runtimes self-declare as Reader, Executor, or Publisher. Not every
tool has to implement everything.

### 7. The format is a proposal, not a standard

Ralph Loops is explicitly a proposed format. It earns adoption
through usefulness, not authority. Status language in every artifact
reflects this.

### 8. Ralph methodology is not owned

Ralph Loops is inspired by Geoffrey Huntley's Ralph loop methodology.
The format does not claim ownership of the methodology. Naming and
attribution across the project reflect this explicitly.

## Drawbacks

Fixing principles makes some future changes harder. That is the
point.

## Alternatives considered

- **Single-file format.** Rejected: would prevent bundling scripts
  and supporting docs, which is one of the format's primary reasons
  to exist.
- **Mandatory section schema in the body.** Rejected: would make the
  format brittle and hostile to authors.
- **Runtime-prescriptive spec.** Rejected: would entrench one
  implementation at the expense of portability.

## Unresolved questions

None for v0.1. Later RFCs may revisit specific fields, the
compatibility model, or registry semantics.
