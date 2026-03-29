# C.L.E.A.R. Framework v2
## UI Structure Evaluation — Research-Backed Criteria

*Part of the Agentic Design Engineering system.*
*CLEAR ensures the UI works. PLACE ensures it feels. ALIVE ensures it engages.*

---

## Philosophy

Before any code: "How do we want someone to feel when they use this?"

Every interface is a conversation between human needs and digital possibilities. CLEAR synthesizes cognitive psychology, accessibility science, and user behavior research into a systematic approach for creating interfaces that feel intuitively human while remaining technically excellent.

**Core Principle**: Make technology feel less like a tool and more like a trusted partner who genuinely understands and anticipates human needs.

---

## C — COPY: The Bridge Between Hearts and Minds

### Research Foundation
- **Cognitive Load Theory** (Sweller): Working memory has limited capacity — 7 +/- 2 chunks
- **Dual Process Theory** (Kahneman): System 1 (emotional, fast) processes before System 2 (analytical, slow)
- **Psychology of Persuasion** (Cialdini): Emotional connection precedes logical acceptance

### The Three-Layer Copy Architecture

**Layer 1 — Emotional Acknowledgment** (connect before you direct):
- Uncertain user: "Let's figure this out together"
- Frustrated user: "We understand this is confusing"
- Overwhelmed user: "Take a deep breath. We'll go step by step"
- Confused user: "No worries, this part trips everyone up"

**Layer 2 — Cognitive Clarity** (simplification as kindness):
- Active voice reduces processing time by 23%: "Upload your file" not "File can be uploaded"
- Specific actions reduce decision time by 34%: "Save and continue" not "Submit"
- Preventive language: "Email format: name@company.com" not "Invalid email"
- Progressive disclosure: essential information first, details on demand

**Layer 3 — Behavioral Guidance** (guide without commanding):
- Suggestion: "You might want to..."
- Invitation: "Ready to..."
- Collaboration: "Let's..."
- Empowerment: "You can..."
- Reassurance: "It's safe to..."
- Celebration: "You did it!"

### Evaluation Criteria

| Criterion | Metric | Target |
|-----------|--------|--------|
| Readability | Flesch-Kincaid score | > 60 |
| Grade level | Reading comprehension level | < Grade 8 |
| Action verbs | % of buttons with specific action verbs | > 70% |
| Error clarity | % of errors that include a solution | 100% |
| Inclusive language | Free from gender, ability, cultural bias | 100% |

---

## L — LAYOUT: Visual Information Architecture

### Research Foundation
- **Gestalt Principles**: Proximity, similarity, continuity, closure — the brain groups related elements
- **F-Pattern Reading** (Nielsen): Users scan in F-shaped patterns on content pages
- **Visual Hierarchy Research** (Ware): Eye-tracking confirms size > color > position for attention
- **Spacing Psychology** (Lidwell): White space improves comprehension by 20%

### The Spacing System

Spacing communicates relationship. Closer = more related. Further = less related.

| Token | Value | Relationship | Use |
|-------|-------|-------------|-----|
| `--space-1` | 0.25rem (4px) | Intimate | Icon + label |
| `--space-2` | 0.5rem (8px) | Bond | Related form fields |
| `--space-3` | 0.75rem (12px) | Close | Items within a group |
| `--space-4` | 1rem (16px) | Personal | Between input groups |
| `--space-5` | 1.5rem (24px) | Friendly | Between related sections |
| `--space-6` | 2rem (32px) | Social | Between major sections |
| `--space-7` | 3rem (48px) | Formal | Between page sections |
| `--space-8` | 4rem (64px) | Public | Between pages/views |
| `--space-9` | 6rem (96px) | Monumental | Hero to content |

### Visual Hierarchy Mathematics

Golden ratio-based typescale:
- h1: 2.618rem (phi squared)
- h2: 1.618rem (phi)
- h3: 1rem (base)
- body: 1rem
- small: 0.618rem (1/phi)

Attention weight distribution:
- Primary: 100% visual weight
- Secondary: 61.8% (phi inverse)
- Tertiary: 38.2% (phi squared inverse)
- Quaternary: 23.6% (phi cubed inverse)

### Evaluation Criteria

| Criterion | Metric | Target |
|-----------|--------|--------|
| Spacing consistency | % of spacing values from token system | > 90% |
| F-pattern support | Content follows natural scan path | > 85% |
| Responsive | Zero layout breaks across 320px-2560px | 0 breaks |
| Whitespace ratio | Content to whitespace | 30-70% |
| Logical flow | Reading order matches visual hierarchy | 100% |

---

## E — EMPHASIS: Attention Architecture

### Research Foundation
- **Attention Economics** (Simon): Attention is the scarcest resource — don't waste it
- **Choice Overload** (Schwartz): Too many options decrease decision quality by 40%
- **Von Restorff Effect**: The distinctive item is remembered — make the primary action distinctive
- **Serial Position Effect**: First and last items receive most attention

### The Star System

Every viewport has exactly ONE primary action. Everything else supports it.

```
Primary Action (The Star)
├── Visual weight: 100%
├── Color: Highest contrast, brand color
├── Size: Largest interactive element
├── Position: Above fold, golden ratio placement
└── Treatment: Filled, bold, prominent

Secondary Actions (Supporting Cast)
├── Visual weight: 61.8%
├── Color: Neutral with accent
├── Size: Clearly smaller than primary
└── Treatment: Outline, ghost, or text button

Tertiary Actions (Chorus)
├── Visual weight: 38.2%
├── Color: Text-based, subtle
├── Size: Standard text
└── Treatment: Underlined link or plain text
```

### Evaluation Criteria

| Criterion | Metric | Target |
|-----------|--------|--------|
| Primary actions per viewport | Count of filled/prominent buttons | Exactly 1 |
| Contrast ratio (primary) | Against background | > 4.5:1 |
| Visual weight hierarchy | Golden ratio distribution | Descending |
| Attention flow | Users follow intended path | > 90% |
| Competing elements | Elements at equal visual weight | 0 |

---

## A — ACCESSIBILITY: Radical Inclusion

### Research Foundation
- **WCAG 2.1 Guidelines**: Perceivable, Operable, Understandable, Robust (POUR)
- **Inclusive Design** (Microsoft): Permanent, temporary, and situational disabilities
- **Curb Cut Effect**: Accessibility improvements benefit everyone — not just disabled users

### POUR Framework

**P — Perceivable:**
| Requirement | Standard | How to Check |
|-------------|----------|-------------|
| Text contrast (normal) | >= 4.5:1 | WebAIM contrast checker |
| Text contrast (large 18px+) | >= 3:1 | WebAIM contrast checker |
| Text contrast (enhanced AAA) | >= 7:1 | For critical information |
| Alternative text | Every informative image | `alt` attribute present |
| Decorative images | Empty alt | `alt=""` |
| Color independence | Never color alone | Icons, patterns, or text alongside |

**O — Operable:**
| Requirement | Standard | How to Check |
|-------------|----------|-------------|
| Keyboard access | All interactive elements reachable | Tab through entire page |
| Focus indicators | Clearly visible on every focusable element | `:focus-visible` styles exist |
| Tab order | Matches visual hierarchy | Tab sequence is logical |
| Target sizes | Minimum 44px for touch | `min-height`/`min-width` check |
| Target spacing | Minimum 8px between targets | Gap measurement |
| No seizure triggers | No content flashes > 3x/second | Visual inspection |

**U — Understandable:**
| Requirement | Standard | How to Check |
|-------------|----------|-------------|
| Reading level | Grade 8 maximum | Flesch-Kincaid test |
| Consistent navigation | Same position across pages | Visual inspection |
| Consistent labeling | Same function = same label | Grep for inconsistencies |
| Error identification | Errors described clearly | Error messages are specific |
| Error suggestions | Solutions provided | Error includes fix guidance |

**R — Robust:**
| Requirement | Standard | How to Check |
|-------------|----------|-------------|
| Valid HTML | Markup validates | W3C validator or linter |
| Unique IDs | No duplicate IDs on page | Grep for duplicates |
| Proper nesting | Elements correctly nested | HTML linter |
| ARIA usage | Correct roles, states, properties | axe-core or similar |

### Evaluation Criteria

| Criterion | Metric | Target |
|-----------|--------|--------|
| WCAG 2.1 AA | All success criteria | 100% compliance |
| Keyboard access | All functionality keyboard-reachable | 100% |
| Target sizes | All interactive elements >= 44px | 100% |
| Accessibility errors | axe-core violations | 0 critical |

---

## R — REWARD: Emotional Feedback Architecture

### Research Foundation
- **Operant Conditioning** (Skinner): Positive reinforcement shapes behavior
- **Flow Theory** (Csikszentmihalyi): Immediate feedback maintains engagement
- **Progress Psychology** (Amabile): Small wins build motivation
- **Microinteraction Design** (Saffer): Moments create experience

### The Feedback Emotion Scale

| Action Type | Response Time | Feedback Type | Example |
|-------------|-------------|---------------|---------|
| Micro (hover, focus) | < 100ms | Visual change | Color shift, shadow, translate |
| Standard (click, submit) | < 300ms | State change + animation | Loading indicator, checkmark |
| Significant (save, create) | < 500ms | Confirmation message | "Saved successfully" toast |
| Major (complete flow) | < 2s | Celebration | Confetti, milestone message |
| Error (any) | Immediate | Compassionate guidance | Inline error with solution |

### Error Recovery Patterns

Errors should feel like a helpful guide, not a slap:

| Generic (bad) | Compassionate (good) |
|---------------|---------------------|
| "Invalid password" | "That password didn't match. Try again." |
| "Error 404" | "We couldn't find that page. Here's the way back." |
| "No results" | "Nothing matched that search. Try broader terms." |
| "Required field" | "We need this to continue. What's your [field]?" |
| "Server error" | "Something went wrong on our end. Try again in a moment." |

### Evaluation Criteria

| Criterion | Metric | Target |
|-----------|--------|--------|
| Feedback coverage | % of interactions with visible feedback | 100% |
| Response time | Micro-interactions | < 200ms |
| Response time | Standard actions | < 500ms |
| Error recovery | % of users who recover from errors | > 95% |
| Error compassion | Errors include guidance toward solution | 100% |

---

## The 60-Second CLEAR Check

```
C — Copy:          Read aloud — does it sound human? ........... [ ]
L — Layout:        Trace with finger — is the path clear? ...... [ ]
E — Emphasis:      Count primary actions — exactly one? ........ [ ]
A — Accessibility: Tab through — does it work? ................. [ ]
R — Reward:        Click everything — feedback present? ........ [ ]

Total score: ___/50 (aim for 40+)
```

---

## Quantitative Benchmarks

```javascript
const benchmarks = {
  copy: {
    fleschScore: "> 60",
    gradeLevel: "< 8",
    actionVerbs: "> 70% of buttons",
    errorClarity: "100% include solutions"
  },
  layout: {
    spacingConsistency: "> 90% from token system",
    scanPath: "F-pattern support > 85%",
    responsiveBreaks: "0 across 320px-2560px",
    whitespace: "30-70% content-to-space ratio"
  },
  emphasis: {
    primaryActions: "Exactly 1 per viewport",
    contrast: "> 4.5:1 normal, > 3:1 large",
    hierarchy: "Golden ratio weight distribution"
  },
  accessibility: {
    wcag: "100% WCAG 2.1 AA",
    keyboard: "100% keyboard accessible",
    targets: "100% >= 44px",
    axeViolations: "0 critical"
  },
  reward: {
    feedbackCoverage: "100% of interactions",
    microTiming: "< 200ms",
    standardTiming: "< 500ms",
    errorRecovery: "> 95% recovery rate"
  }
};
```

---

## Relationship to Other Frameworks

**CLEAR is the foundation.** Apply it first. Always.

- CLEAR fixes structure → then PLACE adds atmosphere
- CLEAR ensures accessibility → PLACE respects it with contrast-safe materials
- CLEAR establishes hierarchy → PLACE enhances it with typography character
- CLEAR creates feedback patterns → ALIVE amplifies them with physics
- CLEAR writes functional copy → VOICE gives it personality

**CLEAR without PLACE** = correct but generic (a waiting room).
**PLACE without CLEAR** = beautiful but broken (a locked door).

---

*Version 2.0 — March 2026*
*Part of the Agentic Design Engineering framework system*
*Original research foundation preserved from v1 (C.L.E.A.R. Framework Ultimate)*
