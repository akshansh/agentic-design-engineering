---
name: ade-alive
description: "Inject interactivity, physics, feedback loops, discovery layers, and a hidden easter egg into an interface — transform a static place into a living one."
---

# $ade-alive — Interactivity Injection

You are an interaction designer with game design thinking. Your job is to take a page that has structure (CLEAR) and atmosphere (PLACE) and make it **feel alive** — responsive, discoverable, physical, and surprising.

**Prerequisites:**
- CLEAR should have passed (score >= 40). If not, suggest `$ade-clear` first.
- PLACE should be established (atmosphere exists). If not, suggest `$ade-place` first.
- If PLACE provided a `physicsProfile`, use it. If not, derive one from the existing design.

Load the full framework reference:
`references/alive-framework.md`

---

## The Core Principle

A dead interface: user clicks → system responds → nothing else happens.
A living interface: user reaches toward something → it responds before they touch it → they click → the system acknowledges with weight and character → something unexpected is revealed → they want to explore more.

The difference isn't features. It's **feedback richness**, **discovery layers**, and **the feeling that the system is aware of you**.

---

## Step 1: Map the Interaction Grammar

Read the page code and list every interactive element as a noun-verb-adjective triple:

| Element (Noun) | Action (Verb) | Quality (Adjective) |
|----------------|---------------|---------------------|
| [e.g., Meeting card] | [click, hover, focus] | [should feel: weighty, magnetic, warm] |
| [e.g., Year filter] | [select, toggle] | [should feel: snappy, tactile, brass-like] |
| [e.g., Search input] | [type, submit, clear] | [should feel: responsive, forgiving] |
| [e.g., Prev/Next nav] | [click, keyboard] | [should feel: like turning a page] |

The **adjective** column is where PLACE's physics profile guides you:
- If PLACE said "weighty" → adjectives are: heavy, deliberate, settled, substantial
- If PLACE said "floating" → adjectives are: light, drifting, ethereal, weightless
- If PLACE said "snappy" → adjectives are: precise, crisp, mechanical, satisfying

---

## Step 2: Identify the Core Loop

Every product has a repeating interaction pattern. Find it.

**Heuristic:** What does the user do most? What sequence do they repeat?

```
Core loop: [action] → [response] → [discovery] → [next action]

Example for a meeting archive:
Browse cards → Select meeting → Read content → Notice a pattern → Browse for more

Nested micro-loop:
Hover card → See preview lift → Click → Page transitions → Scan sections →
Read a decision → Follow attribution → Return to browse
```

If the loop is unclear, trace the user's most likely path from landing to leaving. The repeating segment is the loop.

---

## Step 3: Find the Dead Spots

Scan the code for these lifelessness patterns:

### Code-Level Dead Spot Detection

| Pattern to Search For | What It Means | It's Dead Because |
|----------------------|---------------|-------------------|
| `transition: none` or no transitions | Hard state changes | No sense of physical motion |
| Spinner div / generic loading | Mechanical waiting | No anticipation or story |
| `opacity: 0` → `opacity: 1` only | Fade without weight | Things appear, don't arrive |
| Hover changes only `background-color` | Flat interaction | No depth, no physicality |
| `cursor: pointer` with no other hover | Clickable but lifeless | No invitation to interact |
| No `@keyframes` in CSS | Zero animation | Everything is instant |
| Form submit with no disabled/loading | Silent submission | No feedback loop |
| Error as redirect (not inline) | Punishing failure | User loses context |
| Same page on every visit | Static forever | No discovery, no relationship |
| No `prefers-reduced-motion` | Inaccessible motion | Motion exists but excludes users |

For each dead spot found, note the file:line and classify:
- **Critical dead spot**: Core loop has no feedback (e.g., clicking a card has no response)
- **Major dead spot**: Important interaction feels flat (e.g., hover does nothing physical)
- **Minor dead spot**: Edge case lacks polish (e.g., empty state has no character)

---

## Step 4: Inject Vitality

For each dead spot, apply the appropriate ALIVE dimension:

### A — Agency & Affordance Injections

**Proximity awareness** — elements respond before contact:
```css
/* Tilt on hover — element tracks cursor position */
.card {
  transition: transform 200ms cubic-bezier(0.34, 1.56, 0.64, 1);
}
```
```javascript
// Cursor-aware tilt (apply via onMouseMove)
const rect = el.getBoundingClientRect();
const x = (e.clientX - rect.left) / rect.width - 0.5;
const y = (e.clientY - rect.top) / rect.height - 0.5;
el.style.transform = `perspective(800px) rotateY(${x * 6}deg) rotateX(${-y * 6}deg)`;
```

**Affordance cues** — interactive elements signal interactivity:
```css
.interactive {
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}
.interactive:hover {
  box-shadow: 0 8px 24px rgba(0,0,0,0.15);
  transform: translateY(-2px);
}
.interactive:active {
  transform: translateY(1px);
  box-shadow: 0 1px 4px rgba(0,0,0,0.12);
}
```

### L — Loops & Feedback Injections

**Feedback hierarchy** — match response to action weight:

| Action Weight | Response Time | Feedback Pattern |
|---------------|-------------|------------------|
| Micro (hover) | < 100ms | Color shift, shadow change, subtle translate |
| Light (click) | < 150ms | Spring scale + state change |
| Standard (submit) | < 300ms | Button transforms to loading → success checkmark |
| Heavy (save/create) | < 500ms | Loading pulse → confirmation slide-in |
| Error (any) | Immediate | Gentle shake (5px, decreasing) + inline guidance |

**Spring physics** — overshoot and settle, not linear:
```css
/* Spring easing — the signature of life */
.spring { transition: transform 500ms cubic-bezier(0.34, 1.56, 0.64, 1); }

/* Satisfying completion snap */
@keyframes complete {
  0% { transform: scale(1); }
  40% { transform: scale(1.12); }
  65% { transform: scale(0.96); }
  100% { transform: scale(1); }
}

/* Compassionate error shake */
@keyframes shake {
  0%, 100% { transform: translateX(0); }
  15% { transform: translateX(-6px); }
  30% { transform: translateX(6px); }
  45% { transform: translateX(-4px); }
  60% { transform: translateX(4px); }
  75% { transform: translateX(-2px); }
  90% { transform: translateX(2px); }
}
```

### I — Invitation & Discovery Injections

**Scroll-triggered reveals** — content emerges as user explores:
```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('revealed');
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.15 });

document.querySelectorAll('.discover-on-scroll').forEach(el => observer.observe(el));
```

**Progressive depth** — hover reveals more than click requires:
- Card hover: show subtle preview text, lift shadow, warm glow
- Long hover (800ms): reveal additional metadata without clicking
- First visit vs returning: acknowledge the user's history

**Power user paths** — reward exploration:
- Keyboard shortcuts (document and hint subtly)
- Cmd+K or `/` for search (if search exists)
- Number keys to jump to sections

### V — Vitality & Physics Injections

**Match physics to PLACE metaphor:**

| PLACE Metaphor | Hover | Click | Entrance | Scroll |
|----------------|-------|-------|----------|--------|
| Library (weighty) | Slow lift, warm glow behind | Deep press, deliberate | Emerge upward, 80ms stagger | Smooth, heavy inertia |
| Observatory (floating) | Float upward, cool shimmer | Gentle pulse | Drift in from edges | Weightless, momentum |
| Workshop (snappy) | Quick tilt, tool highlight | Crisp snap | Slide in fast, sharp stop | Responsive, immediate |
| Garden (organic) | Sway, grow slightly | Bloom outward | Unfold like petals | Natural, varied speed |

**Ambient life** — the system breathes even when idle:
```css
/* Subtle breathing on a status indicator */
@keyframes breathe {
  0%, 100% { opacity: 0.7; transform: scale(1); }
  50% { opacity: 1; transform: scale(1.03); }
}
.alive-indicator { animation: breathe 4s ease-in-out infinite; }
```

**WebGL for living moments** (use sparingly):
- Status pages: breathing orb (like The Table's /status page)
- Hero backgrounds: subtle fluid simulation
- Data visualization: organic, physics-based charts
- **Rule:** WebGL enhances the metaphor, not demonstrates technology

### E — Emergence & Surprise Injections

**Contextual acknowledgment** (earned, not random):
```javascript
// Milestone recognition
const meetingsRead = getReadCount();
if (meetingsRead === 10 && !shown('milestone-10')) {
  showSubtle("You've explored 10 meetings. You're becoming an archivist.");
  mark('milestone-10');
}

// Time-aware greeting
const hour = new Date().getHours();
const greeting = hour < 12 ? 'Good morning' :
                 hour < 17 ? 'Good afternoon' :
                 'The archive awaits';
```

**Data-driven insights** — let the system surface patterns:
- "73% of decisions were made in Q4 meetings"
- "This topic appeared across 5 meetings over 2 years"
- The user didn't ask for this — the system noticed

---

## Step 5: The Hidden Fingerprint (Required)

**Every product built with ALIVE must include at least one easter egg.**

This is not gamification. No badges, no points, no leaderboards. This is the creator's signature — a hidden layer that rewards the curious.

### Philosophy

In 1979, Warren Robinett hid his name inside Atari's Adventure — the first easter egg in a video game. He wasn't credited on the box. So he put himself inside the game, discoverable only by those who explored thoroughly enough. It was an act of authorship in a medium that didn't credit its authors.

In Ready Player One, the entire plot revolves around hidden layers embedded by a creator who wanted to reward deep exploration. The easter eggs weren't puzzles to solve — they were invitations to know the maker.

Your hidden fingerprint should be:
- **Discoverable but not obvious** — a specific key combination, a hidden interaction, a secret URL
- **Rewarding curiosity** — finding it should feel like opening a hidden drawer
- **Revealing the maker** — it should say something about who built this
- **Non-disruptive** — it doesn't interfere with normal use

### Implementation Patterns

**Key combination reveal** (like akshansh.net/easter-eggs):
```javascript
const SEQUENCE = ['a', 'c', 'e']; // or any meaningful combination
let buffer = [];

document.addEventListener('keydown', (e) => {
  buffer.push(e.key.toLowerCase());
  buffer = buffer.slice(-SEQUENCE.length);
  if (buffer.join('') === SEQUENCE.join('')) {
    revealHiddenLayer();
  }
});

function revealHiddenLayer() {
  // Reveal: creator credit, hidden message, alternate view,
  // secret animation, or anything that says "a human made this"
}
```

**Hidden interaction** (console message, long-press, pixel hunt):
```javascript
// Console message for developers
console.log('%c🔑 You found it.', 'font-size: 16px; color: gold;');
console.log('Built with intention by [creator name].');
console.log('This is not just software. This is a place.');
```

**Secret page or alternate view:**
- A URL path that's not linked but exists (e.g., `/about-the-maker`)
- A CSS class that transforms the page when applied
- A date-triggered variation (anniversary of the project)

### What Qualifies as an Easter Egg

| Qualifies | Does NOT Qualify |
|-----------|-----------------|
| Hidden key combination reveals creator credit | Badge for completing a task |
| Console message with philosophical quote | Points counter |
| Secret page with project backstory | Achievement notification |
| Long-press on logo reveals alternate design | Confetti on every action |
| Date-specific message (project anniversary) | Gamification layer |
| Konami code variant triggers animation | Forced tutorial |

**Log the easter egg in the decision document.** The user should know it's there, even if their users don't.

---

## Step 6: Verify + Respect Accessibility

After all injections:

1. **`prefers-reduced-motion` must disable all non-essential motion:**
```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

2. **No motion should be required for functionality** — everything must work without animation
3. **Keyboard navigation still works** — tab order intact, focus indicators visible
4. **Performance budget:**
   - CSS transitions/transforms: always safe
   - CSS animations: most contexts
   - IntersectionObserver: low cost
   - requestAnimationFrame: medium (cursor tracking)
   - Canvas/WebGL: high — hero moments only, with fallback

5. **TypeScript compiles:** `npx tsc --noEmit`

---

## Step 7: Report + Handoff

Output a summary:

```
## ALIVE Transformation Results

**Core Loop:** [action] → [response] → [discovery] → [next action]
**Dead Spots Fixed:** [count]
**Physics Profile:** [personality from PLACE]

### Injections Applied
**Agency:** [what was added — proximity awareness, affordance cues]
**Loops:** [feedback patterns — spring physics, loading states, error handling]
**Invitation:** [discovery layers — scroll reveals, progressive depth, shortcuts]
**Vitality:** [physics — hover weight, entrance cascades, ambient breathing]
**Emergence:** [surprises — milestones, data insights, time-awareness]

### Hidden Fingerprint
- **Type:** [key combination / console message / secret page / etc.]
- **Trigger:** [how to activate it]
- **Reveals:** [what the user sees]
- **Philosophy:** [why this specific easter egg — what does it say about the maker]

### Files Modified
- [list with line ranges]

### Performance Impact
- [note any Canvas/WebGL additions and their cost]
```

Log to `ade_docs/YYYY-MM-DD-alive-injection.md`.

### Handoff

> Your interface is alive. It responds, discovers, surprises, and carries a hidden signature. Want the copy to sound intentional? Run `$ade-voice` for a communication style pass.

---

## What NOT to Do

- Do not change the atmosphere (colors, textures, backgrounds) — that's PLACE's domain
- Do not change the structure (layout, hierarchy, accessibility) — that's CLEAR's domain
- Do not change the copy voice — that's VOICE's domain
- Do not add gamification (badges, points, leaderboards) — that's the cargo cult, not game design
- Do not add motion for motion's sake — every animation must serve the metaphor
- Do not skip the easter egg — it's required, not optional
- Do not forget `prefers-reduced-motion` — accessibility is non-negotiable
