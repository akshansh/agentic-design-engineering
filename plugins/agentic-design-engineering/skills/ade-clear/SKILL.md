---
name: ade:clear
description: "Audit and repair UI structure using the CLEAR framework — evaluates copy, layout, emphasis, accessibility, and reward, then fixes violations in priority order."
argument-hint: "[URL or file path of the page/component to audit]"
---

# /ade:clear — UI Structure Audit + Repair

You are a UI structure auditor. Your job is to evaluate a page or component against the CLEAR framework, then **fix what's broken** — not just report findings.

## What CLEAR Evaluates

| Dimension | Question | Priority |
|-----------|----------|----------|
| **C** — Copy | Is the text clear, human, and action-oriented? | 3 |
| **L** — Layout | Is information organized with clear hierarchy and spacing? | 2 |
| **E** — Emphasis | Is there exactly ONE primary action per viewport? | 4 |
| **A** — Accessibility | Can everyone use this? (keyboard, screen reader, contrast, targets) | 1 (highest) |
| **R** — Reward | Does every action get feedback? Are errors compassionate? | 5 |

## Step 1: Read the Page

Read the target page/component code. Identify:
- All text content (headings, labels, buttons, errors, empty states)
- Layout structure (containers, spacing, grid/flex usage)
- Interactive elements (buttons, links, inputs, navigation)
- Visual hierarchy (what's biggest, brightest, most prominent)
- Feedback mechanisms (loading states, success messages, error handling)

## Step 2: Score Each Dimension

For each dimension, score 0-10 and list specific violations.

Load the full framework reference for evaluation criteria:
`references/clear-framework.md`

### Scoring Guide
- **9-10**: Excellent. No violations. Delightful.
- **7-8**: Good. Minor issues that don't block usability.
- **5-6**: Acceptable. Several issues that degrade experience.
- **3-4**: Poor. Significant issues that hurt usability.
- **0-2**: Failing. Critical issues that block users.

## Step 3: Fix in Priority Order

**Fix order: A → L → C → E → R** (Accessibility first, always.)

For each violation found, apply the repair procedure:

### A — Accessibility Repairs (Priority 1)

| Violation | Repair |
|-----------|--------|
| Missing keyboard navigation | Ensure all interactive elements are native `<button>`, `<a>`, `<input>`. Add `tabindex="0"` only for custom interactive elements. |
| No visible focus indicator | Add `outline` or `box-shadow` on `:focus-visible`. Never `outline: none` without replacement. |
| Contrast below 4.5:1 (normal text) | Darken text color or lighten background until ratio meets 4.5:1. Use WebAIM contrast checker logic. |
| Contrast below 3:1 (large text 18px+) | Same approach, lower threshold. |
| Missing alt text on images | Add descriptive `alt` for informative images. Add `alt=""` for decorative. |
| Heading hierarchy broken (h1→h3, skipping h2) | Insert missing heading levels. Ensure single h1 per page. |
| Interactive targets < 44px | Increase `min-height` and `min-width` to 44px via padding. |
| No skip-to-content link | Add `<a class="skip-link" href="#main-content">Skip to content</a>` as first child of body. |
| Color-only information | Add icons, patterns, or text alongside color indicators. |

### L — Layout Repairs (Priority 2)

| Violation | Repair |
|-----------|--------|
| No spacing system | Define CSS custom properties (`--space-1` through `--space-9`). Replace arbitrary values. |
| Inconsistent spacing | Replace all `margin`/`padding`/`gap` values with spacing tokens. |
| No visual hierarchy | Ensure h1 is largest, h2 is clearly smaller, body is readable. Use size AND weight for differentiation. |
| Content not grouped | Apply Gestalt proximity: related items get `--space-2` to `--space-3` gap; unrelated groups get `--space-6` to `--space-8`. |
| No max-width on content | Add `max-width: 65ch` to body text for readability. Center with `margin: 0 auto`. |

### C — Copy Repairs (Priority 3)

| Violation | Repair |
|-----------|--------|
| Passive voice buttons ("File can be uploaded") | Rewrite with active verb: "Upload your file" |
| Generic labels ("Submit", "OK", "Cancel") | Rewrite with specific action: "Save changes", "Create account", "Go back" |
| Blaming error messages ("Invalid input") | Rewrite with guidance: "That doesn't look right. Try [specific format]." |
| No empty state copy | Add helpful message: "Nothing here yet. [Specific action to get started]." |
| Jargon or technical language in user-facing copy | Replace with plain language. Target grade level 6-8. |

### E — Emphasis Repairs (Priority 4)

| Violation | Repair |
|-----------|--------|
| Multiple primary actions competing | Demote all but the most important to secondary styling (outline/ghost button). |
| No clear primary action | Identify the ONE thing the user should do. Make it: largest, highest contrast, most prominent position. |
| Visual weight not distributed by golden ratio | Primary = 100% weight, Secondary = 61.8%, Tertiary = 38.2%. Apply via size, color, and position. |

### R — Reward Repairs (Priority 5)

| Violation | Repair |
|-----------|--------|
| Button has no loading state | Add `disabled` + loading indicator (spinner or "Loading..." text) during async operations. |
| No success feedback | Add confirmation message, checkmark animation, or state change after successful action. |
| Error appears as page reload, not inline | Show error inline near the field that caused it. Use `role="alert"` and `aria-live="polite"`. |
| No hover/focus feedback on interactive elements | Add `transform: translateY(-1px)` + enhanced `box-shadow` on hover. Add `transform: scale(0.98)` on `:active`. |

## Step 4: Verify Fixes

After applying repairs:
1. Run `npx tsc --noEmit` to verify TypeScript compiles
2. Check that no existing functionality was broken
3. Re-score each dimension to confirm improvement

## Step 5: Report + Handoff

Output a summary:

```
## CLEAR Audit Results

| Dimension | Before | After | Status |
|-----------|--------|-------|--------|
| A — Accessibility | X/10 | Y/10 | [Fixed/Improved/Unchanged] |
| L — Layout | X/10 | Y/10 | [Fixed/Improved/Unchanged] |
| C — Copy | X/10 | Y/10 | [Fixed/Improved/Unchanged] |
| E — Emphasis | X/10 | Y/10 | [Fixed/Improved/Unchanged] |
| R — Reward | X/10 | Y/10 | [Fixed/Improved/Unchanged] |

**Total: XX/50** (target: 40+)

### Violations Fixed
- [list each fix with file:line reference]

### Remaining Issues
- [anything that couldn't be auto-fixed]
```

Log this to `ade_docs/YYYY-MM-DD-clear-audit.md`.

### Handoff

If total score is 40+:
> Structure passes. Your UI works correctly and accessibly. Want it to feel like somewhere? Run `/ade:place` to transform the atmosphere.

If total score is below 40:
> Structure needs more work. [List critical remaining issues.] Fix these before moving to atmosphere design.

## Context Branching

Adjust strictness based on product type:

| Product Type | Accessibility | Copy | Layout | Emphasis | Reward |
|-------------|---------------|------|--------|----------|--------|
| **Emergency/medical** | Maximum (AAA) | Clinical clarity | Rigid hierarchy | Single action, no distraction | Immediate, unambiguous |
| **Enterprise/internal** | AA minimum | Professional, efficient | Clean, scannable | Clear primary, tolerate secondary | Functional confirmation |
| **Consumer/creative** | AA minimum | Warm, engaging, metaphoric | Flexible, atmospheric | Can be exploratory | Delightful, progressive |
| **High-frequency tool** | AA minimum | Minimal, fast | Dense, efficient | Power-user shortcuts | Subtle, non-intrusive |

## What NOT to Do

- Do not add features, components, or functionality beyond what exists
- Do not refactor surrounding code that isn't part of the violation
- Do not add comments, docstrings, or type annotations to unchanged code
- Do not change the visual design or atmosphere — that's PLACE's job
- Do not add interactivity or animations — that's ALIVE's job
- Do not change the copy voice/personality — that's VOICE's job
- Fix structure. Nothing more. Nothing less.
