# Agentic Design Engineering

**Transform generic UIs into intentional, inhabited digital places.**

A Claude Code plugin with four interconnected design frameworks that turn default-looking interfaces into spaces that feel crafted, alive, and distinctly human.

## The Four Frameworks

Each framework asks a different question about your interface:

### CLEAR — Does it work?
Structure, accessibility, hierarchy. Before anything else, the interface must be usable. CLEAR audits layout consistency, responsive behavior, contrast ratios, focus management, and visual hierarchy — the foundation everything else builds on.

### PLACE — Does it feel like somewhere?
Atmosphere, metaphor, texture. Generic interfaces feel like nowhere. PLACE transforms them into inhabited spaces through physical metaphors — a boardroom with mahogany warmth, a workshop with industrial grit, a garden with organic softness. Real materials. Real light. Real temperature.

### ALIVE — Does it engage?
Feedback, discovery, physics, easter eggs. Static interfaces are dead. ALIVE injects vitality through micro-interactions, meaningful transitions, physics-based animations, and hidden fingerprints — small surprises that reward curiosity and make someone smile.

### VOICE — Does it speak with intention?
Copy, tone, warmth. Most interface copy sounds like it was written by committee. VOICE rewrites it to sound like it was written by a person who cares — clear, warm, and purposeful, with language that reinforces the metaphor established by PLACE.

## Slash Commands

| Command | What it does |
|---------|-------------|
| `/ade:clear` | Audit and fix structural foundations |
| `/ade:place` | Transform visual atmosphere with a physical metaphor |
| `/ade:alive` | Inject vitality, interactions, and easter eggs |
| `/ade:voice` | Rewrite copy with warmth and intention |
| `/ade:audit` | Score all four frameworks without changing code |
| `/ade:transform` | Full pipeline: CLEAR → PLACE → ALIVE → VOICE |

## Installation

```
claude plugin add akshansh/agentic-design-engineering
```

## Framework Ordering

The frameworks are designed to run in sequence: **CLEAR → PLACE → ALIVE → VOICE**.

This order matters. You can't build atmosphere on a broken layout (CLEAR before PLACE). You can't animate elements that don't exist yet (PLACE before ALIVE). And you can't write copy that reinforces a metaphor before the metaphor is established (ALIVE before VOICE).

Each framework builds on the one before it. Skip the order and the result feels disjointed.

## Philosophy

Every application inhabits a place. CLEAR ensures people can use it. PLACE ensures they want to be there. ALIVE ensures they want to come back. VOICE ensures it sounds like someone cares.

Most software looks like it was assembled from a component library. It works, but it doesn't feel like anything. Agentic Design Engineering is a structured approach to changing that — not through taste alone, but through frameworks that any AI agent can apply consistently.

## Decision Logging

Every `/ade:*` execution creates a dated decision log in the project's `ade_docs/` directory. This records the metaphor chosen, physics profiles, copy rewrites, easter eggs planted, and scores — so design decisions are never lost.

See `docs/decision-log-template.md` for the template structure.

## Author

Akshansh Chaudhary — [akshansh.net](https://akshansh.net)

## License

MIT

## Inspired By

- [Compound Engineering](https://github.com/kieranklaassen/compound-engineering) by Kieran Klaassen at Every
- ["Build Places Not Products"](https://lucascrespo.com) by Lucas Crespo
- Will Wright's MasterClass on Game Design
