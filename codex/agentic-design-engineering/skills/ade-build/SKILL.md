---
name: ade-build
description: "Review and repair UI structure using the Build framework — looks at the rendered page, finds problems in copy, layout, emphasis, accessibility and reward, then fixes them in priority order."
---

# $ade-build — UI Structure Review + Repair

You review a page or component against the Build framework, then **fix what's broken** — not just report findings.

## What Build Evaluates

| Dimension | Question | Priority |
|-----------|----------|----------|
| **C** — Copy | Is the text clear, human, and action-oriented? | 3 |
| **L** — Layout | Is information organized with clear hierarchy and spacing? | 2 |
| **E** — Emphasis | Is there exactly ONE primary action per viewport? | 4 |
| **A** — Accessibility | Can everyone use this? (keyboard, screen reader, contrast, targets) | 1 (highest) |
| **R** — Reward | Does every action get feedback? Are errors compassionate? | 5 |

## Step 0: Understand the Codebase (if not already done)

If running standalone (not as part of `ade-compound`), run Step 0 first:
Load: `skills/shared/step-0-understand.md`

Build the Product Portrait before evaluating. The product type classification decides which context branch applies (bottom of this file). If `ade_docs/direction.md` exists, carry its five checks into the review.

If running as part of `ade-compound`, the Product Portrait is already available — use it.

---

## Step 1: Look, then read

Capture the page at 1440 and 390 px in each real state and look before reading code (`skills/shared/review.md`). Then read the target page/component code. Identify:
- All text content (headings, labels, buttons, errors, empty states)
- Layout structure (containers, spacing, grid/flex usage)
- Interactive elements (buttons, links, inputs, navigation)
- Visual hierarchy (what's biggest, brightest, most prominent)
- Feedback mechanisms (loading states, success messages, error handling)

## Step 2: Review Each Dimension

Run the `build-auditor` skill. It returns findings (blocker, defect, opportunity), each with its evidence class, in the form of `skills/shared/review.md`.

Load the full framework reference for evaluation criteria:
`references/build-framework.md`

A blocker stops a user: an accessibility failure on a real task, a broken flow. A defect degrades the experience. An opportunity is optional.

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
| No clear order of visual weight | One primary, then a readable descending order. Apply via size, color, and position. There is no fixed ratio; judge it on the rendered page. |

### R — Reward Repairs (Priority 5)

| Violation | Repair |
|-----------|--------|
| Button has no loading state | Add `disabled` + loading indicator (spinner or "Loading..." text) during async operations. |
| No success feedback | Add confirmation message, checkmark animation, or state change after successful action. |
| Error appears as page reload, not inline | Show error inline near the field that caused it. Use `role="alert"` and `aria-live="polite"`. |
| No hover/focus feedback on interactive elements | Add `transform: translateY(-1px)` + enhanced `box-shadow` on hover. Add `transform: scale(0.98)` on `:active`. |

## Step 4: Verify Fixes

After applying repairs:
1. Run the project's existing build/lint command (check `package.json` scripts, `Makefile`, or equivalent)
2. If no build command exists, verify the changes don't introduce syntax errors
3. Capture the page again and run the `build-auditor` skill on it
4. Confirm each finding you repaired is gone on the render, and nothing in "what must survive" was lost

## Step 5: Report + Handoff

Output a summary:

```
## Build Results

**Evidence:** [render-observed: widths and states | source-inspected only]
**Status:** [Ready within inspected scope | Needs revision | Blocked | Unverified]
**Open blockers:** [0, or the list]

| Dimension | Before | After |
|-----------|--------|-------|
| A — Accessibility | [blockers / defects] | [blockers / defects] |
| L — Layout | … | … |
| C — Copy | … | … |
| E — Emphasis | … | … |
| R — Reward | … | … |

### Repaired
- [each finding repaired, with file:line and the capture that shows it]

### Still open
- [each remaining finding with severity and repair]

### Judgements
Creative integrity: … · Professional craft: …
```

Log this to `ade_docs/YYYY-MM-DD-build.md`.

### Handoff

If there is no open blocker:
> Structure passes. Your UI works correctly and accessibly. Want it to feel like somewhere? Run `$ade-style` to transform the atmosphere.

If a blocker is still open:
> Structure needs more work. [List critical remaining issues.] Fix these before moving to atmosphere design.

## Context Branching

Adjust strictness based on product type:

| Product Type | Accessibility | Copy | Layout | Emphasis | Reward |
|-------------|---------------|------|--------|----------|--------|
| **Emergency/medical** | Maximum (AAA) | Clinical clarity | Rigid hierarchy | Single action, no distraction | Immediate, unambiguous |
| **Enterprise/internal** | AA minimum | Professional, efficient | Clean, scannable | Clear primary, tolerate secondary | Functional confirmation |
| **Consumer/creative** | AA minimum | Warm, engaging, metaphoric | Flexible, atmospheric | Can be exploratory | Delightful, progressive |
| **High-frequency tool** | AA minimum | Minimal, fast | Dense, efficient | Power-user shortcuts | Subtle, non-intrusive |
| **Data-heavy/analytics** | AA minimum | Precise, label-dense | Dense but scannable, grid-based | Filter/sort controls prominent | Inline feedback, no modals |
| **Communication/social** | AA minimum | Conversational, real-time | Speed-optimized, minimal chrome | Compose action always accessible | Instant send confirmation |
| **E-commerce/transactional** | AA minimum | Trust-building, transparent | Distraction-free checkout flow | Single CTA per step | Progress indicators, confirmation |
| **Educational/onboarding** | AA minimum | Encouraging, progressive | Step-by-step, progressive complexity | Next step always clear | Celebration on completion |

## What NOT to Do

- Do not add features, components, or functionality beyond what exists
- Do not refactor surrounding code that isn't part of the violation
- Do not add comments, docstrings, or type annotations to unchanged code
- Do not change the visual design or atmosphere — that's Style's job
- Do not add interactivity or animations — that's Move's job
- Do not change the copy voice/personality — that's Write's job
- Fix structure. Nothing more. Nothing less.
