# The Review

*How every ADE auditor, every gate between frameworks and `$ade-review` report. There are no scores.*

A number out of 50 hid what was wrong and let a strong part pay for a broken one. A review names what is wrong, where, how sure we are, and what to do about it.

## 1. Look first

1. **Render before reading code.** Capture the page at **1440 and 390 px wide**, in every real state you review: default, empty, loading, long content, error, success, and hover and focus where they matter. Save the captures to the evidence trail (`skills/shared/evidence-trail.md`).
2. **Write what you see** before you open the source. Read code only to find where a repair goes.
3. **No capture, say so.** If nothing can be rendered, the first line of the review is `Evidence: source-inspected only`. A source-inspected review can return Needs revision or Blocked. It cannot return Ready.

## 2. Read what is given

- **The direction note** (`ade_docs/direction.md`, from `$ade-direct`), if it exists. Its chosen direction is the declared concept. Its kind (place, instrument, material, grammar, data, type, quiet) sets what the checks mean. Its five checks are reported first, each `held`, `not held` or `not seen`. A check not held is a blocker.
- The Product Portrait and any project law. Project law outranks this file.

## 3. Findings

Each finding states:

- **Where:** screen, state and width; `file:line` once located.
- **What is seen:** what is there, not what should be.
- **Why it matters,** and the check it fails.
- **Severity:**
  - **blocker** — the work cannot move on or ship: an accessibility failure, a broken task, a direction check not held, something that contradicts the declared concept.
  - **defect** — wrong; repair it in this pass.
  - **opportunity** — would make it better; optional.
- **Evidence class:** source-inspected, render-observed, behaviour-tested, user-tested or specialist-reviewed. One never stands in for another.
- **The repair:** exact enough to do without asking.

Also list **what must survive**: the strengths a repair must not damage.

## 4. Two judgements

- **Creative integrity:** is the concept right, and is it the owner's?
- **Professional craft:** is it resolved?

One or two sentences each. They never offset: good craft does not excuse a borrowed idea, and a good idea does not excuse a broken form. No totals, no averages.

## 5. Status

| Status | When |
|--------|------|
| **Ready within inspected scope** | Rendered, no open blocker or defect in what was seen |
| **Needs revision** | Open blockers or defects, each with its repair |
| **Blocked** | Cannot go on without something outside the work: an owner's ruling, access, a broken build |
| **Unverified** | Not seen well enough to judge, e.g. source-inspected only with nothing found |

Always say what was not seen.

## 6. The gate

Between frameworks the gate is **no open blocker**. Defects travel forward in the decision log. Two repair rounds, each looked at again. If a blocker survives the second round, stop and report it: the concept may be the problem, so go back to Style or `$ade-direct`. Autonomous mode obeys the gate.

## 7. Generated-look checks

Raise a finding for any default nobody chose: everything centred; rows of identical rounded cards; a gradient or glow with no job; a generic icon set; stock flat-vector people; copy that could sit on any website; one layout repeated down the page; pictures that read as generated.

Five habits recur in agent-made work. Check for each:

1. A generated room or scene standing in for the real place, product or people.
2. One page shell shared by products or brands that should differ.
3. One placeholder repeated where real content belongs.
4. The small end of the size ladder never shown: the 16 px icon, the 390 px screen, the dense table.
5. Build marks on the reader's page: version stamps, CURRENT labels, TODOs, test data, notes meant for the builder.

A familiar part chosen on purpose is not a finding. If you raise one, say why you think it was not chosen.

## 8. Report

```
## Review — [page or scope]
Evidence: [render-observed at 1440 and 390: states … | source-inspected only]
Not seen: [states, widths, motion, sound, real devices]
Declared concept: [verbatim, or "none — reviewing for genericness"] · Kind: [kind]

### Direction checks
1. [check] — held / not held / not seen — [what was seen]

### What must survive
- …

### Findings
| # | Where | Seen | Why / check | Severity | Evidence | Repair |

### Judgements
Creative integrity: …
Professional craft: …

### Status
[Ready within inspected scope | Needs revision | Blocked | Unverified]
```

## Works with an outside-in craft review

ADE works from the inside out: the owner's taste decides what the work is. An outside-in craft review, one that holds the work against what leading studios do, decides whether it is finished. If the owner uses one, run ADE first and hand over `ade_docs/direction.md` and this review. Each finding keeps its evidence class, so the craft review knows which claims were seen on a render and which were read from source.
