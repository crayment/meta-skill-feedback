---
name: eval-fixture-counter-skill-recovery
description: Bare counter-skill with a recovery section for the bootstrap-recovery eval.
---

# Counter skill (recovery)

Placeholder skill with no feedback inbox. Used only as a copy source for evals.

## Steps

1. Run `scripts/count.sh` in this skill directory.
2. Report the line count from the script output.

## If the count fails

`scripts/count.sh` reads `inputs/project.txt`. If it exits non-zero, check that
the file exists, then run `wc -l inputs/project.txt` instead.
