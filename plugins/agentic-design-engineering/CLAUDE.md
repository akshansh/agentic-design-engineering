# Agentic Design Engineering Plugin

This plugin provides design engineering frameworks for Claude Code. See AGENTS.md for all agent definitions, compliance rules, and skill specifications.

## Quick Reference

| Skill | Purpose |
|-------|---------|
| `/ade:setup` | Post-install readiness check (stack, evidence capture, history) — run this first |
| `/ade:direct` | Taste first: the owner's thought, feeling and mark become one direction with five checks |
| `/ade:build` | UI structure audit + repair (accessibility, hierarchy, emphasis) |
| `/ade:style` | Concept and atmosphere (a place, or another kind from the direction note) |
| `/ade:move` | Interactivity injection (feedback, discovery, physics, easter eggs where required) |
| `/ade:write` | Apply intentional communication style to UI copy |
| `/ade:review` | Full Build + Style + Move + Write review: render first, findings, two judgements, a status |
| `/ade:audit` | Old name for `/ade:review`, kept for 0.4.x |
| `/ade:compound` | End-to-end transformation from generic to specialized |

## Framework Ordering

Direct (taste) comes first when a direction is wanted; it is optional. Then always apply in this order: Build (structure) → Style (atmosphere) → Move (interactivity) → Write (copy).

## Decision Logging

Every skill execution logs decisions to the project's `ade_docs/` directory. This ensures that what gets decided also gets documented for reference.
