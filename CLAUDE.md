# Working on this repository

Read `AGENTS.md` for full authoring instructions and `CONCEPTS.md` for the domain vocabulary before editing anything.

The three rules that prevent most mistakes here:

1. **Parity:** every skill/agent content change lands in BOTH `plugins/agentic-design-engineering/` and `codex/agentic-design-engineering/` (conversion table in `AGENTS.md`).
2. **Versions:** behavior changes bump the manifest version in all four manifest files together, plus a `CHANGELOG.md` entry.
3. **Registries:** new or renamed skills/agents/references get registered in both package `AGENTS.md` files, the package `CLAUDE.md`, and the root `README.md`.

This repo is documentation and Markdown skill definitions — there is no build step or test suite. Validate JSON manifests with `jq` after touching them.
