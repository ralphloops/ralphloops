# Why this fixture is invalid

The YAML frontmatter in `RALPH.md` is unparseable: the `description`
field opens a quoted string that is never closed. A conforming
implementation MUST treat this as a fatal parse error.

Per `specification/format.md` §9 and `implementors/parsing.md`:

> A valid v0.1 package must contain parseable YAML if frontmatter is
> present.
