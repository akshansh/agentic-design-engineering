# Agentic Design Engineering — Agent Registry

## Overview

This plugin provides design engineering frameworks that transform generic UIs into intentional, inhabited digital places. It operates through four interconnected frameworks:

- **Build** — Structure, accessibility, hierarchy (Does it work?)
- **Style** — Atmosphere, metaphor, texture (Does it feel like somewhere?)
- **Move** — Feedback, discovery, physics, easter eggs (Does it engage?)
- **Write** — Communication style, microcopy, tone (Does it sound intentional?)

## Agent Directory

### Review Agents (`agents/review/`)

| Agent | Description | Model |
|-------|-------------|-------|
| `build-auditor` | Evaluates UI against Build framework: copy, layout, emphasis, accessibility, reward. Returns scored findings with repair procedures. | inherit |
| `style-auditor` | Evaluates atmosphere against Style framework: physical metaphor, lighting, animation, color-as-material, typography. Returns scored findings with diagnostics. | inherit |
| `move-auditor` | Evaluates interactivity against Move framework: agency, loops, invitation, vitality, emergence. Returns scored findings with dead-spot map. | inherit |
| `write-auditor` | Evaluates UI copy against Write framework: partnership, simplification, purpose, invitation, connection, compassion, metaphor language. Returns scored findings. | inherit |

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
| `ade-build` | `/ade:build` | UI structure audit + repair. Evaluates then fixes accessibility, hierarchy, emphasis, copy, and feedback. |
| `ade-style` | `/ade:style` | Atmosphere transformation. Discovers metaphor, builds CSS atmosphere, iterates 5 cycles via design-iterator. |
| `ade-move` | `/ade:move` | Interactivity injection. Identifies core loop, finds dead spots, injects physics and discovery layers, requires easter egg. |
| `ade-write` | `/ade:write` | Communication style pass. Reviews and rewrites UI copy to sound intentional, not generic. |
| `ade-audit` | `/ade:audit` | Full evaluation. Runs Build + Style + Move + Write audits in sequence, produces combined scored report out of /200. |
| `ade-compound` | `/ade:compound` | End-to-end transformation. Build fix → Style atmosphere → Move vitality → Write copy. The flagship skill. |

## Cross-Framework Handoffs

Each skill ends with a suggestion for the next framework in the chain:

```
/ade:build → "Structure passes. Want it to feel like somewhere? → /ade:style"
/ade:style → "Atmosphere is set. Want it to feel alive? → /ade:move"
/ade:move → "Interactivity injected. Want the copy to sound intentional? → /ade:write"
```

## Step 0: Understand

Every skill execution begins with Step 0 — building a Product Portrait that understands the domain, user persona, and emotional weight of the codebase before evaluation. See `skills/shared/step-0-understand.md`.

## Autonomous Mode

The `ade:compound` skill supports an autonomous mode (`--auto`) where the agent makes all decisions independently — including metaphor selection. All gate rules and quality thresholds still apply. See the Operational Modes section in `skills/ade-compound/SKILL.md`.

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
- Build must pass before Style is applied
- Style should be established before Move is injected
- Write can run after any framework produces copy

### Easter Egg Requirement
- Every Move transformation MUST include at least one hidden fingerprint
- The creator's signature in the work — discoverable but not obvious
- Inspired by Warren Robinett's Adventure (1979) and Ready Player One
