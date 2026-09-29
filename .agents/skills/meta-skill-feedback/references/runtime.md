# Runtime feedback (agents using a skill that already has feedback/)

Load `<skill>/feedback/README.md` at the end of the primary workflow.

## Decision tree

```
Routine run, nothing misled you?  →  stop (write nothing)

Non-routine friction?
  ├─ Skim open feedback/*.md (not README)
  ├─ Same issue already open?  →  +1 vote + Agent comment on THAT file
  └─ New issue?  →  one new timestamped file (Votes + Agent comments sections)
```

Never edit the target skill. Never write to a **legacy external feedback queue**
unless the skill still uses one — prefer in-skill `feedback/` when bootstrapped.

## New issue — file body

See [convention.md](convention.md). Minimum sections:

- **Context** · **What happened** · **Suggestion** (optional)
- **Votes** — first line: `· opened`
- **Agent comments** — `_(none yet)_` until someone votes

## Same issue again

Append to the **existing open file** for that topic:

**Votes** (add one line):

```markdown
- **YYYY-MM-DDTHHMM** — <id> · +1
```

**Agent comments** (add one block):

```markdown
### YYYY-MM-DDTHHMM — <id> · <machine>
Short note — new workaround optional; pure +1 is fine.
```

Duplicates are **votes**, not new files. Extra votes signal priority to the reviewer at review time.

## Example

`evals/examples/sample-friction-note.md` at the root of the
[meta-skill-feedback repo](https://github.com/crayment/meta-skill-feedback)
shows a representative new-issue note from a passing eval run.
