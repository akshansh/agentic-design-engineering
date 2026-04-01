# ADE Decision Log: [Project Name] — [Date]

## Product Portrait
- **Domain:** [industry/field from Step 0]
- **Interaction pattern:** [primary pattern]
- **User persona:** [who, frequency, emotional state]
- **Emotional weight:** [clinical/professional/playful/high-stakes]
- **Physical analog:** [specific object or place]
- **Confidence:** [High/Medium/Low]
- **Mode:** [Standard/Autonomous]

## Context
- **What was audited/transformed:** [page/component path]
- **Trigger:** [which skill was invoked: /ade:build, /ade:style, /ade:move, /ade:write, /ade:audit, /ade:compound]
- **Starting state:** [brief description — generic? partially styled? broken?]
- **Timestamp:** [ISO 8601]

## Build Decisions
- **Score:** [before] → [after] /50
- **Product type context:** [emergency/enterprise/consumer/high-frequency/data-heavy/communication/e-commerce/educational]
- **Violations fixed:** [list with file:line]
- **Remaining issues:** [if any]
- **Gate status:** [Pass/Fail — if fail, note retry count and fallback applied]

### Build → Style Handoff
- **product_type:** [classification]
- **structural_constraints:** [list]
- **primary_user_action:** [identified emphasis]
- **accessibility_floor:** [AA/AAA]

## Style Decisions
- **Score:** [before] → [after] /50
- **Metaphor chosen:** [one-line description]
- **Materials:** [list of physical materials]
- **Temperature:** [warm/cool/mixed]
- **Light source:** [position and color]
- **Scope class:** [e.g., .boardroom-page]
- **Pages transformed:** [list]
- **Design cycles completed:** [1-5]
- **Metaphor selection:** [User chose / Agent self-selected (autonomous)]
- **Gate status:** [Pass/Fail]

### Style → Move Handoff
- **metaphor:** [one-line]
- **physics_personality:** [weighty/floating/snappy/organic/mechanical]
- **spring_tension:** [high/medium/low]
- **mass:** [heavy/medium/light]
- **color_palette:** [material → hex mappings]

## Move Decisions
- **Score:** [before] → [after] /50
- **Core loop:** [action → response → discovery → next action]
- **Dead spots fixed:** [count and list]
- **Physics profile:** [personality, spring tension, mass]
- **Kinds of fun supported:** [list from MDA: sensation, fantasy, narrative, etc.]
- **Gate status:** [Pass/Fail]
- **Hidden fingerprint:**
  - Type: [key combination / console message / secret page / etc.]
  - Trigger: [how to activate]
  - Reveals: [what the user sees]
  - Philosophy: [why this specific easter egg]
  - Selected because: [product context from Product Portrait]

### Move → Write Handoff
- **interaction_copy:** [list of copy added by Move]
- **easter_egg_triggers:** [text/elements Write must NOT rewrite]

## Write Decisions
- **Score:** [before] → [after] /70 (normalized: /50)
- **Copy elements reviewed:** [count]
- **Rewrites made:** [count]
- **Metaphor language applied:** [yes/no, which metaphor]
- **Voice profile used:** [default / custom profile name]
- **Key changes:** [table of before → after]

## Files Modified
- [file path] — [what changed] — [framework that changed it]

## Final Scores
| Framework | Before | After | Status |
|-----------|--------|-------|--------|
| Build | /50 | /50 | [pass/fail] |
| Style | /50 | /50 | [pass/fail] |
| Move | /50 | /50 | [pass/fail] |
| Write | /70 (/50) | /70 (/50) | [pass/fail] |
| **Combined** | **/200** | **/200** | [tier] |

## Gate Failures (if any)
| Framework | Attempt | Score | Issue | Fallback Applied |
|-----------|---------|-------|-------|-------------------|
| [framework] | [1/2] | [X/50] | [what blocked] | [what fallback was used] |

## Next Steps
- [recommendations for future work]
