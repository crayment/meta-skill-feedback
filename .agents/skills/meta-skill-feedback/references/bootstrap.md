# Bootstrapping feedback on a target skill

You are wiring a **runtime friction inbox** onto an **existing target skill**.
The human maintainer's ask is usually explicit: use the **meta-skill-feedback**
skill to add a feedback system to `<target-skill>` (e.g. a CLI helper or triage
skill). Load meta-skill-feedback first; do not bootstrap from memory alone.

Use judgment; adapt names, sections, and cues to that skill's shape.

**Out of scope:** scheduled or automated run prompts for unattended agents. If you want
feedback cues on unattended runs, patch your automation entrypoint separately —
not via this meta-skill.

## Minimum deliverables

| Artifact | Purpose |
|----------|---------|
| `feedback/resolved/` | Archive after human review (may stay empty) |
| `feedback/README.md` | Instructions for agents *using* this skill |
| Cue in target `SKILL.md` | So agents see the path before they finish |

## feedback/README.md — starter template

Copy and adapt. Drop bullets that do not apply; add skill-specific "not feedback"
routes (audit logs, rule proposals, eval JSON, etc.).

If this skill has eval fixtures, link one real example note from `evals/examples/`
(representative passing eval output) instead of maintaining a second doc sample.

```markdown
# Skill feedback (runtime friction)

After using this skill, if something **non-routine** misled you, leave feedback
here. Do not edit the skill.

## Before you write

1. Skim open `feedback/*.md` (not README).
2. **Same issue already open?** Add a **+1** under **Votes** and a short entry under **Agent comments** on that file.
3. **New issue?** Create one timestamped file — see format below.

## When to write

- Wrong/missing instruction, surprise failure, workaround you had to invent
- Skip routine successful runs

## Filename (new issues only)

`YYYY-MM-DDTHHMM-<short-slug>.md` — timestamp required; lowercase hyphens in slug.

## New issue — body

# YYYY-MM-DD — <id> · <role> · <machine>

## Context
What you were finishing.

## What happened
Specific friction.

## Suggestion (optional)
Smallest skill change that would help. Do not apply it yourself.

## Votes

- **YYYY-MM-DDTHHMM** — <id> · opened

## Agent comments

_(none yet)_

## Same issue again — append only

**Votes:** `- **YYYY-MM-DDTHHMM** — <id> · +1`

**Agent comments:** `### YYYY-MM-DDTHHMM — <id>` then one short paragraph.

## Rules

- One topic per file · duplicates are +1 votes, not new files · no secrets · reviewer adds a `## Resolution` and moves handled notes to `resolved/`
```

## Adapting to common skill shapes

| Shape | Typical extra work |
|-------|-------------------|
| **Wiki + skill** (external knowledge base) | In README: "wiki wrong → feedback; rule proposals → `<audit path>`" |
| **Interactive triage** | Cue in final-report / batch-complete section, not mid-workflow |
| **Public skill** | README note: entries must stay generic; optional gitignore for `feedback/*.md` |
| **Skill with evals** | Link `evals/examples/*.md` from README as the live format sample |

## Hard rules vs new section

If the target skill already has a **hard rules** (non-negotiable constraints) or **Final report** checklist,
add feedback there instead of a redundant **Before you finish** — one pointer to
`feedback/README.md` is enough.

## Do not

- Run a one-size-fits-all script that blind-patches every skill the same way
- Add cues in every reference file
- Create or patch scheduled or automated run prompts (separate system)
- Create friction files as part of bootstrap (unless you hit real friction)
- Replace task-specific outputs (proposals, Slack reports) with feedback files

## Legacy migration

If a skill still writes friction to an **external queue** (wiki page, shared doc,
old monolithic feedback file), prefer in-skill `feedback/` only. Migrate open
entries when the maintainer reviews — do not add a second write path.
