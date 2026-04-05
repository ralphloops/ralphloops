---
name: full-fixture
description: A fixture exercising every recommended frontmatter field.
ralphloops_version: 0.1
version: 1.2.3
license: MIT
author: Ralph Loops contributors
homepage: https://ralphloops.io/
repository: https://github.com/ralphloops/ralphloops
tags:
  - fixture
  - conformance
compatible_runtimes:
  - ralphify >=0.3.0
triggers:
  - conformance test
entry:
  validate: scripts/validate.sh
resources:
  - docs/notes.md
---

# Goal

Exercise every recommended frontmatter field in a single valid
package.

# Loop

1. The runtime parses this file.
2. The runtime validates the metadata.
3. The runtime reports success.
