---
name: ade:direct
description: "Taste first — before any design work, turn the owner's own thought, feeling and references into one direction with five checks (ade_docs/direction.md). Run it again after work exists as a taste pass: is the thought there, is the feeling there, is it theirs? Works for any medium, not only UI."
argument-hint: "[what is being designed — or 'pass' plus a path or URL to review existing work]"
---

# /ade:direct — Taste First

ADE begins with a person, not a pattern. Before Build, Style, Move or Write touch anything, this skill finds four things: what the owner thinks, what they want someone to feel, what they bring to the work from their own world, and the one decision that makes it theirs. Everything after is the execution of that.

Two modes:

- **Brainstorm** (default) — before work starts. Output: `ade_docs/direction.md`.
- **Pass** — after work exists, when the question is "does this feel like mine?". Invoke with `pass`. Output: a short taste report in the decision log.

It works for any medium: a screen, a deck, a brand board, an installation.

Narrate as you go: one line before each step, one line after (`skills/shared/evidence-trail.md`).

## What this skill is not

- Not a craft review. `/ade:review` does that, and an outside-in craft review, if the owner uses one, holds the result against leading studios.
- Not a survey of other people's design. No competitor moodboards here. The feed is the owner's own world.

---

## Brainstorm

### Step 1: Gather the owner's words

Look, in this order: the invocation text → `ade_docs/` (an earlier direction note, decision logs, a declared concept) → a taste file if the owner keeps one (`ade_docs/taste.md` or `TASTE.md`) → the README, brief or brand files in the project.

Quote what you find. Do not tidy it into something smoother.

If nothing on record says what a person should feel and understand, ask ONE question:

> *"What should someone feel in the first five seconds, and what should they understand that they did not before?"*

In autonomous mode with nobody to ask: write your assumption as the first line of the direction note, marked `ASSUMED`, and continue.

### Step 2: The thought

One sentence: what will a person understand that they did not before? If the sentence cannot be written, there is no design yet. Say so and stop.

### Step 3: The feeling

One feeling for the first five seconds, one for the moment they leave. Write each as a scene, not an adjective ("the hush when a theatre's lights go down", not "premium"). Say where the swell is and where the silence is.

### Step 4: The feed

What the owner brings to it. Their words first. Then at most three things from their own world that bear on this piece: a film, a piece of music, a place, earlier work of their own. One line each on what it lends. If the record holds none, ask for one, or leave the feed as their words alone. Never fill it with invented references.

### Step 5: The mark

The one decision nobody else would have made. If the piece could have come from any studio or any model, the mark is missing. Name it in one line.

### Step 6: The kind of concept

Choose one (see `skills/shared/technique-neutrality.md`):

| Kind | The piece is organised by |
|------|---------------------------|
| Place | a room and its objects |
| Instrument | the way a tool is operated |
| Material | one substance and how it behaves |
| Grammar | a small set of drawn rules |
| Data | the shape of the information itself |
| Type | words and their setting alone |
| Quiet | removing everything but the task |

### Step 7: Three directions

Three directions that differ in idea, not in colour. Show each at the size it will be used: a rendered frame, an HTML study or a drawn screen. Three colourways of one layout are one direction.

- **Standard mode:** present the three and wait for the owner's choice.
- **Autonomous mode:** choose, and record why.

Keep the two that were not chosen, with the reason.

### Step 8: Five checks

Write five checks from the chosen direction. Each is one thing the finished piece must visibly do, phrased so it can fail ("the ledger is the first thing the eye lands on at 390 px", not "feels trustworthy").

### Step 9: Write the direction note

Save `ade_docs/direction.md`:

```markdown
# Direction — [what is being designed] · YYYY-MM-DD

**Owner's words:** "[verbatim]" — [where they came from]
**The thought:** [one sentence]
**The feeling:** first five seconds — [scene] · on leaving — [scene]
**The feed:** [their words] · [up to three references, one line each]
**The mark:** [the one decision nobody else would have made]
**Kind of concept:** [Place | Instrument | Material | Grammar | Data | Type | Quiet]

## Chosen direction
[name + three or four lines] — chosen because [reason]

## Not chosen
- [direction B] — [why not]
- [direction C] — [why not]

## Five checks
1. …
2. …
3. …
4. …
5. …

**Evidence:** [paths to the three studies in ade_docs/evidence/, or "not captured"]
```

---

## Pass

Look first. Open the real thing at the size it is used and capture it (`skills/shared/evidence-trail.md`) before reading any code or notes. Then answer, each with what you saw:

1. Is the thought there? Could a stranger say it?
2. Is the feeling there in the first five seconds?
3. Is there one moment that moves, with stillness around it?
4. Is it kind? Is anything complicated that could be simple?
5. Is it theirs? Is the mark there, once?

Then run the five checks from `ade_docs/direction.md`, if it exists. Report each as held or not held.

**Report:** what is alive, what is missing, and the one change that would add the most. No score. This pass does not gate.

---

## How the rest of ADE uses the direction note

- **Step 0** reads it first and records the chosen direction as the **declared concept**, verbatim, with its kind and five checks.
- **Build, Move and Write** carry the five checks into their reviews. A check not held is a blocker (`skills/shared/review.md`).
- **Style** starts from it. When the kind is Place, metaphor discovery is seeded with it. For any other kind, Style skips metaphor discovery and builds what the concept asks for and nothing else (`skills/shared/technique-neutrality.md`).
- **`/ade:review`** and **`/ade:compound`** report the five checks first, each held, not held or not seen.
- **An outside-in craft review**, if the owner uses one, reads the note as the record of what must be protected before it judges the work.
- No framework replaces the owner's direction with one of its own. If a framework cannot carry it, it says why and asks.

## What NOT to do

- Do not paraphrase the owner's words into marketing language.
- Do not invent references for the feed.
- Do not present three variations of one idea as three directions.
- Do not turn the taste pass into a score.
