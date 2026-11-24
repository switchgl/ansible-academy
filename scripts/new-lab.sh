#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LAB="${1:-}"
[[ -n "$LAB" ]] || { echo "Usage: $0 <lab-id>"; exit 1; }
SRC="$ROOT/labs/$LAB"
DST="$ROOT/workspaces/$LAB"
mkdir -p "$DST"
[[ -d "$SRC/starter" ]] && cp -R "$SRC/starter/." "$DST/" || true
if [[ ! -f "$DST/inventory.ini" ]]; then
  printf "[local]\nlocalhost ansible_connection=local\n" > "$DST/inventory.ini"
fi
echo "Workspace: $DST"
