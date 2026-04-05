# Common bug categories to rule in or out during triage

When a bug is reported, walk through this checklist before diving into
a specific fix:

## Input handling
- Empty input
- Single-element input
- Very large input
- Unicode / non-ASCII input
- Input with leading/trailing whitespace
- Duplicate keys or elements

## Null and absence
- `None` / `null` / `nil` where a value is expected
- Missing optional fields
- Uninitialized variables

## Numbers
- Off-by-one at loop boundaries
- Integer overflow
- Floating-point equality
- Division by zero

## Time and dates
- Timezone handling
- Daylight saving time transitions
- Leap years and leap seconds
- Unix epoch boundaries

## Concurrency
- Race conditions on shared state
- Deadlocks
- Iteration over a mutating collection

## I/O
- File not found
- Permission denied
- Partial reads/writes
- Encoding mismatches

## State and identity
- Equality vs identity
- Mutable default arguments
- Stale caches

Use this list as a triage checklist — don't chase every category, but
rule out the obvious ones before committing to a hypothesis.
