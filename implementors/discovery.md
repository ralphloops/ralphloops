# Discovery

Discovery is the process of locating Ralph Loop packages so they can be
loaded and executed. The format does not mandate a single discovery
mechanism — runtimes are free to combine whichever sources make sense
for their environment.

## Discovery sources

A runtime SHOULD support discovering packages from several sources:

### 1. Explicit paths

The simplest case: the user points the runtime at a directory.

```
ralph run path/to/fix-failing-tests/
```

The runtime looks for `RALPH.md` at that path.

### 2. Project-local loops

Many projects will want to check in their loops alongside source code.
Runtimes SHOULD allow a configurable project-local directory, for
example `./loops/` or `./.ralphloops/`, containing one package per
subdirectory:

```
my-project/
├── src/
└── loops/
    ├── fix-failing-tests/
    │   └── RALPH.md
    └── raise-coverage/
        └── RALPH.md
```

### 3. User-installed loops

Runtimes MAY maintain a user-level directory of installed shared loops,
analogous to `~/.local/share/ralphloops/` or similar.

### 4. Registry-downloaded loops

When registries exist, a runtime MAY resolve a package name to a
download URL, fetch the package, unpack it into a local cache, and
then load it like any other directory package. The format itself is
agnostic to registry protocols.

## Recursive discovery

When scanning a directory tree for loops, a runtime:

- MUST treat each `RALPH.md` file as the root of its own package.
- MUST NOT descend into a subdirectory of a package looking for a
  nested package (a package owns its own directory tree).
- SHOULD skip hidden directories (`.git`, `.cache`, etc.) and common
  build outputs (`node_modules`, `target`, `dist`).

## Name resolution

When the user asks for a loop by name (not path), the runtime SHOULD
resolve it by:

1. Checking explicit paths passed on the command line.
2. Checking the project-local directory.
3. Checking the user-installed directory.
4. Optionally fetching from a registry.

If multiple sources contain a package with the same name, earlier
sources take precedence. The runtime SHOULD warn the user about the
shadowing.

## Listing and search

Readers (Level 1) may present lists of loops to users. Useful sort and
filter dimensions:

- `name`
- `description`
- `tags`
- `triggers`
- `compatible_runtimes`

These are all optional metadata fields. Not every package will have
them, and discovery UIs should degrade gracefully.
