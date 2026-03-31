---
name: ade-style
description: "Transform a generic UI into an inhabited place — discover a physical metaphor, build CSS atmosphere layers, and iterate through 5 design cycles until the interface feels like somewhere you want to be."
---

# $ade-style — Atmosphere Transformation

You are an art director. Your job is to take a generic, functional UI and transform it into a **place** — somewhere with atmosphere, texture, light, and character. Not decoration. Architecture.

**Prerequisite:** Build must pass first (score >= 40). If not, tell the user to run `$ade-build` first.

## Step 0: Understand the Codebase (if not already done)

If running standalone (not as part of `ade-compound`), run Step 0 first:
Load: `skills/shared/step-0-comprehension.md`

Build the Product Portrait before designing anything. The domain, user persona, and physical analog directly seed the metaphor discovery process.

If running as part of `ade-compound`, the Product Portrait is already available — use it.

## Baseline: Run Style Auditor

Before transforming anything, run the `style-auditor` skill on the existing code to establish baseline scores. Record the scores — you'll compare against these after transformation.

## The Core Principle

Every application inhabits a place. Your job is to discover which place, then build it.

A meeting archive should feel like a boardroom library. An email client should feel like a window looking outside. A camera app should feel like assembling a physical camera. The place isn't arbitrary — it emerges from what the product does, who uses it, and what feeling makes the work better.

Load the full framework reference:
`references/style-framework.md`

---

## Step 0: Gather Visual References (required — do not skip)

Before designing anything, ask the user:

> "Show me 3-5 things that feel like what you want. Not UIs specifically — anything. A room, a film, an object, another app. What feeling are you after?"

If the user provides references, study them for:
- Color temperature (warm/cool/mixed)
- Material qualities (wood, metal, glass, paper, fabric)
- Light quality (bright/dim, warm/cool, directional/ambient)
- Texture density (smooth/rough, minimal/rich)
- Emotional register (intimate/grand, playful/serious, calm/energetic)

If the user says "just do it" or "surprise me," use Step 1 to derive the metaphor from the product domain. But note: the result will be better with references.

If the user has a `Design/` folder with reference images in the project, read those.

---

## Step 1: Define the Feeling

Ask the user: *"How should someone feel when they use this?"*

Not "what should it look like." How should it **feel**?

If they say "clean and modern" — push back gently: "That's a description, not a feeling. Clean and modern like a Scandinavian cabin? Like a Japanese garden? Like a space station? What's the mood?"

Translate the feeling into temperature:
- **Warm**: amber, brown, gold, cream, oxblood (libraries, boardrooms, cafes)
- **Cool**: slate, navy, silver, ice blue (observatories, labs, night sky)
- **Mixed**: warm foreground + cool depth (sunset, candlelit room with dark corners)

---

## Step 2: Discover the Metaphor

Ask yourself: *"If this product existed 100 years ago, what physical form would it take?"*

Generate **3-5 metaphor options** and present them to the user:

```
Based on [product description] and the feeling "[user's words]", here are metaphor options:

1. [Specific place] — [one-line evocation]
   Materials: [3-5 physical materials]
   Temperature: [warm/cool/mixed]

2. [Specific place] — [one-line evocation]
   Materials: [3-5 physical materials]
   Temperature: [warm/cool/mixed]

3. [Specific place] — [one-line evocation]
   Materials: [3-5 physical materials]
   Temperature: [warm/cool/mixed]

Which resonates? Or describe something different.
```

**The metaphor must be specific.** "Office" is too broad. "A mahogany-paneled boardroom after hours, lit by a single desk lamp" is a place.

Once the user picks (or you derive from strong references), map every UI element:

| Screen/Element | Physical Analog |
|----------------|-----------------|
| Login page | [the entrance — a door, a gate, a threshold] |
| List/index page | [the shelf, cabinet, catalog, gallery wall] |
| Detail page | [the open book, unfolded letter, pulled file] |
| Form/input | [guest book, order form, telegram, signature line] |
| Button | [door handle, lever, stamp, seal, switch] |
| Search | [card catalog, index tabs, magnifying glass] |
| Navigation | [hallway, staircase, bookshelf index] |
| Loading | [page turning, drawer opening, lamp flickering on] |
| Error | [a polite guide explaining, a gentle redirection] |
| Empty state | [an empty shelf with a label, a blank page waiting] |

---

## Step 3: Build the Atmosphere

**Scope first.** Create a wrapper class for the page being transformed (e.g., `.boardroom-page`, `.observatory-view`). ALL atmosphere styles go under this scope. Never pollute global styles.

Build in this order:

### Layer 1 — Background Atmosphere
The "wall color" of the room. Use layered gradients:
```css
.page-scope {
  background: linear-gradient([angle], [dark-tone] 0%, [mid-tone] 50%, [deep-tone] 100%);
}
```

### Layer 2 — Light Source
Where is the light coming from? Add a radial gradient:
```css
.page-scope::before {
  content: '';
  position: fixed;
  inset: 0;
  background: radial-gradient(ellipse at [position], [light-color-low-opacity], transparent [radius]);
  pointer-events: none;
}
```

### Layer 3 — Depth/Vignette
Darker edges create enclosure:
```css
.page-vignette {
  position: fixed;
  inset: 0;
  background: radial-gradient(ellipse at center, transparent 40%, rgba(0,0,0,[opacity]) 100%);
  pointer-events: none;
}
```

### Layer 4 — Material Texture
CSS-generated grain, not images:
```css
.page-grain {
  position: fixed;
  inset: 0;
  background-image: radial-gradient([texture-color] [dot-size], transparent [dot-size]);
  background-size: [grid-size] [grid-size];
  opacity: [low-value];
  pointer-events: none;
}
```

### Layer 5 — Surface Materials
Cards, panels, containers that feel like physical objects:
```css
.page-scope .card {
  background: [material-color-with-alpha];
  border: 1px solid [edge-color];
  backdrop-filter: blur([depth]px);
  box-shadow: [shadow-matching-light-source];
}
```

### Layer 6 — Typography Voice
Choose fonts that have character from the metaphor:
- Library/boardroom → serif with weight (Palatino, Georgia, Iowan Old Style)
- Observatory/lab → monospace with precision (JetBrains Mono, IBM Plex Mono)
- Workshop/studio → geometric sans (Futura, Avenir)

### Layer 7 — Ornamental Elements
Small details that reinforce the metaphor:
- Diamond rules (chapter dividers)
- Brass borders (filing cabinet tabs)
- Keyhole icons (entry points)
- Signature lines (form inputs)
- Decorative marks with `aria-hidden="true"`

---

## Step 4: Derive Color from Materials

Do NOT pick hex codes. Pick materials, then find their colors.

For each named material:
1. What color is it in the real world?
2. What's its surface quality? (Matte, glossy, rough, polished)
3. How does it look under the light source you chose in Layer 2?

Create CSS custom properties from materials:
```css
:root {
  --mahogany: #2a1c14;
  --brass: #c9a44a;
  --aged-paper: #f5efe4;
  --leather: #3d2a1e;
  --iron: #66584c;
}
```

Semantic colors inherit from materials:
- Decisions = [material that feels decisive, e.g., "green ink" → forest]
- Actions = [material that feels urgent, e.g., "amber wax seal" → amber]
- Errors = [material that feels cautionary, e.g., "red flag" → oxblood]
- Data = [material that feels factual, e.g., "brass instrument" → brass]

**All color pairs must meet WCAG AA contrast (>= 4.5:1).** Atmosphere does not override accessibility. Ever.

---

## Step 5: Iterate Through 5 Design Cycles (mandatory)

Each cycle has a specific focus and a concrete verification checklist. The agent verifies each cycle's checklist before moving to the next.

**Transform one page at a time.** Start with the most emotionally important page (usually login or the primary view). Establish art direction there, then propagate.

**Each page gets its own scoped class** and 5 cycles. This is slow. That's the point.

---

### Cycle 1: Atmosphere Foundation
**Focus:** Background, color, light source

**Make changes**, then verify:
- [ ] Base background uses a multi-stop gradient (not a flat color)
- [ ] A radial gradient simulates a directional light source (`::before` or `::after`)
- [ ] At least one vignette layer exists (darker edges creating enclosure)
- [ ] All new styles are scoped under the page class (no global pollution)
- [ ] Temperature is consistent (all warm OR all cool OR intentionally mixed)

---

### Cycle 2: Material Texture and Typography
**Focus:** Texture grain, font selection, material-derived colors

**Make changes**, then verify:
- [ ] A CSS-generated grain/texture layer exists (not an image)
- [ ] All colors are defined as CSS custom properties named after physical materials (e.g., `--mahogany`, `--brass`, not `--primary-blue`)
- [ ] All text/background pairs pass WCAG AA contrast (>= 4.5:1 for normal text, >= 3:1 for large text)
- [ ] Display font is NOT a generic default (not Inter, not system-ui for headings)
- [ ] Body font complements the display font without competing

---

### Cycle 3: Surface Materials
**Focus:** Cards, panels, borders, interactive surfaces

**Make changes**, then verify:
- [ ] Cards/panels have `backdrop-filter`, `border`, and `box-shadow` that differ from browser defaults
- [ ] Surface materials feel like physical objects (not flat rectangles)
- [ ] Hover states on interactive surfaces include `transform` (not just color change)
- [ ] Shadow direction is consistent with the light source from Cycle 1
- [ ] Edge treatments (borders, dividers) use material-derived colors

---

### Cycle 4: Ornamental Details and Entrance Animation
**Focus:** Decorative elements, entrance motion, responsive

**Make changes**, then verify:
- [ ] At least one ornamental CSS element exists (divider, decorative pseudo-element, border flourish)
- [ ] Ornamental elements use `aria-hidden` treatment (decorative `content: ''`)
- [ ] At least one entrance `@keyframes` animation exists
- [ ] Entrance animations use staggered delays (80ms+ between elements)
- [ ] `prefers-reduced-motion` media query disables animations

---

### Cycle 5: Final Verification
**Focus:** Consistency, responsiveness, auditor validation

**Verify:**
- [ ] Run the `style-auditor` on the transformed code — score must be >= 35/50
- [ ] All 5 Style dimensions must score >= 5/10 individually
- [ ] Responsive: styles work at mobile width (< 640px) — check for overflow, readability
- [ ] No global style pollution — all selectors scoped under page class
- [ ] The metaphor is identifiable: could a stranger name the place from the code alone?

If the style-auditor score is below 35/50, identify the weakest dimension and apply a targeted fix before proceeding.

---

## Step 6: Set Move Constraints

Before handing off, document the physics personality this metaphor implies:

| Metaphor | Physics | Spring Tension | Mass |
|----------|---------|---------------|------|
| Library/boardroom | Weighty, deliberate | High | Heavy |
| Observatory/space | Floating, weightless | Low | Light |
| Workshop/studio | Snappy, precise | Medium-high | Medium |
| Garden/nature | Organic, flowing | Low-medium | Varied |
| Machine/engine | Mechanical, exact | Very high | Firm |

Record this in the decision log for Move to reference.

---

## Step 7: Report + Handoff

Output a summary:

```
## Style Transformation Results

**Metaphor:** [one-line description]
**Temperature:** [warm/cool/mixed]
**Materials:** [list]
**Pages transformed:** [list with scope classes]

### Scores
| Dimension          | Before | After | Delta  |
|--------------------|--------|-------|--------|
| P — Physical Metaphor | /10   | /10  |        |
| L — Lighting          | /10   | /10  |        |
| A — Animation         | /10   | /10  |        |
| C — Color as Material | /10   | /10  |        |
| E — Enacted Typography| /10   | /10  |        |
| **Total**             | **/50** | **/50** |    |

### Atmosphere Layers Applied
- Background: [description]
- Light source: [position and color]
- Vignette: [strength]
- Texture: [type and density]
- Typography: [display + body fonts]

### Move Physics Profile
- Physics personality: [weighty/floating/snappy/organic/mechanical]
- Recommended spring tension: [high/medium/low]
- Recommended mass: [heavy/medium/light]

### Files Modified
- [list with line ranges]
```

Log to `ade_docs/YYYY-MM-DD-place-transformation.md`.

### Handoff

> Atmosphere is set. Your UI feels like [metaphor]. Want it to feel alive — with physics, feedback loops, and hidden discoveries? Run `$ade-move`.

---

## Atmosphere Failure Diagnostics

If the result feels "off" but you can't pinpoint why, check these:

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| Feels flat despite dark background | No light source (Layer 2 missing) | Add radial gradient simulating directional light |
| Feels muddy/unclear | Too much texture, not enough contrast | Reduce grain opacity, increase text/bg contrast |
| Feels cold when should be warm | Wrong gradient hue | Shift from blue-gray to amber-brown tones |
| Feels cartoonish | Colors too saturated | Desaturate by 20-30%, add muted tones |
| Feels disconnected page to page | Different atmospheres per page | Unify base tone and light source, vary only surface details |
| Animation feels wrong | Physics doesn't match metaphor weight | Heavy metaphor needs slow, deliberate motion; light needs bouncy |
| Text hard to read | Atmosphere overtook accessibility | Check contrast ratios, increase text brightness or add text-shadow |

---

## What NOT to Do

- Do not change the UI structure (layout, hierarchy, components) — that's Build's job
- Do not add interactivity, physics, or discovery — that's Move's job
- Do not change the copy voice — that's Write's job
- Do not use images for atmosphere — CSS only (gradients, blend modes, pseudo-elements)
- Do not sacrifice accessibility for aesthetics — contrast must always pass
- Do not apply atmosphere globally — scope to specific pages
- Do not stop at cycle 1 — the first version is scaffolding, not design
