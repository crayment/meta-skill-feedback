# Skill feedback (runtime friction) — meta-skill-feedback itself

This is the **live inbox for the meta-skill-feedback skill**: the convention,
its templates, and its references. It is **not an eval fixture**.

- Eval fixtures live outside this skill folder, under the repo root's
  `evals/fixtures/<name>/`. Their `feedback/` folders (and the seeded
  `2026-08-01T1200-wrong-data-path.md`) are test data. Never add, vote on, or
  move notes there.
- **During an eval run, never write here.** Executors copy fixtures into their
  `outputs/` and write notes there, as the eval prompt says. The repo-root
  checker `scripts/check_eval_outputs.py` reads only `outputs/` and
  `evals/fixtures/`.
- Friction in the **target skill** you bootstrapped or ran goes in *that*
  skill's `feedback/`, not here.

After bootstrapping a feedback inbox or following one, if something
**non-routine** in *this skill's* guidance misled you, leave feedback here. Do
not edit the skill.

**Public repo:** notes are committed and visible. Keep them generic — no company
or customer names, private skill names or paths, internal hostnames, personal
details, or tokens. Describe the target skill's *shape* ("interactive triage
skill with a final-report step"), not the skill. Use a generic machine label
(`local`, `ci-runner`) in the heading, or omit it.

## Before you write

1. Skim open `feedback/*.md` here (not README, not `resolved/`).
2. **Same issue already open?** Add a **+1** under **Votes** and a short entry under **Agent comments** on that file.
3. **New issue?** Create one timestamped file — see format below.

## When to write

This skill owns **the convention, the bootstrap template, cue-point guidance,
the runtime vote rules, and the review workflow**, so write here for:

- **Bootstrap:** the README starter template needed heavy rework for a common skill shape, or its sections did not fit
- **Cue points:** "Before you finish" vs extending a hard-rules / final-report section was unclear, or no section fit the target skill
- **Public vs private:** the guidance did not tell you what to strip, or whether to gitignore `feedback/*.md`
- **Votes:** you could not tell whether an open note was the *same* issue or a related one, whether to vote on a note in `resolved/`, or how to fill the heading slots
- **Filenames:** timestamp or collision rules were ambiguous (time zone, same-minute runs)
- **Review:** the sweep or resolve steps in `references/review.md` missed notes, caught non-notes, or left you guessing
- **Legacy migration:** a skill had an external queue and the guidance did not say what to do with it
- Skip routine bootstraps and runs where the convention simply applied

## Not feedback

| Situation | Where |
|-----------|--------|
| The target skill's own steps misled you | that skill's `feedback/` |
| Friction produced as part of an eval task | the eval run's `outputs/<fixture>/feedback/` |
| Grading or benchmark complaint on an eval iteration | the eval workspace `feedback.json` |
| The eval harness (executors, grader, aggregate, viewer) misled you | the provider-agnostic-skill-creator skill's `feedback/` |
| A bug in `check_eval_outputs.py`, a fixture, or the serve scripts | an issue or PR on this repo — do not edit fixtures to make a run pass |
| Task outputs such as rule proposals or audit rows | the task's own output location |

## Example

[evals/examples/sample-friction-note.md](../../../../evals/examples/sample-friction-note.md) (repo root)
shows the note shape from a passing eval run. It is an example, not an open note.

## Filename (new issues only)

`YYYY-MM-DDTHHMM-<short-slug>.md` — timestamp required; lowercase hyphens in slug.

## New issue — body

# YYYY-MM-DD — <id> · <role> · <machine>

## Context
Bootstrap or runtime, and the shape of the target skill.

## What happened
Which reference or template, what it told you, what did not fit, what you did instead.

## Suggestion (optional)
Smallest change to this skill that would help. Do not apply it yourself.

## Votes

- **YYYY-MM-DDTHHMM** — <id> · opened

## Agent comments

_(none yet)_

## Same issue again — append only

**Votes:** `- **YYYY-MM-DDTHHMM** — <id> · +1`

**Agent comments:** `### YYYY-MM-DDTHHMM — <id>` then one short paragraph.

## Rules

- One topic per file · duplicates are +1 votes, not new files · no secrets · reviewer moves handled notes to `resolved/`
- Never touch `evals/fixtures/` from here, and never write here from an eval run
