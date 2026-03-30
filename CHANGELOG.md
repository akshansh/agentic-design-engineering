# Changelog

## v2.0

### Step 0: Codebase Comprehension
Every skill now begins by understanding what the codebase is before evaluating or transforming anything. The agent builds a **Product Portrait** that feeds all downstream decisions.

### Autonomous Mode
Run `/ade:transform` with "surprise me" or `--auto` and the agent makes all decisions independently, including metaphor selection via a 5-criteria scoring rubric.

### Before/After Scoring
Every framework now runs its auditor at the start and end, producing delta tables that show what changed.

### VOICE Auditor + Full Audit Coverage
VOICE now has its own auditor agent. `/ade:audit` scores all four frameworks for a combined score out of /200.

### Error Recovery
Gate failures now have a 2-retry cap with per-framework fallback strategies. The agent documents what it could not fix and moves on with a warning.

### Structured Handoffs
CLEAR → PLACE → ALIVE → VOICE data contracts now provide cleaner context flow between frameworks.
