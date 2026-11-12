# Cross-Framework Handoff Schema

Each framework produces structured handoff data that the next framework consumes. This prevents ad-hoc parsing and ensures clean data flow.

---

## Build → Style Handoff

After Build completes, pass forward:

```
### Build Handoff
- **product_type:** [emergency | enterprise | consumer | high-frequency | data-heavy | communication | e-commerce | educational]
- **structural_constraints:** [list — e.g., "dense data tables", "long-form content", "complex form wizard"]
- **primary_user_action:** [the ONE action identified by the Emphasis dimension]
- **accessibility_floor:** [AA | AAA] — Style must respect this
- **review:** [status per `skills/shared/review.md`; open blockers: 0 to pass the gate; open defects carried forward]
- **direction_checks:** [the five checks from `ade_docs/direction.md`, each held / not held / not seen — or "no direction note"]
```

---

## Style → Move Handoff

After Style completes, pass forward:

```
### Style Handoff
- **concept_kind:** [place | instrument | material | grammar | data | type | quiet]
- **concept:** [one line — e.g., "A mahogany-paneled boardroom library, after hours, single desk lamp on" for a place; "the peak edge and the band, drawn the same at every size" for a grammar]
- **temperature:** [warm | cool | mixed]
- **materials:** [named physical materials, when the kind has them — e.g., mahogany, brass, aged paper, leather — or "n/a"]
- **fidelity_level:** [0-4 on the Fidelity Ladder — Move should push behavior further toward the concept, never back toward generic]
- **rendering_stack:** [CSS | P5.js | PixiJS | Three.js | SVG+GSAP | WebGL shaders — Move must build on this, not add a competing renderer]
- **physics_personality:** [weighty | floating | snappy | organic | mechanical | minimal — state changes only, for a still, type or quiet concept]
- **spring_tension:** [high | medium | low]
- **mass:** [heavy | medium | light]
- **acoustic_signature:** [one-line room tone + material → sound notes, or "none — reason"] — Move implements earcons from this (see `skills/shared/sound-design.md`)
- **color_palette:** [material → hex mappings — e.g., mahogany → #2a1c14, brass → #c9a44a]
- **scoped_classes:** [list of page scope CSS classes created — e.g., .boardroom-page]
- **evidence_dir:** [path to this run's evidence folder — e.g., ade_docs/evidence/2026-07-05-style/]
- **direction_checks:** [passed through from Build, each held / not held / not seen, with its owner — or "no direction note"]
- **review:** [status; open blockers must be 0; open defects carried forward]
```

---

## Move → Write Handoff

After Move completes, pass forward:

```
### Move Handoff
- **concept_context:** [full Style handoff data, passed through, including direction_checks]
- **core_loop:** [the identified core loop description — e.g., "Browse → Select → Read → Discover → Browse"]
- **interaction_copy:** [list of loading states, tooltips, error messages, feedback text added by Move]
- **easter_egg_triggers:** [text/elements Write must NOT rewrite — e.g., key sequence hints, console messages]
- **sound_layer:** [implemented | skipped — if implemented: toggle location and label, so Write can polish the toggle copy in the place's language without breaking it]
- **review:** [status; open blockers must be 0; open defects carried forward]
```

---

## Usage

- Reference this schema in each framework's SKILL.md handoff section
- The sending framework MUST produce data in this format
- The receiving framework MUST consume this data before starting
- In `ade-compound`, these handoffs happen automatically between steps
- In standalone skill runs, the user or agent provides the context manually
