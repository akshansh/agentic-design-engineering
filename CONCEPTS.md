# Concepts

Shared domain vocabulary for Agentic Design Engineering — the terms every skill, agent, and reference in this repo uses with a precise, project-specific meaning. Glossary only, not a spec: the authoritative procedures live in the skills and shared references named below.

## The plugin and its parts

- **Framework** — one of the four design disciplines: **Build** (structure & clarity), **Style** (environment & materiality), **Move** (interaction & aliveness), **Write** (language & character). Fixed order: build → style → move → write. The old acronyms (C.L.E.A.R., P.L.A.C.E., A.L.I.V.E.) survive as internal mnemonics inside each framework reference.
- **Skill** — a user-invocable procedure (`SKILL.md` + optional `references/`). Six framework skills (`ade-build`, `ade-style`, `ade-move`, `ade-write`, `ade-audit`, `ade-compound`) plus `ade-setup`, the post-install readiness check, and `ade-direct`, the taste-first step that sets the direction before any framework runs.
- **Agent** — a specialized worker with one job: four **auditors** (score, never fix), three **designers** (`metaphor-discoverer`, `atmosphere-builder`, `vitality-injector`), one **analyst** (`codebase-comprehender`), one **voice writer**. In the Codex package agents are converted to specialist skills.
- **Shared reference** — craft knowledge used by multiple skills, in `skills/shared/`: `step-0-understand.md`, `handoff-schema.md`, `sound-design.md`, `evidence-trail.md`.
- **The two packages** — the same methodology ships as a Claude Code/Cursor package (`plugins/`) and a Codex package (`codex/`), kept in strict parity (see `AGENTS.md`).

## Understanding

- **Step 0 (Understand)** — runs before any framework touches anything; produces the Product Portrait. Procedure: `skills/shared/step-0-understand.md`.
- **Product Portrait** — the structured understanding of a project: domain, user persona, emotional weight, physical analog, sound appropriateness, and declared concept. Feeds every framework and gates the sound layer.
- **Direction note** — `ade_docs/direction.md`, written by `ade-direct`: the owner's words, the thought, the feeling, the feed (what they bring from their own world), the mark (the one decision nobody else would have made), the kind of concept, the chosen direction and five checks. When it exists, its chosen direction is the declared concept.
- **Taste pass** — `ade-direct` run on finished work: is the thought there, is the feeling there, is it theirs? Reports what is alive and what is missing. Never a score, never a gate.
- **Declared concept** — what the interface was *supposed to feel like*, stated by the owner. Audits score against it, not against taste: a perfect boardroom library is a failing audit if the owner asked for a spaceship.

## The pipeline

- **Handoff** — the structured data contract each framework passes to the next (product type → metaphor + physics personality + acoustic signature → interaction copy). Schema: `skills/shared/handoff-schema.md`.
- **Gate** — a score threshold that must pass before the pipeline continues. Each framework gates at **40/50**; a full audit reports a combined **/200**. Gates allow 2 retries, then a per-framework fallback. Autonomous mode obeys every gate.
- **Structural Change Request / Build–Style Feedback Loop** — the one sanctioned back-edge in the pipeline: when the chosen metaphor cannot inhabit the current information architecture, Style sends structural changes back through Build. Reskins are not transformations.
- **Standard vs Autonomous mode** — `ade-compound` either pauses at key decisions (metaphor choice, structural approval) or, with `--auto`, self-selects and documents its reasoning. Autonomous ≠ careless: all gates apply.

## Style vocabulary

- **Physical metaphor** — the real place an interface inhabits (a boardroom, a workshop, a garden). Every metaphor names its **materials**, temperature, light, and **acoustic signature** (what the place sounds like — if you can't hear it, it isn't specific enough).
- **Transformability** — the metaphor-scoring dimension that replaced Buildability: metaphors demanding structural reimagination score *higher*, not lower.
- **Metaphor Fidelity Ladder (0–4)** — Keyword Skin → Palette Skin → Component Costume → Behavioral Inhabitation → Full Inhabitation. **Level 3 is the floor**: navigation, loading, and empty states must *operate* like the place. Levels 0–1 (spaceship labels on a hamburger menu) cap the metaphor score.
- **Rendering stack** — the technology the metaphor demands, chosen per project: layered CSS → P5.js/PixiJS canvases → Three.js environments → SVG+GSAP mechanisms → WebGL shaders.

## Move vocabulary

- **Core loop** — the action the user repeats most; Move designs feedback around it first.
- **Dead spot** — an interaction with no felt response (hard cuts, spinner-only loading, color-only hovers). Move's job is to kill them with physics matched to the metaphor's personality.
- **Earcon** — a short synthesized interaction sound derived from the metaphor's materials (Web Audio, no audio files). Part of the **sound layer**: strictly opt-in, off by default, visible persisted toggle, never the sole feedback channel, silent on high-frequency actions. Craft reference: `skills/shared/sound-design.md`.
- **Easter egg** — the required hidden fingerprint in every Move transformation; the creator's signature, discoverable but not obvious.

## Proof

- **Decision log** — the dated record every run writes to the project's `ade_docs/` directory: portrait, concept, metaphor, fidelity level, scores with deltas, gate results, files modified. What gets decided gets documented.
- **Evidence trail** — the screenshot proof behind the log: a baseline capture before any change, per-cycle captures in `ade_docs/evidence/`, a `notes.md`, all referenced from the decision log — plus real-time narration (one line before each phase, one line after). Conventions: `skills/shared/evidence-trail.md`. If no browser is available, the log says so explicitly; nothing is skipped silently.

## Distribution

- **Host** — an AI coding tool that can install ADE: Claude Code, Cursor, OpenAI Codex (App/CLI), GitHub Copilot (VS Code/CLI). Claude Code and Copilot read the same manifests.
- **Marketplace** — the catalog a host installs from. This repo ships three: `.claude-plugin/marketplace.json`, `.cursor-plugin/marketplace.json`, and `.agents/plugins/marketplace.json` (named `ade-marketplace` — the name used in qualified installs like `agentic-design-engineering@ade-marketplace`).
