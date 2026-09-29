# Meta-skill-feedback evals

Run evals with the **provider-agnostic-skill-creator** (PAC) harness — do not
fork PAC into this skill. Install from
[provider-agnostic-skill-creator](https://github.com/crayment/provider-agnostic-skill-creator)
and load its `SKILL.md`.

Eval assets live at the **repo root**, not inside the skill folder, and do not
ship with the skill. Harnesses that discover nested `SKILL.md` files would
otherwise list the counter-skill fixtures as installed skills. This departs from
PAC's default of `evals/` inside the skill: paths in `evals/evals.json` are
relative to the repo root.

## Layout

All paths are relative to the repo root.

| Path | Purpose |
|------|---------|
| `evals/evals.json` | Prompts + expectations |
| `docs/overview.html` | Rendered on [GitHub Pages](https://crayment.github.io/meta-skill-feedback/overview.html) |
| `evals/overview.html` | Symlink → `docs/overview.html` (same file) |
| `evals/fixtures/counter-skill*` | Fake mini-skills (copy-only) |
| `evals/examples/` | Sample friction notes from passing runs (linked by fixtures) |
| `scripts/check_eval_outputs.py` | Deterministic checks for grader |
| `scripts/serve-eval-docs.sh`, `scripts/serve-eval-review.sh` | Local overview and live PAC review servers |
| `meta-skill-feedback-workspace/` | Iteration runs (gitignored) |
| `.agents/skills/meta-skill-feedback/feedback/` | Live inbox for this skill — **not** an eval asset; executors never copy it or write to it |

## Quick run

From this repo root:

```bash
SKILL=./.agents/skills/meta-skill-feedback
PAC=/path/to/provider-agnostic-skill-creator/.agents/skills/provider-agnostic-skill-creator
WS=./meta-skill-feedback-workspace/iteration-N
FIX=./evals/fixtures
CHK=./scripts/check_eval_outputs.py
```

Clone PAC separately if needed; point `PAC` at its skill directory. Pass
`$SKILL` as the with-skill `skill_path`, and resolve eval `files` from the repo
root.

PAC expects eval directories named `eval-*`. After executor runs, grade each:

```bash
python3 $CHK --eval bootstrap-counter-skill --outputs $WS/eval-bootstrap-counter-skill/with_skill/outputs
python3 $CHK --eval runtime-quiet --outputs $WS/eval-runtime-quiet/with_skill/outputs --fixture-root $FIX
# … runtime-friction, runtime-vote, runtime-stuck likewise
cd $PAC && python3 -m scripts.aggregate_benchmark $WS --skill-name meta-skill-feedback
```

Iteration 2 (2026-09-05): **with_skill 20/20 checks** (100%), **baseline 6/20 checks** (30%; 32% mean eval pass-rate), delta **+0.68** mean pass-rate. One run per eval; fixture-only; deterministic filesystem checks — early v0, not production validation.

## Evals (v1)

See **[docs/overview.html](../../../../docs/overview.html)** (also at `evals/overview.html`) or the [rendered GitHub Pages version](https://crayment.github.io/meta-skill-feedback/overview.html).

| id | name | Tests |
|----|------|-------|
| 1 | bootstrap-counter-skill | Install feedback/ on bare counter-skill |
| 2 | runtime-quiet | Routine run → no note |
| 3 | runtime-friction | Wrong path → new note with Votes format |
| 4 | runtime-vote | Same bug open → +1 on existing note, no duplicate file |
| 5 | runtime-stuck | Script fails → friction note, don't patch SKILL.md |

Scheduled or automated run prompts are **not** part of this skill or its evals.

## Rules

- Executors **copy** fixtures into `outputs/` — never mutate `evals/fixtures/`.
- Subjective note quality → human review in viewer, not assertions.
- After a great runtime-friction run, refresh `evals/examples/sample-friction-note.md`.
