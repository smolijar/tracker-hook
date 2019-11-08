# Tracker hook

Add issue tracker references to your commits automatically!

## How to use

1. Use `kebab-case` branches with issue id in the first word with optional folder prefixes, e.g.
    - `feat/550-add-missing-id` -> `#550`
    - `42` -> `#42`
    - `backup/fix/666-root-of-all-evol` -> `#666`
    - `foo/bar` -> `#bar`

2. When hook is installed issue reference will be prefilled in commit message trailer via prepare-commit-msg git hook.