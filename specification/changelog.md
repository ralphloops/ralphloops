# Specification Changelog

All notable changes to the Ralph Loops specification are documented here.

## 0.1 — initial draft

Initial public draft of the Ralph Loops format.

- Defined the package as a directory containing a required `RALPH.md`.
- Defined optional YAML frontmatter with fields `agent`, `commands`,
  and `args`.
- Defined template syntax for `{{ commands.<name> }}` and
  `{{ args.<name> }}` placeholders.
- Defined path resolution rules (relative to package root, no
  traversal).
- Defined validation rules.
- Shipped six reference example packages.

This is a draft release. Breaking changes may land in any `0.x` version.
