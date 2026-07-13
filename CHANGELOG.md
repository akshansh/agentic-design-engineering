# Changelog

## v3.3 — The Agent-Native Repo

Benchmarked against [Compound Engineering](https://github.com/EveryInc/compound-engineering-plugin): the repository itself is now something AI agents can read, understand, and maintain — and installation no longer requires cloning anything.

### Understanding: repo-root agent context
- **Root `AGENTS.md`** — authoring instructions for agents working on this source repo: the two-package parity rule (with the Claude↔Codex conversion table), the four-manifest versioning rule, skill authoring conventions, methodology invariants, and validation commands. Distinguishes authoring context (this repo) from runtime context (the installed plugin), so instructions land at the right layer.
- **Root `CLAUDE.md` and `GEMINI.md`** — host entry points that route agents to `AGENTS.md`.
- **`CONCEPTS.md`** — the shared domain vocabulary: Product Portrait, declared concept, Transformability, the Metaphor Fidelity Ladder, earcons, evidence trail, gates, handoffs. Every term the skills use with project-specific meaning, defined once.

### Execution: `/ade:setup`
New seventh user-invocable skill (`$ade-setup` in Codex), modeled on Compound Engineering's `/ce-setup`. A read-only readiness check that runs after install: detects the rendering stack and animation libraries already on hand, reports which evidence-capture tier the session supports (directly addressing the evidence-tooling variance in headless environments), finds prior `ade_docs/` history so transformations resume instead of restarting, notes sound-layer feasibility, and recommends the right first command.

### Installation: direct from GitHub, every host
(Shipped alongside this release.) Codex — both App and CLI — now installs the marketplace straight from GitHub (`codex plugin marketplace add akshansh/agentic-design-engineering`); GitHub Copilot (VS Code + Copilot CLI) is a documented host since it reads the Claude-compatible manifests already shipped. The clone + `install-codex.sh` flow moved to a contributors-only Local Development section. README gained Getting Started, Limitations, and FAQ sections.

### Versions
Manifests bumped to **0.3.3** across all four version fields.

---

## v3.2 — Sound, Fidelity, Evidence

### The Acoustic Layer
Sound design is now a first-class part of the experience. Style defines each metaphor's **acoustic signature** (room tone + what its materials sound like); Move implements **earcons** — short synthesized interaction sounds derived from the same materials that produced the color palette, matched to the physics personality. Strictly opt-in: off by default, visible toggle, never the sole feedback channel, silent on high-frequency actions. New shared craft reference: `skills/shared/sound-design.md` (synthesis recipes, the sound grammar, Web Audio patterns, audit checklist). The Product Portrait now records **sound appropriateness** so clinical and open-plan contexts stay silent by design.

### The Metaphor Fidelity Ladder
Names the most common AI-design failure: a standard interface wearing a themed costume. Five levels — Keyword Skin (0) → Palette Skin (1) → Component Costume (2) → Behavioral Inhabitation (3) → Full Inhabitation (4). Every Style transformation targets level 3+: the navigation, loading, and empty states must *operate* like the place, not just borrow its vocabulary. The style-auditor now reports `fidelityLevel`, and levels 0-1 cap the Physical Metaphor score at 4.

### Audit Against Intent
`/ade:audit` now opens by recovering the **declared concept** — what the owner wanted this to feel like — from the invocation, decision logs, or one targeted question. Every score is measured against that intent: a perfect boardroom library is a failing audit if the owner asked for a spaceship. The report leads with intent match and fidelity level.

### The Evidence Trail
Every run now proves its transformation: baseline screenshot before any change, per-cycle captures saved to `ade_docs/evidence/` with a `notes.md`, all referenced from the decision log. Real-time narration is required — one line before each phase, one line after — so the user watches the transformation instead of receiving a report at the end. New shared reference: `skills/shared/evidence-trail.md`.

### Also
- Metaphor options from `metaphor-discoverer` now include a one-line acoustic signature each — if you can't hear the place, it isn't specific enough
- Style → Move handoff carries `fidelity_level`, `rendering_stack`, `acoustic_signature`, and `evidence_dir`; Move → Write carries the sound toggle copy
- Fixed leftovers from v3.1: `/ade:style`'s "CSS only" rule now defers to the chosen rendering stack, and its structure rule routes through the Structural Feedback Loop
- Repository relocated to `~/Developer/Claude Code/2026-03-29_vibe-coding_048` as its primary home

---

## v3.1 — Unlock the Creative Ceiling

*(Shipped earlier as the "enhance-plugin-environment" round; recorded here retroactively.)*

- **Technology-agnostic rendering:** Style now selects the renderer the metaphor demands — layered CSS, P5.js/PixiJS generative canvases, Three.js 3D environments, SVG+GSAP mechanisms, or WebGL shaders (ogl.js) — with a metaphor-type → technology decision matrix, installation reference, and sustainability rules
- **Transformability replaces Buildability** in metaphor scoring: metaphors that demand structural reimagination now score HIGHER, not lower
- **Structural Feedback Loop:** Style can send a Structural Change Request back to Build when the metaphor can't inhabit the current information architecture — reskins are no longer accepted as transformations
- **Animation tool selection** in Move: GSAP (timelines, scroll) vs Motion.dev (React springs) vs Anime.js/Theatre.js, with the October 2024 GSAP/Webflow license warning
- Research-validated corrections: P5.js scoped to standalone canvases (PixiJS for React), WebGPU notes

---

## v3.0

### Renamed: Build, Style, Move, Write, Audit, Compound

The four framework names and all six commands have been simplified for clarity and intuitive flow.

**Before → After:**
- `/ade:clear` → `/ade:build` — Build the structure (accessibility, hierarchy, copy, feedback)
- `/ade:place` → `/ade:style` — Style the atmosphere (metaphor, materials, light, typography)
- `/ade:alive` → `/ade:move` — Move the interface to life (physics, interactions, discovery)
- `/ade:voice` → `/ade:write` — Write with intention (warm copy, metaphor language, compassionate errors)
- `/ade:audit` — unchanged
- `/ade:transform` → `/ade:compound` — Compound all four frameworks in one pass

The internal acronym mnemonics (C.L.E.A.R., P.L.A.C.E., A.L.I.V.E.) are preserved as documentation inside each framework reference. The surface flow is now: **build → style → move → write → compound**.

Inspired by [Compound Engineering](https://github.com/EveryInc/compound-engineering-plugin) by Kieran Klaassen — simple, sequential verbs that anyone can follow.

All skill directories, agent files, reference files, manifests, and documentation updated across Claude Code, Cursor, and Codex plugins.

---

## v2.0

### Step 0: Understand
Every skill now begins by understanding what the codebase is before evaluating or transforming anything. The agent builds a **Product Portrait** that feeds all downstream decisions.

### Autonomous Mode
Run `/ade:compound` with "surprise me" or `--auto` and the agent makes all decisions independently, including metaphor selection via a 5-criteria scoring rubric.

### Before/After Scoring
Every framework now runs its auditor at the start and end, producing delta tables that show what changed.

### Write Auditor + Full Audit Coverage
Write now has its own auditor agent. `/ade:audit` scores all four frameworks for a combined score out of /200.

### Error Recovery
Gate failures now have a 2-retry cap with per-framework fallback strategies. The agent documents what it could not fix and moves on with a warning.

### Structured Handoffs
Build → Style → Move → Write data contracts now provide cleaner context flow between frameworks.
