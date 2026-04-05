# Implementor Overview

This document is a narrative overview for people building runtimes,
editors, registries, or analysis tools that understand Ralph Loops. For
normative rules, read the [specification](../specification/format.md).

## What a runtime has to do

At a minimum, a compatible runtime:

1. **Discovers** packages by locating `RALPH.md` files.
2. **Parses** optional YAML frontmatter and the markdown body.
3. **Resolves** bundled resources relative to the package root.
4. **Exposes** loop instructions to an agent or downstream tool.

A runtime does not need to implement all of these in one tool. Many
useful tools only implement Level 1 (Reader) or Level 2 (Executor); see
[`compatibility.md`](../specification/compatibility.md).

## Recommended reading order

1. [`overview.md`](overview.md) — this file
2. [`discovery.md`](discovery.md) — how to find packages
3. [`parsing.md`](parsing.md) — how to read `RALPH.md`
4. [`execution-model.md`](execution-model.md) — how to run loops
5. [`test-cases.md`](test-cases.md) — conformance fixtures

## Principles for implementors

### Be permissive about what you accept

Unknown keys in frontmatter should be preserved and surfaced as warnings,
not fatal errors. Recommended fields are recommended, not required.

### Be strict about safety

Path traversal, symlink escape, and absolute paths outside the package
root are always fatal. A runtime that loads a malicious package should
not compromise the host.

### Don't reinvent execution semantics

The format intentionally leaves runtime behavior open. Build whatever
execution model fits your tool — iteration, reset, context accumulation,
retrieval — but document it so loop authors can rely on consistent
behavior.

### Prefer readable errors

Loop authors are humans. When validation fails, say exactly which file,
which field, and why.

### Round-trip unknown metadata

If you rewrite `RALPH.md` for any reason (packaging, signing, caching),
preserve unknown frontmatter keys. The format evolves; don't drop fields
you don't recognize.

## Minimal parser pseudocode

```python
def load_ralph_loop(package_root: Path) -> Loop:
    entry = package_root / "RALPH.md"
    if not entry.exists():
        raise FatalError("missing RALPH.md")

    text = entry.read_text(encoding="utf-8")  # fatal if not UTF-8
    frontmatter, body = split_frontmatter(text)

    metadata = {}
    if frontmatter is not None:
        metadata = yaml_safe_load(frontmatter)
        require(metadata, ["name", "description", "ralphloops_version"])
        reject_path_traversal(metadata)
        reject_unsupported_version(metadata["ralphloops_version"])

    return Loop(root=package_root, metadata=metadata, body=body)
```

This is pseudocode, not normative. The normative rules live in the
[specification](../specification/format.md).
