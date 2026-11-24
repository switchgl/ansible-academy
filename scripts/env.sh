#!/usr/bin/env bash
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PATH="$ROOT/vendor/bin:$PATH"
export ANSIBLE_COLLECTIONS_PATH="$ROOT/vendor/collections"
export ANSIBLE_CONFIG="$ROOT/shared/ansible.cfg"
echo "Ansible: $(command -v ansible-playbook 2>/dev/null || echo 'run bootstrap')"
