---
agent: codex --full-auto
commands:
  - name: tests
    run: uv run pytest -x
  - name: coverage
    run: uv run pytest --cov --cov-report=term-missing
args:
  - target_module
---

# Raise Coverage

Add focused tests to lift coverage on under-tested modules.

## Current state

{{ commands.coverage }}

{{ commands.tests }}

## Instructions

1. Review the coverage report above.
2. Pick the module with the lowest coverage ratio (or focus on {{ args.target_module }} if provided).
3. Identify one behavior that is currently untested.
4. Write a single focused test for that behavior. Prefer tests that assert behavior, not implementation details.
5. Run the tests. The new test must pass.
6. Commit and repeat until coverage targets are met.

## Constraints

- Do not add tests that only exercise getters, setters, or pass-through code.
- Do not modify production code except to expose things that are obviously missing.
- Do not chase 100% coverage. Stop at the declared target.
