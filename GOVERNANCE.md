# Governance

Ralph Loops is an **open proposed format** for portable Ralph-style agent
loops. This document describes how the format is stewarded and evolved.

## Status

The current format version is `0.1`. All `0.x` versions are draft and
subject to change. A stable `1.x` line will be cut once the format has
proven itself across multiple runtimes and loop packages in the wild.

## Non-ownership of Ralph methodology

Ralph Loops is a community-oriented format proposal **inspired by**
[Geoffrey Huntley's Ralph loop methodology](https://ghuntley.com/ralph/).
This repository defines the package format. It does **not** define, own,
or gate the broader Ralph methodology itself.

## Maintainers

The format is maintained by a small group of stewards who land PRs, review
RFCs, and cut spec releases. Current maintainers are listed in the
repository `MAINTAINERS` file. Additional maintainers are added by
consensus of existing maintainers based on sustained, thoughtful
contribution.

## Decision making

- **Typos, clarifications, small doc fixes.** Any maintainer may merge
  after a brief review.
- **Additive, backwards-compatible spec changes.** Require review from at
  least one other maintainer and an open discussion thread.
- **Breaking changes.** Require an accepted RFC under `rfcs/` and
  consensus among active maintainers.

We prefer rough consensus over formal voting. If consensus cannot be
reached, the maintainers may choose to defer the decision rather than
force it through.

## RFC process

1. Open a discussion or issue describing the problem and the proposed change.
2. If the change is non-trivial, draft an RFC under `rfcs/` using the
   template in `rfcs/0001-format-principles.md`.
3. Maintainers and community members review and comment.
4. The RFC author revises in response to feedback.
5. A maintainer either accepts, rejects, or defers the RFC.
6. Accepted RFCs ship in a future `ralphloops_version` release, referenced
   from `specification/changelog.md`.

## Stewardship principles

- Keep the format small.
- Prefer portability over runtime-specific convenience.
- Prefer human-readability over machine-centric schemas.
- Do not claim ownership of the broader Ralph methodology.
- Do not favor any single runtime in normative text.
- Ship breaking changes through RFCs, not surprises.

## Relationship to runtimes

Runtimes like [Ralphify](https://ralphify.co/) are welcome to ship features
that go beyond the format, but the format itself stays neutral. Runtime-
specific behavior belongs in runtime documentation, not in the spec.
