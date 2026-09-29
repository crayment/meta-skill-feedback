#!/usr/bin/env bash
# Serve static meta-skill-feedback docs (overview + snapshot review.html).
# Usage: serve-eval-docs.sh [port]
#
# Static only — PAC feedback does NOT save here. For live review + feedback.json
# use scripts/serve-eval-review.sh instead.

set -euo pipefail

PORT="${1:-8765}"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEFAULT_WS="$REPO_ROOT/meta-skill-feedback-workspace"
if [[ -n "${MSF_EVAL_WORKSPACE:-}" ]]; then
  WS="$MSF_EVAL_WORKSPACE"
elif [[ -f "$DEFAULT_WS/review.html" ]]; then
  WS="$DEFAULT_WS"
else
  latest="$(find "$DEFAULT_WS" -maxdepth 1 -type d -name 'iteration-*' 2>/dev/null | sort -V | tail -1 || true)"
  WS="${latest:-$DEFAULT_WS}"
fi
STAGE="${MSF_EVAL_STAGE:-/tmp/msf-eval-docs-serve}"
PIDFILE="${TMPDIR:-/tmp}/msf-eval-docs.pid"
LOG="${TMPDIR:-/tmp}/msf-eval-docs.log"

mkdir -p "$STAGE"
ln -sf "$REPO_ROOT/docs/overview.html" "$STAGE/overview.html"
if [[ -f "$WS/review.html" ]]; then
  ln -sf "$WS/review.html" "$STAGE/review.html"
else
  echo "warn: $WS/review.html not found" >&2
fi

cat > "$STAGE/index.html" <<EOF
<!DOCTYPE html>
<html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>meta-skill-feedback docs</title>
<style>body{font-family:system-ui;max-width:32rem;margin:2rem auto;padding:0 1rem;line-height:1.5}
a{display:block;margin:.75rem 0;font-size:1.1rem}</style></head>
<body>
<h1>meta-skill-feedback</h1>
<p><a href="overview.html">overview.html</a> — what the skill does + eval ladder</p>
<p><a href="review.html">review.html</a> — PAC benchmark viewer (when available)</p>
</body></html>
EOF

# Stop prior instance
if [[ -f "$PIDFILE" ]]; then
  old=$(cat "$PIDFILE" 2>/dev/null || true)
  if [[ -n "$old" ]] && kill -0 "$old" 2>/dev/null; then
    kill "$old" 2>/dev/null || true
    sleep 0.3
  fi
fi

cd "$STAGE"
BIND="${MSF_EVAL_BIND:-127.0.0.1}"
nohup python3 -m http.server "$PORT" --bind "$BIND" >>"$LOG" 2>&1 &
echo $! > "$PIDFILE"

echo "Serving on port $PORT (pid $(cat "$PIDFILE"), bind $BIND)"
echo "  http://127.0.0.1:$PORT/"
if [[ "$BIND" == "0.0.0.0" ]]; then
  IP="$(python3 -c "
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(('8.8.8.8', 80))
print(s.getsockname()[0])
" 2>/dev/null || true)"
  [[ -n "$IP" ]] && echo "  http://${IP}:$PORT/"
fi
echo "Log: $LOG"
echo "LAN bind: MSF_EVAL_BIND=0.0.0.0 $0 $PORT"
