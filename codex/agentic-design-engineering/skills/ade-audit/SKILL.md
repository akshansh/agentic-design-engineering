---
name: ade-audit
description: "Run a full Build + Style + Move + Write evaluation on a page — score each framework, produce a combined report out of /200 with prioritized recommendations across all four."
---

# $ade-audit — Full Design Audit

You are a design auditor running the complete ADE evaluation suite. Your job is to assess a page or component against all four design frameworks — Build (structure), Style (atmosphere), Move (interactivity), and Write (communication) — and produce a single prioritized report.

**This is an audit, not a transformation.** You score and recommend. You do not fix.

---

## Step 1: Read the Page

Read the target page/component code thoroughly. Build a mental model of:
- Structure (layout, hierarchy, accessibility, copy, feedback)
- Atmosphere (colors, textures, light, typography, metaphor presence)
- Interactivity (transitions, hover states, feedback loops, discovery layers, easter eggs)

---

## Step 2: Run the Build Auditor

Load the Build framework reference:
`references/build-framework.md`

Score each Build dimension 0–10:

| Dimension | Question | Score |
|-----------|----------|-------|
| **C** — Copy | Is the text clear, human, and action-oriented? | /10 |
| **L** — Layout | Is information organized with clear hierarchy and spacing? | /10 |
| **E** — Emphasis | Is there exactly ONE primary action per viewport? | /10 |
| **A** — Accessibility | Can everyone use this? (keyboard, screen reader, contrast, targets) | /10 |
| **R** — Reward | Does every action get feedback? Are errors compassionate? | /10 |

**Build Total: /50**

For each dimension scoring below 8, list specific violations with file:line references.

---

## Step 3: Run the Style Auditor

Load the Style framework reference:
`references/style-framework.md`

Score each Style dimension 0–10:

| Dimension | Question | Score |
|-----------|----------|-------|
| **P** — Physical Metaphor | Does the interface inhabit a specific, named place? | /10 |
| **L** — Light & Depth | Is there a directional light source and sense of enclosure? | /10 |
| **A** — Atmosphere Layers | Are background, vignette, grain, and surface materials present? | /10 |
| **C** — Color from Materials | Are colors derived from named materials, not arbitrary hex values? | /10 |
| **E** — Enacted Typography | Do headings and copy feel like they belong to the place? | /10 |

**Style Total: /50**

For each dimension scoring below 8, list what's missing or unconvincing.

---

## Step 4: Run the Move Auditor

Load the Move framework reference:
`references/move-framework.md`

Score each Move dimension 0–10:

| Dimension | Question | Score |
|-----------|----------|-------|
| **A** — Agency & Affordance | Do elements respond before contact? Do they signal interactivity? | /10 |
| **L** — Loops & Feedback | Does every action get a weighted, physical response? | /10 |
| **I** — Invitation & Discovery | Are there scroll reveals, progressive depth, power-user paths? | /10 |
| **V** — Vitality & Physics | Does the motion match the Style metaphor's weight and character? | /10 |
| **E** — Emergence & Surprise | Is there a hidden fingerprint? Contextual acknowledgment? | /10 |

**Move Total: /50**

For each dimension scoring below 8, list dead spots and missing injections with file:line references.

---

## Step 5: Run the Write Auditor

Score each Write principle 0–10:

| Principle | Question | Score |
|-----------|----------|-------|
| **1** — Partnership | Does the copy speak with the user, not at them? | /10 |
| **2** — Simplification | Is every word earning its place? | /10 |
| **3** — Purpose | Do actions explain why before what? | /10 |
| **4** — Invitation | Are interactions framed as invitations, not commands? | /10 |
| **5** — Connection | Does copy connect moments to meaning? | /10 |
| **6** — Compassion | Are errors kind and guiding? | /10 |
| **7** — Metaphor Language | Does copy inhabit the Style metaphor (if established)? | /10 |

**Write Total: /70** (normalized to /50 for combined scoring: `Math.round(total * 50 / 70)`)

For each principle scoring below 7, list specific copy violations with file:line references.

---

## Step 6: Prioritize Recommendations

Combine all violations across the four frameworks into a single prioritized list.

**Priority tiers:**

| Tier | Criteria | Examples |
|------|----------|---------|
| **P0 — Blocking** | Accessibility failures, broken interactions, missing keyboard nav | Build-A violations, missing `prefers-reduced-motion` |
| **P1 — Critical** | No metaphor, no feedback on core loop, copy that blames users | Style-P absence, Move-L gaps, Build-C blaming errors |
| **P2 — Important** | Weak atmosphere, inconsistent physics, generic copy | Style-A thin layers, Move-V mismatched weight, Write issues |
| **P3 — Polish** | Missing ornamental details, no easter egg, minor copy improvements | Style ornaments, Move-E easter egg missing, Write tone |

List each recommendation as:

```
[P0/P1/P2/P3] [Build/Style/Move/Write] — [specific issue]
→ [specific fix recommendation]
→ File: [file:line]
```

---

## Step 7: Combined Report

Output the full report:

```
## ADE Audit Results

**Page:** [page name or path]
**Date:** [YYYY-MM-DD]

### Scores

| Framework | Score | Status |
|-----------|-------|--------|
| Build (Structure) | XX/50 | [Passing (40+) / Needs Work / Failing] |
| Style (Atmosphere) | XX/50 | [Passing (40+) / Needs Work / Failing] |
| Move (Interactivity) | XX/50 | [Passing (40+) / Needs Work / Failing] |
| Write (Communication) | XX/50 | [Passing (40+) / Needs Work / Failing] |
| **Combined** | **XX/200** | **[Overall status]** |

### Build Breakdown
| Dimension | Score | Key Issues |
|-----------|-------|------------|
| C — Copy | /10 | [summary or "Clean"] |
| L — Layout | /10 | [summary or "Clean"] |
| E — Emphasis | /10 | [summary or "Clean"] |
| A — Accessibility | /10 | [summary or "Clean"] |
| R — Reward | /10 | [summary or "Clean"] |

### Style Breakdown
| Dimension | Score | Key Issues |
|-----------|-------|------------|
| P — Physical Metaphor | /10 | [summary or "Clean"] |
| L — Light & Depth | /10 | [summary or "Clean"] |
| A — Atmosphere Layers | /10 | [summary or "Clean"] |
| C — Color from Materials | /10 | [summary or "Clean"] |
| E — Enacted Typography | /10 | [summary or "Clean"] |

### Move Breakdown
| Dimension | Score | Key Issues |
|-----------|-------|------------|
| A — Agency & Affordance | /10 | [summary or "Clean"] |
| L — Loops & Feedback | /10 | [summary or "Clean"] |
| I — Invitation & Discovery | /10 | [summary or "Clean"] |
| V — Vitality & Physics | /10 | [summary or "Clean"] |
| E — Emergence & Surprise | /10 | [summary or "Clean"] |

### Write Breakdown
| Principle | Score | Key Issues |
|-----------|-------|------------|
| 1 — Partnership | /10 | [summary or "Clean"] |
| 2 — Simplification | /10 | [summary or "Clean"] |
| 3 — Purpose | /10 | [summary or "Clean"] |
| 4 — Invitation | /10 | [summary or "Clean"] |
| 5 — Connection | /10 | [summary or "Clean"] |
| 6 — Compassion | /10 | [summary or "Clean"] |
| 7 — Metaphor Language | /10 | [summary or "Clean"] |

### Prioritized Recommendations
[P0 items first, then P1, P2, P3 — each with framework tag, issue, fix, file:line]

### Verdict
[One of the following:]
- **Score 160+:** This interface is well-crafted across all dimensions. Minor polish recommended.
- **Score 120-159:** Solid foundation. Targeted improvements will elevate it.
- **Score 80-119:** Significant gaps. Focus on P0/P1 items before shipping.
- **Score below 80:** Needs a full transformation pass. Start with `$ade-compound`.
```

Log this report to `ade_docs/YYYY-MM-DD-audit.md`.

---

## Step 8: Next Steps

Based on the scores, recommend the appropriate action:

**If any framework scores below 40:**
> [Framework] scored [X]/50 — below the passing threshold. Run `$ade-[clear|place|alive]` to address the gaps before a re-audit.

**If all frameworks pass (40+) but total is below 120:**
> All frameworks pass individually, but there's room for polish. Focus on the P2/P3 recommendations above.

**If total is 120+:**
> Strong across all four frameworks. Consider running `$ade-write` for a copy consistency pass.

**If the user wants everything fixed:**
> Run `$ade-compound` to fix everything — it orchestrates all four frameworks in sequence.

---

## What NOT to Do

- Do not fix anything — this is an audit, not a repair
- Do not make code changes — only observe and score
- Do not inflate scores to be kind — honest assessment helps more than encouragement
- Do not conflate frameworks — score each independently, even if issues overlap
- Do not skip a framework because it "looks fine" — score every dimension explicitly
- Do not recommend adding features — only evaluate what exists
