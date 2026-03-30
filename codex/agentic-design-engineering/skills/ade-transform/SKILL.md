---
name: ade-transform
description: "End-to-end transformation of a generic UI into a specialized, living interface — orchestrates CLEAR, PLACE, ALIVE, and VOICE in sequence with cross-framework handoffs."
---

# $ade-transform — Full Design Transformation

You are the lead designer orchestrating a complete transformation. Your job is to take a generic, functional page and turn it into something intentional — structurally sound, atmospherically rich, interactively alive, and speaking with a human voice.

This is the flagship skill. It runs all four frameworks in strict order, with each step handing off constraints and context to the next.

---

## The Sequence

```
CLEAR (structure) → PLACE (atmosphere) → ALIVE (interactivity) → VOICE (copy)
```

Each framework builds on the last. Skipping or reordering breaks the chain:
- PLACE without CLEAR = atmosphere on a broken foundation
- ALIVE without PLACE = animation with no personality to match
- VOICE without context = copy that sounds warm but doesn't fit

---

## Operational Modes

### Standard Mode (default)
The agent asks for user input at key decision points:
- Step 0: May ask ONE clarification question if confidence is low
- PLACE: Presents 3 metaphor options for user selection
- All other steps proceed autonomously with gate checks

### Autonomous Mode (`--auto` or "surprise me" or "just do it")
The agent makes all decisions independently:
- **Step 0:** Runs with high-confidence threshold. If confidence is high, proceeds. If low, asks ONE question and proceeds regardless of answer.
- **PLACE:** Skips user metaphor selection. The `metaphor-discoverer` generates 3 options, scores them using its rubric, selects the highest-scoring option, and documents its reasoning in the decision log.
- **VOICE:** Uses all 7 principles. If PLACE established a metaphor, principle 7 (metaphor language) activates automatically. If no metaphor, principle 7 scores on distinctive character.
- **All gates still apply.** Autonomous doesn't mean careless. Scores must still pass thresholds.

Activate autonomous mode when:
- User explicitly says "surprise me", "just do it", or "make it not look like everything else"
- User passes `--auto` flag
- User doesn't want to be interrupted with decision points

---

## Step 0: Understand the Codebase

**This runs once, at the very beginning, before any framework.**

Load the codebase comprehension process:
`skills/shared/step-0-comprehension.md`

1. Scan the project structure, dependencies, README, routes, and component hierarchy
2. Build the Product Portrait (domain, interaction pattern, data density, user persona, emotional weight, physical analog)
3. Assess confidence (high/medium/low)
4. If autonomous mode AND confidence is low: ask ONE targeted question, then proceed
5. If standard mode AND confidence is low: ask ONE targeted question, wait for answer
6. If confidence is high: state the hypothesis and proceed

**The Product Portrait feeds every subsequent step.** CLEAR uses it for context branching. PLACE uses it for metaphor seeding. ALIVE uses it for easter egg selection. VOICE uses it for tone calibration.

---

## Gate Rule

**If any step scores below 40/50, it blocks the next step.**

Do not proceed to PLACE if CLEAR scores below 40. Do not proceed to ALIVE if PLACE scores below 40. Fix first, then continue.

When a gate blocks:
1. Report the score and the critical violations
2. Apply the fixes within that framework's scope
3. Re-score to confirm >= 40
4. Only then proceed to the next step

### Retry Limits

**Maximum 2 repair attempts per gate failure.** If the score doesn't improve after 2 focused repair passes:

1. Log the blocking issues clearly in the decision log
2. Flag the specific violations that couldn't be resolved and WHY
3. Apply the fallback strategy for that framework (see below)
4. Proceed to the next framework with a warning

### Fallback Strategies

| Framework | Fallback | Reduced Target |
|-----------|----------|---------------|
| **CLEAR** | If accessibility can't be fully fixed (e.g., third-party component limitations), document the exceptions and proceed | 35/50 instead of 40/50 |
| **PLACE** | If the metaphor isn't convincing after 2 cycles of repair, commit to the strongest version achieved | Note as "draft atmosphere — iteration recommended" |
| **ALIVE** | If physics can't be injected (framework constraints like CSS-in-JS limitations), apply the subset that IS possible | List what was blocked and why |
| **VOICE** | If the codebase has hardcoded strings the agent can't edit (e.g., third-party components), list them as manual tasks | Document untouchable strings |

### Decision Log Entry for Gate Failures

Every gate failure MUST log:
- Which framework failed and the score
- What was attempted in each repair pass
- Why the repair didn't succeed
- Which fallback was applied
- What the user should manually address later

---

## Step 1: Run $ade-clear — Fix Structure

Execute the full CLEAR audit and repair process.

**Priority order: A → L → C → E → R** (Accessibility first, always.)

1. Read the page and score all five dimensions
2. Fix violations in priority order
3. Re-score to confirm the repair
4. Produce the CLEAR report

**What to pass forward to PLACE:**
- The product type classification (emergency/enterprise/consumer/high-frequency)
- Any structural constraints that affect atmosphere (e.g., dense data tables, long-form content)
- The primary user action identified in the Emphasis dimension

**Gate check:** CLEAR total must be >= 40/50 to proceed.

If below 40:
> CLEAR scored [X]/50. Fixing [list critical issues] before proceeding to atmosphere design.

Apply fixes, re-score, then continue.

---

## Step 2: Gather Context → Run $ade-place — Build Atmosphere

Before running PLACE, ask the user two questions:

> 1. **How should someone feel when they use this?** Not what it should look like — how should it feel?
> 2. **Show me 3-5 references** — not UIs specifically. A room, a film, an object, a texture. Anything that evokes the feeling you're after.

If the user says "just do it" or "surprise me," derive the metaphor from the product domain. Note that results are better with references.

Then execute the full PLACE process:

1. Translate the feeling into temperature (warm/cool/mixed)
2. Discover the metaphor — present 3-5 options, let the user choose
3. Map every UI element to a physical analog
4. Build the seven atmosphere layers (background → light → vignette → texture → surface → typography → ornament)
5. Derive colors from materials, not hex pickers
6. Iterate through 5 design cycles (mandatory — cycle 1 is scaffolding, not design)
7. Set the ALIVE physics constraints based on the metaphor's weight

**What to pass forward to ALIVE:**
- The chosen metaphor and its one-line description
- The physics personality (weighty/floating/snappy/organic/mechanical)
- Recommended spring tension and mass
- The material palette and color derivations

**Gate check:** PLACE total must be >= 40/50 to proceed.

If below 40:
> PLACE scored [X]/50. The atmosphere isn't convincing enough yet. Fixing [list critical issues] before injecting interactivity.

Apply fixes, re-score, then continue.

---

## Step 3: Run $ade-alive — Inject Interactivity

Execute the full ALIVE process using the physics profile from PLACE.

1. Map the interaction grammar (noun-verb-adjective for every element)
2. Identify the core loop (the repeating interaction pattern)
3. Find all dead spots (no transitions, flat hovers, missing feedback)
4. Inject vitality in five dimensions:
   - **Agency** — proximity awareness, affordance cues
   - **Loops** — feedback hierarchy matching action weight, spring physics
   - **Invitation** — scroll reveals, progressive depth, power-user paths
   - **Vitality** — physics matching the PLACE metaphor's weight
   - **Emergence** — contextual acknowledgment, data-driven insights
5. Implement the hidden fingerprint (required — not optional)
6. Verify `prefers-reduced-motion` coverage
7. Verify keyboard navigation still works

**What to pass forward to VOICE:**
- The complete metaphor context (place + physics + materials)
- Any interaction-specific copy that was added (loading states, tooltips, error messages)
- The easter egg description (so VOICE doesn't accidentally rewrite its trigger text)

**Gate check:** ALIVE total must be >= 40/50 to proceed.

If below 40:
> ALIVE scored [X]/50. The interface doesn't feel alive yet. Fixing [list critical issues] before the voice pass.

Apply fixes, re-score, then continue.

---

## Step 4: Run $ade-voice — Polish Copy

Execute the full VOICE review using the metaphor context from PLACE and ALIVE.

1. Scan all user-facing copy on the page
2. Apply the seven voice principles:
   - Warm partnership ("we" not "you")
   - Simplification as kindness
   - Purpose before action
   - Guide through questions, not commands
   - Connect the specific to the bigger picture
   - Compassionate errors (never blame)
   - Metaphor language (using the PLACE metaphor vocabulary)
3. Rewrite and replace directly
4. Verify tone consistency across the entire page

**Do not rewrite:**
- Copy that PLACE already transformed to metaphor language
- Error messages that are already compassionate
- The easter egg trigger text from ALIVE

---

## Step 5: Log All Decisions

Create a comprehensive transformation log at `ade_docs/YYYY-MM-DD-transform.md`:

```
## ADE Transformation Log

**Page:** [page name or path]
**Date:** [YYYY-MM-DD]
**Duration:** [how many steps, iterations, gates hit]

---

### Product Portrait
**Domain:** [from Step 0]
**Interaction pattern:** [from Step 0]
**User persona:** [from Step 0]
**Physical analog:** [from Step 0]
**Confidence:** [High/Medium/Low]
**Mode:** [Standard/Autonomous]

---

### CLEAR — Structure
**Score:** [before] → [after] /50
**Product type:** [classification]
**Primary action:** [identified emphasis]
**Key fixes:** [list]

---

### PLACE — Atmosphere
**Score:** [before] → [after] /50
**Feeling:** [user's words]
**Metaphor:** [chosen metaphor — one line]
**Temperature:** [warm/cool/mixed]
**Materials:** [list of named materials]
**Colors derived:** [material → color mappings]
**Pages transformed:** [list with scope classes]
**Design cycles completed:** [1-5, with notes per cycle]

---

### ALIVE — Interactivity
**Score:** [before] → [after] /50
**Core loop:** [action → response → discovery → next action]
**Dead spots fixed:** [count]
**Physics profile:** [personality, spring tension, mass]
**Injections:** [Agency / Loops / Invitation / Vitality / Emergence summary]
**Hidden fingerprint:**
- Type: [key combination / console message / secret page]
- Trigger: [how to activate]
- Reveals: [what the user sees]

---

### VOICE — Copy
**Copy reviewed:** [count]
**Rewrites made:** [count]
**Metaphor vocabulary:** [list of metaphor-specific terms used]

---

### Cross-Framework Handoffs
- CLEAR → PLACE: [what structural context informed atmosphere]
- PLACE → ALIVE: [what physics profile was derived from metaphor]
- ALIVE → VOICE: [what interaction copy was preserved]

---

### Files Modified
[complete list with line ranges, organized by framework]

---

### Final Scores

| Framework | Score | Status |
|-----------|-------|--------|
| CLEAR | /50 | [Pass/Fail] |
| PLACE | /50 | [Pass/Fail] |
| ALIVE | /50 | [Pass/Fail] |
| VOICE | /70 (normalized: /50) | [Pass/Fail] |
| **Combined** | **/200** | |
```

---

## Step 6: Final Verdict

After all four frameworks complete:

**If combined score is 160+:**
> Transformation complete. Your interface works (CLEAR), feels like [metaphor] (PLACE), responds with [physics personality] (ALIVE), and speaks with intention (VOICE). Run `$ade-audit` anytime to re-evaluate.

**If combined score is 120-159:**
> Transformation complete with room for polish. [List the P2/P3 recommendations.] Consider a focused pass on the weakest framework.

**If combined score is below 120:**
> Transformation hit some walls. [List what blocked progress and what still needs work.] Run `$ade-audit` after addressing the remaining issues.

---

## What NOT to Do

- Do not skip frameworks or reorder the sequence — the chain matters
- Do not proceed past a gate failure without fixing and re-scoring
- Do not let PLACE override CLEAR's accessibility fixes
- Do not let ALIVE break CLEAR's structure or PLACE's atmosphere
- Do not let VOICE rewrite the easter egg trigger or PLACE's metaphor copy
- Do not rush the PLACE iteration cycles — 5 cycles minimum, each page
- Do not forget to log every decision — the log is the institutional memory
- Do not add features — transform what exists, don't expand scope
