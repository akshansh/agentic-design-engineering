# Agentic Design Engineering

**Transform generic UIs into intentional, inhabited digital places.**

Most AI-built interfaces look the same. Rounded corners, neutral grays, tidy rows of cards. Competent, functional, forgettable. The internet is becoming an office park — every app a different floor of the same building.

Agentic Design Engineering is a structured system for changing that. Four interconnected frameworks — **Build**, **Style**, **Move**, **Write** — that any AI agent can apply to turn default-looking interfaces into spaces that feel crafted, alive, and distinctly human.

This isn't a design system. It's a design *philosophy* with teeth — actionable agent instructions, repair procedures, iteration loops, and evaluation criteria that produce measurably different results.

Works with **Claude Code**, **Cursor**, **OpenAI Codex**, and **GitHub Copilot** · Current release: v3.2 · [Changelog](CHANGELOG.md)

---

## Watch the Walkthrough

[![Agentic Design Engineering — 8 min walkthrough](docs/agentic-design-engineering-video.png)](https://supercut.ai/share/akshansh/C1YmDLwspBPB14BJSHnAMI)

*8 min · The origin story, the four frameworks, and a live install demo.*

---

## Installation

ADE ships in the standard Claude Code plugin format, plus a Codex skills package — and every host can now install it **directly from GitHub, no cloning required**. Pick your host:

```mermaid
flowchart LR
    Repo["akshansh/agentic-design-engineering<br/>on GitHub"] --> Claude["Claude Code"]
    Repo --> Cursor["Cursor"]
    Repo --> Codex["OpenAI Codex<br/>App or CLI"]
    Repo --> Copilot["GitHub Copilot<br/>VS Code or CLI"]

    Claude --> C1["/plugin marketplace add<br/>/plugin install"]
    Cursor --> C2["/add-plugin"]
    Codex --> C3["Add plugin marketplace<br/>from GitHub, then install"]
    Copilot --> C4["Reads the same<br/>Claude-compatible manifests"]

    style Repo fill:#4a3a5c,stroke:#7a6a8c,color:#fff
    style Claude fill:#2d5a3d,stroke:#4a8c5c,color:#fff
    style C1 fill:#dff3e6,stroke:#4a8c5c,color:#1f3b2b
    style Cursor fill:#2a4a6b,stroke:#5282ef,color:#fff
    style C2 fill:#dce8ff,stroke:#5282ef,color:#1e3556
    style Codex fill:#8a5d18,stroke:#c9a44a,color:#fff
    style C3 fill:#f6ecd5,stroke:#c9a44a,color:#5a3b08
    style Copilot fill:#6e3328,stroke:#a04d3e,color:#fff
    style C4 fill:#f4dfdb,stroke:#a04d3e,color:#5a261e
```

### Claude Code

```text
/plugin marketplace add akshansh/agentic-design-engineering
/plugin install agentic-design-engineering
```

Then use slash commands: `/ade:build`, `/ade:style`, `/ade:move`, `/ade:write`, `/ade:audit`, `/ade:compound`

### Cursor

```text
/add-plugin agentic-design-engineering
```

Then use the same slash commands as Claude Code.

### OpenAI Codex (App)

Codex installs plugin marketplaces directly from GitHub:

1. Open **Plugins** from the sidebar.
2. Click **Add plugin marketplace**.
3. Enter Source: `akshansh/agentic-design-engineering` · Git ref: `main` · Sparse paths: leave blank.
4. Click **Add marketplace**.
5. Install **Agentic Design Engineering**, then restart Codex.

### OpenAI Codex (CLI)

```bash
codex plugin marketplace add akshansh/agentic-design-engineering
codex plugin add agentic-design-engineering@ade-marketplace
```

Then use skills: `$ade-build`, `$ade-style`, `$ade-move`, `$ade-write`, `$ade-audit`, `$ade-compound`

### GitHub Copilot

Copilot reads the same Claude-compatible plugin manifests this repo already ships.

**VS Code:** run `Chat: Install Plugin from Source` from the command palette, enter `akshansh/agentic-design-engineering`, and select **agentic-design-engineering**.

**Copilot CLI:**

```text
/plugin marketplace add akshansh/agentic-design-engineering
/plugin install agentic-design-engineering@ade-marketplace
```

### Local development (contributors)

Work from a checkout when developing the plugin itself:

```bash
git clone https://github.com/akshansh/agentic-design-engineering.git
cd agentic-design-engineering
```

**Claude Code** — load the checkout directly:

```bash
claude --plugin-dir "$PWD/plugins/agentic-design-engineering"
```

**Codex CLI** — register the checkout as a local marketplace:

```bash
codex plugin marketplace add "$PWD"
codex plugin add agentic-design-engineering@ade-marketplace
```

**Codex App** — open Codex in the repo root; it discovers `.agents/plugins/marketplace.json` and loads the plugin from `./codex/agentic-design-engineering`. Or, for a persistent personal marketplace outside the checkout, run `./scripts/install-codex.sh` — it copies the Codex package to `~/.codex/plugins/` and registers it in `~/.agents/plugins/marketplace.json`.

Release notes live in `CHANGELOG.md`, so this README stays focused on what the project is and how to install it.

---

## The Four Frameworks

```mermaid
graph LR
    A["Build<br/><i>Does it work?</i>"] --> B["Style<br/><i>Does it feel?</i>"]
    B --> C["Move<br/><i>Does it engage?</i>"]
    C --> D["Write<br/><i>Does it speak?</i>"]

    style A fill:#2d5a3d,stroke:#4a8c5c,color:#fff
    style B fill:#6e3328,stroke:#a04d3e,color:#fff
    style C fill:#8a5d18,stroke:#c9a44a,color:#fff
    style D fill:#2a4a6b,stroke:#5282ef,color:#fff
```

### Build — Structure & Accessibility

*"Before anything else, the interface must be usable."*

Audits and repairs five dimensions: **C**opy, **L**ayout, **E**mphasis, **A**ccessibility, **R**eward. Accessibility issues are fixed first, always. Score target: 40/50. Context-branched for 8 product types — from emergency medical to educational platforms.

Rooted in: Cognitive Load Theory (Sweller), Gestalt Principles, WCAG 2.1, Flow Theory (Csikszentmihalyi)

### Style — Atmosphere & Art Direction

*"Every application inhabits a place. Your job is to discover which place, then build it."*

Transforms generic interfaces into inhabited spaces through physical metaphors — a boardroom with mahogany warmth, a workshop with industrial grit, a garden with organic softness. Real materials. Real light. Real temperature. Even a real sound: every metaphor names its acoustic signature.

Style selects the rendering technology the metaphor demands — layered CSS, P5.js generative art, Three.js environments, SVG+GSAP choreography, or WebGL shaders — and enforces the **Metaphor Fidelity Ladder**: themed labels on generic menus are a costume (level 0-1); the target is level 3+, where navigation, loading, and errors *operate* like the place.

Inspired by: "Build Places, Not Products" (Lucas Crespo), Cora's art direction at Every, P5.js creative coding at Parsons

### Move — Interactivity & Game Design Thinking

*"You can take almost anything, and looking at it the right way, make it a fascinating interactive experience." — Will Wright*

Injects vitality through micro-interactions, physics-based animations (GSAP, Motion.dev, or vanilla CSS — matched to the project stack), discovery layers, an opt-in sound layer of material-derived earcons, and **required easter eggs** — the creator's hidden signature in the work. Inspired by Warren Robinett hiding his name inside Atari's Adventure in 1979.

Rooted in: Will Wright's MasterClass on Game Design, MDA Framework, Csikszentmihalyi's Flow Theory

### Write — Intentional Communication

*"Simplification is kindness. Every unnecessary word is a tiny cruelty."*

Reviews and rewrites UI copy to sound intentional — warm partnership, purpose before action, compassionate errors, metaphor language. Now includes a dedicated auditor for scoring and supports custom voice profiles. Scope: UI copy only.

---

## How They Work Together

```mermaid
graph TD
    subgraph "The Transformation Pipeline"
        S0["0. UNDERSTAND — the codebase"] --> CL["1. Build — Fix structure"]
        CL --> PL["2. Style — Set atmosphere"]
        PL --> AL["3. Move — Inject vitality"]
        AL --> VO["4. Write — Polish copy"]
    end

    style S0 fill:#4a3a5c,stroke:#7a6a8c,color:#fff
    style CL fill:#2d5a3d,stroke:#4a8c5c,color:#fff
    style PL fill:#6e3328,stroke:#a04d3e,color:#fff
    style AL fill:#8a5d18,stroke:#c9a44a,color:#fff
    style VO fill:#2a4a6b,stroke:#5282ef,color:#fff
```

**The order matters:** Build before Style (can't build atmosphere on a broken layout). Style before Move (can't animate elements without materiality). Move before Write (can't write metaphor copy before the metaphor exists). Each framework gates the next.

---

## Commands Reference

| Action | Claude Code / Cursor | Codex |
|--------|----------------------|-------|
| Audit + repair UI structure | `/ade:build` | `$ade-build` |
| Transform atmosphere with metaphor | `/ade:style` | `$ade-style` |
| Inject physics, discovery, easter egg | `/ade:move` | `$ade-move` |
| Rewrite copy with warmth | `/ade:write` | `$ade-write` |
| Score all four frameworks against the declared concept (read-only) | `/ade:audit` | `$ade-audit` |
| Full pipeline: Build → Style → Move → Write | `/ade:compound` | `$ade-compound` |

`/ade:compound` runs in two modes. **Standard** (default) pauses at key decision points — you pick the metaphor, you approve structural changes. **Autonomous** (`--auto`, or just say "surprise me") self-selects and documents its reasoning in the decision log. Every quality gate applies in both modes.

`/ade:audit` opens by recovering the **declared concept** — what this was *supposed* to feel like, from your invocation, previous decision logs, or one targeted question — and scores all four frameworks against that intent. A perfect boardroom library is a failing audit if you asked for a spaceship.

---

## The Agents

Nine specialized agents power the framework skills:

| Agent | Role |
|-------|------|
| `codebase-comprehender` | Scans project structure to build a Product Portrait before any evaluation begins |
| `build-auditor` | Evaluates UI against Build, returns scored violations with file:line references |
| `style-auditor` | Evaluates atmosphere, returns diagnostics + physics profile for Move |
| `move-auditor` | Evaluates interactivity, maps dead spots, verifies easter egg exists |
| `write-auditor` | Evaluates UI copy against 7 voice principles, returns scored findings |
| `metaphor-discoverer` | Suggests 3-5 ranked metaphors — each with materials, temperature, light, and acoustic signature — scored for Transformability |
| `atmosphere-builder` | Selects the rendering technology (CSS → P5.js → Three.js → shaders) and builds the atmosphere from the chosen metaphor + materials |
| `vitality-injector` | Scans code for dead spots, produces physics-based patches via GSAP, Motion.dev, or vanilla CSS |
| `voice-writer` | Reviews UI copy, rewrites generic text with warmth and purpose. Supports custom voice profiles |

In Claude Code and Cursor, these run as dedicated agents. In Codex, they're converted to skills (e.g., `$build-auditor`).

---

## Decision Logging & Evidence Trail

Every execution creates a dated decision log in the project's `ade_docs/` directory. Each log records: Product Portrait, declared concept, metaphor chosen, fidelity level, materials, rendering stack, physics profile, acoustic signature, copy rewrites, easter egg planted, before/after scores with deltas, cross-framework handoff data, gate pass/fail status, and files modified. What gets decided gets documented.

And what gets documented gets **proven**: every run captures a baseline screenshot before any change and saves per-cycle captures to `ade_docs/evidence/`, referenced from the decision log — so anyone can see what the transformation started with and what it became. While working, the agent narrates each phase in real time instead of dumping a report at the end.

---

## Repository Structure

```mermaid
flowchart TD
    Root["agentic-design-engineering/"] --> ClaudeCursor["Claude + Cursor package<br/>plugins/agentic-design-engineering"]
    Root --> Codex["Codex package<br/>codex/agentic-design-engineering"]
    Root --> Marketplace["Marketplace files<br/>.agents / .claude-plugin / .cursor-plugin"]
    Root --> Support["Docs + installer<br/>CHANGELOG.md / scripts/install-codex.sh"]

    ClaudeCursor --> ClaudeFiles["agents/<br/>skills/<br/>.claude-plugin/plugin.json<br/>.cursor-plugin/plugin.json"]
    Codex --> CodexFiles["skills/<br/>docs/<br/>.codex-plugin/plugin.json"]

    style Root fill:#4a3a5c,stroke:#7a6a8c,color:#fff
    style ClaudeCursor fill:#2d5a3d,stroke:#4a8c5c,color:#fff
    style ClaudeFiles fill:#dff3e6,stroke:#4a8c5c,color:#1f3b2b
    style Codex fill:#8a5d18,stroke:#c9a44a,color:#fff
    style CodexFiles fill:#f6ecd5,stroke:#c9a44a,color:#5a3b08
    style Marketplace fill:#6e3328,stroke:#a04d3e,color:#fff
    style Support fill:#2a4a6b,stroke:#5282ef,color:#fff
```

```
agentic-design-engineering/
│
├── plugins/                              # Claude Code + Cursor plugin
│   └── agentic-design-engineering/
│       ├── .claude-plugin/plugin.json    # Claude Code manifest
│       ├── .cursor-plugin/plugin.json    # Cursor manifest
│       ├── AGENTS.md                     # Agent registry + compliance rules
│       ├── CLAUDE.md                     # Quick reference
│       ├── README.md                     # Plugin documentation
│       ├── agents/
│       │   ├── analysis/                 # 1 understand agent
│       │   ├── review/                   # 4 auditor agents
│       │   ├── design/                   # 3 builder agents
│       │   └── voice/                    # 1 voice agent
│       ├── skills/
│       │   ├── shared/                   # Step 0, handoff schema, sound design, evidence trail
│       │   ├── ade-build/                # + references/build-framework.md
│       │   ├── ade-style/                # + references/style-framework.md
│       │   ├── ade-move/                # + references/move-framework.md
│       │   ├── ade-write/                # + references/write-framework.md
│       │   ├── ade-audit/
│       │   └── ade-compound/
│       ├── rules/                        # Cursor rules (.mdc)
│       │   └── ade-conventions.mdc       # Framework ordering + quality gates
│       └── docs/                         # Decision log template
│
├── codex/                                # OpenAI Codex plugin
│   └── agentic-design-engineering/
│       ├── .codex-plugin/plugin.json     # Codex manifest
│       ├── AGENTS.md                     # Codex project instructions
│       ├── skills/
│       │   ├── shared/                   # Step 0, handoff schema, sound design, evidence trail
│       │   ├── ade-build/                # 6 framework skills (adapted)
│       │   ├── ade-style/                #   + references/
│       │   ├── ade-move/
│       │   ├── ade-write/
│       │   ├── ade-audit/
│       │   ├── ade-compound/
│       │   ├── build-auditor/            # 9 specialist skills
│       │   ├── style-auditor/
│       │   ├── move-auditor/
│       │   ├── write-auditor/            # NEW
│       │   ├── codebase-comprehender/    # NEW
│       │   ├── metaphor-discoverer/
│       │   ├── atmosphere-builder/
│       │   ├── vitality-injector/
│       │   └── akshansh-voice/           # (voice-writer)
│       └── docs/                         # Decision log template
│
├── .claude-plugin/marketplace.json       # Claude Code marketplace entry
├── .cursor-plugin/marketplace.json       # Cursor marketplace entry
├── .agents/plugins/marketplace.json      # Codex marketplace entry
├── .gitignore
├── LICENSE                               # MIT
└── README.md                             # This file
```

---

## The Origin Story

This started with a meeting archive. Venus Remedies had 94 management meetings spanning 6 years — institutional memory trapped in PDFs. The app built to browse them worked perfectly. And felt like nothing.

The question that changed everything: *What if this login page wasn't a form — but a heavy wooden door to a private boardroom?*

Five design iterations later, the app had mahogany atmosphere, brass accents, candlelight warmth, and a keyhole ornament on the login page. It felt like entering institutional memory. Not viewing it.

The frameworks built to get there became Agentic Design Engineering.

---

## Inspired By

- **[Compound Engineering](https://github.com/EveryInc/compound-engineering-plugin)** by Kieran Klaassen at Every — the model for plugin architecture and agentic workflows
- **["Build Places, Not Products"](https://every.to/source-code/build-places-not-products)** by Lucas Crespo — the philosophy that software should feel like somewhere you want to stay
- **Will Wright's MasterClass on Game Design** — game loops, agency, emergence, and the idea that simple rules create complex, surprising outcomes
- **Warren Robinett's Adventure (1979)** — the first easter egg in any video game, and the inspiration for Move's hidden fingerprint requirement
- **Ready Player One** by Ernest Cline — hidden layers that reward the deeply curious

---

## Author

**Akshansh Chaudhary** — [akshansh.net](https://akshansh.net)

ED & CTO at Venus Remedies. Parsons School of Design + BITS Pilani. Building bridges between traditional industries and human-centered technology.

*"Simplification is kindness. Structure creates clarity. Purpose drives action."*

Learn. Share. Repeat.

---

## License

MIT — Use it. Break it. Make it better. Build places, not products.
