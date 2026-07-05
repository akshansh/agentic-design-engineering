# The Evidence Trail — Prove the Transformation

**A score in a log says the design improved. A screenshot pair proves it.**

Every ADE run must leave behind evidence that a human (or a future agent) can inspect without re-running anything: what the interface looked like before, what was decided, what it looked like after each meaningful step, and why. Decision logs record the *reasoning*; the evidence trail records the *reality*.

---

## Directory Convention

All evidence lives inside the project's `ade_docs/` directory, next to the decision logs:

```
ade_docs/
├── 2026-07-05-style-transformation.md      # decision log (existing convention)
└── evidence/
    └── 2026-07-05-style/
        ├── 00-baseline.png                  # REQUIRED — before anything changes
        ├── 01-cycle1-atmosphere.png
        ├── 02-cycle2-materials-type.png
        ├── 03-cycle3-surfaces.png
        ├── 04-cycle4-ornament-motion.png
        ├── 05-cycle5-final.png              # REQUIRED — the end state
        └── notes.md                         # one line per image: what changed and why
```

Naming: `NN-<step>-<focus>.png` — numbered so the sequence reads as a story in any file browser.

## How to Capture

Use whatever the environment provides, in this order of preference:

1. **A browser automation tool available in the session** (Playwright/Puppeteer MCP, `ce-test-browser`, or the host's screenshot tool) — screenshot the actual rendered page at desktop width (1440px) and mobile width (390px) for the final state.
2. **A dev server + headless capture** — if the project has `npm run dev`, boot it, capture, shut it down.
3. **If no rendering is possible** (headless environment, no browser): record that explicitly in the decision log — *"Evidence: not captured — no browser available in this session. Re-run `/ade:audit` in an interactive session to capture."* Never silently skip.

## What Each Framework Captures

| Framework | Required Evidence |
|-----------|-------------------|
| **Build** | Baseline + after-repair (2 images minimum) |
| **Style** | Baseline + one per design cycle + final (7 images) — the cycle discipline already demands screenshots; save them instead of discarding |
| **Move** | Baseline + final. Motion can't be screenshotted — record a short screen capture if tooling allows, otherwise describe each injection's trigger in `notes.md` so a human can reproduce it by hand |
| **Write** | Before/after copy table in the decision log (text is its own evidence — no images needed) |
| **Audit** | Baseline screenshot attached to the audit report, so the score has a face |

## Referencing Evidence in Decision Logs

Every decision log links its evidence inline, telling the story from starting point to result:

```markdown
### Evidence
| Stage | Image | What changed |
|-------|-------|--------------|
| Baseline | [00-baseline.png](evidence/2026-07-05-style/00-baseline.png) | Starting point: white background, default cards, system font |
| Cycle 1 | [01-cycle1-atmosphere.png](evidence/2026-07-05-style/01-cycle1-atmosphere.png) | Mahogany gradient base, desk-lamp light source, vignette |
| ... | ... | ... |
| Final | [05-cycle5-final.png](evidence/2026-07-05-style/05-cycle5-final.png) | Fidelity level 3; a stranger can name the room |
```

## Real-Time Narration

The evidence trail has a live counterpart: **narrate while working.** Before each phase, tell the user in one line what is about to happen and why; after it, one line on what changed and what the evidence shows. Pattern:

> **Cycle 2 — material texture and typography.** Swapping Inter for Iowan Old Style and adding canvas grain, because the reference photos all share a printed-paper warmth.
> *(...changes applied, screenshot captured...)*
> Captured `02-cycle2-materials-type.png` — the grain reads clearly at full size; heading now carries the ledger voice. Weakest remaining element: the buttons still look stock. That's Cycle 3.

Never work silently through five cycles and dump a report at the end. The user should be able to stop, redirect, or approve at every visible step — that is what makes this *agentic* design engineering rather than batch generation.

## Rules

1. **Baseline before any change — always.** An after without a before proves nothing.
2. **Evidence is append-only.** Never overwrite a previous run's directory; each run gets its own dated folder.
3. **`notes.md` is mandatory** — one line per image. Images without context rot instantly.
4. **Reference evidence from the decision log** — a log that doesn't link its images is incomplete.
5. **Honesty over beauty.** If a cycle made things worse, capture it and say so — the failed frame is often the most instructive one in the trail.
