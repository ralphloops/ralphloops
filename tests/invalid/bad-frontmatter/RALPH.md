---
name: bad-frontmatter
description: "unterminated string
ralphloops_version: 0.1
---

# Goal

This fixture has unparseable YAML frontmatter (an unterminated quoted
string on the `description` line). A conforming implementation MUST
reject it.
