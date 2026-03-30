# Agentic Design Engineering

**Transform generic UIs into intentional, inhabited digital places.**

A Claude Code plugin with four interconnected design frameworks that turn default-looking interfaces into spaces that feel crafted, alive, and distinctly human. Features codebase comprehension, autonomous mode, before/after scoring, and structured cross-framework handoffs.

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

### Step 0 — Does the agent understand what it's looking at?
Every skill begins with Codebase Comprehension — the agent scans the project structure, dependencies, and UI patterns to build a **Product Portrait** (domain, user persona, emotional weight, physical analog) before evaluating or transforming anything. This context feeds all downstream decisions.

## Slash Commands

| Command | What it does |
|---------|-------------|
| `/ade:clear` | Audit and fix structural foundations (8 product-type contexts) |
| `/ade:place` | Transform visual atmosphere with a physical metaphor (5 code-level design cycles) |
| `/ade:alive` | Inject vitality, interactions, and easter eggs (product-matched) |
| `/ade:voice` | Rewrite copy with warmth and intention (supports custom voice profiles) |
| `/ade:audit` | Score all four frameworks without changing code (combined /200) |
| `/ade:transform` | Full pipeline: Step 0 → CLEAR → PLACE → ALIVE → VOICE (supports `--auto` mode) |

## Key Features

### Autonomous Mode
Add "surprise me" or `--auto` to `/ade:transform` and the agent makes all decisions independently — including metaphor selection via a 5-criteria scoring rubric (domain fit, material richness, emotional alignment, specificity, buildability). All quality gates still apply.

### Before/After Scoring
Every framework runs its auditor at the start (baseline) and end (result), producing delta tables:

```
| Dimension          | Before | After | Delta  |
|--------------------|--------|-------|--------|
| P — Physical Metaphor | 0/10   | 8/10  | +8     |
| ...                   |        |       |        |
```

### Gate Rules with Error Recovery
If a framework scores below 40/50, it blocks the next step. After 2 repair attempts, fallback strategies kick in — the agent documents what it couldn't fix and proceeds with a warning.

### Structured Handoffs
Clean data contracts flow between frameworks: CLEAR passes product type and accessibility floor to PLACE. PLACE passes metaphor, materials, and physics profile to ALIVE. ALIVE passes interaction copy and easter egg triggers to VOICE.

## Installation

### Claude Code

```bash
/plugin marketplace add akshansh/agentic-design-engineering
/plugin install agentic-design-engineering
```

Then use slash commands: `/ade:clear`, `/ade:place`, `/ade:alive`, `/ade:voice`, `/ade:audit`, `/ade:transform`

### Cursor

```text
/add-plugin agentic-design-engineering
```

Then use slash commands: `/ade:clear`, `/ade:place`, `/ade:alive`, `/ade:voice`, `/ade:audit`, `/ade:transform`

## Framework Ordering

The frameworks run in sequence: **Step 0 (Comprehend) → CLEAR → PLACE → ALIVE → VOICE**.

Step 0 builds a Product Portrait that feeds everything. Then: CLEAR before PLACE (can't build atmosphere on a broken layout). PLACE before ALIVE (can't animate without materiality). ALIVE before VOICE (can't write metaphor copy before the metaphor exists). Each framework gates the next — scores must pass before proceeding.

## Philosophy

Every application inhabits a place. Step 0 ensures the agent understands what that place could be. CLEAR ensures people can use it. PLACE ensures they want to be there. ALIVE ensures they want to come back. VOICE ensures it sounds like someone cares.

Most software looks like it was assembled from a component library. It works, but it doesn't feel like anything. Agentic Design Engineering is a structured approach to changing that — not through taste alone, but through frameworks that any AI agent can apply consistently, autonomously, and measurably.

## Decision Logging

Every `/ade:*` execution creates a dated decision log in the project's `ade_docs/` directory. This records: Product Portrait, before/after scores with deltas, cross-framework handoff data, gate pass/fail status, metaphor chosen, physics profiles, copy rewrites, easter eggs planted, and all files modified. What gets decided gets documented.

See `docs/decision-log-template.md` for the template structure.

## Author

Akshansh Chaudhary — [akshansh.net](https://akshansh.net)

## License

MIT

## Inspired By

- [Compound Engineering](https://github.com/kieranklaassen/compound-engineering) by Kieran Klaassen at Every
- ["Build Places Not Products"](https://lucascrespo.com) by Lucas Crespo
- Will Wright's MasterClass on Game Design
