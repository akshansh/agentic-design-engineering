# Step 0: Codebase Comprehension

**This step is mandatory. It runs before any framework evaluation or transformation.**

Before evaluating or transforming anything, understand what you're looking at. The agent must stand in the doorway and ask: *"What kind of room am I in?"*

## Process

1. **Scan the full project structure** — not just the target page. Read the project tree, package.json (or equivalent), README, route structure, and component hierarchy.

2. **Build a Product Portrait** containing:

| Field | Question | Examples |
|-------|----------|---------|
| **Domain** | What industry/field does this serve? | Pharma, finance, creative tools, education, internal ops, e-commerce |
| **Interaction pattern** | What is the primary thing users do? | Browse/consume, create/edit, monitor/respond, explore/discover |
| **Data density** | How much information is on screen? | Sparse and focused, moderate, dense and complex |
| **User persona** | Who opens this every day? What's their emotional state? | QA analyst (high-stakes), creative freelancer (exploratory), ops manager (routine) |
| **Emotional weight** | What are the consequences of getting it wrong? | Life-critical, professional routine, playful exploration, high-stakes decisions |
| **Physical analog** | If this existed 100 years ago, what would it be? | Inspector's desk, artist's studio, trading floor, librarian's catalog |

3. **Rate confidence**: High / Medium / Low

4. **If confidence is LOW** → Ask the user ONE targeted question. Not open-ended. Specific:
   - *"I see a data-heavy interface with form inputs and status tracking. Is this an internal operations tool or customer-facing? Who uses this daily?"*

5. **If confidence is HIGH** → State the hypothesis and proceed:
   - *"Based on the project structure, dependencies, and UI patterns, this appears to be an internal pharmaceutical compliance dashboard used by QA teams. Proceeding with enterprise/clinical context."*

## Output Format

```
## Product Portrait
**Domain:** [industry/field]
**Interaction pattern:** [primary pattern] ([secondary if applicable])
**Data density:** [sparse/moderate/dense]
**User persona:** [who, frequency, emotional state]
**Emotional weight:** [clinical/professional/playful/high-stakes]
**Physical analog:** [specific physical object or place from 100 years ago]
**Confidence:** [High/Medium/Low]
**Context classification:** [emergency|enterprise|consumer|high-frequency|data-heavy|communication|e-commerce|educational]
```

## Why This Matters

- A React component doesn't tell you whether it's used in a hospital or a music studio
- The same card layout means something completely different in a finance dashboard vs. a recipe app
- Style's metaphor discovery is impossible without understanding the product domain
- Build's context branching requires product understanding
- The agent can't score meaningfully if it doesn't know what "good" looks like for this specific product

## How It's Used

- The Product Portrait output is passed forward to ALL subsequent steps as context
- In `ade:compound`, Step 0 runs once at the beginning and feeds every framework phase
- In individual skills (`ade:build`, `ade:style`, `ade:move`, `ade:write`), Step 0 runs at the start
- In `ade:audit`, Step 0 runs once and its context informs all scoring
