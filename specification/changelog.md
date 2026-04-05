# Specification Changelog

All notable changes to the Ralph Loops specification are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
loosely.

## 0.1 — initial draft

Initial public draft of the Ralph Loops format.

- Defined the package as a directory containing a required `RALPH.md`.
- Defined optional YAML frontmatter with required fields `name`,
  `description`, and `ralphloops_version`.
- Defined recommended fields: `version`, `license`, `author`,
  `homepage`, `repository`, `tags`, `compatible_runtimes`, `triggers`,
  `entry`, `resources`.
- Defined path resolution rules (relative to package root, no
  traversal).
- Defined compatibility classes: Reader, Executor, Publisher.
- Defined validation rules and the minimum runtime contract.
- Shipped six reference example packages.
- Shipped a draft JSON Schema for frontmatter metadata.
- Established the RFC process under `rfcs/`.

This is a draft release. Breaking changes may land in any `0.x` version.
