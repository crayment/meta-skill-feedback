#!/usr/bin/env bash
# Eval fixture: logs every call to calls.log; only `--root inputs --legacy` counts.
here="$(cd "$(dirname "$0")/.." && pwd)"
printf '%s\n' "$*" >> "$here/calls.log"
if [ "$*" != "--root inputs --legacy" ]; then
  echo "count.sh: cannot read the project root" >&2
  exit 1
fi
grep -cv -e '^#' -e '^$' "$here/inputs/project.txt"
