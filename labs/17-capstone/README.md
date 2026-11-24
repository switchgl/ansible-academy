# 17 — Capstone: hardened service

Build a production-shaped role that uses a template, handler, defaults, and an assert.

## Required outcome

A role hardened_service that creates a directory, renders a config, notifies a handler, and asserts the port is > 1024. Called from a clean site.yml. Idempotent on second run.
