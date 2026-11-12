---
name: ade-setup
description: "Post-install readiness check — verifies this project and session can support a full ADE run (rendering stack, evidence capture, prior ADE history, sound feasibility) and recommends the right first command. Read-only: reports, never modifies."
---

# $ade-setup — Readiness Check

You are checking whether this project and this session are ready for an ADE transformation. **You change nothing.** You inspect, you report, you recommend a first command. Do not create `ade_docs/`, do not install packages, do not modify any file.

Narrate briefly as you go — one line per check — then produce the report.

---

## Check 1: Project & rendering stack

Identify what ADE would be working with:

- UI framework: look at `package.json` dependencies (React, Vue, Svelte, Angular) or detect plain HTML/CSS, server-rendered templates, or a native/other stack.
- Styling approach: Tailwind, CSS modules, styled-components, plain CSS, a design system.
- Already-present rendering/animation libraries relevant to Style and Move: GSAP, Motion (motion.dev / framer-motion), Anime.js, P5.js, PixiJS, Three.js, ogl. Present libraries lower the cost of ambitious metaphors — note them.
- Dev server: does the project have a runnable dev command (`dev`, `start`, `serve`)? Which port, if discoverable?

If there is no user-facing UI at all (a pure library, a CLI-only tool), say so plainly — ADE has nothing to transform here — and stop after the report.

## Check 2: Evidence capture capability

The evidence trail (`skills/shared/evidence-trail.md`) needs screenshots. Determine which tier this session supports:

1. **Full capture** — a browser automation tool is available in the session (Playwright/Puppeteer, a browser or screenshot MCP tool, or the host's built-in browser). Confirm by checking the tools available to you, not by guessing.
2. **Dev-server capture** — no dedicated tool, but the project has a dev server and the session can drive a headless browser.
3. **No capture** — headless environment, no browser. ADE runs still work, but every decision log will record "evidence: not captured" and reviews will say `source-inspected only` and cannot return Ready until the work is looked at in an interactive session.

Report the tier and what it means for the run.

## Check 3: Prior ADE history

Look for an existing `ade_docs/` directory:

- Decision logs present? List them by date and framework.
- Is there a Product Portrait or declared concept on record? Quote the concept if found.
- Evidence directories present?

If history exists, the project is mid-transformation: recommend resuming from the next framework in the sequence rather than starting over.

## Check 4: Sound layer feasibility

Do not design anything — just note the gate:

- Is this a product context where sound could ever be appropriate (consumer, creative, portfolio) or one where the Product Portrait will almost certainly gate it off (clinical, enterprise open-plan, high-frequency data entry)?
- Is the app web-based (Web Audio available) or not?

## Check 5: Accessibility baseline

Note whether the project has any accessibility tooling (axe, eslint-plugin-jsx-a11y, pa11y, Storybook a11y addon). Build fixes accessibility first regardless — this just tells the user whether regressions will be caught automatically afterward.

---

## The Readiness Report

Output exactly this structure:

```
## ADE Readiness Report

**Project:** <name> — <UI framework + styling approach>
**Rendering libraries on hand:** <list or "none — Style will select and justify a stack">
**Dev server:** <command + port, or "none found">

**Evidence capture:** <Tier 1/2/3> — <one sentence on what that means for proof>
**ADE history:** <fresh project | resuming: last run was <framework> on <date>, declared concept: "<concept>">
**Sound layer:** <plausible / likely gated off> — decided by the Product Portrait at run time
**Accessibility tooling:** <present: <tools> / none>

**Recommended first command:** <see below>
```

Recommend:

- `$ade-review` — if the project already has deliberate design or prior ADE history (look before touching).
- `$ade-compound` — if the interface is functional but generic and the user wants the full transformation.
- `$ade-build` — if Check 5 or a quick look revealed obvious structural/accessibility problems worth fixing before any atmosphere work.

Close with one line inviting the user to run the recommended command.
