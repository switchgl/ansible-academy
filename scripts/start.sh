#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
touch .progress.json
[[ -s .progress.json ]] || echo '{}' > .progress.json
cd portal
python3 -m venv .venv 2>/dev/null || true
. .venv/bin/activate 2>/dev/null || true
pip install -q fastapi uvicorn jinja2 markdown 2>/dev/null || true
ACADEMY_ROOT="$ROOT" uvicorn app:app --host 0.0.0.0 --port 8080 &
echo "Portal: http://localhost:8080"
