# Test Cases

The [`tests/`](../tests/) directory in this repository contains a
conformance corpus of valid and invalid Ralph Loop packages. Runtimes
are encouraged to run against it and publish a conformance report.

## Layout

```
tests/
├── valid/
│   ├── minimal/
│   └── full/
└── invalid/
    ├── missing-ralph-md/
    └── bad-frontmatter/
```

Each valid fixture is a complete, loadable package. Each invalid
fixture is a package that MUST be rejected, with a short `REASON.md`
file explaining why.

## How to use the corpus

### Readers (Level 1)

For each valid fixture, a Reader SHOULD:

- Successfully locate `RALPH.md`.
- Successfully parse the frontmatter (if present).
- Return the declared metadata without loss.

For each invalid fixture, a Reader SHOULD:

- Reject the package with a clear error.
- Not crash.
- Not silently accept invalid input.

### Executors (Level 2)

Everything a Reader does, plus:

- Successfully resolve every file referenced from `entry` and
  `resources` in valid fixtures.
- Reject any valid fixture whose `entry` commands cannot be resolved
  safely.
- Reject any invalid fixture that requests path traversal.

### Publishers (Level 3)

Everything an Executor does, plus:

- Produce a deterministic validation report for every fixture.
- Refuse to publish any invalid fixture.

## Conformance report format

A conformance report is a plain-text or JSON document listing, for
each fixture, whether the implementation accepted or rejected it, and
whether that matched the expected outcome. Example:

```
tests/valid/minimal                 accepted   PASS
tests/valid/full                    accepted   PASS
tests/invalid/missing-ralph-md      rejected   PASS
tests/invalid/bad-frontmatter       rejected   PASS
```

## Adding fixtures

See [`CONTRIBUTING.md`](../CONTRIBUTING.md) for rules on adding new
fixtures. In short:

- Valid fixtures go under `tests/valid/<name>/`.
- Invalid fixtures go under `tests/invalid/<name>/` with a `REASON.md`.
- Keep fixtures minimal — each should demonstrate one rule.
