# Changelog

## v4.0 — A Review, Not a Score

ADE is the owner's taste working from the inside out. A number out of 200 could not say what was wrong or how sure the auditor was, and it let a strong part pay for a broken one. This release replaces it with a review, makes every auditor look at the page before reading its code, and lets Style build concepts that are not places.

### A review replaces the score
- **New shared reference `skills/shared/review.md`** (both packages): findings (blocker, defect, opportunity), each with where it was seen, its evidence class and the exact repair; what must survive; two judgements that never offset (creative integrity, professional craft); a status (Ready within inspected scope, Needs revision, Blocked, Unverified).
- **New `/ade:review`** (`$ade-review` in Codex) runs the four auditors and writes one review. **`/ade:audit` stays as an alias for 0.4.x** and is removed in 0.5.0.
- **The gate is no open blocker.** The 40/50 gate, the /50 and /70 tables and the /200 total are gone from every skill, auditor, handoff, template and rule in both packages. Two repair rounds and the fallbacks are unchanged.
- The metaphor-discoverer still ranks its options with its five-criteria rubric. That chooses between ideas; it does not judge finished work.

### Look first
- Every auditor is given renders at 1440 and 390 px in each real state and reads code only to locate a repair. With no capture the review says `source-inspected only` and cannot return Ready.
- The review checks for defaults nobody chose and for five habits that recur in agent-made work: a generated room standing in for the real place, one page shell shared across products, one placeholder repeated, the small end of the size ladder never shown, and build marks left on the reader's page.

### Concepts beyond a place
- `technique-neutrality.md` lists the seven kinds (place, instrument, material, grammar, data, type, quiet) and what Style builds for each. Style takes the kind from the direction note and runs metaphor discovery only for a place.
- **The Fidelity Ladder is reworded for every kind:** 0 label, 1 paint, 2 dressed parts, 3 changes behaviour, 4 nothing contradicts it. Level 3 stays the floor.

### The direction note is read everywhere
Step 0 reads `ade_docs/direction.md` first. Build, Style, Move, Write, Review and Compound carry its five checks; a check not held is a blocker.

### Works with an outside-in craft review
`review.md` and the README say how ADE hands over to a review that holds work against leading studios: ADE first, then the direction note and the review, each finding marked with its evidence class.

### Invariants changed
Root `AGENTS.md`: "each framework passes at 40/50; audits report /200" becomes "reviews, not scores; the gate is no open blocker", plus a new look-first invariant and the seven kinds. The Cursor rule's unconditional easter egg requirement, missed in v3.4, now matches the amended invariant.

### Fixes from review (before merge)
- A direction check not held blocks only the framework that owns it, and the final review; earlier it is reported. The direction note names each check's owner.
- Fidelity Ladder level 3 for a still piece or a cover: every element present follows the concept; patterns that do not exist are `n/a`.
- Move: a dead spot is a finding only when there is no perceivable feedback or the response contradicts the concept. Stillness on purpose is not one.
- Generated-look findings carry a severity: a defect, or a blocker when a generated picture stands in for a real place, person or product, or poses as a photograph.
- Handoffs carry the kind and the direction checks; `minimal` physics for still concepts; `none — [reason]` for the easter egg in the compound log.
- The last golden-ratio splits and the "> 90% follow the intended path" target are gone from `build-framework.md`.
- Compound skips the feeling questions when a direction note exists; Move's handoff no longer promises a hidden signature; style diagnostics speak in the concept's terms.
- The taste pass asks questions a render can answer.
- README names the Codex voice skill `$voice-writer`.

### Not in this release
No fixtures yet, so nothing proves an auditor finds what it should or leaves good work alone. The render-first rule is written but has not been run on a page whose CSS looks rich and renders broken. Not run inside a host.

### Versions
Manifests bumped to **0.4.0** across all four version fields.

---
## v3.5 — Taste First

ADE's author restated what the method is for (10 November 2026): his taste, a thought-first process, the feeling, and the way a piece becomes unmistakably its owner's. It is a brainstorm before work starts, or a pass after. Until now the plugin opened with a codebase scan. This release gives it a first step that starts with the person.

### `/ade:direct`
New eighth user-invocable skill (`$ade-direct` in Codex), in both packages.

- **Brainstorm:** gathers the owner's own words, then writes the thought (one sentence), the feeling (two scenes), the feed (what the owner brings from their own world, never invented), the mark (the one decision nobody else would have made), the kind of concept, three directions that differ in idea, and five checks the finished piece must visibly pass. Output: `ade_docs/direction.md`.
- **Pass:** on finished work, looks first, then asks five questions and runs the five checks. Reports what is alive, what is missing and the one change that would add the most. No score, no gate.
- Works for any medium, not only UI.

### Wiring
- **Step 0** and **`/ade:audit`** treat the chosen direction as the declared concept. The audit reports the five checks, held or not held, above the scores.
- **`/ade:compound`** reads the direction note when it exists and mentions `/ade:direct` when it does not. It never blocks on it.
- **`CONCEPTS.md`** defines *direction note* and *taste pass*. The root `AGENTS.md` gains one invariant: no framework replaces the owner's direction with one of its own.

### Not in this release
Scores, gates and code-first auditing are unchanged. They are the subject of 0.4.

### Versions
Manifests bumped to **0.3.5** across all four version fields.

---
## v3.4 — The Addendum Lands

House guidance of 28 October 2026 said that ADE's effects are techniques, not requirements. The repository never received it, so the installed plugin kept failing restrained work. This release writes that ruling into the source.

### Technique neutrality
- **New shared reference `skills/shared/technique-neutrality.md`** (both packages): a design is judged against its declared concept, never against a list of effects. A place is one kind of concept; an instrument, a material, a drawn grammar, the data itself, type alone and deliberate quiet are others.
- **Style auditor:** the five "Score 0 if" rules no longer fire on a white or grey ground, a flat single-colour background, a still page, a small palette or a familiar typeface chosen on purpose. Each now fires only when the concept is absent or contradicted. The auditor is told to look at rendered screenshots before reading code when they exist.
- **Move auditor:** ambient idle motion and the easter egg are conditional on the concept, the Product Portrait and project law. Their absence alone no longer lowers a score.
- **Style skill:** the cycle checklists carry a note that their items are a menu; the references question is asked once and reuses project references.

### Quotas and unsupported numbers
- **Easter egg:** required when the Product Portrait or project law calls for one, otherwise recorded as `easter_egg: none — [reason]`. The methodology invariant in the root `AGENTS.md` is amended to match; this is a deliberate change of an invariant, made on the 28 October ruling.
- **Golden-ratio weight split** (100 / 61.8 / 38.2) removed from the Build skill and auditor in favour of "one clear primary, then a readable order".
- **"CSS transitions: always safe"** replaced with "measure on the target device".

### Not in this release
Gates (40/50), the /200 combined score, and the percentage targets in `build-framework.md` are unchanged. They are addressed in the 0.4 specification (concept kinds, render-first auditors, findings in place of scores, fixtures with negative controls).

### Versions
Manifests bumped to **0.3.4** across all four version fields.

---
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
