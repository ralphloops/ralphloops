# bug-hunter

A Ralph Loop for turning a bug report into a reproduction, a
regression test, and a fix.

## How to use it

Run this loop with a bug report attached to the runtime's input. The
runtime decides how the report is passed in (CLI flag, file, issue
link, etc.) — the loop itself only cares that "the bug report" is
available somewhere in the agent's working context.

## What it bundles

- `prompts/edge-cases.md` — a checklist of common bug categories that
  helps the agent triage the report.
