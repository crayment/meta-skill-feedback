#!/usr/bin/env bash
# Live PAC eval review server (feedback saves to workspace/feedback.json).
# Usage: serve-eval-review.sh [port]
#
# Unlike serve-eval-docs.sh (static overview + snapshot review.html), this runs
# generate_review.py with POST /api/feedback — required for the feedback UI.

set -euo pipefail

PORT="${1:-3117}"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEFAULT_WS="$REPO_ROOT/meta-skill-feedback-workspace"
PAC="${PAC_SKILL_ROOT:-$HOME/dev/me/provider-agnostic-skill-creator/.agents/skills/provider-agnostic-skill-creator}"

if [[ -n "${MSF_EVAL_WORKSPACE:-}" ]]; then
  WS="$MSF_EVAL_WORKSPACE"
else
  latest="$(find "$DEFAULT_WS" -maxdepth 1 -type d -name 'iteration-*' 2>/dev/null | sort -V | tail -1 || true)"
  WS="${latest:-$DEFAULT_WS/iteration-2}"
fi

GEN="$PAC/eval-viewer/generate_review.py"
if [[ ! -f "$GEN" ]]; then
  echo "error: PAC generate_review.py not found at $GEN" >&2
  echo "Set PAC_SKILL_ROOT to provider-agnostic-skill-creator skill directory." >&2
  exit 1
fi

BENCH="$WS/benchmark.json"
BENCH_ARG=()
[[ -f "$BENCH" ]] && BENCH_ARG=(--benchmark "$BENCH")

PIDFILE="${TMPDIR:-/tmp}/msf-eval-review.pid"
LOG="${TMPDIR:-/tmp}/msf-eval-review.log"

if [[ -f "$PIDFILE" ]]; then
  old=$(cat "$PIDFILE" 2>/dev/null || true)
  if [[ -n "$old" ]] && kill -0 "$old" 2>/dev/null; then
    kill "$old" 2>/dev/null || true
    sleep 0.3
  fi
fi
lsof -ti ":$PORT" | xargs kill -9 2>/dev/null || true

nohup python3 "$GEN" "$WS" --skill-name meta-skill-feedback --port "$PORT" \
  "${BENCH_ARG[@]}" >>"$LOG" 2>&1 &
echo $! > "$PIDFILE"
sleep 0.8

if curl -sf "http://127.0.0.1:$PORT/" >/dev/null; then
  echo "Live eval review: http://127.0.0.1:$PORT/"
  echo "Workspace: $WS"
  echo "Feedback:  $WS/feedback.json"
  echo "Log:       $LOG"
else
  echo "error: server failed to start — see $LOG" >&2
  tail -20 "$LOG" >&2 || true
  exit 1
fi
