# 2026-10-01 — eval-seed · counter-run · fixture

## Context

Running the counter-skill line count.

## What happened

`scripts/count.sh` with no arguments exits 1 with "no input configured". The
skill has no recovery steps. The script needs the input path and comment
skipping passed explicitly.

## Workaround

Run `scripts/count.sh --input inputs/project.txt --skip-comments`. It skips
comment and blank lines; that is the count to report.

## Suggestion

Put the full command in step 1.

## Votes

- **2026-10-01T0800** — eval-seed · opened

## Agent comments

_(none yet)_
