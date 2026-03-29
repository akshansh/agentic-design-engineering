# Agentic Design Engineering — Codex Plugin

This plugin provides design engineering frameworks for OpenAI Codex. It transforms generic UIs into intentional, inhabited digital places through four interconnected frameworks.

## Skills

### Framework Skills (user-invocable)

| Skill | Invocation | Description |
|-------|------------|-------------|
| `ade-clear` | `$ade-clear` | UI structure audit + repair (accessibility, hierarchy, emphasis) |
| `ade-place` | `$ade-place` | Atmosphere transformation (generic → inhabited place) |
| `ade-alive` | `$ade-alive` | Interactivity injection (feedback, discovery, physics, easter eggs) |
| `ade-voice` | `$ade-voice` | Apply intentional communication style to UI copy |
| `ade-audit` | `$ade-audit` | Full CLEAR + PLACE + ALIVE evaluation with combined report |
| `ade-transform` | `$ade-transform` | End-to-end transformation from generic to specialized |

### Specialist Skills (supporting)

| Skill | Description |
|-------|-------------|
| `clear-auditor` | Evaluates UI against CLEAR framework, returns scored violations |
| `place-auditor` | Evaluates atmosphere, returns diagnostics + physics profile |
| `alive-auditor` | Evaluates interactivity, maps dead spots, verifies easter egg |
| `metaphor-discoverer` | Suggests 3-5 physical metaphors from product domain |
| `atmosphere-builder` | Generates scoped CSS atmosphere layers from metaphor + materials |
| `vitality-injector` | Scans code for dead spots, produces physics-based patches |
| `akshansh-voice` | Reviews UI copy, rewrites generic text with warmth and purpose |

## Framework Ordering

Always apply in this order: CLEAR (structure) → PLACE (atmosphere) → ALIVE (interactivity) → VOICE (copy).

## Decision Logging

Every skill execution logs decisions to the project's `ade_docs/` directory. What gets decided gets documented.

## Compliance Rules

- CLEAR must pass (score >= 40/50) before PLACE is applied
- PLACE should be established before ALIVE is injected
- VOICE can run after any framework produces copy
- Every ALIVE transformation MUST include at least one hidden easter egg
