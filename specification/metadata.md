# Metadata

`RALPH.md` frontmatter is optional YAML delimited by `---` lines at the
top of the file. Frontmatter is strongly recommended for ecosystem
compatibility but is not strictly required.

## Required fields (if frontmatter is present)

| Field                | Type   | Meaning                                      |
|----------------------|--------|----------------------------------------------|
| `name`               | string | Short stable package name.                   |
| `description`        | string | One-sentence summary for discovery.          |
| `ralphloops_version` | string | Format version used by the package.          |

If frontmatter is omitted entirely, a runtime MAY still load the loop,
but the package is considered minimally described.

## Recommended fields

| Field                 | Type                    | Meaning                                                       |
|-----------------------|-------------------------|---------------------------------------------------------------|
| `version`             | string                  | Package version (semver recommended).                         |
| `license`             | string                  | SPDX license identifier.                                      |
| `author`              | string or object        | Author name or structured author info.                        |
| `homepage`            | string (URL)            | Project homepage.                                             |
| `repository`          | string (URL)            | Source repository URL.                                        |
| `tags`                | list of strings         | Free-form tags for discovery.                                 |
| `compatible_runtimes` | list of strings         | Runtimes/version ranges known to support the package.         |
| `triggers`            | list of strings         | Human-readable phrases describing when to select this loop.   |
| `entry`               | map of string → path    | Named executable or reference entrypoints.                    |
| `resources`           | list of paths           | Supporting files that are particularly important.             |

## Field semantics

### `name`

A short, stable identifier for the package. Typically matches the
directory name. Outcome-oriented names are preferred
(`fix-failing-tests`, not `my-loop-1`).

### `description`

A one-sentence summary suitable for listings, registries, and runtime
discovery UIs.

### `ralphloops_version`

The format version the package targets, e.g. `0.1`. Runtimes MUST refuse
to execute packages whose `ralphloops_version` is strictly greater than
the version they support.

### `version`

The package's own version. Semver is recommended. Separate from
`ralphloops_version`.

### `compatible_runtimes`

A list of strings of the form `<runtime-name> <version-range>`, e.g.:

```yaml
compatible_runtimes:
  - ralphify >=0.3.0
```

Runtimes SHOULD evaluate these strings and warn on mismatch.
This is a hint, not a hard constraint.

### `triggers`

Human-readable phrases that describe the conditions under which a
runtime or a user might select this loop. These are for discovery UIs,
not for execution logic.

### `entry`

A map of named entrypoints. Values are paths relative to the package
root. Suggested keys:

- `validate` — a command that verifies the loop's preconditions or
  results
- `test` — a command that runs the project's tests
- `lint` — a command that lints the project
- `plan` — a file or script that produces a plan document
- `bootstrap` — a script that prepares the environment

Additional keys are allowed and will be preserved.

### `resources`

A list of relative paths to supporting files that are particularly
important for the loop. Runtimes MAY use this list to decide which
files to surface to the agent first.

## Path rules

- Paths MUST be relative to the package root unless they are absolute
  URIs.
- Paths MUST NOT use `..` to escape the package root.
- Forward slashes MUST be used as path separators in metadata, even on
  platforms that use a different native separator.

## Unknown fields

Unknown top-level frontmatter keys MUST be preserved by implementations
and MAY be surfaced as warnings during validation. They MUST NOT cause a
fatal parse error.
