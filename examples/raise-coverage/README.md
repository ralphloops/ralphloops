# raise-coverage

A Ralph Loop for steadily lifting test coverage on under-tested modules.

The loop deliberately caps itself at a declared target and refuses to
write tests for trivial pass-through code. That keeps the resulting
test suite useful instead of noisy.

## Commands

- `tests` — runs `uv run pytest -x`
- `coverage` — runs `uv run pytest --cov --cov-report=term-missing`

Adjust these in the RALPH.md frontmatter to match your project's
tooling.
