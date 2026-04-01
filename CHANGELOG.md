# Changelog

## v3.0

### Renamed: Build, Style, Move, Write, Audit, Compound

The four framework names and all six commands have been simplified for clarity and intuitive flow.

**Before → After:**
- `/ade:clear` → `/ade:build` — Build the structure (accessibility, hierarchy, copy, feedback)
- `/ade:place` → `/ade:style` — Style the atmosphere (metaphor, materials, light, typography)
- `/ade:alive` → `/ade:move` — Move the interface to life (physics, interactions, discovery)
- `/ade:voice` → `/ade:write` — Write with intention (warm copy, metaphor language, compassionate errors)
- `/ade:audit` — unchanged
- `/ade:transform` → `/ade:compound` — Compound all four frameworks in one pass

The internal acronym mnemonics (C.L.E.A.R., P.L.A.C.E., A.L.I.V.E.) are preserved as documentation inside each framework reference. The surface flow is now: **build → style → move → write → compound**.

Inspired by [Compound Engineering](https://github.com/EveryInc/compound-engineering-plugin) by Kieran Klaassen — simple, sequential verbs that anyone can follow.

All skill directories, agent files, reference files, manifests, and documentation updated across Claude Code, Cursor, and Codex plugins.

---

## v2.0

### Step 0: Understand
Every skill now begins by understanding what the codebase is before evaluating or transforming anything. The agent builds a **Product Portrait** that feeds all downstream decisions.

### Autonomous Mode
Run `/ade:compound` with "surprise me" or `--auto` and the agent makes all decisions independently, including metaphor selection via a 5-criteria scoring rubric.

### Before/After Scoring
Every framework now runs its auditor at the start and end, producing delta tables that show what changed.

### Write Auditor + Full Audit Coverage
Write now has its own auditor agent. `/ade:audit` scores all four frameworks for a combined score out of /200.

### Error Recovery
Gate failures now have a 2-retry cap with per-framework fallback strategies. The agent documents what it could not fix and moves on with a warning.

### Structured Handoffs
Build → Style → Move → Write data contracts now provide cleaner context flow between frameworks.
