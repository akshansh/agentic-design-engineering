# Agentic Design Engineering — Agent Registry

## Overview

This plugin provides design engineering frameworks that transform generic UIs into intentional, inhabited digital places. It operates through four interconnected frameworks:

- **Build** — Structure, accessibility, hierarchy (Does it work?)
- **Style** — Atmosphere, metaphor, texture, acoustic signature (Does it feel like somewhere?)
- **Move** — Feedback, discovery, physics, sound, easter eggs (Does it engage?)
- **Write** — Communication style, microcopy, tone (Does it sound intentional?)

## Shared References (`skills/shared/`)

| File | Purpose |
|------|---------|
| `step-0-understand.md` | Product Portrait process — runs before every framework |
| `handoff-schema.md` | Structured data contracts between frameworks |
| `sound-design.md` | The acoustic layer — material-derived earcons, room tone, Web Audio patterns, opt-in rules |
| `evidence-trail.md` | Screenshot evidence + real-time narration conventions — every run proves its transformation |
| `technique-neutrality.md` | The rule that effects are techniques, not requirements: judge against the declared concept; the seven kinds of concept |
| `review.md` | How every auditor and gate reports: render first, findings (blocker, defect, opportunity), two judgements, a status; generated-look checks; no scores |

## Agent Directory

### Review Agents (`agents/review/`)

| Agent | Description | Model |
|-------|-------------|-------|
| `build-auditor` | Evaluates UI against Build framework: copy, layout, emphasis, accessibility, reward. Returns a review with repair procedures. | inherit |
| `style-auditor` | Reviews the render against Style framework: the concept (any kind), lighting, animation, color-as-material, typography. Reports fidelity level (0-4) and intent match against the declared concept. | inherit |
| `move-auditor` | Evaluates interactivity against Move framework: agency, loops, invitation, vitality, emergence. Returns a review with dead-spot map, easter egg check, and sound layer compliance. | inherit |
| `write-auditor` | Evaluates UI copy against Write framework: partnership, simplification, purpose, invitation, connection, compassion, concept language. Returns a review. | inherit |

### Design Agents (`agents/design/`)

| Agent | Description | Model |
|-------|-------------|-------|
| `metaphor-discoverer` | Given a product domain and feeling description, suggests 3-5 specific physical metaphors with material palettes and temperature. | inherit |
| `atmosphere-builder` | Given a chosen metaphor and materials, generates scoped CSS atmosphere layers (background, light source, vignette, texture, air). | inherit |
| `vitality-injector` | Scans code for interaction dead spots (hard cuts, spinner loaders, color-only hovers) and generates physics-based replacements. | inherit |

### Analysis Agents (`agents/analysis/`)

| Agent | Description | Model |
|-------|-------------|-------|
| `codebase-comprehender` | Scans project structure, dependencies, and UI patterns to build a Product Portrait — understanding domain, user persona, and emotional weight before framework evaluation. | inherit |

### Voice Agents (`agents/voice/`)

| Agent | Description | Model |
|-------|-------------|-------|
| `voice-writer` | Reviews UI copy (button labels, error messages, empty states, microcopy) and rewrites generic text to sound warm, structured, and purposeful. Supports custom voice profiles. | inherit |

## Skills Directory

### User-Invocable Skills (`skills/`)

| Skill | Slash Command | Description |
|-------|---------------|-------------|
| `ade-direct` | `/ade:direct` | Taste first. Turns the owner's thought, feeling and references into one direction with five checks (`ade_docs/direction.md`); as a pass, asks whether finished work carries them. Any medium. |
| `ade-build` | `/ade:build` | UI structure review + repair. Looks, then fixes accessibility, hierarchy, emphasis, copy, and feedback. |
| `ade-style` | `/ade:style` | Concept and atmosphere. Takes the kind from the direction note; discovers a metaphor only for a place; iterates 5 cycles. |
| `ade-move` | `/ade:move` | Interactivity injection. Identifies core loop, finds dead spots, injects physics and discovery layers, an easter egg where required. |
| `ade-write` | `/ade:write` | Communication style pass. Reviews and rewrites UI copy to sound intentional, not generic. |
| `ade-review` | `/ade:review` | Full review without changes. Looks at renders first, runs all four auditors, returns findings, two judgements and a status. No scores. |
| `ade-audit` | `/ade:audit` | Old name for `/ade:review`, kept for 0.4.x. |
| `ade-compound` | `/ade:compound` | End-to-end transformation. Build fix → Style atmosphere → Move vitality → Write copy. The flagship skill. |
| `ade-setup` | `/ade:setup` | Post-install readiness check. Detects the rendering stack, evidence-capture tier, prior ADE history, and sound feasibility; recommends the right first command. Read-only. |

## Cross-Framework Handoffs

Each skill ends with a suggestion for the next framework in the chain:

```
/ade:build → "Structure passes. Want it to feel like somewhere? → /ade:style"
/ade:style → "Atmosphere is set. Want it to feel alive? → /ade:move"
/ade:move → "Interactivity injected. Want the copy to sound intentional? → /ade:write"
```

## Step 0: Understand

Every skill execution begins with Step 0 — reading `ade_docs/direction.md` if it exists, then building a Product Portrait that understands the domain, user persona, and emotional weight of the codebase before evaluation. See `skills/shared/step-0-understand.md`.

## Autonomous Mode

The `ade:compound` skill supports an autonomous mode (`--auto`) where the agent makes all decisions independently — including metaphor selection. Every gate still applies: no step proceeds with an open blocker. See the Operational Modes section in `skills/ade-compound/SKILL.md`.

## Decision Logging

Every skill execution MUST log its decisions to `ade_docs/YYYY-MM-DD-<context>.md` in the project directory. This is non-negotiable. What gets decided must be documented.

## Compliance Rules

### Agent Files
- Every agent is a single `.md` file with YAML frontmatter
- Required frontmatter: `name`, `description`
- Output must be structured: auditors return a review in the form of `skills/shared/review.md`

### Skill Files
- Every skill has a `SKILL.md` file in its directory
- Required frontmatter: `name`, `description`, `argument-hint`
- Large reference docs go in `references/` subdirectory
- Reference files are loaded via backtick paths: `` `references/filename.md` ``

### Framework Ordering
- Build has no open blocker before Style is applied
- Style should be established before Move is injected
- Write can run after any framework produces copy

### Easter Egg
- Move plants a hidden fingerprint when the Product Portrait or project law calls for one; otherwise it records `easter_egg: none — [reason]`
- The creator's signature in the work — discoverable but not obvious
- Inspired by Warren Robinett's Adventure (1979) and Ready Player One

### Sound Layer Rules
- Sound is optional and gated by the Product Portrait's sound-appropriateness field
- When built: OFF by default, visible persisted toggle, material-derived synthesis, never the sole feedback channel, silent on high-frequency actions
- Full craft reference: `skills/shared/sound-design.md`

### Evidence Trail Requirement
- Every transformation captures a baseline screenshot BEFORE changes and saves per-step captures to `ade_docs/evidence/` (see `skills/shared/evidence-trail.md`)
- Decision logs must reference their evidence — a log without proof is incomplete
- Narrate in real time: one line before each phase (what and why), one line after (what changed)
- If no browser is available, state that explicitly in the log — never silently skip

### Review Rule
- Reviews look at renders first (1440 and 390 px); with no capture they say "source-inspected only" and cannot return Ready
- The gate between frameworks is no open blocker. No scores, totals or averages

### Fidelity Floor
- Style transformations target fidelity level >= 3 (Changes behaviour) on the Fidelity Ladder, for any kind of concept
- Themed labels on generic patterns (levels 0-1) are a failure state, not a result
