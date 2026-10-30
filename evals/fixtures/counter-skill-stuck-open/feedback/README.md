# Skill feedback (runtime friction)

After a **non-routine** surprise, leave feedback here. Do not edit the skill.

## Before you write

1. Skim open `feedback/*.md` (not README).
2. **Same issue already open?** Add **+1** under **Votes** and a short **Agent comments** entry.
3. **New issue?** Create one timestamped file.

## When to write

- Something misled you or required discovery not in the skill
- Skip routine successful runs

## Filename (new issues)

`YYYY-MM-DDTHHMM-<short-slug>.md`

## New issue — body

```markdown
# YYYY-MM-DD — <id> · <role/title> · <machine>

## Context
One or two sentences: what you were trying to finish.

## What happened
Specific: wrong path, missing step, misleading instruction, workaround you used.

## Suggestion (optional)
Smallest change that would have prevented the friction.

## Votes

- **YYYY-MM-DDTHHMM** — <id> · opened

## Agent comments

_(none yet)_
```

## Same issue — vote and comment

Under **Votes**: `- **YYYY-MM-DDTHHMM** — <id> · +1`

Under **Agent comments**:

```markdown
### YYYY-MM-DDTHHMM — <id> · <machine>
+1 — what you saw; any new workaround.
```

## Rules

- One topic per file · duplicates are +1 votes · no secrets · reviewer moves handled notes to `resolved/`
