# Sound Design — The Acoustic Layer

**Every place has an acoustic signature. Digital silence is the fluorescent lighting of audio.**

A boardroom library after hours isn't silent — it has the hush of thick carpet, the tick of a brass clock, the muffled weight of wood-paneled walls. A spaceship hums. A workshop rings. When an interface has atmosphere in every visual dimension but total silence in the auditory one, the place is incomplete.

But sound in software is seasoning, not sauce. Most products should ship **silent by default** with sound as an opt-in layer. The craft is in making that layer feel like it belongs to the place — not like notification noise bolted on.

---

## The Two Sound Layers

| Layer | Owned By | What It Is | Example |
|-------|----------|------------|---------|
| **Room Tone** | Style | Ambient, continuous, barely audible — the sound the place makes when nothing is happening | Low library hush, distant observatory wind, soft workshop hum |
| **Earcons** | Move | Short, synthesized interaction sounds — the sound objects make when touched | Page-turn on navigation, brass tick on toggle, soft thump on card select |

Style defines the acoustic signature (what the place sounds like). Move implements the earcons (what interactions sound like). Both derive from the same source: **the materials of the metaphor**.

---

## Deriving Sound from Materials

Just as color comes from materials, sound comes from materials. Don't pick "a click sound." Ask what the object is made of and how it would sound if touched.

| Material | Acoustic Character | Synthesis Recipe |
|----------|-------------------|------------------|
| **Wood (mahogany, oak)** | Soft, low, warm knock | Sine/triangle burst 80–150 Hz, fast attack, 100–200ms decay |
| **Brass / metal** | Bright, precise tick with shimmer | Short square/triangle blip with 2–4 kHz partials, < 80ms |
| **Paper / parchment** | Dry whisper, friction | Band-passed noise burst, 1–3 kHz, 50–150ms |
| **Glass** | Pure ping, long tail | Sine 800–1600 Hz, slow exponential decay, slight detune |
| **Stone** | Deep thud, room reverb | Low sine + noise transient, 60–100 Hz, convolution or feedback delay |
| **Fabric / leather** | Soft swish, muted | Low-passed noise sweep, < 500 Hz, gentle attack |
| **Air / space** | Pads, wind, breath | Filtered noise with slow LFO on filter cutoff |

## Matching Sound to the Physics Profile

The Style → Move handoff carries a physics personality. Sound must match it — a weighty interface with chirpy high-pitched blips breaks the spell instantly.

| Physics Personality | Pitch Range | Envelope | Character |
|--------------------|-------------|----------|-----------|
| **Weighty** | Low (80–300 Hz) | Slow attack, long decay | Thumps, knocks, heavy pages |
| **Floating** | High, airy (600 Hz+) | Soft attack, long reverb tail | Pings, breaths, distant chimes |
| **Snappy** | Mid (300–800 Hz) | Instant attack, < 80ms total | Clicks, ticks, mechanical precision |
| **Organic** | Varied, detuned | Humanized timing, ±10% pitch variation | No two sounds identical |
| **Mechanical** | Fixed, exact | Square-edged, identical every time | Relay clicks, typewriter strikes |

---

## The Sound Grammar

Map interactions to sounds the way Style maps UI elements to physical objects. Less is more — score only the moments that carry meaning:

| Interaction | Sound? | Guidance |
|-------------|--------|----------|
| Hover | Almost never | If used: barely audible (< -30 dB relative), high-pass filtered |
| Click / select | Yes | The signature earcon — material-derived, < 150ms |
| Success / completion | Yes | Two-note rising interval in the place's timbre |
| Error | Yes | Single soft low tone. NEVER a harsh buzzer — errors are compassionate in sound too |
| Navigation / transition | Sparingly | A whoosh or page-turn derived from room tone |
| Milestone / easter egg | Yes | A small melodic motif — the place's musical signature |
| Typing, scrolling, drag | Never | High-frequency actions must stay silent |

---

## Technology Ladder

Mirror the rendering-stack philosophy: synthesize first, sample only when synthesis can't reach.

1. **Web Audio API (vanilla)** — default. Synthesized earcons from oscillators + noise + envelopes. Zero assets, zero network, infinitely tunable to the material palette.
2. **Tone.js** — when sound needs musical structure: generative ambient tones, tuned intervals, effects chains (reverb, filter). `npm install tone`
3. **Howler.js** — only when curated recorded samples genuinely beat synthesis (real vinyl crackle, actual room tone recordings). Adds asset weight. `npm install howler`

### Core Pattern: Lazy AudioContext + Synthesized Earcon

```javascript
// sound.js — the place's acoustic engine
let ctx = null;
const pref = () => localStorage.getItem('sound') === 'on'; // OFF by default

function ensureContext() {
  // Browsers require a user gesture before audio — create lazily on first interaction
  if (!ctx) ctx = new (window.AudioContext || window.webkitAudioContext)();
  return ctx;
}

// A wooden "thump" — weighty personality, mahogany material
export function thump() {
  if (!pref()) return;
  const ac = ensureContext();
  const osc = ac.createOscillator();
  const gain = ac.createGain();
  osc.type = 'triangle';
  osc.frequency.setValueAtTime(120, ac.currentTime);
  osc.frequency.exponentialRampToValueAtTime(60, ac.currentTime + 0.15);
  gain.gain.setValueAtTime(0.12, ac.currentTime);            // volume ceiling: quiet
  gain.gain.exponentialRampToValueAtTime(0.001, ac.currentTime + 0.18);
  osc.connect(gain).connect(ac.destination);
  osc.start();
  osc.stop(ac.currentTime + 0.2);
}
```

### Core Pattern: Debounce + Variation

```javascript
let lastPlayed = 0;
export function play(earcon) {
  const now = performance.now();
  if (now - lastPlayed < 150) return;   // never machine-gun sounds
  lastPlayed = now;
  earcon({ detune: (Math.random() - 0.5) * 20 }); // ±10 cents — organic variation
}
```

### Core Pattern: The Sound Toggle

The toggle is part of the place — label it in the metaphor's language and make it discoverable but unobtrusive:

- Library: a small gramophone ornament — "The room is quiet / The room has sound"
- Observatory: "Comms: on/off"
- Workshop: a small radio icon in the corner

```javascript
function toggleSound() {
  const on = localStorage.getItem('sound') === 'on';
  localStorage.setItem('sound', on ? 'off' : 'on');
  if (!on) thump(); // confirm with the signature sound itself
}
```

---

## Non-Negotiable Rules

1. **OFF by default.** Sound is discovered and chosen, never imposed. The first sound a user hears is the one they asked for.
2. **Visible, persistent toggle.** Preference stored in `localStorage`, respected everywhere, styled in the place's language.
3. **Never the sole feedback channel.** Every sound accompanies a visual response. Deaf and hard-of-hearing users must lose nothing.
4. **No audio before a user gesture.** Browsers enforce this; design for it — the AudioContext initializes lazily on first interaction.
5. **Volume discipline.** UI sounds sit far below content volume (gain ≤ 0.15). Room tone sits below that. If a user notices the volume, it's too loud.
6. **Silence for high-frequency actions.** Typing, scrolling, dragging, rapid repeated clicks — always silent. Sound on repetition becomes noise, then hatred.
7. **Respect `prefers-reduced-motion` as a signal.** Users who reduce motion often want reduced sensory load overall — treat it as a hint to keep ambient sound off unless explicitly enabled.

---

## When NOT to Add Sound

The Product Portrait (Step 0) decides. Skip the sound layer entirely when:

- **Open-plan / office contexts** — enterprise dashboards, internal tools used at desks without headphones
- **High-frequency daily tools** — anything used hundreds of times a day (see rule 6, at product scale)
- **Clinical / emergency interfaces** — sound is reserved for alarms; decorative audio is dangerous
- **Content apps where audio IS the content** — music players, video tools; UI sound competes with the product

Sound belongs where the experience is the differentiator and sessions are immersive: portfolios, creative tools, archives, storytelling products, login/landing moments, games and playful products.

---

## Sound Audit Checklist

```
Signature:  Can you describe what this place sounds like in one line? .... [ ]
Materials:  Are earcons derived from the metaphor's materials? .......... [ ]
Physics:    Does pitch/envelope match the physics personality? .......... [ ]
Opt-in:     Is sound OFF by default with a visible toggle? .............. [ ]
Redundant:  Does every sound have a visual counterpart? ................. [ ]
Restraint:  Are high-frequency actions silent? .......................... [ ]
Quiet:      Is the volume ceiling respected (unnoticeable-but-felt)? .... [ ]
```

### Failure Diagnostics

| Symptom | Diagnosis | Fix |
|---------|-----------|-----|
| "Sounds like a casino" | Too many interactions scored | Strip back to click/success/error only |
| "Sounds like a phone notification" | Generic pitch, no material derivation | Re-synthesize from the material table |
| Sound feels detached from visuals | Envelope doesn't match physics profile | Match attack/decay to the motion's weight |
| Users immediately mute | Volume too high or hover sounds present | Halve all gains, remove hover audio |
| Same sound grates by tenth click | No variation | Add ±10 cent detune and skip-on-repeat |
