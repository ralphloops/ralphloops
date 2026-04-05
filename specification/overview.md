# Specification Overview

**Ralph Loops** is an open proposed format for portable Ralph-style agent
loops. A Ralph Loop is a directory-based package centered on a required
`RALPH.md` file.

This overview introduces the format in narrative form. The normative rules
live in the other documents in this directory:

- [`format.md`](format.md) — the package format itself
- [`metadata.md`](metadata.md) — frontmatter fields and their semantics
- [`directory-layout.md`](directory-layout.md) — directory structure rules
- [`runtime-contract.md`](runtime-contract.md) — what runtimes must do
- [`compatibility.md`](compatibility.md) — compatibility classes
- [`changelog.md`](changelog.md) — spec version history

## Goals

Ralph Loops is designed to make Ralph-style loops:

- **portable** across tools and runtimes
- **shareable** as reusable packages
- **versionable** in git
- **inspectable** by humans
- **tool-agnostic** where possible
- **easy to author** without complex schemas
- **easy to bundle** with supporting files

### Secondary goals

- provide a base for registries and galleries
- support future compatibility across multiple loop runners
- enable community-authored reusable loop packages

### Non-goals for v1

- defining one mandatory runtime engine
- defining network protocol behavior
- defining model-specific execution semantics
- solving sandboxing, security, or permissions universally
- forcing a single metadata schema beyond a small required core

## Core concept

A **Ralph Loop** is a directory containing:

- one required file: `RALPH.md`
- zero or more optional bundled files and subdirectories

The reusable unit is the **folder**, not a single file. A loop may bundle
scripts, templates, fixtures, reference materials, sample inputs, plans,
checklists, or any other files that help a compatible runtime execute it.

## Status language

Ralph Loops is described everywhere as:

> **An open proposed format for portable Ralph-style agent loops.**

It is not a standard. It is not presented as official or canonical for all
Ralph methodology. It is a portable package format proposal inspired by
Geoffrey Huntley's Ralph loop methodology.

## Terminology

- **Package** — a Ralph Loop directory containing `RALPH.md`.
- **Package root** — the directory containing `RALPH.md`.
- **Entrypoint** — the `RALPH.md` file itself.
- **Bundled resource** — any other file inside the package root.
- **Runtime** — a tool that discovers, parses, and/or executes packages.
- **Compatibility class** — the level of support a runtime declares (see
  [`compatibility.md`](compatibility.md)).

## Normative keywords

The words MUST, SHOULD, and MAY in the specification documents follow
[RFC 2119](https://www.rfc-editor.org/rfc/rfc2119) semantics.
