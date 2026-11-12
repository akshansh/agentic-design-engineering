# Agentic Design Engineering — Codex Plugin

This plugin provides design engineering frameworks for OpenAI Codex. It transforms generic UIs into intentional, inhabited digital places through four interconnected frameworks:

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
| `technique-neutrality.md` | The rule that effects are techniques, not requirements: judge against the declared concept |

## Skills

### Framework Skills (user-invocable)

| Skill | Invocation | Description |
|-------|------------|-------------|
| `ade-direct` | `$ade-direct` | Taste first. Turns the owner's thought, feeling and references into one direction with five checks (`ade_docs/direction.md`); as a pass, asks whether finished work carries them. Any medium. |
| `ade-build` | `$ade-build` | UI structure audit + repair. Evaluates then fixes accessibility, hierarchy, emphasis, copy, and feedback. |
| `ade-style` | `$ade-style` | Atmosphere transformation. Discovers metaphor, builds CSS atmosphere, iterates 5 cycles. |
| `ade-move` | `$ade-move` | Interactivity injection. Identifies core loop, finds dead spots, injects physics and discovery layers, requires easter egg. |
| `ade-write` | `$ade-write` | Communication style pass. Reviews and rewrites UI copy to sound intentional, not generic. |
| `ade-audit` | `$ade-audit` | Full evaluation. Runs Build + Style + Move + Write audits in sequence, produces combined scored report out of /200. |
| `ade-compound` | `$ade-compound` | End-to-end transformation. Build fix → Style atmosphere → Move vitality → Write copy. The flagship skill. |
| `ade-setup` | `$ade-setup` | Post-install readiness check. Detects the rendering stack, evidence-capture tier, prior ADE history, and sound feasibility; recommends the right first command. Read-only. |

### Specialist Skills (supporting)

| Skill | Description |
|-------|-------------|
| `build-auditor` | Evaluates UI against Build framework, returns scored violations |
| `style-auditor` | Evaluates atmosphere, returns diagnostics + physics profile. Reports metaphor fidelity level (0-4) and intent match against the declared concept |
| `move-auditor` | Evaluates interactivity, maps dead spots, verifies easter egg and sound layer compliance |
| `write-auditor` | Evaluates UI copy against Write framework's seven principles, returns scored findings |
| `metaphor-discoverer` | Suggests 3-5 physical metaphors from product domain |
| `atmosphere-builder` | Generates scoped CSS atmosphere layers from metaphor + materials |
| `vitality-injector` | Scans code for dead spots, produces physics-based patches |
| `voice-writer` | Reviews UI copy, rewrites generic text with warmth and purpose. Supports custom voice profiles. |
| `codebase-comprehender` | Scans project structure, dependencies, and UI patterns to build a Product Portrait |

## Step 0: Understand

Every skill execution begins with Step 0 — building a Product Portrait that understands the domain, user persona, and emotional weight of the codebase before evaluation. See `skills/shared/step-0-understand.md`.

## Autonomous Mode

The `ade-compound` skill supports an autonomous mode (`--auto`) where the agent makes all decisions independently — including metaphor selection. All gate rules and quality thresholds still apply. See the Operational Modes section in `skills/ade-compound/SKILL.md`.

## Cross-Framework Handoffs

Each skill ends with a suggestion for the next framework in the chain:

```
$ade-build → "Structure passes. Want it to feel like somewhere? → $ade-style"
$ade-style → "Atmosphere is set. Want it to feel alive? → $ade-move"
$ade-move → "Interactivity injected. Want the copy to sound intentional? → $ade-write"
```

## Framework Ordering

Always apply in this order: Build (structure) → Style (atmosphere) → Move (interactivity) → Write (copy).

## Decision Logging

Every skill execution MUST log its decisions to `ade_docs/YYYY-MM-DD-<context>.md` in the project directory. This is non-negotiable. What gets decided must be documented.

## Compliance Rules

- Build must pass (score >= 40/50) before Style is applied
- Style should be established before Move is injected
- Write can run after any framework produces copy
- Every Move transformation MUST include at least one hidden easter egg

### Sound Layer Rules

- Sound is optional and gated by the Product Portrait's sound-appropriateness field
- When built: OFF by default, visible persisted toggle, material-derived synthesis, never the sole feedback channel, silent on high-frequency actions
- Full craft reference: `skills/shared/sound-design.md`

### Evidence Trail Requirement

- Every transformation captures a baseline screenshot BEFORE changes and saves per-step captures to `ade_docs/evidence/` (see `skills/shared/evidence-trail.md`)
- Decision logs must reference their evidence — a log without proof is incomplete
- Narrate in real time: one line before each phase (what and why), one line after (what changed)
- If no browser is available, state that explicitly in the log — never silently skip

### Metaphor Fidelity Floor

- Style transformations target fidelity level >= 3 (Behavioral Inhabitation) on the Metaphor Fidelity Ladder
- Themed labels on generic patterns (levels 0-1) are a failure state, not a result
