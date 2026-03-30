# Agentic Design Engineering — Codex Plugin

This plugin provides design engineering frameworks for OpenAI Codex. It transforms generic UIs into intentional, inhabited digital places through four interconnected frameworks:

- **CLEAR** — Structure, accessibility, hierarchy (Does it work?)
- **PLACE** — Atmosphere, metaphor, texture (Does it feel like somewhere?)
- **ALIVE** — Feedback, discovery, physics, easter eggs (Does it engage?)
- **VOICE** — Communication style, microcopy, tone (Does it sound intentional?)

## Skills

### Framework Skills (user-invocable)

| Skill | Invocation | Description |
|-------|------------|-------------|
| `ade-clear` | `$ade-clear` | UI structure audit + repair. Evaluates then fixes accessibility, hierarchy, emphasis, copy, and feedback. |
| `ade-place` | `$ade-place` | Atmosphere transformation. Discovers metaphor, builds CSS atmosphere, iterates 5 cycles. |
| `ade-alive` | `$ade-alive` | Interactivity injection. Identifies core loop, finds dead spots, injects physics and discovery layers, requires easter egg. |
| `ade-voice` | `$ade-voice` | Communication style pass. Reviews and rewrites UI copy to sound intentional, not generic. |
| `ade-audit` | `$ade-audit` | Full evaluation. Runs CLEAR + PLACE + ALIVE + VOICE audits in sequence, produces combined scored report out of /200. |
| `ade-transform` | `$ade-transform` | End-to-end transformation. CLEAR fix → PLACE atmosphere → ALIVE vitality → VOICE copy. The flagship skill. |

### Specialist Skills (supporting)

| Skill | Description |
|-------|-------------|
| `clear-auditor` | Evaluates UI against CLEAR framework, returns scored violations |
| `place-auditor` | Evaluates atmosphere, returns diagnostics + physics profile |
| `alive-auditor` | Evaluates interactivity, maps dead spots, verifies easter egg |
| `voice-auditor` | Evaluates UI copy against VOICE framework's seven principles, returns scored findings |
| `metaphor-discoverer` | Suggests 3-5 physical metaphors from product domain |
| `atmosphere-builder` | Generates scoped CSS atmosphere layers from metaphor + materials |
| `vitality-injector` | Scans code for dead spots, produces physics-based patches |
| `voice-writer` | Reviews UI copy, rewrites generic text with warmth and purpose. Supports custom voice profiles. |
| `codebase-comprehender` | Scans project structure, dependencies, and UI patterns to build a Product Portrait |

## Step 0: Codebase Comprehension

Every skill execution begins with Step 0 — building a Product Portrait that understands the domain, user persona, and emotional weight of the codebase before evaluation. See `skills/shared/step-0-comprehension.md`.

## Autonomous Mode

The `ade-transform` skill supports an autonomous mode (`--auto`) where the agent makes all decisions independently — including metaphor selection. All gate rules and quality thresholds still apply. See the Operational Modes section in `skills/ade-transform/SKILL.md`.

## Cross-Framework Handoffs

Each skill ends with a suggestion for the next framework in the chain:

```
$ade-clear → "Structure passes. Want it to feel like somewhere? → $ade-place"
$ade-place → "Atmosphere is set. Want it to feel alive? → $ade-alive"
$ade-alive → "Interactivity injected. Want the copy to sound intentional? → $ade-voice"
```

## Framework Ordering

Always apply in this order: CLEAR (structure) → PLACE (atmosphere) → ALIVE (interactivity) → VOICE (copy).

## Decision Logging

Every skill execution MUST log its decisions to `ade_docs/YYYY-MM-DD-<context>.md` in the project directory. This is non-negotiable. What gets decided must be documented.

## Compliance Rules

- CLEAR must pass (score >= 40/50) before PLACE is applied
- PLACE should be established before ALIVE is injected
- VOICE can run after any framework produces copy
- Every ALIVE transformation MUST include at least one hidden easter egg
