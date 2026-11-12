# Technique Neutrality

*A design is judged against its declared concept, never against a list of effects.*

ADE's frameworks describe many techniques: layered gradients, a directional light source, a vignette, grain, backdrop blur, hover transforms, ornament, entrance animation, ambient idle motion, sound, metaphor copy, a hidden easter egg. Each of them is a way to carry a concept. None of them is a requirement.

## The rule

1. **Name the concept first, and its kind.** A place is one kind. There are six others:

   | Kind | The interface is organised by | Style builds |
   |------|-------------------------------|--------------|
   | Place | a room and its objects | the room: metaphor discovery, materials, light |
   | Instrument | the way a tool is operated | controls, readouts and the order you use them in |
   | Material | one substance and how it behaves | that substance's surface, edge and response |
   | Grammar | a small set of drawn rules | the rules, applied the same way at every size |
   | Data | the shape of the information itself | layout and marks taken from the data |
   | Type | words and their setting alone | a type system: faces, sizes, measure, rhythm |
   | Quiet | removing everything but the task | the task, and nothing that competes with it |

   The kind comes from the direction note when one exists (`ade_docs/direction.md`). Metaphor discovery runs only for a place.
2. **Derive the checks from the concept.** Ask what this concept needs in order to be felt and used. Check for that.
3. **Absence is not a defect.** A white ground, a flat colour, a familiar typeface chosen on purpose, a page that does not move, a product with no sound and no easter egg can each be exactly right. Never raise a finding because a technique is missing when the concept does not call for it.
4. **Presence is not a merit.** A gradient, a spring or a texture that the concept does not need is decoration. Say so.
5. **Write the decision down.** When a technique is left out on purpose, record `n/a — [reason]` so the next reader knows it was a choice.

## What still holds

- The Fidelity Ladder: whatever the kind, the concept must change how the interface behaves (level 3), not only how it is painted.
- Accessibility, real task flows and honest evidence are never optional.
- Sound stays opt-in and off by default.
- Project law outranks this file: if a project requires an easter egg, a texture or a motion signature, that requirement stands for that project.

## Why this exists

Before 0.3.4 the auditors scored zero for a white or grey ground, for a flat single-colour background, for a page with no entrance animation and for a missing easter egg. Those rules encoded one look, a dim warm room, as if it were the method. Restrained, typographic and data-led work failed automatically. House guidance of 28 October 2026 ruled that out; this file is that ruling in the repository.
