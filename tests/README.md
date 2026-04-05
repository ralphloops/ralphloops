# Conformance Corpus

This directory holds fixtures that runtimes can use to check their
conformance with the Ralph Loops format.

```
tests/
├── valid/
│   ├── minimal/        # RALPH.md with no frontmatter
│   └── full/           # RALPH.md with every recommended field
└── invalid/
    ├── missing-ralph-md/   # directory with no RALPH.md
    └── bad-frontmatter/    # unparseable YAML frontmatter
```

## Valid fixtures

Every directory under `valid/` is a complete, loadable Ralph Loop
package. A conforming implementation MUST accept it.

## Invalid fixtures

Every directory under `invalid/` contains a `REASON.md` explaining why
the fixture is invalid. A conforming implementation MUST reject it and
SHOULD produce an error message that corresponds to the stated reason.

See [`implementors/test-cases.md`](../implementors/test-cases.md) for
how to use this corpus in a conformance suite.
