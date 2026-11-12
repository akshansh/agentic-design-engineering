# Agentic Design Engineering — Repository Instructions

This file is **authoring context** for agents working on this source repository. If you are an agent *using* the installed ADE plugin inside someone's project, this file does not apply to you — your instructions live in the installed plugin's own `AGENTS.md`/`CLAUDE.md` and each skill's `SKILL.md`.

Shared domain vocabulary lives in `CONCEPTS.md`. Read it before editing any skill or agent — the frameworks use precise terms (Product Portrait, declared concept, Fidelity Ladder, Transformability) that must stay consistent across every file.

## What this repo is

ADE is a design methodology shipped as plugins for AI coding agents. The same methodology is packaged twice:

```
plugins/agentic-design-engineering/   Claude Code + Cursor package (skills + dedicated agents)
codex/agentic-design-engineering/     OpenAI Codex package (skills only — agents become skills)
.claude-plugin/marketplace.json       Claude Code marketplace catalog (also read by GitHub Copilot)
.cursor-plugin/marketplace.json       Cursor marketplace catalog
.agents/plugins/marketplace.json      Codex marketplace catalog (name: "ade-marketplace")
scripts/install-codex.sh              Legacy local-marketplace installer for Codex
docs/                                 README assets
CONCEPTS.md                           Shared domain vocabulary
CHANGELOG.md                          Release notes (marketing versions: v3.x)
```

## The parity rule (most important)

**Any change to skill or agent content must land in BOTH packages.** The Codex package is a full mirror of the Claude/Cursor package with these mechanical conversions:

| Claude/Cursor package | Codex package |
|-----------------------|---------------|
| Skill frontmatter `name: ade:build` | `name: ade-build` |
| Frontmatter has `argument-hint` | No `argument-hint` field |
| Invocation written `/ade:build` | Written `$ade-build` |
| Dedicated agents in `agents/{analysis,review,design,voice}/*.md` | Specialist skills in `skills/<agent-name>/SKILL.md` |
| Agent invoked via the agent runner | Skill invoked as `$<agent-name>` |
| `voice-writer` agent | `akshansh-voice` skill directory |

Shared references (`skills/shared/*.md`) and framework references (`skills/ade-*/references/*.md`) are byte-equivalent between packages except for the invocation-syntax conversions above. After editing one package, apply the same edit to the other before committing. A quick drift check:

```bash
diff -rq plugins/agentic-design-engineering/skills codex/agentic-design-engineering/skills | grep -v "Only in"
```

(Differences beyond `/ade:` ↔ `$ade-` syntax and frontmatter are drift — fix them.)

## Skill and agent authoring conventions

- Every skill is a directory with a `SKILL.md`. Required frontmatter: `name`, `description` (plus `argument-hint` in the Claude/Cursor package).
- Large craft knowledge goes in the skill's `references/` subdirectory, loaded by backtick path — keep `SKILL.md` procedural (steps, gates, report templates).
- Cross-skill shared knowledge lives in `skills/shared/` and is referenced by package-root-relative path (e.g. `skills/shared/step-0-understand.md`). If you add a shared reference, register it in the package `AGENTS.md` table.
- Agent files (Claude/Cursor package only) are single `.md` files with `name` + `description` frontmatter; output must be structured (JSON or scored findings). Auditors score, never fix.
- Skills must narrate in real time and leave an evidence trail — see `skills/shared/evidence-trail.md`. Never author a skill that works silently and dumps a report at the end.
- Write for any host: no host-specific environment variables in skill content; the Codex package must work with no agent runner.

## Versioning and releases

Two version schemes coexist deliberately:

- **Manifest version** (`0.x.y`) lives in FOUR files that must always match:
  1. `plugins/agentic-design-engineering/.claude-plugin/plugin.json`
  2. `plugins/agentic-design-engineering/.cursor-plugin/plugin.json`
  3. `codex/agentic-design-engineering/.codex-plugin/plugin.json`
  4. `.claude-plugin/marketplace.json` (the plugin entry's `version`)
- **Marketing version** (`v3.x`) names the release in `CHANGELOG.md` and the README. Mapping: manifest `0.3.y` ↔ marketing `v3.y`.

Any behavior change to skills, agents, or references bumps the manifest patch version in all four files and adds a `CHANGELOG.md` entry at the top. Validation:

```bash
for f in plugins/agentic-design-engineering/.claude-plugin/plugin.json \
         plugins/agentic-design-engineering/.cursor-plugin/plugin.json \
         codex/agentic-design-engineering/.codex-plugin/plugin.json; do jq -r .version "$f"; done
jq -r '.plugins[0].version' .claude-plugin/marketplace.json
jq . .claude-plugin/marketplace.json .cursor-plugin/marketplace.json .agents/plugins/marketplace.json > /dev/null && echo "manifests parse"
```

## When you change plugin content, also update

- `README.md` — commands table, agents table, repo structure tree, and framework descriptions if behavior changed
- The package-level `AGENTS.md` (both packages) and `CLAUDE.md` — skill/agent registry tables
- `CHANGELOG.md` — what changed, why, what it unlocks
- The canonical Notion page (if you have Notion access in the session) — its Upgrade Log expects a dated entry per meaningful change

## Methodology invariants (do not weaken these while editing)

- Direct comes before the frameworks and is optional. When `ade_docs/direction.md` exists, its chosen direction is the declared concept and no framework replaces it with one of its own. The taste pass never scores and never gates.
- Framework order is fixed: Build → Style → Move → Write. The only sanctioned back-edge is Style's Structural Change Request to Build.
- Gates: each framework passes at 40/50; audits report /200 combined. Autonomous mode (`--auto`) obeys every gate.
- Style targets Metaphor Fidelity Ladder level ≥ 3; levels 0–1 cap the metaphor score.
- Sound is opt-in, off by default, never the sole feedback channel, gated by the Product Portrait.
- Move plants an easter egg when the Product Portrait or project law calls for one; otherwise it records the absence as a decision. Every run logs to `ade_docs/` and captures evidence to `ade_docs/evidence/`.
- Techniques are a menu, not a checklist. No auditor scores a design down for the absence of a gradient, texture, animation, sound, metaphor or easter egg when the declared concept does not call for it (`skills/shared/technique-neutrality.md`).
