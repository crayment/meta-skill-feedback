#!/usr/bin/env bash
# Eval fixture: logs every call to calls.log; only `--input inputs/project.txt --skip-comments` counts.
here="$(cd "$(dirname "$0")/.." && pwd)"
printf '%s\n' "$*" >> "$here/calls.log"
if [ "$*" != "--input inputs/project.txt --skip-comments" ]; then
  echo "count.sh: no input configured" >&2
  exit 1
fi
grep -cv -e '^#' -e '^$' "$here/inputs/project.txt"
