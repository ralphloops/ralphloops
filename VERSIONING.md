# Versioning

Ralph Loops uses a single version number, `ralphloops_version`, declared
per package in `RALPH.md` frontmatter.

## Version lines

- **`0.x` — draft / experimental.** Breaking changes may land in any
  `0.x` release. Runtimes and authors should track releases closely.
- **`1.x` — stable compatibility line.** Once cut, breaking changes
  require a new major version and an RFC. Additive changes ship as minor
  versions.

The current release is **`0.1`**.

## What counts as breaking

A change is breaking if, after it lands, a package that was valid under
the previous version is no longer valid, or behaves materially differently
under a conforming runtime.

Examples:

- Removing or renaming a required field
- Tightening validation rules so that previously valid packages fail
- Changing path resolution semantics
- Changing the meaning of an existing field

Not breaking:

- Adding a new optional field
- Clarifying prose without changing behavior
- Adding new conformance fixtures that match existing rules
- Adding recommended (not required) metadata

## Runtime behavior across versions

Runtimes MUST refuse to execute packages whose `ralphloops_version` is
strictly greater than the runtime's supported version. Runtimes SHOULD
emit warnings, not errors, when they encounter unknown optional fields
or recommended fields they do not use.

## Release process

1. Land all accepted RFCs for the release against `main`.
2. Update `specification/changelog.md` with a release entry.
3. Tag the release as `v<ralphloops_version>` (e.g. `v0.1`).
4. Announce in GitHub Discussions.

## Compatibility guidance

Authors should declare `ralphloops_version` honestly. When in doubt, set
it to the version you actually tested against.

Runtimes should declare which versions they support in their own
documentation, and should publish a conformance report against the
fixtures in `tests/`.
