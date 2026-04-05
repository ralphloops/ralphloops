# Contributing to Ralph Loops

Thanks for helping shape Ralph Loops. This repository is the canonical source
for the Ralph Loops format: its specification, examples, conformance tests,
and governance.

## What lives here

- **`specification/`** — the normative format spec
- **`loop-creation/`** — creator-facing docs
- **`implementors/`** — runtime-author docs
- **`examples/`** — reference loop packages
- **`schemas/`** — JSON Schema for frontmatter metadata
- **`tests/`** — valid/invalid conformance fixtures
- **`rfcs/`** — RFCs for non-trivial changes

Code for specific runtimes (e.g. Ralphify) does **not** live here.

## Kinds of contributions we welcome

- Typo, clarity, and wording fixes in the spec and docs
- New conformance fixtures under `tests/valid/` and `tests/invalid/`
- New example loops under `examples/`
- RFCs proposing additions or changes to the format
- Translations and accessibility improvements to docs

## Discussion first, PR second

For anything beyond a typo or a small clarification, please open an issue or
a discussion first. This is especially true for spec changes. We prefer
small, well-scoped PRs over large, speculative ones.

## Spec changes require an RFC

Any change that affects what a Ralph Loop *is* — required fields, path
resolution rules, compatibility classes, runtime contract, etc. — must go
through the RFC process under `rfcs/`. Use `rfcs/0001-format-principles.md`
as a template.

Additive, backwards-compatible clarifications to existing fields may be
landed directly as a PR against `specification/`.

## Adding an example loop

Each example under `examples/` must include:

1. A `RALPH.md` with complete, valid frontmatter
2. A short `README.md` explaining what the loop is for
3. At least one bundled supporting file (script, doc, template, or fixture)
4. Realistic exit conditions and validation steps

Prefer outcome-oriented names (`fix-failing-tests`, not `my-loop-1`).

## Adding conformance fixtures

- Valid fixtures go under `tests/valid/<name>/`.
- Invalid fixtures go under `tests/invalid/<name>/` with a short
  `REASON.md` file explaining why the fixture is invalid.

## Style

- Prose: plain English, short sentences, no hype language.
- Normative keywords (MUST, SHOULD, MAY) follow RFC 2119 semantics.
- Code fences should declare a language where applicable.

## Code of conduct

Participation in this project is governed by our
[Code of Conduct](CODE_OF_CONDUCT.md).
