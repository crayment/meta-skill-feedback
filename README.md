# meta-skill-feedback

Agent skill for adding a **runtime friction inbox** to other skills — `feedback/` folder, vote/+1 on repeat issues, and finish-line cues in `SKILL.md`.

Agents leave timestamped notes when something misled them; you review, edit the skill, and move notes to `feedback/resolved/`. Not task output (audit logs, rule proposals) and not PAC eval `feedback.json`.

## Install

Paths below follow the [Agent Skills specification](https://agentskills.io/specification) (`.agents/skills/`). Adapt for your host if skills live elsewhere.

```bash
git clone https://github.com/crayment/meta-skill-feedback.git
ln -s "$(pwd)/meta-skill-feedback/.agents/skills/meta-skill-feedback" \
  ~/.agents/skills/meta-skill-feedback
```

Or via the skills CLI (when indexed):

```bash
npx skills add crayment/meta-skill-feedback
```

## Quick start

**Bootstrap** on a target skill:

> Use **meta-skill-feedback** to add a feedback system to `<target-skill>`.

**Runtime** (target already has `feedback/README.md`): follow that README at end of a job — new issue → one file; same issue again → +1 vote on the open note.

Human overview: **[crayment.github.io/meta-skill-feedback/overview.html](https://crayment.github.io/meta-skill-feedback/overview.html)** (rendered) · [source](docs/overview.html)

## Evals (TDD)

Five [counter-skill](.agents/skills/meta-skill-feedback/evals/fixtures/) fixtures + PAC harness ([provider-agnostic-skill-creator](https://github.com/crayment/provider-agnostic-skill-creator)). Iteration 2 (2026-09-05): **with_skill 20/20 checks**, baseline **6/20** (30% checks; 32% mean eval pass-rate), delta **+0.68** — one run per eval, fixture-only, deterministic checks. Early v0, not production validation.

See [.agents/skills/meta-skill-feedback/references/evals.md](.agents/skills/meta-skill-feedback/references/evals.md).

## Layout

```
.agents/skills/meta-skill-feedback/
├── SKILL.md
├── references/          # convention, bootstrap, runtime, evals
├── feedback/            # live friction inbox for this skill (not a fixture)
├── evals/               # evals.json, fixtures, overview.html
└── scripts/             # check_eval_outputs.py, serve-eval-docs.sh
meta-skill-feedback-workspace/   # gitignored PAC iteration runs
```

## Related

- [Agent Skills specification](https://agentskills.io/specification)
- [agentic-engineering](https://github.com/crayment/agentic-engineering) — sibling skills catalog
- [provider-agnostic-skill-creator](https://github.com/crayment/provider-agnostic-skill-creator) — eval harness

## License

Apache-2.0 — see [LICENSE](LICENSE).
