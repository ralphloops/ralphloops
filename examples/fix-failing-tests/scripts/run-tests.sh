#!/usr/bin/env bash
# Run the project's test suite and print the results.
# Edit this script to match your project's test runner.
set -euo pipefail

# Example: a Python project using pytest.
#   exec uv run pytest

# Example: a Node project.
#   exec npm test

# Default: refuse to run until the user has configured a test command.
echo "fix-failing-tests: scripts/run-tests.sh has not been configured." >&2
echo "Edit this file to run your project's test suite." >&2
exit 2
