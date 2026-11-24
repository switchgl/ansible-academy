# Offline Ansible Academy

Hands-on Ansible training from basics to advanced. Fully offline after one-time bootstrap.

Companion to the Terraform academies:
- Pure Terraform: https://github.com/switchgl/tf-core-academy
- Terraform + AWS (Floci): https://github.com/switchgl/tf-aws-floci-academy

## Quick start

```bash
git clone https://github.com/switchgl/ansible-academy.git
cd ansible-academy
chmod +x scripts/*.sh
./scripts/bootstrap-online.sh
./scripts/start.sh
source scripts/env.sh
./scripts/new-lab.sh 01-hello-playbook
cd workspaces/01-hello-playbook
ansible-playbook site.yml
```

Portal: http://localhost:8080

MIT licensed.
