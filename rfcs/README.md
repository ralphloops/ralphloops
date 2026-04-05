# RFCs

Ralph Loops uses a lightweight RFC process for non-trivial changes to
the format.

## When to write an RFC

Write an RFC when your change:

- adds, removes, or renames a metadata field
- tightens or loosens a validation rule
- changes path resolution semantics
- changes the runtime contract
- introduces a new compatibility class
- defines registry or distribution semantics

You do **not** need an RFC for typo fixes, clarifications, new
fixtures, or new examples. Open a normal PR for those.

## Process

1. Open a discussion or issue describing the problem.
2. Copy `0001-format-principles.md` as a template under a new number.
3. Fill in Summary, Motivation, Proposal, Drawbacks, Alternatives,
   and Unresolved Questions.
4. Open a PR. Maintainers and the community review.
5. Revise in response to feedback.
6. A maintainer accepts, rejects, or defers the RFC.
7. Accepted RFCs ship in a future `ralphloops_version` release and
   are referenced from `specification/changelog.md`.

## Numbering

RFCs are numbered sequentially starting at `0001`. Numbers are
assigned when an RFC PR is opened, not when it is accepted.

## Initial RFCs

- [`0001-format-principles.md`](0001-format-principles.md) — the
  design principles Ralph Loops v0.1 is built on.

Planned future RFCs:

- `0002` — Metadata shape (revisiting recommended fields)
- `0003` — Compatibility declaration model
- `0004` — Registry / distribution model
