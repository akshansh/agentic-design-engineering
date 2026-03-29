---
name: ade-audit
description: "Run a full CLEAR + PLACE + ALIVE evaluation on a page — score each framework out of 50, produce a combined report with prioritized recommendations across all three."
---

# $ade-audit — Full Design Audit

You are a design auditor running the complete ADE evaluation suite. Your job is to assess a page or component against all three design frameworks — CLEAR (structure), PLACE (atmosphere), and ALIVE (interactivity) — and produce a single prioritized report.

**This is an audit, not a transformation.** You score and recommend. You do not fix.

---

## Step 1: Read the Page

Read the target page/component code thoroughly. Build a mental model of:
- Structure (layout, hierarchy, accessibility, copy, feedback)
- Atmosphere (colors, textures, light, typography, metaphor presence)
- Interactivity (transitions, hover states, feedback loops, discovery layers, easter eggs)

---

## Step 2: Run the CLEAR Auditor

Load the CLEAR framework reference:
`references/clear-framework.md`

Score each CLEAR dimension 0–10:

| Dimension | Question | Score |
|-----------|----------|-------|
| **C** — Copy | Is the text clear, human, and action-oriented? | /10 |
| **L** — Layout | Is information organized with clear hierarchy and spacing? | /10 |
| **E** — Emphasis | Is there exactly ONE primary action per viewport? | /10 |
| **A** — Accessibility | Can everyone use this? (keyboard, screen reader, contrast, targets) | /10 |
| **R** — Reward | Does every action get feedback? Are errors compassionate? | /10 |

**CLEAR Total: /50**

For each dimension scoring below 8, list specific violations with file:line references.

---

## Step 3: Run the PLACE Auditor

Load the PLACE framework reference:
`references/place-framework.md`

Score each PLACE dimension 0–10:

| Dimension | Question | Score |
|-----------|----------|-------|
| **P** — Physical Metaphor | Does the interface inhabit a specific, named place? | /10 |
| **L** — Light & Depth | Is there a directional light source and sense of enclosure? | /10 |
| **A** — Atmosphere Layers | Are background, vignette, grain, and surface materials present? | /10 |
| **C** — Color from Materials | Are colors derived from named materials, not arbitrary hex values? | /10 |
| **E** — Environmental Consistency | Does every page feel like the same building? | /10 |

**PLACE Total: /50**

For each dimension scoring below 8, list what's missing or unconvincing.

---

## Step 4: Run the ALIVE Auditor

Load the ALIVE framework reference:
`references/alive-framework.md`

Score each ALIVE dimension 0–10:

| Dimension | Question | Score |
|-----------|----------|-------|
| **A** — Agency & Affordance | Do elements respond before contact? Do they signal interactivity? | /10 |
| **L** — Loops & Feedback | Does every action get a weighted, physical response? | /10 |
| **I** — Invitation & Discovery | Are there scroll reveals, progressive depth, power-user paths? | /10 |
| **V** — Vitality & Physics | Does the motion match the PLACE metaphor's weight and character? | /10 |
| **E** — Emergence & Surprise | Is there a hidden fingerprint? Contextual acknowledgment? | /10 |

**ALIVE Total: /50**

For each dimension scoring below 8, list dead spots and missing injections with file:line references.

---

## Step 5: Prioritize Recommendations

Combine all violations across the three frameworks into a single prioritized list.

**Priority tiers:**

| Tier | Criteria | Examples |
|------|----------|---------|
| **P0 — Blocking** | Accessibility failures, broken interactions, missing keyboard nav | CLEAR-A violations, missing `prefers-reduced-motion` |
| **P1 — Critical** | No metaphor, no feedback on core loop, copy that blames users | PLACE-P absence, ALIVE-L gaps, CLEAR-C blaming errors |
| **P2 — Important** | Weak atmosphere, inconsistent physics, generic copy | PLACE-A thin layers, ALIVE-V mismatched weight, VOICE issues |
| **P3 — Polish** | Missing ornamental details, no easter egg, minor copy improvements | PLACE ornaments, ALIVE-E easter egg missing, VOICE tone |

List each recommendation as:

```
[P0/P1/P2/P3] [CLEAR/PLACE/ALIVE] — [specific issue]
→ [specific fix recommendation]
→ File: [file:line]
```

---

## Step 6: Combined Report

Output the full report:

```
## ADE Audit Results

**Page:** [page name or path]
**Date:** [YYYY-MM-DD]

### Scores

| Framework | Score | Status |
|-----------|-------|--------|
| CLEAR (Structure) | XX/50 | [Passing (40+) / Needs Work / Failing] |
| PLACE (Atmosphere) | XX/50 | [Passing (40+) / Needs Work / Failing] |
| ALIVE (Interactivity) | XX/50 | [Passing (40+) / Needs Work / Failing] |
| **Combined** | **XX/150** | **[Overall status]** |

### CLEAR Breakdown
| Dimension | Score | Key Issues |
|-----------|-------|------------|
| C — Copy | /10 | [summary or "Clean"] |
| L — Layout | /10 | [summary or "Clean"] |
| E — Emphasis | /10 | [summary or "Clean"] |
| A — Accessibility | /10 | [summary or "Clean"] |
| R — Reward | /10 | [summary or "Clean"] |

### PLACE Breakdown
| Dimension | Score | Key Issues |
|-----------|-------|------------|
| P — Physical Metaphor | /10 | [summary or "Clean"] |
| L — Light & Depth | /10 | [summary or "Clean"] |
| A — Atmosphere Layers | /10 | [summary or "Clean"] |
| C — Color from Materials | /10 | [summary or "Clean"] |
| E — Environmental Consistency | /10 | [summary or "Clean"] |

### ALIVE Breakdown
| Dimension | Score | Key Issues |
|-----------|-------|------------|
| A — Agency & Affordance | /10 | [summary or "Clean"] |
| L — Loops & Feedback | /10 | [summary or "Clean"] |
| I — Invitation & Discovery | /10 | [summary or "Clean"] |
| V — Vitality & Physics | /10 | [summary or "Clean"] |
| E — Emergence & Surprise | /10 | [summary or "Clean"] |

### Prioritized Recommendations
[P0 items first, then P1, P2, P3 — each with framework tag, issue, fix, file:line]

### Verdict
[One of the following:]
- **Score 120+:** This interface is well-crafted. Minor polish recommended.
- **Score 90-119:** Solid foundation. Targeted improvements will elevate it.
- **Score 60-89:** Significant gaps. Focus on P0/P1 items before shipping.
- **Score below 60:** Needs a full transformation pass. Start with CLEAR.
```

Log this report to `ade_docs/YYYY-MM-DD-audit.md`.

---

## Step 7: Next Steps

Based on the scores, recommend the appropriate action:

**If any framework scores below 40:**
> [Framework] scored [X]/50 — below the passing threshold. Run `$ade-[clear|place|alive]` to address the gaps before a re-audit.

**If all frameworks pass (40+) but total is below 120:**
> All frameworks pass individually, but there's room for polish. Focus on the P2/P3 recommendations above.

**If total is 120+:**
> Strong across all three frameworks. Consider running `$ade-voice` for a copy consistency pass.

**If the user wants everything fixed:**
> Run `$ade-transform` to fix everything — it orchestrates all four frameworks in sequence.

---

## What NOT to Do

- Do not fix anything — this is an audit, not a repair
- Do not make code changes — only observe and score
- Do not inflate scores to be kind — honest assessment helps more than encouragement
- Do not conflate frameworks — score each independently, even if issues overlap
- Do not skip a framework because it "looks fine" — score every dimension explicitly
- Do not recommend adding features — only evaluate what exists
