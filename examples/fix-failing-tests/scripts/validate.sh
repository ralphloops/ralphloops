#!/usr/bin/env bash
# Confirm the workspace is in a sane state before the loop touches it.
set -euo pipefail

if ! command -v git >/dev/null 2>&1; then
  echo "validate: git is not installed" >&2
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "validate: not inside a git repository" >&2
  exit 1
fi

# Warn (don't fail) if the working tree is dirty. The loop decides
# whether to continue.
if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "validate: working tree has uncommitted changes" >&2
fi

echo "validate: ok"
