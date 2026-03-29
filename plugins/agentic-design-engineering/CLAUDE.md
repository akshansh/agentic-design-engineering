# Agentic Design Engineering Plugin

This plugin provides design engineering frameworks for Claude Code. See AGENTS.md for all agent definitions, compliance rules, and skill specifications.

## Quick Reference

| Skill | Purpose |
|-------|---------|
| `/ade:clear` | UI structure audit + repair (accessibility, hierarchy, emphasis) |
| `/ade:place` | Atmosphere transformation (generic → inhabited place) |
| `/ade:alive` | Interactivity injection (feedback, discovery, physics, easter eggs) |
| `/ade:voice` | Apply intentional communication style to UI copy |
| `/ade:audit` | Full CLEAR + PLACE + ALIVE evaluation with combined report |
| `/ade:transform` | End-to-end transformation from generic to specialized |

## Framework Ordering

Always apply in this order: CLEAR (structure) → PLACE (atmosphere) → ALIVE (interactivity) → VOICE (copy).

## Decision Logging

Every skill execution logs decisions to the project's `ade_docs/` directory. This ensures that what gets decided also gets documented for reference.
