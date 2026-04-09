# Ralph Loops

Ralph Loops is a minimal, open format for packaging autonomous agent loops as
portable directories. A `RALPH.md` file describes what the agent should do,
which commands to run for feedback, and what arguments to accept. Any compatible
runtime can execute it. 

> **Status:** v0.1 draft. The format is a proposal — it earns adoption through
> usefulness, not authority.

## What it looks like

```
bug-hunter/
├── RALPH.md
├── scripts/
│   └── run-tests.sh
└── prompts/
    └── edge-cases.md
```

```markdown
---
agent: claude -p --dangerously-skip-permissions
commands:
  - name: tests
    run: uv run pytest -x
args:
  - bug_report
---

# Bug Hunter

Reproduce, localize, and patch the reported bug.

## Bug report
{{ args.bug_report }}

## Test results
{{ commands.tests }}

## Instructions
1. Read the bug report above.
2. Write a failing test to reproduce the bug.
3. Localize the root cause.
4. Make the smallest useful fix.
5. Run the full test suite. Commit only if everything passes.
```

### How it works

- **`agent`** — the command that runs the agent (`claude`, `codex`, or anything
  that reads stdin)
- **`commands`** — deterministic feedback commands whose output gets injected
  via `{{ commands.<name> }}`
- **`args`** — parameterize the loop with CLI arguments, injected via
  `{{ args.<name> }}`

The body is the agent's instructions. The runtime expands the templates, runs
the commands, and pipes everything to the agent. Write the loop once; run it
with any compatible runtime.

## Inspiration

Ralph Loops draws from two sources:

- [Geoffrey Huntley's Ralph loop methodology](https://ghuntley.com/ralph/) —
  the concept of autonomous agent loops that iterate with deterministic feedback
  until a task is done. Ralph Loops packages that concept; it does not own or
  gate the methodology.
- [Agent Skills](https://agentskills.io) — Anthropic's directory-based format
  for agent capabilities. Ralph Loops borrows the packaging philosophy
  (directory + entrypoint + frontmatter + templates) and applies it to a
  different problem: **iterative autonomous loops with feedback commands** rather
  than one-shot agent skills.

## Specification

The full spec lives under [`specification/`](specification/):

- [Format](specification/format.md) — package structure
- [Metadata](specification/metadata.md) — frontmatter fields
- [Directory layout](specification/directory-layout.md) — conventions

## Project

The format evolves through public discussion in the
[GitHub repo](https://github.com/ralphloops/ralphloops).
[Ralphify](https://ralphify.co/) is one reference runtime — others are welcome.

## License

[MIT](LICENSE).
