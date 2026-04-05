# Repository Conventions (sample)

This is a placeholder document that the `fix-failing-tests` loop
references from its `resources` list. Replace the contents with your
project's actual conventions when you adapt this loop.

## Test layout

- Tests live under `tests/`, mirroring the package structure.
- Each test file is named `test_<module>.py` (or equivalent for your
  language).
- Fixtures live in `tests/fixtures/`.

## Commit message style

- Use conventional commit prefixes: `fix:`, `feat:`, `refactor:`,
  `docs:`, `test:`.
- Keep the subject under 72 characters.
- Explain *why* in the body, not just *what*.

## What the agent should not touch

- `CHANGELOG.md`
- `LICENSE`
- Anything under `third_party/`
