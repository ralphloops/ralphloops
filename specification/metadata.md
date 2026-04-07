# Metadata

`RALPH.md` frontmatter is optional YAML delimited by `---` lines at the
top of the file.

## Fields

| Field      | Type             | Meaning                                                    |
|------------|------------------|------------------------------------------------------------|
| `agent`    | string           | The command to run (anything that reads stdin).            |
| `commands` | list of objects  | Deterministic feedback commands with `name` and `run`.     |
| `args`     | list of strings  | CLI arguments that become template variables.              |

### `agent`

The shell command that runs the agent. For example:

```yaml
agent: claude -p
```

The runtime pipes the rendered prompt body into this command's stdin.

### `commands`

A list of deterministic feedback operations. Each command has a `name`
and a `run` field:

```yaml
commands:
  - name: tests
    run: uv run pytest -x
  - name: lint
    run: uv run ruff check .
```

Command outputs are injected into the body using `{{ commands.<name> }}`
template placeholders.

### `args`

A list of CLI argument names. Each argument becomes a `--<name>` flag
and is injected into the body using `{{ args.<name> }}`:

```yaml
args:
  - module
  - focus
```

## Template syntax

The markdown body supports two template placeholders:

- `{{ commands.<name> }}` -- replaced with the output of running the named command
- `{{ args.<name> }}` -- replaced with the value of the named CLI argument

## Unknown fields

Unknown top-level frontmatter keys MUST be preserved by implementations
and MAY be surfaced as warnings. They MUST NOT cause a fatal parse error.
