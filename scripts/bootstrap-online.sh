#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$ROOT/vendor/bin" "$ROOT/vendor/collections" "$ROOT/vendor/python"
python3 -m venv "$ROOT/vendor/python"
"$ROOT/vendor/python/bin/pip" install --upgrade pip
"$ROOT/vendor/python/bin/pip" install ansible ansible-core ansible-lint
ln -sf "$ROOT/vendor/python/bin/ansible" "$ROOT/vendor/bin/ansible"
ln -sf "$ROOT/vendor/python/bin/ansible-playbook" "$ROOT/vendor/bin/ansible-playbook"
ln -sf "$ROOT/vendor/python/bin/ansible-vault" "$ROOT/vendor/bin/ansible-vault"
ln -sf "$ROOT/vendor/python/bin/ansible-lint" "$ROOT/vendor/bin/ansible-lint" || true
ANSIBLE_COLLECTIONS_PATH="$ROOT/vendor/collections" "$ROOT/vendor/bin/ansible-galaxy" collection install community.general ansible.posix --force || true
echo "Bootstrap complete. You can go offline."
