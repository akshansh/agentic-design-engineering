# Concepts

Shared domain vocabulary for Agentic Design Engineering — the terms every skill, agent, and reference in this repo uses with a precise, project-specific meaning. Glossary only, not a spec: the authoritative procedures live in the skills and shared references named below.

## The plugin and its parts

- **Framework** — one of the four design disciplines: **Build** (structure & clarity), **Style** (environment & materiality), **Move** (interaction & aliveness), **Write** (language & character). Fixed order: build → style → move → write. The old acronyms (C.L.E.A.R., P.L.A.C.E., A.L.I.V.E.) survive as internal mnemonics inside each framework reference.
- **Skill** — a user-invocable procedure (`SKILL.md` + optional `references/`). Six framework skills (`ade-build`, `ade-style`, `ade-move`, `ade-write`, `ade-review`, `ade-compound`) plus `ade-setup`, the post-install readiness check, and `ade-direct`, the taste-first step that sets the direction before any framework runs. `ade-audit` is the old name of `ade-review`, kept for 0.4.x.
- **Agent** — a specialized worker with one job: four **auditors** (review, never fix), three **designers** (`metaphor-discoverer`, `atmosphere-builder`, `vitality-injector`), one **analyst** (`codebase-comprehender`), one **voice writer**. In the Codex package agents are converted to specialist skills.
- **Shared reference** — craft knowledge used by multiple skills, in `skills/shared/`: `step-0-understand.md`, `handoff-schema.md`, `sound-design.md`, `evidence-trail.md`, `technique-neutrality.md`, `review.md`.
- **The two packages** — the same methodology ships as a Claude Code/Cursor package (`plugins/`) and a Codex package (`codex/`), kept in strict parity (see `AGENTS.md`).

## Understanding

- **Step 0 (Understand)** — runs before any framework touches anything; produces the Product Portrait. Procedure: `skills/shared/step-0-understand.md`.
- **Product Portrait** — the structured understanding of a project: domain, user persona, emotional weight, physical analog, sound appropriateness, and declared concept. Feeds every framework and gates the sound layer.
- **Direction note** — `ade_docs/direction.md`, written by `ade-direct`: the owner's words, the thought, the feeling, the feed (what they bring from their own world), the mark (the one decision nobody else would have made), the kind of concept, the chosen direction and five checks. When it exists, every framework reads it: its chosen direction is the declared concept, its kind decides how Style works, and its five checks are reported in every review.
- **Taste pass** — `ade-direct` run on finished work: is the thought there, is the feeling there, is it theirs? Reports what is alive and what is missing. Never a score, never a gate.
- **Declared concept** — what the interface was *supposed to feel like*, stated by the owner. Reviews judge against it, not against taste: a perfect boardroom library is a failing review if the owner asked for a spaceship.
- **Concept kind** — what organises the interface: a **place**, an **instrument**, a **material**, a **grammar**, the **data**, **type** alone, or **quiet**. Chosen in the direction note. Metaphor discovery runs only for a place. Table: `skills/shared/technique-neutrality.md`.

## The pipeline

- **Handoff** — the structured data contract each framework passes to the next (product type → metaphor + physics personality + acoustic signature → interaction copy). Schema: `skills/shared/handoff-schema.md`.
- **Review** — what every auditor and `ade-review` return, in place of the scores retired in 0.4.0: findings (**blocker**, **defect**, **opportunity**), each with an **evidence class** (source-inspected, render-observed, behaviour-tested, user-tested, specialist-reviewed); what must survive; two judgements that never offset (**creative integrity**, **professional craft**); and a **status** (Ready within inspected scope, Needs revision, Blocked, Unverified). Renders at 1440 and 390 px come first; with none, the review is *source-inspected only* and cannot be Ready. Form: `skills/shared/review.md`.
- **Gate** — the condition before the pipeline continues: **no open blocker**. Gates allow 2 repair rounds, then a per-framework fallback. Autonomous mode obeys every gate.
- **Structural Change Request / Build–Style Feedback Loop** — the one sanctioned back-edge in the pipeline: when the chosen metaphor cannot inhabit the current information architecture, Style sends structural changes back through Build. Reskins are not transformations.
- **Standard vs Autonomous mode** — `ade-compound` either pauses at key decisions (metaphor choice, structural approval) or, with `--auto`, self-selects and documents its reasoning. Autonomous ≠ careless: all gates apply.

## Style vocabulary

- **Physical metaphor** — for a concept of the place kind, the real place an interface inhabits (a boardroom, a workshop, a garden). Every metaphor names its **materials**, temperature, light, and **acoustic signature** (what the place sounds like — if you can't hear it, it isn't specific enough).
- **Transformability** — the metaphor-scoring dimension that replaced Buildability: metaphors demanding structural reimagination score *higher*, not lower.
- **Fidelity Ladder (0–4)** — how far the concept, of any kind, has moved in: 0 label → 1 paint → 2 dressed parts → 3 changes behaviour → 4 nothing contradicts it. **Level 3 is the floor**: navigation, loading and empty states must *work* by the concept's rules. Levels 0–1 (spaceship labels on a hamburger menu) are a defect.
- **Rendering stack** — the technology the metaphor demands, chosen per project: layered CSS → P5.js/PixiJS canvases → Three.js environments → SVG+GSAP mechanisms → WebGL shaders.

## Move vocabulary

- **Core loop** — the action the user repeats most; Move designs feedback around it first.
- **Dead spot** — an interaction with no felt response (hard cuts, spinner-only loading, color-only hovers). Move's job is to kill them with physics matched to the metaphor's personality.
- **Earcon** — a short synthesized interaction sound derived from the metaphor's materials (Web Audio, no audio files). Part of the **sound layer**: strictly opt-in, off by default, visible persisted toggle, never the sole feedback channel, silent on high-frequency actions. Craft reference: `skills/shared/sound-design.md`.
- **Easter egg** — the creator's hidden fingerprint, discoverable but not obvious. Move plants one when the Product Portrait or project law calls for it; otherwise it records `easter_egg: none — [reason]`.

## Proof

- **Decision log** — the dated record every run writes to the project's `ade_docs/` directory: portrait, concept, kind, fidelity level, findings before and after, gate results, files modified. What gets decided gets documented.
- **Evidence trail** — the screenshot proof behind the log: a baseline capture before any change, per-cycle captures in `ade_docs/evidence/`, a `notes.md`, all referenced from the decision log — plus real-time narration (one line before each phase, one line after). Conventions: `skills/shared/evidence-trail.md`. If no browser is available, the log says so explicitly; nothing is skipped silently.

## Distribution

- **Host** — an AI coding tool that can install ADE: Claude Code, Cursor, OpenAI Codex (App/CLI), GitHub Copilot (VS Code/CLI). Claude Code and Copilot read the same manifests.
- **Marketplace** — the catalog a host installs from. This repo ships three: `.claude-plugin/marketplace.json`, `.cursor-plugin/marketplace.json`, and `.agents/plugins/marketplace.json` (named `ade-marketplace` — the name used in qualified installs like `agentic-design-engineering@ade-marketplace`).
