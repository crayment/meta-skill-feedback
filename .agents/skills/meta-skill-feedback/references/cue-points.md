# Cue points — where to patch target skills

Goal: agents **see** the feedback path without loading this meta-skill. Use **one
touchpoint** in the target skill — end of `SKILL.md`.

Scheduled or automated run prompts for unattended agents are **out of scope** for this
meta-skill. Patch your automation entrypoint separately if you want unattended
runs to see the feedback path.

## Required — end of SKILL.md

Add a **Before you finish** section (or fold into an existing **hard rules** section if the skill
already has one). Keep to ~5 lines:

```markdown
## Before you finish

If anything misled you, failed oddly, or required discovery not covered here,
write **one file** in `feedback/` — see [feedback/README.md](feedback/README.md).
Do not edit this skill. Skip when the run was routine.
```

Extend existing **hard rules** or **Final report** sections instead when that
fits the target skill better.

## Optional — second cue (rare)

Add **one** extra cue only where agents repeatedly get lost mid-workflow — and
only in `SKILL.md` or a domain reference file, not in automation run prompts:

| Skill shape | Where |
|-------------|--------|
| Multi-phase workflow | After error recovery or auth failure section |
| External wiki paths | Next to the path table: "wiki wrong/missing → `feedback/`" |
| Long reference chains | Do **not** cue in every reference — end of SKILL.md is enough |

## Good moments to leave feedback

- Had to guess because the skill was silent
- Wrong path, flag, account, or command
- Same manual workaround as a prior run
- Near-miss (almost wrong action)
- Found the answer only by searching outside the skill

## Skip feedback

- Routine success, no surprises
- The output belongs in the task itself (proposals, summaries, audit rows)
- Pure user preference with no skill gap

## Same issue again

Do not open a second file. Add **+1** under **Votes** and an **Agent comments**
entry on the existing open note — see [convention.md](convention.md).

## Legacy external queues

If a skill still writes friction to an **external queue** (wiki page, shared doc,
old monolithic feedback file), **do not add a second write path**. Prefer in-skill
`feedback/` only; migrate open entries when the maintainer reviews.
