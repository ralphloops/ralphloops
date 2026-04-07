# Parsing

This document describes how to parse a Ralph Loop `RALPH.md` file. It
is a companion to the normative rules in
[`specification/format.md`](../specification/format.md) and
[`specification/metadata.md`](../specification/metadata.md).

## File encoding

`RALPH.md` MUST be valid UTF-8. Implementations:

- MUST reject files that are not valid UTF-8 as fatal.
- SHOULD handle and strip a UTF-8 BOM if present.
- SHOULD normalize line endings to `\n` internally.

## Frontmatter detection

Frontmatter is a YAML block at the very top of the file, delimited by
`---` lines. Detection rules:

- If the first line is exactly `---`, frontmatter begins on the next
  line.
- Frontmatter ends at the next line that is exactly `---`.
- If no closing `---` is found, the file is invalid: treat as a fatal
  parse error.
- If the first line is not `---`, the file has no frontmatter and the
  entire file is the body.

## YAML parsing

- Use a **safe** YAML loader. Do not allow arbitrary object
  instantiation.
- YAML 1.2 semantics are recommended.
- The top-level frontmatter document MUST be a mapping. Lists or
  scalars at the top level are a fatal error.

## Recognised fields

If frontmatter is present, these fields are recognised:

- `agent` (string) -- the command to run
- `commands` (list of objects) -- deterministic feedback commands
- `args` (list of strings) -- CLI arguments

All fields are optional since frontmatter itself is optional.

## Path fields

Path-valued fields include the `run` values in `commands`. For each
path:

- Normalize it against the package root.
- Reject paths containing `..` that escape the package root.
- Reject absolute paths on POSIX (`/...`) and Windows (`C:\...`,
  `\\?\...`).
- Treat forward slashes as path separators, regardless of host OS.

Missing files referenced from `commands` are fatal.

## Unknown fields

- Unknown top-level frontmatter keys MUST be preserved.
- Unknown keys MAY produce warnings.
- Unknown keys MUST NOT cause a fatal parse error.

## Body handling

Everything after the closing frontmatter `---` is the markdown body.
The body:

- Is agent-facing instructions.
- MUST NOT be interpreted as a strict schema.
- MAY use any markdown features (headings, lists, fenced code blocks,
  tables, inline HTML).
- SHOULD be passed to the agent as text, unmodified, except for
  possible template expansion performed by the runtime (a runtime-
  specific feature).

## Template expansion

The body supports two standard template placeholders:

- `{{ commands.<name> }}` -- replaced with the output of running the
  named command from the `commands` list.
- `{{ args.<name> }}` -- replaced with the value of the named CLI
  argument from the `args` list.

Runtimes MUST expand these placeholders before passing the body to
the agent. Runtimes MUST degrade gracefully when a loop doesn't use
templating.

## Error reporting

When reporting errors, implementations SHOULD include:

- the package root path
- the field or line number where the error occurred
- a short explanation of the rule that was violated
- a link to the relevant spec section when possible
