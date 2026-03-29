# Agentic Design Engineering — Agent Registry

## Overview

This plugin provides design engineering frameworks that transform generic UIs into intentional, inhabited digital places. It operates through four interconnected frameworks:

- **CLEAR** — Structure, accessibility, hierarchy (Does it work?)
- **PLACE** — Atmosphere, metaphor, texture (Does it feel like somewhere?)
- **ALIVE** — Feedback, discovery, physics, easter eggs (Does it engage?)
- **VOICE** — Communication style, microcopy, tone (Does it sound intentional?)

## Agent Directory

### Review Agents (`agents/review/`)

| Agent | Description | Model |
|-------|-------------|-------|
| `clear-auditor` | Evaluates UI against CLEAR framework: copy, layout, emphasis, accessibility, reward. Returns scored findings with repair procedures. | inherit |
| `place-auditor` | Evaluates atmosphere against PLACE framework: physical metaphor, lighting, animation, color-as-material, typography. Returns scored findings with diagnostics. | inherit |
| `alive-auditor` | Evaluates interactivity against ALIVE framework: agency, loops, invitation, vitality, emergence. Returns scored findings with dead-spot map. | inherit |

### Design Agents (`agents/design/`)

| Agent | Description | Model |
|-------|-------------|-------|
| `metaphor-discoverer` | Given a product domain and feeling description, suggests 3-5 specific physical metaphors with material palettes and temperature. | inherit |
| `atmosphere-builder` | Given a chosen metaphor and materials, generates scoped CSS atmosphere layers (background, light source, vignette, texture, air). | inherit |
| `vitality-injector` | Scans code for interaction dead spots (hard cuts, spinner loaders, color-only hovers) and generates physics-based replacements. | inherit |

### Voice Agents (`agents/voice/`)

| Agent | Description | Model |
|-------|-------------|-------|
| `akshansh-voice` | Reviews UI copy (button labels, error messages, empty states, microcopy) and rewrites in Akshansh's communication style: warm, structured, purposeful. | inherit |

## Skills Directory

### User-Invocable Skills (`skills/`)

| Skill | Slash Command | Description |
|-------|---------------|-------------|
| `ade-clear` | `/ade:clear` | UI structure audit + repair. Evaluates then fixes accessibility, hierarchy, emphasis, copy, and feedback. |
| `ade-place` | `/ade:place` | Atmosphere transformation. Discovers metaphor, builds CSS atmosphere, iterates 5 cycles via design-iterator. |
| `ade-alive` | `/ade:alive` | Interactivity injection. Identifies core loop, finds dead spots, injects physics and discovery layers, requires easter egg. |
| `ade-voice` | `/ade:voice` | Communication style pass. Reviews and rewrites UI copy to sound intentional, not generic. |
| `ade-audit` | `/ade:audit` | Full evaluation. Runs CLEAR + PLACE + ALIVE audits in sequence, produces combined scored report. |
| `ade-transform` | `/ade:transform` | End-to-end transformation. CLEAR fix → PLACE atmosphere → ALIVE vitality → VOICE copy. The flagship skill. |

## Cross-Framework Handoffs

Each skill ends with a suggestion for the next framework in the chain:

```
/ade:clear → "Structure passes. Want it to feel like somewhere? → /ade:place"
/ade:place → "Atmosphere is set. Want it to feel alive? → /ade:alive"
/ade:alive → "Interactivity injected. Want the copy to sound intentional? → /ade:voice"
```

## Decision Logging

Every skill execution MUST log its decisions to `ade_docs/YYYY-MM-DD-<context>.md` in the project directory. This is non-negotiable. What gets decided must be documented.

## Compliance Rules

### Agent Files
- Every agent is a single `.md` file with YAML frontmatter
- Required frontmatter: `name`, `description`
- Output must be structured (JSON or scored findings)

### Skill Files
- Every skill has a `SKILL.md` file in its directory
- Required frontmatter: `name`, `description`, `argument-hint`
- Large reference docs go in `references/` subdirectory
- Reference files are loaded via backtick paths: `` `references/filename.md` ``

### Framework Ordering
- CLEAR must pass before PLACE is applied
- PLACE should be established before ALIVE is injected
- VOICE can run after any framework produces copy

### Easter Egg Requirement
- Every ALIVE transformation MUST include at least one hidden fingerprint
- The creator's signature in the work — discoverable but not obvious
- Inspired by Warren Robinett's Adventure (1979) and Ready Player One
