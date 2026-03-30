# Cross-Framework Handoff Schema

Each framework produces structured handoff data that the next framework consumes. This prevents ad-hoc parsing and ensures clean data flow.

---

## CLEAR → PLACE Handoff

After CLEAR completes, pass forward:

```
### CLEAR Handoff
- **product_type:** [emergency | enterprise | consumer | high-frequency | data-heavy | communication | e-commerce | educational]
- **structural_constraints:** [list — e.g., "dense data tables", "long-form content", "complex form wizard"]
- **primary_user_action:** [the ONE action identified by the Emphasis dimension]
- **accessibility_floor:** [AA | AAA] — PLACE must respect this
- **clear_score:** [X/50]
```

---

## PLACE → ALIVE Handoff

After PLACE completes, pass forward:

```
### PLACE Handoff
- **metaphor:** [one-line description — e.g., "A mahogany-paneled boardroom library, after hours, single desk lamp on"]
- **temperature:** [warm | cool | mixed]
- **materials:** [list of named physical materials — e.g., mahogany, brass, aged paper, leather]
- **physics_personality:** [weighty | floating | snappy | organic | mechanical]
- **spring_tension:** [high | medium | low]
- **mass:** [heavy | medium | light]
- **color_palette:** [material → hex mappings — e.g., mahogany → #2a1c14, brass → #c9a44a]
- **scoped_classes:** [list of page scope CSS classes created — e.g., .boardroom-page]
- **place_score:** [X/50]
```

---

## ALIVE → VOICE Handoff

After ALIVE completes, pass forward:

```
### ALIVE Handoff
- **metaphor_context:** [full PLACE handoff data, passed through]
- **core_loop:** [the identified core loop description — e.g., "Browse → Select → Read → Discover → Browse"]
- **interaction_copy:** [list of loading states, tooltips, error messages, feedback text added by ALIVE]
- **easter_egg_triggers:** [text/elements VOICE must NOT rewrite — e.g., key sequence hints, console messages]
- **alive_score:** [X/50]
```

---

## Usage

- Reference this schema in each framework's SKILL.md handoff section
- The sending framework MUST produce data in this format
- The receiving framework MUST consume this data before starting
- In `ade-transform`, these handoffs happen automatically between steps
- In standalone skill runs, the user or agent provides the context manually
