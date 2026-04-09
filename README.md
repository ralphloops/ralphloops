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

## What makes this different from a directory of prompts

Three things the format adds beyond "markdown file in a folder":

1. **Feedback commands.** The runtime executes `commands` between iterations and
   injects their output into the prompt. The agent sees fresh test results,
   coverage reports, or lint output every loop.
2. **Arguments.** Loops are parameterized with `args` so the same loop works
   across different modules, scopes, or inputs.
3. **Portability contract.** The format defines how runtimes discover, parse,
   and execute loops — so a loop written for one tool works with another.

## Real-world usage

Ralph Loops are used in production on
[agr](https://github.com/computerlovetech/agr) (a package manager for AI
agents) and [ralphify](https://github.com/computerlovetech/ralphify) (the
reference runtime). Loops like `bug-hunter`, `refactor-module`, and `write-docs`
have driven real changes:

- **Bug fixes** — token leak vulnerability found and patched with a regression
  test
- **Refactoring** — function complexity reduced from 25 to 13, 19 to 9, 16 to 7
  across multiple modules
- **Dead code removal** — 10+ unused functions identified and removed
- **Documentation** — README rewritten end-to-end from loop output

Every commit from a loop run carries
`Co-authored-by: Ralphify <noreply@ralphify.co>`.

## Examples

Six complete loop packages ship with the spec under [`examples/`](examples/).
Most are ongoing gardening tasks — the kind of thing you schedule on a cron
or kick off whenever a codebase needs attention:

| Loop | Agent | What it does |
|------|-------|-------------|
| [`bug-hunter`](examples/bug-hunter/) | `claude` | Continuously hunt for bugs and edge cases |
| [`improve-codebase`](examples/improve-codebase/) | `codex` | Continuously find and fix code quality issues |
| [`raise-coverage`](examples/raise-coverage/) | `codex` | Steadily lift test coverage over time |
| [`refactor-module`](examples/refactor-module/) | `claude` | Clean up internals without changing behavior |
| [`write-docs`](examples/write-docs/) | `codex` | Keep docs in sync with code as it changes |
| [`dependency-updater`](examples/dependency-updater/) | `claude` | Keep dependencies current and secure |

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
