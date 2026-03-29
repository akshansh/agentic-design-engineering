# ADE Decision Logs

This directory stores decision logs from Agentic Design Engineering skill executions.

## How it works

Every `/ade:*` command creates a dated log file in the project's `ade_docs/` directory using the template in `decision-log-template.md`. This ensures that every design decision — metaphor choices, physics profiles, copy rewrites, easter eggs — is documented for reference.

## Template

See `decision-log-template.md` for the full template structure. Skills copy this template and fill in the relevant sections based on which frameworks were applied.

## Naming Convention

Log files follow this format: `YYYY-MM-DD-<context>.md`

Examples:
- `2026-03-29-clear-audit.md`
- `2026-03-29-place-transformation.md`
- `2026-03-29-alive-injection.md`
- `2026-03-29-full-transform.md`
