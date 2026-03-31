# Agentic Design Engineering — Codex Plugin

This plugin provides design engineering frameworks for OpenAI Codex. It transforms generic UIs into intentional, inhabited digital places through four interconnected frameworks:

- **Build** — Structure, accessibility, hierarchy (Does it work?)
- **Style** — Atmosphere, metaphor, texture (Does it feel like somewhere?)
- **Move** — Feedback, discovery, physics, easter eggs (Does it engage?)
- **Write** — Communication style, microcopy, tone (Does it sound intentional?)

## Skills

### Framework Skills (user-invocable)

| Skill | Invocation | Description |
|-------|------------|-------------|
| `ade-build` | `$ade-build` | UI structure audit + repair. Evaluates then fixes accessibility, hierarchy, emphasis, copy, and feedback. |
| `ade-style` | `$ade-style` | Atmosphere transformation. Discovers metaphor, builds CSS atmosphere, iterates 5 cycles. |
| `ade-move` | `$ade-move` | Interactivity injection. Identifies core loop, finds dead spots, injects physics and discovery layers, requires easter egg. |
| `ade-write` | `$ade-write` | Communication style pass. Reviews and rewrites UI copy to sound intentional, not generic. |
| `ade-audit` | `$ade-audit` | Full evaluation. Runs Build + Style + Move + Write audits in sequence, produces combined scored report out of /200. |
| `ade-compound` | `$ade-compound` | End-to-end transformation. Build fix → Style atmosphere → Move vitality → Write copy. The flagship skill. |

### Specialist Skills (supporting)

| Skill | Description |
|-------|-------------|
| `build-auditor` | Evaluates UI against Build framework, returns scored violations |
| `style-auditor` | Evaluates atmosphere, returns diagnostics + physics profile |
| `move-auditor` | Evaluates interactivity, maps dead spots, verifies easter egg |
| `write-auditor` | Evaluates UI copy against Write framework's seven principles, returns scored findings |
| `metaphor-discoverer` | Suggests 3-5 physical metaphors from product domain |
| `atmosphere-builder` | Generates scoped CSS atmosphere layers from metaphor + materials |
| `vitality-injector` | Scans code for dead spots, produces physics-based patches |
| `voice-writer` | Reviews UI copy, rewrites generic text with warmth and purpose. Supports custom voice profiles. |
| `codebase-comprehender` | Scans project structure, dependencies, and UI patterns to build a Product Portrait |

## Step 0: Codebase Comprehension

Every skill execution begins with Step 0 — building a Product Portrait that understands the domain, user persona, and emotional weight of the codebase before evaluation. See `skills/shared/step-0-comprehension.md`.

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
