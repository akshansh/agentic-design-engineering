---
name: ade-review
description: "Review a page against Build, Style, Move and Write without changing it. Looks at renders first, then returns findings (blocker, defect, opportunity) with evidence, two judgements and a status. No scores."
---

# $ade-review — Full Design Review

You run all four ADE auditors on a page and write one review. **This is a review, not a repair.** You do not change code.

The form of every finding, judgement and status is in `skills/shared/review.md`. Read it first.

---

## Step 0: The declared concept

1. Run Step 0 (`skills/shared/step-0-understand.md`) if there is no Product Portrait yet. It reads `ade_docs/direction.md` when one exists.
2. **Recover the declared concept.** In order: the direction note → what the user said when invoking the review → `ade_docs/` decision logs → the Product Portrait.
3. **If no concept is on record, ask ONE question before reviewing:**

   > *"What was this interface supposed to feel like — what concept, place, or experience were you trying to create? (If there was never an intended concept, say 'none' and I'll review for genericness and recommend one.)"*

4. Every finding is measured against the declared concept, not against taste. A perfect boardroom library is a failing review if the owner asked for a spaceship.

## Step 1: Look

Capture the page at 1440 and 390 px in every real state you can reach, to `ade_docs/evidence/YYYY-MM-DD-review/` (`skills/shared/evidence-trail.md`). Write five observations of what is there before you read any code. If nothing can be rendered, the review is `source-inspected only` and cannot return Ready.

## Step 2: Run the auditors

Give each auditor the captures, the files, the concept and its kind, and the direction checks. Run them in framework order:

1. `build-auditor` — structure, accessibility, emphasis (`skills/ade-build/references/build-framework.md`)
2. `style-auditor` — the concept and how fully it is carried; report the fidelity level (`skills/ade-style/references/style-framework.md`)
3. `move-auditor` — response, feedback, physics, sound, easter egg where required (`skills/ade-move/references/move-framework.md`)
4. `write-auditor` — the copy (`skills/ade-write/references/write-framework.md`)

Then run the generated-look checks in `skills/shared/review.md` once across the whole page.

## Step 3: Write the review

Merge the four results into one report in the format of `skills/shared/review.md`. Add:

- **Fidelity level** (0–4) with one line of reasoning
- **Intent match:** one sentence — did they build what they said they wanted?
- **Sound layer:** exists and compliant / absent / inappropriate for this context
- A framework tag on each finding: `[Build]`, `[Style]`, `[Move]`, `[Write]`

Order findings by severity, then by framework order. One status for the page: the least ready of the four.

Log the review to `ade_docs/YYYY-MM-DD-review.md`.

## Step 4: Next step

- **A blocker in one framework:** run that framework's skill (`$ade-build`, `$ade-style`, `$ade-move`, `$ade-write`) to clear it, then review again.
- **Blockers in several, or no concept at all:** `$ade-direct` to set a direction, then `$ade-compound`.
- **Defects only:** list the three that matter most.
- **Ready within inspected scope:** say what was not seen. If the owner uses an outside-in craft review, hand it the direction note and this review.

---

## What NOT to Do

- Do not fix anything or make code changes.
- Do not read code before looking at the render.
- Do not soften a finding to be kind. Do not invent one to look thorough.
- Do not let one framework's strength excuse another's blocker.
- Do not recommend adding features — review what exists.
