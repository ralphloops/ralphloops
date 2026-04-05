# Execution Model

The Ralph Loops format deliberately does not mandate a single execution
engine. Different runtimes have different strengths, and forcing them
into one execution model would make the format less portable, not more.

This document describes what the format *does* require, and lists the
decisions runtimes are free to make.

## What the format requires

A Level 2 (Executor) runtime MUST:

1. Load `RALPH.md` per the parsing rules.
2. Make the markdown body available to the agent as instructions.
3. Resolve bundled resources relative to the package root.
4. Refuse any path that escapes the package root.
5. Refuse packages whose `ralphloops_version` exceeds the runtime's
   supported version.
6. Honor declared `entry` commands when the runtime's execution model
   invokes them.

## What the format does NOT specify

Runtimes choose their own answers to the following questions:

- **Iteration.** Does the runtime run the loop once, N times, or until
  a condition is met? Is context reset between iterations or carried
  forward?
- **Context construction.** Is the entire body passed to the agent on
  every turn? Is it trimmed? Is it combined with additional runtime-
  injected context?
- **Resource exposure.** Are bundled files mounted into the agent's
  working directory? Embedded into the prompt? Exposed via a retrieval
  tool?
- **Command execution.** How are `entry` commands run — directly on the
  host, in a sandbox, via a container, as a subprocess?
- **Timeouts.** Per-command and per-iteration timeouts are a runtime
  concern.
- **Logging and observability.** Runtimes are free to log however they
  like.
- **Sandboxing and permissions.** The format does not attempt to solve
  sandboxing universally.
- **Model selection.** Runtimes pick their own models, providers, and
  sampling parameters.

## Recommended practices

Runtimes SHOULD:

- Expose a stable working directory that corresponds to the package
  root during execution.
- Surface declared `entry` commands to the agent as named, invokable
  commands.
- Treat bundled scripts as untrusted by default, requiring opt-in
  before running them on the host.
- Provide clear, reproducible logs of which iteration ran, what it
  saw, and what it produced.

## Runtime-specific templating

A runtime MAY implement template expansion in the body. For example,
Ralphify expands `{{ commands.<name> }}` to the output of a declared
command and `{{ args.<name> }}` to named CLI arguments. The format
itself does not require or forbid templating; runtimes that implement
it MUST document their templating syntax and limitations in their own
docs.

Loops that rely on runtime-specific templating SHOULD declare that
dependency via `compatible_runtimes`.

## Error semantics

When execution fails, the runtime SHOULD:

- Report which package, which file, and which step failed.
- Distinguish fatal errors (cannot continue) from warnings (should
  continue).
- Not leave the host in a half-executed state (e.g., partial
  filesystem writes with no record).

## Documentation expectation

An Executor runtime is expected to publish its execution model in its
own documentation. Loop authors need to know:

- how iteration works
- how context is constructed
- how resources are exposed
- how commands are executed
- how the loop terminates

Without that documentation, authors cannot write portable loops for
your runtime.
