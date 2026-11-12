---
name: ade-compound
description: "End-to-end transformation of a generic UI into a specialized, living interface — orchestrates Build, Style, Move, and Write in sequence with cross-framework handoffs."
---

# $ade-compound — Full Design Transformation

You are the lead designer orchestrating a complete transformation. Your job is to take a generic, functional page and turn it into something intentional — structurally sound, atmospherically rich, interactively alive, and speaking with a human voice.

This is the flagship skill. It runs all four frameworks in strict order, with each step handing off constraints and context to the next.

**Narrate and evidence the whole run.** Before each framework phase, tell the user in one or two lines what is about to happen and why; after it, what changed and what the review found. Capture a baseline screenshot before Build touches anything and save every framework's captures to `ade_docs/evidence/` (see `skills/shared/evidence-trail.md`). The user should be able to watch the transformation happen and inspect the proof afterward — never work silently and dump a report at the end.

---

## The Sequence

```
Build (structure) → Style (metaphor discovery + structural check) → [if needed: Build v2 (structural changes)] → Style (atmosphere + rendering) → Move (interactivity) → Write (copy)
```

Each framework builds on the last. Skipping or reordering breaks the chain:
- Style without Build = atmosphere on a broken foundation
- Move without Style = animation with no personality to match
- Write without context = copy that sounds warm but doesn't fit

**The one sanctioned exception:** Style may send a Structural Change Request back to Build. This is the Build-Style Feedback Loop, and it is intentional. See Step 2.

---

## Operational Modes

### Standard Mode (default)
The agent asks for user input at key decision points:
- Step 0: May ask ONE clarification question if confidence is low
- Style: Presents 3 metaphor options for user selection
- All other steps proceed autonomously with gate checks

### Autonomous Mode (`--auto` or "surprise me" or "just do it")
The agent makes all decisions independently:
- **Step 0:** Runs with high-confidence threshold. If confidence is high, proceeds. If low, asks ONE question and proceeds regardless of answer.
- **Style:** Uses the direction note's concept and kind when one exists. Otherwise, for a place, the `metaphor-discoverer` generates 3 options, ranks them with its rubric, selects the strongest, and documents its reasoning in the decision log.
- **Write:** Uses all 7 principles. If Style established a metaphor, principle 7 (metaphor language) activates automatically. If no metaphor, principle 7 asks only whether the copy has a character of its own.
- **All gates still apply.** Autonomous doesn't mean careless. No step proceeds with an open blocker.

Activate autonomous mode when:
- User explicitly says "surprise me", "just do it", or "make it not look like everything else"
- User passes `--auto` flag
- User doesn't want to be interrupted with decision points

---

## Step 0: Understand the Codebase

**This runs once, at the very beginning, before any framework.**

Load the Step 0 understand process:
`skills/shared/step-0-understand.md`

0. **Read the direction note if there is one.** If `ade_docs/direction.md` exists, its chosen direction is the declared concept and its five checks travel through every step. If it does not exist, say in one line that `$ade-direct` can set the direction first (standard mode), then continue; never block on it.
1. Scan the project structure, dependencies, README, routes, and component hierarchy
2. Build the Product Portrait (domain, interaction pattern, data density, user persona, emotional weight, physical analog, sound appropriateness, declared concept)
3. Assess confidence (high/medium/low)
4. If autonomous mode AND confidence is low: ask ONE targeted question, then proceed
5. If standard mode AND confidence is low: ask ONE targeted question, wait for answer
6. If confidence is high: state the hypothesis and proceed

**The Product Portrait feeds every subsequent step.** Build uses it for context branching. Style uses it for metaphor seeding. Move uses it for easter egg selection. Write uses it for tone calibration.

---

## Gate Rule

**The gate is no open blocker.** Each framework ends with its auditor's review, taken on the render (`skills/shared/review.md`). If a blocker is open, it blocks the next step. Defects travel forward in the log.

When a gate blocks:
1. Report the blockers, each with where it was seen and its evidence class
2. Repair them within that framework's scope
3. Capture again and re-run the auditor
4. Only then proceed to the next step

### Retry Limits

**Maximum 2 repair rounds per blocked gate.** If a blocker is still open after 2 focused rounds:

1. Log it in the decision log with what was tried and why it did not work
2. Apply the fallback for that framework (below)
3. Proceed with a warning, and say in the final report that the work is not Ready
4. If the blocker is the concept itself, stop and suggest `$ade-direct` instead of pushing on

### Fallback Strategies

| Framework | Fallback | What gets logged |
|-----------|----------|------------------|
| **Build** | If accessibility can't be fully fixed (e.g., third-party component limitations), document the exceptions and proceed | Each exception as an open blocker, with the component and the reason |
| **Style** | If the concept isn't convincing after 2 rounds of repair, commit to the strongest version achieved | "Draft atmosphere — iteration recommended" |
| **Move** | If physics can't be injected (framework constraints like CSS-in-JS limitations), apply the subset that IS possible | What was blocked and why |
| **Write** | If the codebase has hardcoded strings the agent can't edit (e.g., third-party components), list them as manual tasks | The untouchable strings |

### Decision Log Entry for Gate Failures

Every blocked gate MUST log:
- Which framework, and each open blocker
- What was attempted in each repair round
- Why the repair didn't succeed
- Which fallback was applied
- What the user should manually address later

---

## Step 1: Run $ade-build — Fix Structure

Execute the full Build review and repair process.

**Priority order: A → L → C → E → R** (Accessibility first, always.)

1. Capture the page, then review all five dimensions
2. Fix findings in priority order
3. Capture again and re-review to confirm the repair
4. Produce the Build report

**What to pass forward to Style:**
- The product type classification (emergency/enterprise/consumer/high-frequency)
- Any structural constraints that affect atmosphere (e.g., dense data tables, long-form content)
- The primary user action identified in the Emphasis dimension

**Gate check:** no open blocker in Build.

If one is open:
> Build has [N] open blockers: [list]. Fixing them before atmosphere design.

Apply fixes, re-review, then continue.

---

## Step 2: Gather Context → Run $ade-style — Build Atmosphere

Before running Style, ask the user two questions:

> 1. **How should someone feel when they use this?** Not what it should look like — how should it feel?
> 2. **Show me 3-5 references** — not UIs specifically. A room, a film, an object, a texture. Anything that evokes the feeling you're after.

If the user says "just do it" or "surprise me," derive the metaphor from the product domain. Note that results are better with references.

**If the direction note names a kind other than a place** (instrument, material, grammar, data, type, quiet), skip the two questions and steps 1–3 below: Style writes the concept's rules and goes to the rendering stack. See "Which kind of concept" in `skills/ade-style/SKILL.md`.

Then execute the full Style process:

1. Translate the feeling into temperature (warm/cool/mixed)
2. Discover the metaphor — present 3-5 options, let the user choose (or auto-select in `--auto` mode)
3. Map every UI element to a physical analog

### Build-Style Feedback Loop (Step 2.75 — may trigger)

After element mapping, Style runs its **Structural Authenticity Check**. If the metaphor demands structural changes that cannot be resolved by atmosphere alone:

1. Style generates a **Structural Change Request**
2. **Return to Build** — execute structural repair with the Structural Change Request as requirements
3. Build makes structural changes, re-verifies accessibility, re-reviews
4. **Return to Style** — proceed with atmosphere implementation on the new structure

Log this as "Build v2 — Structural Changes for Style" in the decision log.

---

4. **Select the rendering stack** — choose the technology that authentically serves the metaphor (CSS / P5.js / Three.js / SVG+GSAP / WebGL). Record the choice and rationale.
5. Build the atmosphere using the chosen rendering stack
6. Derive colors from materials, not hex pickers
7. Iterate through 5 design cycles (mandatory — cycle 1 is scaffolding, not design), saving each cycle's screenshot to the evidence trail and verifying **fidelity level >= 3** in cycle 5 (no themed labels on generic patterns)
8. Set the Move constraints based on the metaphor's weight and rendering stack — including the **acoustic signature** (room tone + material sounds) if the Product Portrait allows sound, or an explicit `none — [reason]`

**What to pass forward to Move:**
- The chosen metaphor and its one-line description
- The fidelity level achieved (0-4)
- The rendering stack chosen and why
- The physics personality (weighty/floating/snappy/organic/mechanical)
- Recommended spring tension and mass
- The acoustic signature (or "none — reason")
- The material palette and color derivations
- Which libraries are already installed (so Move doesn't duplicate)

**Gate check:** no open blocker in Style.

If one is open:
> Style has [N] open blockers: [list]. The concept isn't carried yet. Fixing them before injecting interactivity.

Apply fixes, re-review, then continue.

---

## Step 3: Run $ade-move — Inject Interactivity

Execute the full Move process using the physics profile from Style.

1. Map the interaction grammar (noun-verb-adjective for every element)
2. Identify the core loop (the repeating interaction pattern)
3. Find all dead spots (no transitions, flat hovers, missing feedback)
4. Inject vitality in five dimensions:
   - **Agency** — proximity awareness, affordance cues
   - **Loops** — feedback hierarchy matching action weight, spring physics
   - **Invitation** — scroll reveals, progressive depth, power-user paths
   - **Vitality** — physics matching the Style metaphor's weight
   - **Emergence** — contextual acknowledgment, data-driven insights
5. Implement the sound layer (only if Style handed off an acoustic signature — earcons derived from materials, off by default, visible toggle; see `skills/shared/sound-design.md`)
6. Implement the hidden fingerprint when the Product Portrait or project law calls for one (otherwise record `easter_egg: none — [reason]`)
7. Verify `prefers-reduced-motion` coverage
8. Verify keyboard navigation still works

**What to pass forward to Write:**
- The complete metaphor context (place + physics + materials)
- Any interaction-specific copy that was added (loading states, tooltips, error messages)
- The easter egg description (so Write doesn't accidentally rewrite its trigger text)
- The sound toggle location and label (so Write can polish it in the place's language without breaking it)

**Gate check:** no open blocker in Move.

If one is open:
> Move has [N] open blockers: [list]. Fixing them before the voice pass.

Apply fixes, re-review, then continue.

---

## Step 4: Run $ade-write — Polish Copy

Execute the full Write review using the metaphor context from Style and Move.

1. Scan all user-facing copy on the page
2. Apply the seven voice principles:
   - Warm partnership ("we" not "you")
   - Simplification as kindness
   - Purpose before action
   - Guide through questions, not commands
   - Connect the specific to the bigger picture
   - Compassionate errors (never blame)
   - Metaphor language (using the Style metaphor vocabulary)
3. Rewrite and replace directly
4. Verify tone consistency across the entire page

**Do not rewrite:**
- Copy that Style already transformed to metaphor language
- Error messages that are already compassionate
- The easter egg trigger text from Move

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
**Sound appropriateness:** [from Step 0]
**Declared concept:** [from Step 0 — verbatim owner intent, or "none declared"]
**Confidence:** [High/Medium/Low]
**Mode:** [Standard/Autonomous]

---

### Build — Structure
**Review:** [findings before] → [after] · open blockers: [N]
**Product type:** [classification]
**Primary action:** [identified emphasis]
**Key fixes:** [list]

---

### Style — Atmosphere
**Review:** [findings before] → [after] · open blockers: [N]
**Concept kind:** [place / instrument / material / grammar / data / type / quiet]
**Feeling:** [user's words]
**Metaphor:** [chosen metaphor — one line]
**Temperature:** [warm/cool/mixed]
**Materials:** [list of named materials]
**Colors derived:** [material → color mappings]
**Fidelity level:** [0-4 — target >= 3]
**Acoustic signature:** [one line, or "none — reason"]
**Pages transformed:** [list with scope classes]
**Design cycles completed:** [1-5, with notes per cycle]

---

### Move — Interactivity
**Review:** [findings before] → [after] · open blockers: [N]
**Core loop:** [action → response → discovery → next action]
**Dead spots fixed:** [count]
**Physics profile:** [personality, spring tension, mass]
**Injections:** [Agency / Loops / Invitation / Vitality / Emergence summary]
**Hidden fingerprint:**
- Type: [key combination / console message / secret page]
- Trigger: [how to activate]
- Reveals: [what the user sees]
**Sound layer:** [implemented — earcon list + toggle location / skipped — reason]

---

### Write — Copy
**Copy reviewed:** [count]
**Rewrites made:** [count]
**Metaphor vocabulary:** [list of metaphor-specific terms used]

---

### Cross-Framework Handoffs
- Build → Style: [what structural context informed atmosphere]
- Style → Move: [what physics profile was derived from metaphor]
- Move → Write: [what interaction copy was preserved]

---

### Evidence
[table linking baseline → per-framework → final screenshots in ade_docs/evidence/, per skills/shared/evidence-trail.md — or an explicit note that no browser was available]

---

### Files Modified
[complete list with line ranges, organized by framework]

---

### Final Review

Run `$ade-review` on the result and paste its report here: direction checks, what must survive, findings, two judgements, status.
```

---

## Step 6: Final Verdict

Report the status from the final review, and what was not seen.

**Ready within inspected scope:**
> Transformation complete. Your interface works (Build), carries [concept] (Style), responds with [physics personality] (Move), and speaks with intention (Write). Not seen: [list]. Run `$ade-review` anytime to look again.

**Needs revision:**
> Transformation complete with work left. [The open defects that matter most, with repairs.]

**Blocked or Unverified:**
> Transformation hit some walls. [What blocked progress, or what could not be seen.] Run `$ade-review` after addressing them.

---

## What NOT to Do

- Do not skip frameworks or reorder the sequence — the chain matters
- Do not proceed past an open blocker without fixing and re-reviewing
- Do not let Style override Build's accessibility fixes
- Do not let Move break Build's structure or Style's atmosphere
- Do not let Write rewrite the easter egg trigger or Style's metaphor copy
- Do not rush the Style iteration cycles — 5 cycles minimum, each page
- Do not forget to log every decision — the log is the institutional memory
- Do not add features — transform what exists, don't expand scope
