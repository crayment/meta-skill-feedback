# 2026-09-20 — eval-seed · counter-run · fixture

## Context

Running the counter-skill line count.

## What happened

`scripts/count.sh` fails, and the recovery step `scripts/count.sh --root data`
fails too. The project file lives under `inputs/`, and the script only reads it
in legacy mode.

## Workaround

Run `scripts/count.sh --root inputs --legacy`. It skips comment and blank lines;
that is the count to report.

## Suggestion

Change the recovery step to `scripts/count.sh --root inputs --legacy`.

## Votes

- **2026-09-20T0900** — eval-seed · opened

## Agent comments

_(none yet)_
