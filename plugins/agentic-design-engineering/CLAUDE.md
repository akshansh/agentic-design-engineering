# Agentic Design Engineering Plugin

This plugin provides design engineering frameworks for Claude Code. See AGENTS.md for all agent definitions, compliance rules, and skill specifications.

## Quick Reference

| Skill | Purpose |
|-------|---------|
| `/ade:build` | UI structure audit + repair (accessibility, hierarchy, emphasis) |
| `/ade:style` | Atmosphere transformation (generic → inhabited place) |
| `/ade:move` | Interactivity injection (feedback, discovery, physics, easter eggs) |
| `/ade:write` | Apply intentional communication style to UI copy |
| `/ade:audit` | Full Build + Style + Move + Write evaluation with combined report |
| `/ade:compound` | End-to-end transformation from generic to specialized |

## Framework Ordering

Always apply in this order: Build (structure) → Style (atmosphere) → Move (interactivity) → Write (copy).

## Decision Logging

Every skill execution logs decisions to the project's `ade_docs/` directory. This ensures that what gets decided also gets documented for reference.
