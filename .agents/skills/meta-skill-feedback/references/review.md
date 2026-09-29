# Reviewing open skill feedback

The skill maintainer (or an agent **explicitly asked** to review feedback) sweeps
open friction files and decides skill edits.

## Find open notes

From a repo root or home skills tree:

```bash
find .agents/skills -path '*/feedback/*.md' ! -path '*/feedback/resolved/*' ! -path '*/evals/*' ! -name README.md 2>/dev/null
```

`! -path '*/evals/*'` skips eval fixtures kept inside a skill folder (the default skill-creator layout), whose `feedback/` folders hold seeded test notes, not real friction.

Or one skill:

```bash
ls path/to/skill/feedback/*.md 2>/dev/null | grep -v README
```

## Per-file loop

1. **Read** the friction file — context, what happened, suggestion, **vote count**.
2. **Brief** (if live human): job, friction, break vs inconvenience, vote weight, smallest fix, ask ship/defer/kill.
3. **Ship** — edit the target skill at its canonical source path in the repo where it lives.
4. **Resolve** — move the note:

```bash
git mv feedback/2026-08-29T1130-example.md feedback/resolved/
```

Optional frontmatter at top after move:

```markdown
---
reviewed: 2026-08-29
---
```

5. **Commit** skill fix + resolved move together when possible.

## Do not

- Auto-apply skill edits on unattended scheduled runs (unless the maintainer's prompt says otherwise).
- Delete friction files — move to `resolved/` for history.
- Treat open feedback as approval to change behavior silently.

## Aggregating across skills

No central index required. Optional: add a small script or linter in your repo to
list open `feedback/*.md` counts per skill.
