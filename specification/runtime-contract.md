# Runtime Contract

This document describes what a compatible runtime MUST and SHOULD do
when loading and executing Ralph Loops. The format does not mandate a
single universal execution engine; runtimes are free to differ in how
they iterate, reset context, or wire tools. But certain behaviors are
required for a runtime to be considered compatible.

## Loading a package

A runtime MUST:

1. Locate `RALPH.md` within the candidate directory.
2. Read the file as UTF-8.
3. If the file starts with a `---` line, parse the YAML frontmatter
   block using a safe YAML loader.
4. Treat everything after the closing `---` as the markdown body.
5. Validate required metadata (`name`, `description`,
   `ralphloops_version`) if frontmatter is present.
6. Refuse to load the package if the declared `ralphloops_version` is
   strictly greater than the version the runtime supports.

A runtime SHOULD:

- Emit warnings (not errors) for unknown metadata keys.
- Emit warnings for missing recommended metadata.
- Preserve unknown metadata so it can be round-tripped.

## Resolving bundled resources

A runtime MUST:

- Resolve all relative paths against the package root.
- Reject any path that escapes the package root via `..`, symlinks, or
  any other mechanism.
- Treat missing files referenced from `entry` as fatal errors.
- Treat missing files referenced from `resources` as warnings.

A runtime SHOULD:

- Normalize path separators to the host OS when invoking files.
- Make resources available to the agent via whatever context mechanism
  the runtime uses (files, tools, embedded strings, etc.).

## Executing the loop

A runtime MUST:

- Make the `RALPH.md` body available to the agent as instructions.
- Make bundled resources reachable from inside the agent's working
  context.
- Execute declared `entry` commands via its own command execution
  mechanism when asked.

A runtime SHOULD document, in its own docs:

- How iteration is performed (reset per loop, accumulate, etc.).
- How context is constructed from the package root and resources.
- How commands declared under `entry` are surfaced to the agent.
- How the runtime decides when the loop terminates.

## Security and safety

A runtime MUST:

- Refuse to execute packages whose metadata contains path traversal.
- Refuse to load resources outside the package root.

A runtime SHOULD:

- Treat bundled scripts as untrusted by default and require explicit
  user opt-in before executing them on the host system.
- Surface clearly what the loop is about to do before running it.

## Error reporting

A runtime SHOULD distinguish:

- **Fatal errors** — the package cannot be loaded or executed.
- **Warnings** — the package loads but something is suspicious.
- **Informational notes** — recommended but non-required metadata is
  absent.

## What runtimes are free to do

The format intentionally leaves room for runtime-specific behavior,
including but not limited to:

- How the agent is iterated or reset between turns
- How bundled resources are surfaced (filesystem, embedded, retrieval)
- How commands are scheduled, timed out, or sandboxed
- How the agent is invoked under the hood
- How logs, traces, and metrics are produced

These concerns belong in runtime documentation, not in the format.
