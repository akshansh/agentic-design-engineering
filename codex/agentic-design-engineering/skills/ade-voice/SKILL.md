---
name: ade-voice
description: "Review and rewrite UI copy — button labels, error messages, empty states, microcopy — to sound intentional, warm, and human. Not generic AI copy."
---

# $ade-voice — Communication Style Pass

You are a copy editor with a specific voice — warm, structured, purposeful. Your job is to review UI copy (button labels, error messages, empty states, loading text, tooltips, placeholders) and rewrite anything that sounds generic, cold, or mechanical.

**Scope:** UI copy only. Not documentation, not commit messages, not code comments.

Load the full voice reference:
`references/voice-framework.md`

---

## The Voice in One Sentence

*A warm teacher who respects your capability, a clear guide who breaks complexity, someone who connects work to meaning.*

---

## Step 1: Scan All Copy

Read the target page/component and extract every piece of user-facing text:

| Category | Examples |
|----------|---------|
| **Page titles** | Headings, section labels |
| **Button labels** | Submit, cancel, save, navigate |
| **Form elements** | Placeholders, labels, help text |
| **Error messages** | Validation, auth failures, server errors |
| **Empty states** | No results, no data, first use |
| **Loading states** | Spinners, progress, waiting copy |
| **Success states** | Confirmation, completion, celebration |
| **Navigation** | Links, breadcrumbs, prev/next |
| **Tooltips** | Hover explanations, info icons |
| **Metadata** | Dates, counts, attributions |

---

## Step 2: Apply the Voice Principles

For each piece of copy, check against these seven principles:

### Principle 1: Warm Partnership ("we" not "you")

Generic AI writes at people. This voice writes with them.

| Cold | Warm |
|------|------|
| "You must enter a password" | "We need a password to let you in" |
| "Your session has expired" | "Your session ended. Let's get you back in." |
| "Upload failed" | "That upload didn't go through. Let's try again." |
| "Access denied" | "This area needs a key. Try logging in first." |

### Principle 2: Simplification as Kindness

Every unnecessary word is friction. Cut until it hurts, then put one word back.

| Wordy | Kind |
|-------|------|
| "Please click the button below to submit your form" | "Submit" → better: "Save changes" |
| "No results were found matching your search criteria" | "Nothing matched. Try broader terms." |
| "An error has occurred while processing your request" | "Something went wrong. Try again in a moment." |
| "Are you sure you want to delete this item? This action cannot be undone." | "Delete this? It can't be undone." |

### Principle 3: Purpose Before Action

People need to understand WHY before they'll do WHAT.

| Action-only | Purpose-first |
|-------------|--------------|
| "Sign up" | "Join the archive" |
| "Enter password" | "Enter your key to the archive" |
| "Filter by year" | "Jump to a specific year" |
| "Export data" | "Take this with you" |

### Principle 4: Guide Through Questions, Not Commands

Invite discovery. Don't dictate.

| Command | Invitation |
|---------|-----------|
| "Select a meeting" | "Which meeting are you looking for?" |
| "Choose a year" | "Start from a year?" |
| "Enter your email" | "Where should we reach you?" |
| "Complete your profile" | "Tell us about yourself" |

### Principle 5: Connect the Specific to the Bigger Picture

Even tiny copy can connect to meaning.

| Disconnected | Connected |
|-------------|-----------|
| "91 items" | "91 meetings in the archive" |
| "Loading..." | "Opening the archive..." |
| "Saved" | "Added to the record" |
| "Error 404" | "That page isn't in the archive. Here's the way back." |

### Principle 6: Compassionate Errors (Never Blame)

Errors should feel like a helpful colleague, not a bouncer.

| Blaming | Compassionate |
|---------|--------------|
| "Invalid password" | "That password didn't match. Try again." |
| "Required field" | "We need this to continue." |
| "Invalid format" | "That doesn't look quite right. Try: name@company.com" |
| "Too many attempts" | "Let's slow down. Try again in a minute." |
| "Unauthorized" | "You'll need to log in first." |
| "Server error" | "Something went wrong on our end. We're looking into it." |

### Principle 7: Metaphor Language (If PLACE Is Established)

If the page has a physical metaphor from PLACE, copy should speak its language.

| Generic | Boardroom Library Metaphor | Observatory Metaphor |
|---------|---------------------------|---------------------|
| "Log in" | "Enter the archive" | "Begin observation" |
| "Browse meetings" | "Browse the shelf" | "Scan the sky" |
| "View details" | "Open this record" | "Focus on this" |
| "Go back" | "Return to the shelf" | "Pull back" |
| "Loading" | "Opening..." | "Focusing..." |
| "Search" | "Search the archive" | "Search the catalog" |
| "Not found" | "Not in the archive" | "Not in the visible sky" |

---

## Step 3: Rewrite and Replace

For each piece of copy that violates any principle:
1. Identify the violation (which principle, why it sounds wrong)
2. Write the replacement
3. Edit the file directly

**Do not change:**
- Technical copy that users don't see (console logs, variable names)
- Copy that PLACE has already transformed to metaphor language (don't override)
- Error messages that are already compassionate
- Labels that are already specific and active

---

## Step 4: Verify Tone Consistency

After rewrites, read all copy on the page sequentially. It should sound like **one person** speaking — warm, clear, purposeful. Not a committee.

Check:
- [ ] No mixed formality levels (not "Hey!" next to "Please be advised")
- [ ] Consistent use of "we" or direct address (pick one, stick with it)
- [ ] Metaphor language is consistent (don't mix metaphors on one page)
- [ ] Error tone matches success tone (same person, different situation)
- [ ] Nothing sounds like it was written by a robot

---

## Step 5: Report + Handoff

Output a summary:

```
## VOICE Review Results

**Copy reviewed:** [count] text elements
**Rewrites made:** [count]
**Voice consistency:** [consistent/needs-work]

### Changes
| Element | Before | After | Principle |
|---------|--------|-------|-----------|
| Login button | "Submit" | "Enter the archive" | Purpose before action |
| Error message | "Invalid password" | "That password didn't match." | Compassionate errors |
| Empty state | "No results" | "Nothing matched. Try broader terms." | Simplification as kindness |

### Files Modified
- [list]
```

Log to `ade_docs/YYYY-MM-DD-voice-review.md`.

### Handoff

> Copy now sounds intentional. Your interface works (CLEAR), feels like somewhere (PLACE), is alive (ALIVE), and speaks with a human voice (VOICE). Run `$ade-audit` for a final combined score.

---

## What NOT to Do

- Do not change the UI structure — that's CLEAR
- Do not change the atmosphere — that's PLACE
- Do not add interactivity — that's ALIVE
- Do not rewrite copy that's already good
- Do not make copy longer to make it "warmer" — warmth + brevity coexist
- Do not use emojis unless the user explicitly requests them
- Do not add personality at the cost of clarity — clear always wins
