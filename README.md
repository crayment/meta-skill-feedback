# meta-skill-feedback

Agent skill for adding a **runtime friction inbox** to other skills — `feedback/` folder, vote/+1 on repeat issues, and finish-line cues in `SKILL.md`.

Agents leave timestamped notes when something misled them; you review, edit the skill, and move notes to `feedback/resolved/`. Not task output (audit logs, rule proposals) and not PAC eval `feedback.json`.

## Install

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

Human overview: [.agents/skills/meta-skill-feedback/evals/overview.html](.agents/skills/meta-skill-feedback/evals/overview.html)

## Evals (TDD)

Five [counter-skill](.agents/skills/meta-skill-feedback/evals/fixtures/) fixtures + PAC harness ([provider-agnostic-skill-creator](https://github.com/crayment/provider-agnostic-skill-creator)). Iteration 2: **with_skill 100%**, baseline 32%, delta +0.68.

See [.agents/skills/meta-skill-feedback/references/evals.md](.agents/skills/meta-skill-feedback/references/evals.md).

## Layout

```
.agents/skills/meta-skill-feedback/
├── SKILL.md
├── references/          # convention, bootstrap, runtime, evals
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
