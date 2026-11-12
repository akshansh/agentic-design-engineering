# Agentic Design Engineering

**Transform generic UIs into intentional, inhabited digital places.**

A Claude Code plugin with four interconnected design frameworks that turn default-looking interfaces into spaces that feel crafted, alive, and distinctly human. Features a taste-first direction step, codebase understanding, autonomous mode, render-first reviews, and structured cross-framework handoffs.

## The Four Frameworks

Each framework asks a different question about your interface:

### Build — Does it work?
Structure, accessibility, hierarchy. Before anything else, the interface must be usable. Build audits layout consistency, responsive behavior, contrast ratios, focus management, and visual hierarchy — the foundation everything else builds on.

### Style — Does it feel like somewhere?
Atmosphere, metaphor, texture, sound. Generic interfaces feel like nowhere. Style transforms them into inhabited spaces through physical metaphors — a boardroom with mahogany warmth, a workshop with industrial grit, a garden with organic softness. Real materials. Real light. Real temperature. Real acoustics. A place is one kind of concept; an instrument, a material, a drawn grammar, the data, type alone and quiet are others, and Style builds whichever the direction names. It picks the rendering technology the concept demands (CSS layers, P5.js, Three.js, SVG+GSAP, shaders) and holds every transformation to the Fidelity Ladder — themed labels on generic menus don't pass.

### Move — Does it engage?
Feedback, discovery, physics, sound, easter eggs. Static interfaces are dead. Move injects vitality through micro-interactions, meaningful transitions, physics-based animations, opt-in material-derived earcons, and hidden fingerprints — small surprises that reward curiosity and make someone smile.

### Write — Does it speak with intention?
Copy, tone, warmth. Most interface copy sounds like it was written by committee. Write rewrites it to sound like it was written by a person who cares — clear, warm, and purposeful, with language that reinforces the metaphor established by Style.

### Step 0 — Does the agent understand what it's looking at?
Every skill begins with Understand — the agent scans the project structure, dependencies, and UI patterns to build a **Product Portrait** (domain, user persona, emotional weight, physical analog) before evaluating or transforming anything. This context feeds all downstream decisions.

## Slash Commands

| Command | What it does |
|---------|-------------|
| `/ade:setup` | Read-only readiness check — run this first |
| `/ade:direct` | Taste first: the owner's thought, feeling and mark become one direction with five checks |
| `/ade:build` | Review and fix structural foundations (8 product-type contexts) |
| `/ade:style` | Carry the concept — a physical metaphor or another kind (5 design cycles) |
| `/ade:move` | Inject vitality and interactions; an easter egg where required |
| `/ade:write` | Rewrite copy with warmth and intention (supports custom voice profiles) |
| `/ade:review` | Review all four frameworks without changing code: findings, two judgements, a status |
| `/ade:audit` | Old name for `/ade:review`, kept for 0.4.x |
| `/ade:compound` | Full pipeline: Step 0 → Build → Style → Move → Write (supports `--auto` mode) |

## Key Features

### Autonomous Mode
Add "surprise me" or `--auto` to `/ade:compound` and the agent makes all decisions independently — including metaphor selection via a 5-criteria scoring rubric (domain fit, material richness, emotional alignment, specificity, transformability). Every gate still applies.

### Render-First Reviews
Every framework runs its auditor at the start (baseline) and end (result). Auditors look at the page at 1440 and 390 px before reading code, and return findings (blocker, defect, opportunity) with their evidence class, two judgements (creative integrity and professional craft) and a status. No scores. Without a capture, a review says "source-inspected only" and cannot return Ready.

### Gate Rules with Error Recovery
An open blocker stops the next step. After 2 repair rounds, fallback strategies kick in — the agent documents what it couldn't fix and proceeds with a warning.

### Structured Handoffs
Clean data contracts flow between frameworks: Build passes product type and accessibility floor to Style. Style passes metaphor, materials, and physics profile to Move. Move passes interaction copy and easter egg triggers to Write.

## Installation

### Claude Code

```bash
/plugin marketplace add akshansh/agentic-design-engineering
/plugin install agentic-design-engineering
```

Then use slash commands: `/ade:build`, `/ade:style`, `/ade:move`, `/ade:write`, `/ade:review`, `/ade:compound`

### Cursor

```text
/add-plugin agentic-design-engineering
```

Then use slash commands: `/ade:build`, `/ade:style`, `/ade:move`, `/ade:write`, `/ade:review`, `/ade:compound`

## Framework Ordering

The frameworks run in sequence: **Step 0 (Understand) → Build → Style → Move → Write**.

Step 0 builds a Product Portrait that feeds everything. Then: Build before Style (can't build atmosphere on a broken layout). Style before Move (can't animate without materiality). Move before Write (can't write metaphor copy before the metaphor exists). Each framework gates the next — no open blocker before proceeding.

## Philosophy

Every application inhabits a place. Step 0 ensures the agent understands what that place could be. Build ensures people can use it. Style ensures they want to be there. Move ensures they want to come back. Write ensures it sounds like someone cares.

Most software looks like it was assembled from a component library. It works, but it doesn't feel like anything. Agentic Design Engineering is a structured approach to changing that — not through taste alone, but through frameworks that any AI agent can apply consistently, autonomously, and measurably.

## Decision Logging

Every `/ade:*` execution creates a dated decision log in the project's `ade_docs/` directory. This records: Product Portrait, declared concept, findings before and after, cross-framework handoff data, gate status, metaphor chosen, fidelity level, rendering stack, physics profiles, acoustic signature, copy rewrites, easter eggs planted, and all files modified. What gets decided gets documented.

Every run also leaves an **evidence trail**: a baseline screenshot before any change and per-cycle captures in `ade_docs/evidence/`, referenced from the log — proof of the transformation, not just a description of it. The agent narrates each phase in real time as it works.

See `docs/decision-log-template.md` and `skills/shared/evidence-trail.md` for the structures.

## Author

Akshansh Chaudhary — [akshansh.net](https://akshansh.net)

## License

MIT

## Inspired By

- [Compound Engineering](https://github.com/kieranklaassen/compound-engineering) by Kieran Klaassen at Every
- ["Build Places Not Products"](https://lucascrespo.com) by Lucas Crespo
- Will Wright's MasterClass on Game Design
