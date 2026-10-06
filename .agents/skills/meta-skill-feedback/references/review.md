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
4. **Resolve** — append a resolution to the note, then move it. Every resolved note gets one: the
   next reader of `resolved/` should learn the outcome without digging through commit history.

```markdown
## Resolution (2026-08-29)

Shipped: `SKILL.md` § Setup now gives the real config path, and `scripts/check.sh` warns when it
is missing. The suggested auto-create was dropped: it would hide a typo in the path.
```

   Say what changed and where (file and section), and which suggestions you didn't take and why.
   For a note closed without a change, say why: `Won't fix: …`, `Duplicate of <note>`, or
   `Already fixed by <commit>`. Cite a commit hash only for an earlier commit; the one you're
   about to make is found by `git log` on the note.

```bash
git mv feedback/2026-08-29T1130-example.md feedback/resolved/
```

   A deferred note stays open; add an **Agent comments** entry saying what it waits on.

5. **Commit** skill fix + resolved move together when possible.

## Do not

- Auto-apply skill edits on unattended scheduled runs (unless the maintainer's prompt says otherwise).
- Delete friction files — move to `resolved/` for history.
- Move a note to `resolved/` without a `## Resolution` section.
- Treat open feedback as approval to change behavior silently.

## Aggregating across skills

No central index required. Optional: add a small script or linter in your repo to
list open `feedback/*.md` counts per skill.
