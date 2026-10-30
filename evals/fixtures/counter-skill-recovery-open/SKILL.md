---
name: eval-fixture-counter-skill-recovery-open
description: Bootstrapped counter-skill with a stale recovery step and an open note holding the fix, for the runtime-recovery eval.
---

# Counter skill (recovery, open note)

Count project lines with the bundled script and report the total.

## Steps

1. Run `scripts/count.sh` in this skill directory.
2. Report the line count from the script output.

## If the count fails

Run `scripts/count.sh --root data`.
If that still fails, read the open notes in [feedback/](feedback/) (skip
`resolved/`) before inventing a workaround.

## Before you finish

If anything misled you, see [feedback/README.md](feedback/README.md).
Do not edit this skill. Skip when the run was routine.
