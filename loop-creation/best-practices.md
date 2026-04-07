# Best Practices

Guidelines for writing portable, reusable Ralph Loops.

## One job per loop

Each package should describe a single outcome. Small loops are easier
to reuse, review, and debug than large monolithic ones. If a loop feels
like it's doing two things, split it.

Good names: `fix-failing-tests`, `raise-coverage`, `refactor-module`,
`write-docs`, `dependency-updater`, `bug-hunter`.

Bad names: `do-stuff`, `main-loop`, `my-ralphify-loop-v2`.

## Keep RALPH.md operational

The body is agent-facing instructions, not marketing copy. Write:

- concrete steps
- explicit validation commands
- clear exit conditions
- short, direct sentences

Move large background material into bundled files under `docs/` and
reference them.

## Bundle reusable scripts

If the loop needs to run tests, lint, or validate something, put the
commands in a script under `scripts/` and reference it from the
`commands` list. This makes the loop portable across projects that wire
their commands differently.

## Prefer relative paths

All paths in metadata resolve relative to the package root. Avoid
absolute paths. Never reference files outside the loop directory.

## Include validation and exit conditions

An autonomous loop must know when to stop. Always include:

- a `validate` or `test` command that can verify progress
- explicit exit conditions in the body

Without these, the runtime cannot decide when the loop is done and may
loop indefinitely.

## Name packages by outcome

Outcome-oriented names (`fix-failing-tests`) travel across projects
better than tool-oriented names (`my-ralphify-loop`). Assume someone
will find your loop in a list and need to understand what it does in
under three seconds.

## Ship a realistic example

Include a small fixture or sample input under `examples/` so users
and runtimes can smoke-test the loop without a real project attached.

## Keep frontmatter small

The frontmatter is intentionally minimal. Resist the urge to encode
every behavior as metadata. If something belongs in code or prose, put
it in a script or a markdown file.

## Write for an agent that forgets

Assume the agent has no memory between iterations. Every loop
iteration must be able to re-read `RALPH.md` and know exactly what to
do next. Avoid instructions that depend on remembering a previous
turn.

## Don't require a specific model

The format is runtime-agnostic and model-agnostic. Don't hardcode
model names, provider-specific features, or token budgets into your
loop body unless the loop genuinely cannot work without them.

## Test your loop before publishing

Run the loop against a realistic project before sharing it. Loops that
look clean in the abstract often fall apart the first time they hit
real code. Fix the loop, then publish.
