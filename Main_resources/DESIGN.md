# KOTOKA — DESIGN SPECIFICATION v1.1

> **Document type:** UI/UX Design Bible — Figma-equivalent specification  
> **Audience:** UI/UX designers, motion designers, design reviewers  
> **Platform:** iOS + Android (React Native + Expo)  
> **Word count target:** 15,000+  
> **Status:** Phase 1 deliverable — must be signed off before Phase 2 implementation begins  
> **Revision:** v1.1 — addresses Round 1 review comments (DS-01, DS-02, SC-01–04, UX-01–03, IR-01–02)  

---

## TABLE OF CONTENTS

1. [Design Philosophy](#1-design-philosophy)
2. [Brand Identity](#2-brand-identity)
3. [Design Token System](#3-design-token-system)
4. [Component Library](#4-component-library)
5. [Koko Character & Animation System](#5-koko-character--animation-system)
6. [Navigation Architecture](#6-navigation-architecture)
7. [Screen Specifications — Onboarding](#7-screen-specifications--onboarding)
8. [Screen Specifications — Home Tab](#8-screen-specifications--home-tab)
9. [Screen Specifications — Snap Tab](#9-screen-specifications--snap-tab)
10. [Screen Specifications — Review Tab](#10-screen-specifications--review-tab)
11. [Screen Specifications — Shop Tab](#11-screen-specifications--shop-tab)
12. [Screen Specifications — Profile Tab](#12-screen-specifications--profile-tab)
13. [Interaction Patterns & Micro-animations](#13-interaction-patterns--micro-animations)
14. [Accessibility Specification](#14-accessibility-specification)
15. [Content & Copy Guidelines](#15-content--copy-guidelines)
16. [Design Handoff Checklist](#16-design-handoff-checklist)

---

## 1. DESIGN PHILOSOPHY

### 1.1 The Two Responsibilities

Kotoka's visual design carries two simultaneous responsibilities that sit in constant tension and must both be satisfied at every design decision:

**Responsibility 1 — Warm and personal.**  
Kotoka is a memory companion, not a drill tool. The words in a user's corpus came from their own desk, their own café, their own commute. The design must honor this intimacy. A user looking at their word list should feel something like looking at a photo album — these are *their* words, attached to *their* places and *their* moments. Clinical surfaces, aggressive gamification, or corporate-blue sterility would undermine this.

**Responsibility 2 — Cognitively lightweight.**  
Users review vocabulary in 30-second windows on a commute, between meetings, while waiting for coffee. The interface cannot demand setup time, cannot present ambiguous affordances, cannot require orientation before action. Every screen must be operable with one thumb in three taps or fewer. Every word, button, and label must be legible at arm's length in variable outdoor light.

These two responsibilities are not opposites. Warmth and clarity reinforce each other: a warm design that confuses users fails both. A clean design that feels impersonal fails both. Every design decision in this document is evaluated against both axes before it is included.

### 1.2 The Three Design Laws

These are inviolable constraints. Any design that violates them must be revised before handoff.

**Law 1 — No guilt.**  
Never use red danger states, harsh error indicators, or shame-based visual language for vocabulary errors. A wrong answer is data — it tells the system to reschedule the word sooner. The visual response to an error is informational, not punitive. Success colors: `#10B981` (success-500). Error feedback: `#d8566a` used only for neutral annotation, never for alarming visual weight. Koko's response to errors is warm and instructive, never disappointed.

**Law 2 — Context is king.**  
The sensory tags — location icon, weather state, mood color — must be visible on every review card. They are not supplementary information; they are Kotoka's core differentiator. A review card without its sensory context is a generic flashcard. The SensoryTagBar is a non-optional element on every flashcard, fill-blank, and conversation node. It may be compact but it must be present.

**Law 3 — 30 seconds is a session.**  
Every screen must be operable with one thumb in three taps or fewer. This governs all information architecture decisions. If a user action requires four taps, the flow must be redesigned. Bottom tab navigation is single-tap. Session start is one tap from the home review card. Snap capture is one tap in camera mode. This law also governs content density: a screen must never require scrolling to reach its primary action.

### 1.3 Design Evaluation Framework

Before finalizing any screen or component, apply this four-question test:

| Question | Pass condition |
|---|---|
| Can I reach the primary action in ≤ 3 taps from the current state? | Yes |
| Does this screen feel like it belongs to a memory companion? | Yes |
| If the user makes a mistake here, does the UI respond without guilt? | Yes |
| Is every sensory tag visible on this review surface? | Yes (review screens only) |

A screen that fails any question is not ready for handoff.

### 1.4 Design as Product Proof

The design is not a container for features. It is itself the product proof. The PRD's core hypothesis is that vocabulary anchored to personal sensory context is retained better than abstract word lists. The design must make this hypothesis viscerally obvious to a user within their first three minutes. Every visual decision — how the SensoryTagBar renders, how Koko celebrates a correct answer, how the Memory Map pin pulses when a review is due nearby — either strengthens or weakens the hypothesis. Strengthen it.

---

## 2. BRAND IDENTITY

### 2.1 Mission Statement

**Make vocabulary stick by anchoring it to lived experience.**

This sentence drives every brand decision. The product is not about language as an academic subject; it is about language as an extension of the user's actual life. The brand must feel like a tool a person carries, not software they install.

### 2.2 Brand Personality Matrix

| Trait | What it means in design | What to avoid |
|---|---|---|
| **Intelligent, not academic** | Clean information hierarchy, purposeful whitespace, no jargon in UI copy | Dense terminology, lecture-style layouts, academic typography choices |
| **Ambient, not intrusive** | Passive surfaces yield to active content; notifications are minimal and earned | Popups, badges that scream for attention, dark patterns |
| **Personal, not generic** | User's name, location name, and sensory details appear on surfaces wherever appropriate | Stock photography, shared word lists, one-size-fits-all content |
| **Playful through science** | Streaks, XP, and Koko's animations are backed by genuine behavioral science | Gamification that undermines retention, points that feel arbitrary |
| **Warm confidence** | Claims stated directly; the science lives beneath the surface, not on it | Name-dropping citations in UI text, overclaiming in headlines |

### 2.3 Brand Voice

**Four rules for all copy written in this product:**

1. **Direct.** Short sentences. No filler. No passive voice.
2. **Warm.** Second person. The user is a smart adult, not a student.
3. **Confident.** Every claim has a research foundation, even if the citation doesn't appear in the UI.
4. **Never condescending.** Users are working professionals. They have 12+ years of language education. The app is a tool they chose; it does not lecture.

**Tone benchmark — reference these when writing any UI copy:**

```
"Your mood and surroundings when you learn a word change how
fast your brain stores it. Koko reads these signals so reviews
hit you at the right moment — science-backed."

"Tap your desk. Your café. Your commute. Photograph it.
Koko finds the words you actually need there."

"7-day free trial — no credit card, cancel anytime."
```

Note what these do: short clauses, direct verbs, specific details ("30-second review," "3 words," "60 seconds"). Copy that achieves warmth through specificity rather than exclamation marks.

### 2.4 Mascot: Koko

Koko is Kotoka's AI conversation partner. Koko is not a tutor and must never be designed or written as one. Koko is a conversation partner who knows exactly which words the user needs right now and steers conversation toward them without making it feel like a test.

**Koko's visual personality:**
- Gender-neutral. The character design does not signal a specific gender.
- Expressive but not cartoonish. Koko's animations read as genuine reactions, not performed cuteness.
- Present but not dominant. On most screens Koko occupies a supporting position — upper quarter, not center stage. Koko moves to center only in conversation node and session-complete screens.
- Consistent across states. The idle Koko and the celebrating Koko are clearly the same character. Animation states change expression and movement, not the fundamental design.

**Koko's voice in copy:**

```
"Good — you used 'deadline' naturally. That's the third time
this week. Your brain is filing it."

"Quick question before we wrap: your manager just walked in.
How do you greet them in Mandarin?"

"That sentence was almost perfect. 'Proposal' fits better
than 'suggestion' in a formal meeting context."
```

Note: warm, specific, forward-pointing. Never "Wrong! Try again." Always "Here's what works better."

---

## 3. DESIGN TOKEN SYSTEM

The token system is the single source of truth for all visual values. No hardcoded color, size, or timing value should appear in a component specification. Every value is a named token from this section.

### 3.1 Color System — Teal-Purple Theme

```
╔══════════════════════════════════════════════════════════════════════╗
║                      KOTOKA COLOR SYSTEM                             ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  PRIMARY TEAL-PURPLE                                                 ║
║  ──────────────────────────────────────────────────────────────────  ║
║  brand-900    #000000   Black — app bar, primary header text         ║
║  brand-800    #4a1549   Dark purple shade — tab bar active state     ║
║  brand-700    #682069   Deep purple — primary buttons, CTA  -> 3 rd       ║
║  brand-600    #8c6792   Dark purple — links, selection borders       ║
║  brand-500    #00c8cc   Teal/Cyan — accent, progress bars, rings -> 1 st    ║
║  brand-400    #0cf6fc   Bright Cyan — highlights, selected state -> 2 nd    ║
║  brand-300    #ffb6cb   Pink — disabled-active elements, tag pills -> 4 th  ║
║  brand-200    #ffe1df   Light Peach — card background tints          ║
║  brand-100    #ffe1df   Light Peach — surface light, onboarding bg   ║
║  brand-50     #e8e1f0   Very Light Lavender — page background        ║
║                                                                      ║
║  SEMANTIC COLORS                                                     ║
║  ──────────────────────────────────────────────────────────────────  ║
║  success-500  #10B981   Correct answer glow, streak active           ║
║  success-100  #D1FAE5   Correct answer card bg tint                  ║
║  warning-500  #ffdfa2   Pale Yellow/Tan — streak at risk, due-soon   ║
║  warning-100  #ffdfa2   Warning card bg tint                         ║
║  error-400    #d8566a   Red/Pink — fill-blank incorrect annotation   ║
║  error-100    #FEE2E2   Error annotation bg (never alarming)         ║
║  neutral-900  #111827   Primary body text                            ║
║  neutral-700  #374151   Secondary text, subheadings                  ║
║  neutral-500  #6B7280   Caption text, placeholder, metadata          ║
║  neutral-300  #D1D5DB   Dividers, inactive tab icons                 ║
║  neutral-100  #F3F4F6   Input field bg, disabled surface             ║
║  white        #ffffff   Card surfaces, modal bg                      ║
║                                                                      ║
║  MOOD TINT OVERLAYS (applied to card backgrounds at 20% opacity)    ║
║  ──────────────────────────────────────────────────────────────────  ║
║  mood-stressed    #ffdfa2   Pale Yellow wash (7–10 stress score)     ║
║  mood-neutral     #ffb6cb   Pink tint (default, no additional tint)  ║
║  mood-energized   #ffe1df   Light Peach wash (high energy score)     ║
║  mood-calm        #e8e1f0   Very Light Lavender (low energy, low stress) ║
║                                                                      ║
╚══════════════════════════════════════════════════════════════════════╝
```

**Color usage rules:**

- `brand-700` (#682069 Deep Purple) is the primary CTA color. One CTA per screen maximum.
- `brand-50` (#e8e1f0 Very Light Lavender) is the default page background for all non-camera screens.
- Error states use `error-400` (#d8566a) as text annotation only, never as a fill on the primary action area.
- Mood tint overlays are applied at 20% opacity over white card backgrounds. They must not exceed 20% — higher opacity competes with text legibility.
- Dark mode: not in scope for Phase 1. Tokens are designed for light mode. Reserve dark mode token slot names for future phases.

### 3.2 Typography System

```
╔══════════════════════════════════════════════════════════════════════╗
║                       TYPOGRAPHY SYSTEM                              ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  Script Group       Languages     Primary Font        Fallback       ║
║  ────────────────────────────────────────────────────────────────    ║
║  Latin              EN, ES, VI    IBM Plex Sans        System UI     ║
║  Thai               TH            Sarabun              Noto Sans TH  ║
║  Chinese (SC)       ZH            Noto Sans SC         System CJK    ║
║  Lao                LO            Noto Sans Lao        System        ║
║                                                                      ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  TYPE SCALE (same numeric spec for all scripts)                      ║
║  ────────────────────────────────────────────────────────────────    ║
║  Token          Weight      Size    Line-h   Color          Usage    ║
║                                                                      ║
║  h1             Bold        20px    1.3      neutral-900    Titles   ║
║  h2             Bold        18px    1.3      neutral-900    Sections ║
║  h3             SemiBold    16px    1.4      neutral-900    Cards    ║
║  body           Regular     14px    1.6      neutral-900    Body     ║
║  caption        Regular     12px    1.5      neutral-500    Meta     ║
║  label          Medium      12px    1.4      neutral-700    Forms    ║
║  button         SemiBold    14px    1.0      (set by state) Buttons  ║
║  target-word    Bold        28px    1.2      neutral-900    Vocab    ║
║  romanization   Regular     16px    1.4      neutral-500    Pinyin   ║
║                                                                      ║
╚══════════════════════════════════════════════════════════════════════╝
```

**Why these fonts — rationale for designers:**

- **IBM Plex Sans** carries humanist curves that read as warm and professional simultaneously. Its diacritic support is excellent for Vietnamese. It is a workhorse for Latin scripts.
- **Sarabun** was designed specifically for Thai readability at mobile sizes. Its stroke personality is a close visual relative of IBM Plex Sans — warm, not decorative.
- **Noto Sans SC** provides complete simplified Chinese coverage with no missing glyph squares. The Noto family's design language is cohesive across scripts.
- **Noto Sans Lao** is the only mature free Lao font with complete Unicode coverage. Consistency with the Noto family across CJK and Lao scripts is intentional.

**Typography usage rules:**

- `target-word` (28px bold) is used exclusively for the vocabulary word on review cards and flashcards. It may not be used elsewhere.
- `romanization` (16px regular, neutral-500) appears directly beneath `target-word` when romanization exists (Pinyin for Mandarin, Romaji for Japanese if added, phonetics for all others).
- Captions are always `neutral-500`. Never use `neutral-900` for captions — the contrast creates hierarchy confusion.
- Button text is always `button` token: SemiBold 14px, no uppercase transform.

### 3.3 Spacing System

All spacing is built on a **4px base unit**. No spacing value outside this scale appears in any component.

```
space-1    4px     Micro gap — icon-to-label, internal tag padding
space-2    8px     Small gap — tag-to-tag, compact list items
space-3    12px    Component interior — compact mode padding
space-4    16px    Component interior — default padding (most used)
space-6    24px    Section padding, card padding, margin from edge
space-8    32px    Page header padding, large card interior
space-12   48px    Major section gaps, hero element margins
space-16   64px    Splash screen vertical rhythm, onboarding spacing
```

**Safe area awareness:** All edge-adjacent content must respect device safe area insets. iOS home indicator: minimum 34pt bottom padding added to `space-4`. iOS notch: top content starts below the status bar.

### 3.4 Border Radius

```
radius-sm      6px     Tags (TagPill), badge chips, small inputs
radius-md      12px    Cards (VocabCard, MissionCard, PackCard)
radius-lg      20px    Bottom sheets, modal surfaces, snap results
radius-full    9999px  Buttons (pill), avatars, StreakFlame badge
```

All cards use `radius-md`. Bottom sheets clip at the top corners only (`radius-lg` on top-left and top-right, 0 on bottom). Buttons are always pill-shaped (`radius-full`) unless specified as icon-only, which uses `radius-md`.

### 3.5 Elevation System

```
elev-0    No shadow        Flat surfaces — page backgrounds, tab bar base
elev-1    0 1px 3px #0001A   Subtle lift — resting card state
elev-2    0 4px 12px #0001A  Active card — focused card, hover equivalent
elev-3    0 8px 24px #0002A  Modals, bottom sheets, floating elements
```

Cards rest at `elev-1`. A card the user has tapped (before navigation) briefly shifts to `elev-2` as tactile feedback. Modals and bottom sheets always render at `elev-3`.

### 3.6 Icon Library

**Library: Ionicons via `@expo/vector-icons`** — bundled with Expo (no additional install), provides matched outlined and filled variants for all 5 tab states.

```
TAB BAR ICONS
  Home tab          home-outline       →  home (active)
  Snap tab          camera-outline     →  camera (active)
  Review tab        book-outline       →  book (active)
  Shop tab          storefront-outline →  storefront (active)
  Profile tab       person-outline     →  person (active)

RECURRING UI ICONS
  Back arrow        chevron-back-outline
  Notification      notifications-outline / notifications (unread)
  Settings          settings-outline
  Audio speaker     volume-high-outline
  Microphone        mic-outline / mic (recording)
  Close / Exit      close-outline
  Checkmark         checkmark-outline / checkmark-circle (success)
  Add               add-circle-outline
  Delete            trash-outline
  Edit              create-outline
  Menu              menu-outline
  Location pin      location-outline
  Camera capture    radio-button-on-outline  (shutter button)
  Expand/more       chevron-down-outline
```

All icons render at 24px in body contexts and 28px in tab bar. Icon color always uses a named color token — no hardcoded hex on icons.

### 3.7 Motion & Animation Tokens

```
Duration tokens:
  duration-fast     150ms    Micro interactions — tap state, icon swap
  duration-normal   250ms    Screen transitions, card flips, tab switch
  duration-slow     400ms    Reveal animations — session start, results
  duration-xslow    600ms    Splash fade, onboarding entrance

Easing functions:
  ease-standard     cubic-bezier(0.4, 0, 0.2, 1)    Default transitions
  ease-decelerate   cubic-bezier(0, 0, 0.2, 1)       Entering elements
  ease-accelerate   cubic-bezier(0.4, 0, 1, 1)       Exiting elements
  ease-spring       spring(1, 100, 10, 0)             Card flip, bounce
```

**Accessibility rule:** All animations must check `prefers-reduced-motion`. When reduced motion is active, replace all animated transitions with instant state changes. The `KokoAnimation` component falls back to a static PNG. No animation is required for the interface to function.

---

## 4. COMPONENT LIBRARY

The component library contains 34 named components organized in four tiers. Every screen specification in this document references only named components from this library.

### 4.1 Component Hierarchy Overview

```
╔══════════════════════════════════════════════════════════════════════╗
║               COMPONENT LIBRARY — 34 COMPONENTS                      ║
╠══════════════════════════════════╦═══════════════════════════════════╣
║  ATOMS (14)                      ║  MOLECULES (12)                   ║
║  ─────────────────────────────   ║  ───────────────────────────────  ║
║  Button (primary)                ║  VocabCard                       ║
║  Button (secondary)              ║  SensoryTagBar                   ║
║  Button (ghost)                  ║  MissionCard                     ║
║  Button (icon)                   ║  MemoryMapPin                    ║
║  TagPill                         ║  SessionProgressBar              ║
║  Badge (XP, count)               ║  FlashcardFlip                   ║
║  Avatar (Koko)                   ║  FillBlankInput                  ║
║  StreakFlame                      ║  ConversationBubble              ║
║  ProgressRing                    ║  PronunciationWaveform           ║
║  LanguagePairBadge               ║  ScoreResultCard                 ║
║  MoodColorDot                    ║  PackCard (Shop)                 ║
║  WeatherIcon                     ║  ReceiptModal                    ║
║  SoundTypeIcon                   ║                                  ║
║  LoadingPulse                    ║                                  ║
╠══════════════════════════════════╬═══════════════════════════════════╣
║  ORGANISMS (8)                   ║  TEMPLATES (4 screen layouts)    ║
║  ─────────────────────────────   ║  ───────────────────────────     ║
║  BottomTabBar                    ║  FullScreenScrollable            ║
║  HomeStreakHeader                ║  CardCenterStage                 ║
║  SnapTabSwitcher                 ║  SplitHeaderContent              ║
║  ReviewSessionContainer          ║  BottomSheetOverlay              ║
║  KokoConversationThread          ║                                  ║
║  MemoryMapView                   ║                                  ║
║  ShopGrid                        ║                                  ║
║  OnboardingStep                  ║                                  ║
╚══════════════════════════════════╩═══════════════════════════════════╝
```

### 4.2 Atom Specifications

**Button — Primary**
```
Background:    brand-700
Text:          white, button token
Height:        52px
Width:         fill container (subtract space-6 × 2 margins)
Border radius: radius-full
Padding:       space-4 vertical, space-8 horizontal
Pressed state: brand-800 bg, scale(0.97) over 150ms ease-standard
Disabled:      brand-300 bg, neutral-500 text, no press animation
Shadow:        elev-1 at rest, elev-0 when pressed
```

**Button — Secondary**
```
Background:    transparent
Border:        1.5px solid brand-700
Text:          brand-700, button token
All other dimensions: same as primary
Pressed state: brand-100 bg fill
```

**Button — Ghost**
```
Background:    transparent
Border:        none
Text:          brand-600, button token
Height:        44px (minimum touch target)
Pressed state: brand-50 bg, 150ms
```

**Button — Icon**
```
Size:          44×44px (touch target), visual icon 24×24px
Background:    transparent
Pressed state: neutral-100 circular fill behind icon
Icon color:    contextual (see each screen spec)
```

**TagPill**
```
Background:    brand-100
Text:          brand-800, caption token (12px medium)
Border radius: radius-sm
Padding:       space-1 vertical (4px), space-2 horizontal (8px)
Icon (optional): 16px, preceding text, space-1 gap
Max width:     automatically truncates at 120px with ellipsis
```

**Badge (XP)**
```
Background:    warning-500 (#ffdfa2)
Text:          white, label token (12px medium)
Format:        "+{n} XP"
Shape:         pill, radius-full
Padding:       2px vertical, space-2 horizontal
```

**StreakFlame**
```
Visual:        🔥 emoji or Lottie flame icon
Count text:    h3 token, neutral-900
Active:        warning-500 text color
Broken/0 day:  neutral-300, flame icon desaturated
Minimum touch: 44×44px
```

**ProgressRing**
```
Diameter:      36px (compact), 56px (standard), 80px (hero)
Track color:   neutral-200
Fill color:    brand-500
Stroke width:  4px
Center text:   percentage in label token, or icon
Animation:     arc draws with ease-decelerate over 400ms
```

**MoodColorDot**
```
Diameter:      10px
Shape:         circle
Color:         maps to mood-stressed / mood-neutral / mood-energized / mood-calm
Position:      leftmost element in SensoryTagBar
No text label: color only — accessibilityLabel reads full mood score
```

**LoadingPulse**
```
Width:         fill container
Height:        4px
Color:         brand-400 animated over brand-100 track
Animation:     traveling highlight from left to right, 1.2s loop
Reduced motion: static bar at 50% fill
```

### 4.3 Molecule Specifications

**VocabCard**

Two variants controlled by `variant` prop: `'full'` (default) and `'compact'`.

| Field | full | compact |
|---|---|---|
| SensoryTagBar | visible | hidden |
| target-word (28px) | visible | visible (18px, h3 token) |
| romanization | visible | hidden |
| audio button | visible | hidden |
| native translation | visible | visible |
| example sentence | visible | hidden |
| location/date caption | visible | hidden |
| add/check button | hidden | visible (top-right) |

`full` — used in: REV-02, REV-03 header, REV-00 word history (expandable)  
`compact` — used in: SNA-05 results list, word history collapsed rows

```
┌─────────────────────────────────────────────────────────┐
│  [MoodColorDot] [WeatherIcon] [ZoneTag]  [SoundTypeIcon] │  ← SensoryTagBar inside card
│  ─────────────────────────────────────────────────────   │
│                                                         │
│                    TARGET WORD                          │  ← target-word token, 28px bold
│                  /phonetics/                            │  ← romanization token, 16px
│                    [🔊]                                  │  ← Button (icon), 44×44
│                                                         │
│  ─────────────────────────────────────────────────────  │
│  Native translation in source language                  │  ← body token
│  "Example sentence using the word naturally."           │  ← body token, neutral-700
│                                                         │
│  [📍 Location Name — Month Day]                         │  ← caption, neutral-500
└─────────────────────────────────────────────────────────┘

Card metrics:
  Background:    white + mood tint overlay at 20%
  Border radius: radius-md (12px)
  Shadow:        elev-1
  Padding:       space-6 (24px) all sides
  Margin:        space-6 horizontal, space-3 vertical
  Flip trigger:  Tap anywhere on card or swipe up
  Flip animation: 180° Y-axis rotate, ease-spring, 250ms
                  Content crossfade at 90° (midpoint of flip)
```

**SensoryTagBar**
```
┌─────────────────────────────────────────────────────────┐
│  [MoodColorDot] [📍 Zone Name] [☀️ 28°C] [😤 6/10] [🎵]  │
└─────────────────────────────────────────────────────────┘

Layout:        horizontal scroll if tags overflow, no wrapping
Each tag:      TagPill with icon + label text
Tap behavior:  Expand to full-context tooltip (BottomSheetOverlay)
Tooltip shows: Full sensory data captured at encoding time
Accessibility: "Captured at [Zone], [temp], mood [n] of 10"
Spacing:       space-2 between tags
```

**MissionCard**
```
┌───────────────────────────────────────┐
│  [Mission icon]  Mission title        │
│  Progress bar ████░░░░  2/3 done      │
│                          [+n XP]      │
└───────────────────────────────────────┘

Width:         calc(50% - space-3)   (two per row)
Height:        auto, min 80px
Background:    white
Border radius: radius-md
Border:        1px neutral-200 (incomplete) / 1px success-500 (complete)
Complete state: success-100 bg, checkmark replaces progress bar
XP badge:      Badge (XP) component, top-right corner
```

**SessionProgressBar**
```
┌──────────────────────────────────────────────────────────┐
│  [≡]  ────────████████████░░░░  n of N  [✕]              │
└──────────────────────────────────────────────────────────┘

Track:         neutral-200, height 4px, radius-full
Fill:          brand-500, animates on each node advance (250ms ease-decelerate)
Left:          menu icon (Button icon, opens session menu)
Right:         exit button (Button icon, prompts confirm before leaving)
Counter:       "n of N" in caption token, neutral-500
```

**FlashcardFlip**

The FlashcardFlip wraps a VocabCard and adds the flip interaction layer.

```
Front face:    Target word only (concealed: native text, example)
               Shows "Tap card or swipe up to reveal" in caption
               tap/swipe-up → triggers flip

Back face:     Full VocabCard (all fields visible)
               Shows self-rating buttons below card:
               ┌──────────┐  ┌──────────┐  ┌──────────┐
               │ 😕 Hard   │  │ 🙂 OK    │  │ 😄 Easy  │
               └──────────┘  └──────────┘  └──────────┘
               Each: Button (secondary), full labels, 44px height

Animation:     Y-axis 180° flip, ease-spring, 250ms
               Front exits on first 90°, back enters from 90°
               Reduced motion: instant crossfade, no rotation
```

**FillBlankInput**
```
┌──────────────────────────────────────────────────────────┐
│  "Please send the _____ to all team members."            │  ← sentence with blank
│                                                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌─────────┐  │
│  │ option A │  │ option B │  │ option C │  │option D │  │
│  └──────────┘  └──────────┘  └──────────┘  └─────────┘  │
└──────────────────────────────────────────────────────────┘

Sentence:      body token, blank rendered as underline span
Options:       2×2 grid of Button (secondary), each max 50% width
               Selected: brand-700 bg + white text (pre-submit)
               Correct: success-500 border, success-100 bg
               Incorrect: error-400 border, error-100 bg (neutral, not alarming)
               Transition: 150ms ease-standard
Hint element:  TagPill with 📍 icon referencing scene name
Distractors:   always from same scene vocabulary for semantic coherence
```

**ConversationBubble**
```
Koko bubble (left):
  ┌───────────────────────────────────────┐
  │  [Koko avatar 40px]  Koko's message   │
  └───────────────────────────────────────┘
  Background: brand-100, border-radius: radius-lg radius-sm at tail
  Text:       body token, neutral-900

User bubble (right):
  ┌───────────────────────────────────────┐
  │                    User's response    │
  └───────────────────────────────────────┘
  Background: brand-700, text: white

Spacing:  space-3 between bubbles
Max width: 75% of container
```

**ScoreResultCard**
```
┌──────────────────────────────────────────────────────────┐
│                  ✅  Session Complete!                    │  ← h2 bold
│                                                          │
│   [CorrectCount] / [TotalCount] correct  •  +[XP] XP    │  ← h3
│   Streak: 🔥 [n] days                                    │  ← body
│                                                          │
│   Strongest word:  [word]                                │  ← caption + bold word
│   Needs more work: [word]                                │  ← caption + neutral-500
│                                                          │
│   Next review: [Location] words → in [n] days            │  ← caption
└──────────────────────────────────────────────────────────┘

Background:    white
Border radius: radius-lg (20px)
Shadow:        elev-2
Padding:       space-8
Correct bg:    success-100 tint behind correct count
```

### 4.4 Organism Specifications

**BottomTabBar**
```
┌─────────────────────────────────────────────────────┐
│  [Home]   [Snap]   [Review]   [Shop]   [Me]         │
└─────────────────────────────────────────────────────┘

Height:        83px (includes safe area inset on iOS)
Background:    white
Border-top:    1px neutral-200
Icons:         24px, outlined style at rest, filled when active
Labels:        caption token (12px), below icon, space-1 gap
Active:        brand-800 icon + label color
Inactive:      neutral-400
Touch area:    full tab width (approximately 20% each), minimum 44px height
Badge:         count Badge overlaid top-right of icon when pending reviews > 0
Animation:     tab icon bounces at scale(1.15) on tap, 150ms ease-spring
```

**HomeStreakHeader**
```
┌─────────────────────────────────────────────────────────────┐
│  Good morning, {name}                            [🔔]       │  ← h2 + notification icon
│  ┌───────────────────────────────────────────────────────┐  │
│  │  🔥 {n}-day streak   ████████████░░  {n} XP today     │  │
│  └───────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘

Greeting:      personalized by time-of-day (morning/afternoon/evening/night)
Streak card:   brand-100 bg, radius-md, space-4 padding
XP bar:        ProgressRing or linear bar (brand-500 fill, neutral-200 track)
Greeting text: h2 token
```

**SnapTabSwitcher**
```
┌──────────────────────────────────────────────────────┐
│       [Camera]     |     [Text]     |     [GPS]      │
└──────────────────────────────────────────────────────┘

Layout:        pill-shaped segmented control, full width
Background:    neutral-100
Active segment: brand-700 bg, white text, radius-full
Inactive:      transparent bg, neutral-700 text
Height:        40px
Animation:     active pill slides, 200ms ease-standard
```

**OnboardingStep** (updated — adds progress indicator)
```
Progress indicator: step dots, centered, below safe area top
  Active dot:   brand-700, diameter 8px
  Inactive dot: neutral-300, diameter 6px
  Spacing:      space-2 between dots
  Count:        shown on ONB-02 through ONB-07 (not ONB-01 splash)
  Position:     top of CardCenterStage, below back button row, space-3 below
  Animation:    active dot expands from 6px to 8px over 150ms on advance
  Tap behavior: dots are NOT interactive (display only)

Step mapping:
  ONB-01  Splash       — no dots (entry, not a step)
  ONB-02  Auth         — ●○○○○○  step 1 of 6
  ONB-03  PDPA         — ●●○○○○  step 2 of 6
  ONB-04  Language     — ●●●○○○  step 3 of 6
  ONB-05  Proficiency  — ●●●●○○  step 4 of 6
  ONB-06  Goal/Time    — ●●●●●○  step 5 of 6
  ONB-07  First Snap   — ●●●●●●  step 6 of 6 (completion)
```

**ReviewSessionContainer**

Shell that hosts the session node sequence. Renders:
- `SessionProgressBar` at top
- Current node component (FlashcardFlip | FillBlankInput | KokoConversationThread | PronunciationWaveform)
- Node transitions: slide-from-right (next), slide-from-left (previous)
- Bottom area: self-rating buttons when applicable

**KokoConversationThread**

Scrollable thread of ConversationBubble components. Koko's avatar (`KokoAnimation` at `sm` size, 40pt) anchors left. User response area anchors bottom. Suggested word chips displayed as TagPills above the response field.

**MemoryMapView**
```
Full-width map surface (Google Maps SDK)
Pins:          MemoryMapPin components (custom marker)
                Active pin (words due): brand-700 bg, white icon, elev-2
                Reviewed pin: brand-300 bg, small
                Tapped pin: expands to mini-card showing location name + word count
Clustering:    pins within 50px cluster into count badge
Controls:      locate-me button (bottom-right, elev-2), zoom standard
Legend:        compact bottom sheet: "• Due now  • Reviewed"
```

**ShopGrid**

2-column grid of PackCard components with a Premium banner occupying full width at top.

### 4.5 Template Specifications

**FullScreenScrollable**
```
Safe area top + status bar
Fixed header area (h1 title, optional action)
Scrollable content area (default padding: space-6)
Fixed bottom area (primary CTA, or BottomTabBar)
Safe area bottom
```

**CardCenterStage**
```
Safe area top
Minimal header (back button + progress)
Centered content area — card is vertically and horizontally centered
Bottom action row
Safe area bottom
Used by: Onboarding steps, Review session nodes
```

**SplitHeaderContent**
```
Safe area top
Header block (occupies approximately 35% of screen height)
  Contains: greeting, stats, Koko avatar (if applicable)
Content area (remaining 65%, scrollable)
BottomTabBar
Safe area bottom
Used by: Home tab
```

**BottomSheetOverlay**
```
Scrim: neutral-900 at 40% opacity, tap to dismiss
Sheet: white bg, radius-lg on top corners, max-height 90vh
Drag handle: 4×32px, neutral-300, centered, space-3 from top
Content: scrollable when height exceeds sheet max
Safe area bottom padding inside sheet

Gesture dismissal:
  Swipe down on sheet: dismiss when drag distance > 30% of sheet height
                        OR velocity > 300px/s (whichever fires first)
  Drag handle: interactive — drag down to dismiss, drag up to expand
  Partial drag: sheet follows finger; snaps back if threshold not met
  Animation: sheet slides down with ease-accelerate over 250ms on dismiss
  Reduced motion: instant dismiss on tap-scrim, no drag gesture (tap only)
```

---

## 5. KOKO CHARACTER & ANIMATION SYSTEM

### 5.0 Koko Visual Design Brief

Koko is a **small, abstract humanoid figure** — bipedal, round-headed, rendered in flat 2D vector. The character sits between human and cartoon: recognizable as a person-like entity, but stylized enough to feel designed rather than illustrated. Think of the character weight of Google's early Material Design mascots or the Headspace meditation characters — simple, clear silhouettes, no realistic detail.

**Visual characteristics:**
- **Form:** Round head (~60% of total height), compact torso, stubby arms that express through motion rather than gesture complexity. No detailed hands or feet — ends in rounded nubs.
- **Color:** Koko's body uses `brand-700` (#682069 Deep Purple) as primary fill with `white` detail lines. Facial features — large circular eyes, simple curved mouth — render in `white` and `brand-900`. No additional colors on the base character. Animation states add accent glow/sparkle in `brand-400` (#0cf6fc Bright Cyan) and `success-500`.
- **Style:** Flat vector, no gradients on the character body. Shadow cast as a flat `brand-200` (#ffe1df Light Peach) ellipse beneath the character, not a drop shadow.
- **Expression:** All emotion is carried by eye shape and mouth curve — no eyebrows, no complex facial geometry. Wide circle eyes = neutral/listening. Crescent eyes (squinting upward) = happy/celebrating. Slightly downward curve = thinking/reading.
- **Reference aesthetic:** Simpler than Duolingo's Duo (no feathers, no complex anatomy). Closer to the Notion mascot or early LINE Friends in terms of geometric simplicity. Warm, not intimidating.

**What Koko is NOT:**
- Not an animal or robot
- Not photo-realistic or 3D
- Not gendered through hairstyle, clothing, or accessories
- Not a floating head — always has a full body silhouette

This brief is the input for the Lottie animation production. All 7 animation states must be consistent with this character design.

### 5.1 Animation Asset Inventory

Koko animations are Lottie files (`expo-lottie` / `LottieView`). All assets are located in `\Kokoanimation\`.

```
╔══════════════════════════════════════════════════════════════════════╗
║  KokoAnimation Asset Registry                                        ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  File                        State           Loop    File size       ║
║  ──────────────────────────────────────────────────────────────────  ║
║  koko-idle.json              Resting/waiting  Yes    ~12KB           ║
║  koko-speaking.json          Koko talking     Yes    ~18KB           ║
║  koko-listening.json         Awaiting input   Yes    ~14KB           ║
║  koko-correct.json           Praise / win     No     ~16KB           ║
║  koko-thinking.json          Processing       Yes    ~15KB           ║
║  koko-waving.json            Greeting         No     ~13KB           ║
║  koko-reading.json           Loading / scan   Yes    ~17KB           ║
║                                                                      ║
║  Static fallbacks (prefers-reduced-motion):                          ║
║  \Kokoanimation\static\koko-idle.png                                 ║
║  \Kokoanimation\static\koko-happy.png                                ║
║                                                                      ║
╚══════════════════════════════════════════════════════════════════════╝
```

### 5.2 Screen-to-Animation Mapping

| Screen ID | Trigger | Animation |
|---|---|---|
| ONB-07 | First Snap prompt display | koko-waving.json |
| HOM-02 | Empty state (no words yet) | koko-waving.json |
| SNA-04 | Gemini processing | koko-reading.json |
| REV-00 | All words caught up | koko-correct.json → koko-idle.json |
| REV-00 | Zero corpus (no words captured yet) | koko-idle.json |
| REV-04 | Awaiting user response | koko-listening.json |
| REV-04 | Koko delivering reply | koko-speaking.json |
| REV-06 | Session complete | koko-correct.json (plays once, then idle) |

### 5.3 KokoAnimation Component Contract

```
Props:
  source:           require('\Kokoanimation\koko-{state}.json')
  autoPlay:         boolean
  loop:             boolean (false for koko-correct and koko-waving — plays once)
  size:             'sm' (40pt) | 'md' (80pt) | 'lg' (120pt)
  onAnimationFinish?: () => void   (for non-looping, triggers transition to idle)
  fallbackImage?:   ImageSource    (static PNG, shown when reducedMotion active)

Size usage:
  sm (40pt)   — inside ConversationBubble avatar slot
  md (80pt)   — supporting role on onboarding and empty-state screens
  lg (120pt)  — hero position on REV-06 Session Complete, ONB-07

Transitions between states:
  - State changes crossfade over 150ms (not a hard cut)
  - Non-looping animations fire onAnimationFinish → caller transitions to idle
  - koko-correct always plays to completion before idle resumes
```

### 5.4 Koko Design Constraints

Koko must not be resized below 40pt at any display density — below this size the character reads as abstract rather than expressive. On screens where space is constrained, omit Koko rather than shrink below minimum.

Koko must never appear on screens where the user's primary cognitive task is active evaluation — specifically, during the 3-second period after a fill-blank answer is submitted while correct/incorrect feedback renders. After feedback is shown, Koko may respond.

---

## 6. NAVIGATION ARCHITECTURE

### 6.1 Top-Level Structure

```
App Root
│
├── Onboarding Stack (shown when no user session exists)
│   ├── ONB-01  Splash / Welcome
│   ├── ONB-02  Authentication
│   ├── ONB-03  PDPA Consent Gate  ← all Firebase writes blocked until here
│   ├── ONB-04  Language Pair Selection
│   ├── ONB-05  Proficiency Assessment
│   ├── ONB-06  Goal & Time Commitment
│   └── ONB-07  First Snap Prompt
│
└── Main Tab Navigator (shown when user session exists + onboarding complete)
    ├── Home Tab
    │   ├── HOM-01  Home — Active Learner
    │   ├── HOM-02  Home — Empty State
    │   ├── HOM-03  Home — Streak at Risk
    │   └── HOM-04  Home — Notification Received
    │
    ├── Snap Tab
    │   ├── SNA-01  Camera Mode
    │   ├── SNA-02  Text Input Mode
    │   ├── SNA-03  GPS Mode
    │   ├── SNA-04  Processing / Loading
    │   └── SNA-05  Results
    │
    ├── Review Tab
    │   ├── REV-00  Review — Empty State (all caught up)
    │   ├── REV-01  Session Intro
    │   ├── REV-02  Flashcard Node
    │   ├── REV-03  Fill-Blank Node
    │   ├── REV-04  Koko Conversation Node
    │   ├── REV-05  Pronunciation Node
    │   └── REV-06  Session Complete
    │
    ├── Shop Tab
    │   ├── SHO-01  Shop Home
    │   ├── SHO-02  Pack Detail
    │   └── SHO-03  Premium Paywall
    │
    └── Profile Tab
        ├── PRO-01  Profile Overview
        ├── PRO-02  Memory Map Full Screen
        ├── PRO-03  Settings
        └── PRO-04  Privacy & Data
```

### 6.2 Navigation Transitions

| Transition type | Animation | Duration |
|---|---|---|
| Tab switch | Crossfade (no slide — prevents disorientation) | 200ms ease-standard |
| Stack push | Slide from right | 300ms ease-decelerate |
| Stack pop | Slide to right | 250ms ease-accelerate |
| Modal / Bottom sheet open | Slide up from bottom | 350ms ease-decelerate |
| Modal / Bottom sheet close | Slide down to bottom | 250ms ease-accelerate |
| Session node advance | Slide from right | 250ms ease-standard |

### 6.3 Deep Link Routing

FCM push notifications deep-link into the app. The following routes must be handled:

| FCM trigger | Deep link target |
|---|---|
| Location revisit (within 100m of pin) | REV-01 with words from that geohash pre-selected |
| Streak at risk (10pm) | REV-01 with quick-3 mode |
| Mission complete | HOM-01 with ScoreResultCard visible |
| Session due reminder | REV-01 |

---

## 7. SCREEN SPECIFICATIONS — ONBOARDING

### ONB-01: Splash / Welcome

Template: CardCenterStage (no navigation chrome)  
Entrance animation: Logo fades in over 600ms (duration-xslow), button slides up from +40px over 400ms after logo appears.

```
┌─────────────────────────┐
│                         │
│                         │  ← ambient blur orb top-left (primary-container/10)
│     ╔═══════════╗       │
│     ║  [KOKO]   ║       │  ← KokoAnimation: koko-wave (128×128, rounded-[40px])
│     ║  koko-wave║       │     bg-primary-container, shadow-xl
│     ╚═══════════╝       │
│                         │
│        Kotoka           │  ← h1, text-on-surface, tracking-tight
│                         │
│  Your serene memory     │  ← body-lg, text-outline, max-w-md
│  companion. Capture,    │
│  organize, and relive…  │
│                         │
│  ┌─────────────────┐    │
│  │   Get Started   │    │  ← bg-primary-container, rounded-xl, shadow-lg
│  └─────────────────┘    │
│                         │
│    Sign in to account   │  ← ghost, text-primary, font-label-md
│                         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┤  ← gradient-to-t from-background overlay
│  ┌──────┐ ┌────┐ ┌─────┐│  ← 3 floating glass cards (bg-white/70 blur-xl)
│  │📷    │ │⭐  │ │🔒   ││
│  │Snap  │ │AI  │ │Vault││
│  └──────┘ └────┘ └─────┘│
│                         │
│                         │  
└─────────────────────────┘

Screen bg: brand-50
Logo color: brand-700
Tagline: italic body, neutral-500, centered
Primary button: full width minus space-6 margins
```

### ONB-02: Authentication

Template: CardCenterStage  
Back button: top-left, Button (icon), navigates to ONB-01

```
┌─────────────────────────┐  ← mobile: single column, bg-white
│  ┌────┐                 │
│  │[K] │  Kotoka         │  ← mobile only: icon + wordmark (hidden md:hidden)
│  └────┘                 │     bg-primary-container rounded-xl w-16 h-16
│                         │
│  Welcome back           │  ← h2, text-on-surface
│  Please enter details   │  ← body-md, text-outline
│                         │
│  ┌─────────────────────┐│
│  │ [G]  Continue Google ││  ← outlined, border-outline-variant, rounded-xl
│  └─────────────────────┘│
│  ┌─────────────────────┐│
│  │ [🍎] Continue Apple  ││  ← solid black bg, rounded-xl
│  └─────────────────────┘│
│                         │
│  ─────  or sign in  ────│  ← caption, uppercase, tracking-widest
│                         │
│  Email address          │  ← label-md, text-on-surface-variant
│  ┌─────────────────────┐│
│  │  name@company.com   ││  ← rounded-xl, focus:ring-2 primary-container/20
│  └─────────────────────┘│
│                         │
│  Password    Forgot? →  │
│  ┌─────────────────────┐│
│  │  ••••••••      [👁] ││  ← visibility toggle button absolute right
│  └─────────────────────┘│
│                         │
│  ☑  Remember 30 days    │  ← checkbox, w-5 h-5
│                         │
│  ┌─────────────────────┐│
│  │  Sign in to Kotoka  ││  ← bg-primary-container, font-bold, rounded-xl
│  └─────────────────────┘│
│                         │
│  No account? Sign up →  │  ← body-md, text-primary font-bold
│                         │
│  Privacy · Terms        │  ← caption, text-outline, opacity-60
└─────────────────────────┘
  Desktop: left half = bg-primary brand panel with blur orbs
           right half = this form (w-2/5, bg-white)
  No bottom nav (onboarding)

Note: Apple Sign-In required on iOS for App Store compliance.
Android: Google only (hide Apple button entirely, not disable).
```

### ONB-03: PDPA Consent Gate (Mandatory)

Template: FullScreenScrollable  
This screen must complete before any Firebase writes occur. `FirebaseFirestore.disableNetwork()` is active until the user taps Accept.

```
┌─────────────────────────┐
│                         │  ← ambient orbs fixed top-right & bottom-left
│     ┌───────────┐       │
│     │  🛡 icon  │       │  ← w-xl h-xl, bg-primary-container/10, rounded-full
│     └───────────┘       │     icon text-h1 size, text-primary-container
│                         │
│   Help Kotoka learn     │  ← h2, text-on-surface, tracking-tight
│  To provide a seamless  │  ← body-md, text-on-surface-variant, max-w-sm
│  experience we need a   │
│  few permissions…       │
│                         │
│ ┌───────────────────────┐│
│ │ ┌──┐ Camera    ••• [●]││  ← white card, border-outline-variant
│ │ └──┘ Snap memories    ││     toggle ON = peer-checked:bg-primary-container
│ └───────────────────────┘│
│ ┌───────────────────────┐│
│ │ ┌──┐ Location   ••[○] ││  ← toggle OFF
│ │ └──┘ Geo-tag memories ││
│ └───────────────────────┘│
│ ┌───────────────────────┐│
│ │ ┌──┐ Microphone ••[●] ││
│ │ └──┘ Voice notes, AI  ││
│ └───────────────────────┘│
│ ┌───────────────────────┐│
│ │ ┌──┐ Notifications [●]││
│ │ └──┘ Smart reminders  ││
│ └───────────────────────┘│
│                          │
│  ┌──────────────────────┐│
│  │  Allow Selected      ││  ← primary CTA
│  └──────────────────────┘│
│      Maybe Later         │  ← ghost, text-primary
│                          │
│  Change anytime in       │  ← caption, text-on-surface-variant
│  Device Settings →       │
└──────────────────────────┘
  No bottom nav (onboarding)

ConsentRecord written to Firestore on tap:
  { version, timestamp, scope[], ip_hash (SHA-256) }

CONSENTRECORD WRITE FAILURE:
If the Firestore write fails (network loss, quota error):
  - Show inline error below the Accept button (not a full-screen error)
  - Copy: "Couldn't save your preferences. Check your connection and try again."
  - Error text: error-400 color, caption token
  - Button remains active — user can retry immediately
  - Do NOT navigate forward until write succeeds (PDPA compliance gate)
  - Auto-retry silently after 3s if user has not already tapped again
```

### ONB-04: Language Pair Selection

Template: CardCenterStage

```
┌─────────────────────────────────────────────┐
│   "What are you learning?"  (h1)            │
│                                             │
│   I speak:                                  │
│   ┌─────────────────────────────────────┐   │
│   │  Thai  (pre-selected from OS lang) ▾│   │  ← LanguagePairBadge dropdown
│   └─────────────────────────────────────┘   │
│                                             │
│   I want to learn:                          │
│    ┌─────────────────────────────────────┐  │
│    │  Thai  (pre-selected from OS lang) ▾│  │  ← LanguagePairBadge dropdown
│    └─────────────────────────────────────┘  │
│                                             │
│                                             │
│                                             │
│                                             │
│                                             │
│                                             │
│                                             │
│   ┌─────────────────────────────────────┐   │
│   │   Continue  (primary, disabled      │   │
│   │   until target selected)            │   │
│   └─────────────────────────────────────┘   │
└─────────────────────────────────────────────┘

Language options: Button (secondary) style, 2-column grid
Selected: brand-700 bg, white text
LanguagePairBadge: shows flag + script name for each option
Same-pair (e.g. Thai → Thai) automatically excluded from grid
```

### ONB-05: Proficiency Assessment

Template: FullScreenScrollable

```
> **Template reference:** `stitch_kotoka_design_builder/image.png` (Duolingo-style 2-card path selector)  
> **Assets:** `kotoka_logo/child_koko_nobg.png` (beginner) · `kotoka_logo/graduate_koko_nobg.png` (experienced)  

┌─────────────────────────┐
│ ◀  Kotoka    Step 2 of 4│  ← sticky header, bg-white, shadow-sm
├─────────────────────────┤  ← bar-style step progress below header
│ ████████████░░░░░░░░░░░ │     h-1.5, bg-primary (#0cf6fc) fill 50%
│                         │
│   Choose your path      │  ← h1, text-on-surface, text-center, tracking-tight
│  How familiar are you   │  ← body-md, text-heading (#8c6792), text-center
│  with this language?    │
│                         │
│ ┌───────────────────────┐│  ← Card 1: bg-white, border-outline-variant
│ │                       ││     rounded-xl, p-lg, shadow-sm
│ │   ┌───────────────┐   ││     hover: border-2 border-primary shadow-md
│ │   │  child_koko   │   ││  ← child_koko_nobg.png, w-32 h-32, object-contain
│ │   │   _nobg.png   │   ││     mx-auto mb-md
│ │   └───────────────┘   ││
│ │  Learning for the     ││  ← label-md font-bold, text-on-surface, text-center
│ │  first time?          ││
│ │  Start from scratch!  ││  ← caption, text-outline, text-center
│ └───────────────────────┘│
│                          │
│ ┌───────────────────────┐│  ← Card 2: same style
│ │                       ││
│ │  ┌───────────────┐    ││
│ │  │ graduate_koko │    ││  ← graduate_koko_nobg.png, w-32 h-32, object-contain
│ │  │  _nobg.png    │    ││
│ │  └───────────────┘    ││
│ │  Already know some?   ││  ← label-md font-bold, text-on-surface, text-center
│ │  Check your level!    ││  ← caption, text-outline, text-center
│ └───────────────────────┘│
│                          │
│     ○  ━━  ○  ○          │  ← step dots, fixed bottom
└──────────────────────────┘
  Selected state (either card):
    border-2 border-primary (#0cf6fc)
    bg-primary/5 (#0cf6fc at 5% opacity)
    ring-2 ring-primary/20
    shadow-lg
  No bottom nav (onboarding)
```

### ONB-06: Goal & Time Commitment

┌─────────────────────────┐
│ ◀  Kotoka  ━━━━━━━○     │  ← header + bar-style step progress (3/4 filled)
├─────────────────────────┤
│                         │
│  What's your focus?     │  ← h1, text-on-surface
│  Set your personalized  │  ← body-lg, text-on-surface-variant
│  goals and daily rhythm │
│                         │
│  Select Goals  Step 1/2 │  ← h2 + badge pill
│ ┌───────────────────────┐│
│ │ [🧠 Mental Clarity ✓] ││  ← ACTIVE chip: bg-primary-container
│ │ [📖 Daily Journaling]  ││  ← inactive: bg-surface-container-low
│ │ [📷 Visual Memory]     ││
│ │ [📅 Routine Build ✓]   ││  ← ACTIVE chip
│ │ [⏳ Past Review]       ││
│ │ [⚡ Focus Sprints]     ││
│ └───────────────────────┘│
│                          │
│  ┌──────────┐┌──────────┐│  ← 2-col bento insight row
│  │ 💡       ││ [image]  ││
│  │ Lucid    ││ Inspiring││
│  │ Thinking ││ Spaces   ││
│  └──────────┘└──────────┘│
│                          │
│  Commitment    Step 2/2  │  ← h2 + badge pill
│                          │
│  ╔═══════════════════════╗│
│  ║  ╔════╗               ║│  ← KokoAnimation: koko-encourage (small, right)
│  ║  ║KOKO║  Breezy  ●   ║│     positioned top-right of commitment section
│  ║  ╚════╝  5-10m/day   ║│
│  ╚═══════════════════════╝│  ← radio SELECTED: peer-checked:border-primary
│ ┌───────────────────────┐ │
│ │  🕐  Steady  15-20m ○ │ │  ← radio inactive
│ └───────────────────────┘ │
│ ┌───────────────────────┐ │
│ │  🏋  Deep Dive 30m+ ○ │ │
│ └───────────────────────┘ │
│                           │
│  ┌─────────────────────┐  │
│  │  Confirm Selection →│  │  ← bg-primary, rounded-xl
│  └─────────────────────┘  │
│  Change goals in settings │  ← caption, text-outline
└───────────────────────────┘
  No bottom nav (onboarding)
```

**KokoAnimation** → `koko-encourage` small widget beside the commitment section title — motivates the user to commit to a daily habit.

```

### ONB-07: First Snap Prompt

Template: CardCenterStage  
Koko animation: koko-waving.json, size lg (120pt), centered above copy

```
┌─────────────────────────┐
│                         │
│   You're all set!       │  ← h1, text-on-surface, tracking-tight
│   Kotoka is now ready   │  ← body-lg, text-secondary, max-w-md
│   to help you preserve… │
│                         │
│ ┌═══════════════════════╗│
│ ║                       ║│  ← col-span-8, koko-mascot-bg (radial gradient)
│ ║   ╔═══════════════╗   ║│     bg: radial-gradient(#e6f9fa → #ffffff)
│ ║   ║  KOKO MASCOT  ║   ║│
│ ║   ║ koko-celebrate║   ║│  ← KokoAnimation: koko-celebrate (w-64 h-64)
│ ║   ║  or koko-wave ║   ║│     drop-shadow-xl, object-contain
│ ║   ╚═══════════════╝   ║│
│ ║  🛡 Account Secured   ║│  ← label-md, text-primary-container
│ ╚═══════════════════════╝│
│ ┌───────────────────────┐│
│ │ ⭐ Smart Tags         ││  ← col-span-4, bento-card (border #e5eeff)
│ │ Koko auto-categorizes ││
│ └───────────────────────┘│
│ ┌───────────────────────┐│
│ │ ☁  Cloud Sync         ││
│ │ Encrypted, all devices││
│ └───────────────────────┘│
│                          │
│  ┌──────────────────────┐│
│  │ Snap my first place →││  ← primary CTA, bg-primary-container
│  └──────────────────────┘│
│     Take a tour first    │  ← ghost, text-secondary
│                          │
│                ┌────────┐│  ← fixed bottom-right toast
│                │✓ Setup ││    border-l-4 border-primary
│                └────────┘│
└──────────────────────────┘
  No bottom nav (onboarding)
```

**KokoAnimation** → `koko-celebrate` is the hero of this screen. Centered in the large 8-col bento card on a soft radial teal gradient background. This is the primary celebratory moment in the onboarding flow.

Snap button deep-links to Snap tab, camera mode (SNA-01)
```

---

## 8. SCREEN SPECIFICATIONS — HOME TAB

### NTF-01: Notification Permission Flow

Fires once, after the user completes their first Snap (SNA-05 results saved). Not shown during onboarding — waiting until the user has demonstrated value (their first words are in) maximizes allow rate.

**Pre-permission educational sheet (BottomSheetOverlay):**

```
┌─────────────────────────────────────────────┐
│  ▬▬▬  (drag handle)                         │
│                                             │
│  📍  "Review when you return"  (h2)         │
│                                             │
│  Kotoka notices when you're near a place    │
│  where you learned words — and sends a      │
│  30-second review right then.               │
│  (body, neutral-700)                        │
│                                             │
│  Studies show context-matched review        │
│  doubles retention. (caption, neutral-500)  │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Turn on reminders  (primary)      │    │  ← fires iOS/Android system dialog
│  └─────────────────────────────────────┘    │
│                                             │
│   Not now  (ghost → dismisses sheet,        │
│             sets remind_later=true,         │
│             re-prompts after 3rd session)   │
└─────────────────────────────────────────────┘
```

**Post-denial nudge (HOM-01 banner, shown once after denial):**
```
┌─────────────────────────────────────────────┐
│  🔔 Enable reminders for better recall       │  ← neutral-100 bg, body text
│     [Open Settings]  [Dismiss]               │  ← ghost buttons, right-aligned
└─────────────────────────────────────────────┘
```
Banner appears once on next HOM-01 visit after denial. Dismissed permanently on [Dismiss] tap. [Open Settings] → `Linking.openSettings()`.

### HOM-01: Home — Active Learner

Template: SplitHeaderContent

```
┌─────────────────────────┐
│ ☰   Kotoka         🔔   │  ← sticky header, bg-white, shadow-sm
├─────────────────────────┤
│ ┌═══════════════════════╗│
│ ║ 🔥 12 DAY STREAK      ║│  ← bg-primary-container, rounded-xl, p-xl
│ ║                       ║│     text: text-on-primary-container
│ ║  Keep the fire        ║│
│ ║  burning, Aiden.      ║│  ← h1/h2, leading-tight
│ ║                       ║│
│ ║  Your lucidity is at  ║│  ← body-lg, opacity-90
│ ║  an all-time high…    ║│
│ ║         ╭────────╮    ║│
│ ║         │  85%   │    ║│  ← SVG progress ring, w-32 h-32
│ ║         │  Daily │    ║│     stroke white/20 track + white progress
│ ║         ╰────────╯    ║│
│ ╚═══════════════════════╝│
│                          │
│  Daily Missions  View →  │  ← h3 + text-primary chevron link
│ ┌───────────────┐ ┌─────┐│
│ │ 📷 Visual     │ │[img]││  ← 2-col bento: md:col-span-2 + md:col-span-1
│ │   Anchor      │ │     ││     main card: bg-white, icon + title + body
│ │               │ │Grat.││     secondary: bg-surface-container-low + image hdr
│ │ [avatar] +12  │ │     ││
│ │ [Complete →]  │ │Resum││
│ └───────────────┘ └─────┘│
│                          │
│  Spatial Archive         │  ← h3 + filter/location icon buttons
│  Memories anchored…      │  ← caption, text-on-surface-variant
│ ┌────────────────────────┐│
│ │  [MAP IMAGE]    ❤ 📍  ││  ← h-[400px], relative, border-outline-variant
│ │                        ││     markers: bg-primary / bg-tertiary rounded-full
│ │    hover → [label]     ││     hover label: bg-white shadow-xl rounded-lg
│ │           ┌──────────┐ ││
│ │           │[img] Pk  │ ││  ← floating glass card: bg-white/90 blur-md
│ │           │2 nearby  │ ││
│ │           └──────────┘ ││
│ └────────────────────────┘│
│                          │
│ ┌──────┐┌──────┐┌──────┐┌┐│  ← 4-col stat tiles, bg-white, text-primary h2
│ │1,284 ││  92% ││  14  ││42│
│ │Mem.  ││Focus ││Cities││Cn│
│ └──────┘└──────┘└──────┘└┘│
│                        ⊕  │  ← FAB: fixed bottom-24 right-6, bg-primary
├─────────────────────────┤
│ [🏠]  📷    🧠    🛍   👤│  ← Home tab active (bg-cyan-50 rounded-xl capsule)
└─────────────────────────┘
```

**KokoAnimation** → `koko-idle` or `koko-encourage` as a small (64×64) widget tucked into the right side of the streak hero banner — gives the card personality and reinforces the Kotoka mascot identity during daily engagement.

Review card: tapping navigates to REV-01 with those words pre-loaded
Memory Map compact: tapping expands to PRO-02 full-screen map

LANGUAGE PAIR SWITCHING:
Design decision: one active pair at a time. All tabs (Home, Review, Snap)
filter content by the active pair. Switching pair clears the session queue
and reloads due words for the new pair.

Active pair indicator on HOM-01 (below greeting, above streak card):
┌──────────────────────────────────────────┐
│  [🇹🇭→🇬🇧 TH→EN]  ▾                     │  ← LanguagePairBadge, tappable
└──────────────────────────────────────────┘
Tap → BottomSheetOverlay with list of user's active pairs.
Each pair: LanguagePairBadge (flag + name) as selectable row.
"+ Add language pair" at bottom → navigates to ONB-04 (re-entry mode).
Selection: immediate — sheet closes, Home reloads for new pair.
```

### HOM-02: Home — Empty State (New User)

```
┌─────────────────────────────────────────────┐
│  Welcome, {name}                     🔔     │
│                                             │
│  [koko-waving.json — md size, 80pt]         │
│                                             │
│  "Snap your first place to unlock          │
│   your personal words."                     │
│   (body, neutral-700, centered)             │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  📷 Take my first Snap  (primary)   │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  or type a phrase you heard today:          │
│  ┌─────────────────────────────────────┐    │
│  │  "I heard..."   [→ Text Snap]       │    │  ← navigates to SNA-02
│  └─────────────────────────────────────┘    │
│                                             │
│  [Home]  [Snap]  [Review]  [Shop]  [Me]     │
└─────────────────────────────────────────────┘
```

### HOM-03: Home — Streak at Risk

Identical to HOM-01 with a warning banner:

```
┌─────────────────────────────────────────────┐
│  ┌───────────────────────────────────────┐  │
│  │  ⚠️  Streak at risk — review before   │  │  ← warning-100 bg, warning-500 text
│  │  midnight to keep your 12-day run.    │  │
│  └───────────────────────────────────────┘  │
│  ... rest of HOM-01 content ...             │
└─────────────────────────────────────────────┘
```

### HOM-04: Home — Location Review Triggered

Triggered when FCM push notification is tapped while app is open or backgrounded. Same as HOM-01 but the review card is elevated:

```
│  ┌─────────────────────────────────────┐    │
│  │  📍 You're near Silom Office!       │    │  ← brand-700 bg, white text
│  │  Review your 8 words from here?     │    │     elev-2 shadow
│  │  [Start 30-sec review] (white btn)  │    │
│  └─────────────────────────────────────┘    │
```

---

## 9. SCREEN SPECIFICATIONS — SNAP TAB

### SNA-01: Camera Mode

Template: Full-screen camera (no tab chrome visible during capture)

```
┌─────────────────────────────────────────────┐
│         [FULL CAMERA VIEWFINDER]            │
│                                             │
│  ┌────────────────────────────────────────┐ │
│  │   [Camera]  |   [Text]  |   [GPS]     │ │  ← SnapTabSwitcher (below status bar)
│  └────────────────────────────────────────┘ │
│                                             │
│         [Live camera feed]                  │
│                                             │
│   [MobileNetV3 overlay: real-time           │
│    object detection bounding boxes,         │
│    semi-transparent brand-400 borders]      │
│                                             │
│  ┌───────────────────────────────────────┐  │
│  │  Sensory: 📍 Silom  ☀️ 28°C          │  │  ← auto-populated strip
│  │  Mood: [────●────]  6 / 10            │  │  ← user-adjustable slider
│  └───────────────────────────────────────┘  │
│                                             │
│                ◎  SNAP                      │  ← large capture button, 72px diameter
│                                             │
└─────────────────────────────────────────────┘

Sensory strip: brand-900 bg at 80% opacity, text: white caption
Mood slider: brand-500 thumb, neutral-300 track
Object detection overlay: shown after 1s stable detection, fades in
Capture button: white bg, brand-700 border, 4px stroke
              Tap: scales to 0.9 and back over 150ms, triggers capture
```

### SNA-02: Text Input Mode

```
┌─────────────────────────────────────────────┐
│  ┌────────────────────────────────────────┐ │
│  │   [Camera]  |   [Text]  |   [GPS]     │ │
│  └────────────────────────────────────────┘ │
│                                             │
│  "Type or paste words you want to learn:"   │
│   (body, neutral-700)                       │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │                                     │    │
│  │  e.g. "the proposal is due"         │    │
│  │                                     │    │  ← tall text input, 6 lines visible
│  │                                  32 │    │  ← char count, caption, neutral-400
│  └─────────────────────────────────────┘    │
│                                             │
│  [📋 Paste]      [🎤 Voice input]            │  ← icon buttons, 44pt
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Generate words  (primary)         │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

### SNA-03: GPS Mode

```
┌─────────────────────────────────────────────┐
│  ┌────────────────────────────────────────┐ │
│  │   [Camera]  |   [Text]  |   [GPS]     │ │
│  └────────────────────────────────────────┘ │
│                                             │
│  [Mini map — current location, pin]         │  ← Google Maps embedded, no interaction
│  [Map height: 200px]                        │
│                                             │
│  📍 Detected: Café Amazon                  │  ← h3, neutral-900
│     Silom Road, Bangkok                    │  ← body, neutral-700
│     Category: coffee_shop                  │  ← TagPill
│                                             │
│  "Learn words for this place?"              │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Yes, teach me coffee shop words   │    │  ← primary button
│  └─────────────────────────────────────┘    │
│                                             │
│   Not here right now  [change location]     │  ← ghost button
└─────────────────────────────────────────────┘
```

### SNA-04: Processing (Loading)

Template: CardCenterStage  
Koko animation: koko-reading.json, loop, md size (80pt)

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│  [koko-reading.json — 80pt, looping]        │
│                                             │
│  "Reading your photo..."  (h3, neutral-700) │
│  [LoadingPulse bar — full width, animated]  │
│                                             │
│  Gemini is finding the words that           │
│  matter in this place.                      │
│  (caption, neutral-500, centered)           │
│                                             │
│                                             │
│   [Cancel]  (ghost button)                  │
└─────────────────────────────────────────────┘

Target latency: 1.8s average (Gemini 2.5 Flash)

TIMEOUT ERROR STATE (fires at 8 seconds):
┌─────────────────────────────────────────────┐
│                                             │
│  [koko-idle.json — md, 80pt]                │
│                                             │
│  "Taking longer than usual."  (h3)          │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Try again  (primary)              │    │  ← retries Gemini call, preserves
│  └─────────────────────────────────────┘    │     sensory data from capture
│  ┌─────────────────────────────────────┐    │
│  │   Use Text mode instead  (ghost)    │    │  ← navigates to SNA-02, pre-fills
│  └─────────────────────────────────────┘    │     detected object labels as text
│                                             │
└─────────────────────────────────────────────┘
Sensory data (location, weather, mood) is preserved across retry.
Back button is visible — tap exits to SNA-01 (camera mode).

GEMINI API FAILURE (non-timeout):
Same layout as timeout. Copy: "Koko couldn't read this one. Try again or switch to Text mode."
```

### SNA-05: Snap Results

Template: FullScreenScrollable

```
┌─────────────────────────────────────────────┐
│  ←  Back        "12 words found"     [✓]    │  ← header: h3, checkmark saves all
│                                             │
│  📍 Silom Office  ☀️ 22°C  😊 6/10          │  ← SensoryTagBar (full)
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  STAKEHOLDER                    [+] │    │  ← VocabCard compact
│  │  ผู้มีส่วนได้ส่วนเสีย                │    │    [+] adds individually
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │  DEADLINE                       [+] │    │
│  │  กำหนดเวลา                          │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │  PROPOSAL                       [+] │    │
│  │  ข้อเสนอ                            │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │  + 9 more — tap to expand           │    │  ← collapsed by default
│  └─────────────────────────────────────┘    │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Save all to my words  (primary)   │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │   Review now (quick 3-min)(secondary│    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘

Compact VocabCard: target word (h3) + native (caption) + add button
Added words: [+] becomes [✓] (success-500 checkmark), not removable without full delete
```

---

## 10. SCREEN SPECIFICATIONS — REVIEW TAB

### WRD-01: Word Management Flow

Accessible from: REV-00 word history list (long-press on any VocabCard compact row).

**Long-press context menu (BottomSheetOverlay, compact):**
```
┌─────────────────────────────────────────────┐
│  ▬▬▬                                        │
│                                             │
│  "STAKEHOLDER"  (h3, neutral-900)           │
│  📍 Silom Office · April 15                 │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  [✏️]  Edit translation  (ghost)    │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │  [🗑️]  Remove this word  (ghost)   │    │  ← error-400 text color
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

**Edit translation flow:**
- Bottom sheet expands: shows current native text in editable text field
- User edits → tap "Save" (primary) → updates Firestore, closes sheet
- Undo: toast "Translation updated" with [Undo] for 4s

**Delete word flow:**
- Tap "Remove this word" → confirmation inline within same sheet:
  "Remove STAKEHOLDER from your words? This cannot be undone."
  [Remove] (error-400 text, ghost) | [Keep it] (primary)
- No full-screen confirmation — inline is sufficient for single-word delete
- On confirm: haptic (impact medium), word removed from Firestore, sheet closes
- Toast: "STAKEHOLDER removed" (no undo — deletion is intentional)

**Batch delete (scene-level):**
- Accessible from: PRO-02 Memory Map → tap pin → sheet → "Manage scene words"
- Scene word list: all words from that pin, checkboxes
- Select all / deselect all toggle at top
- "Remove selected" (error-400 text) at bottom
- Confirmation: "Remove {n} words from Silom Office? This cannot be undone."
- [Remove {n} words] | [Cancel]

### REV-00: Review Empty State (All Caught Up)

```
┌─────────────────────────────────────────────┐
│  Review                                     │
│                                             │
│  [koko-correct.json → fades to koko-idle]   │
│                                             │
│  "All caught up!"  (h2, neutral-900)        │
│                                             │
│  Your next review:                          │
│  📍 Silom Office words → in 3 days          │
│  (body, neutral-700)                        │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Snap a new place  (primary)       │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  or explore your word history below:        │
│  [Scrollable word list — compact VocabCards]│
└─────────────────────────────────────────────┘
```

### REV-01: Session Intro

```
┌─────────────────────────────────────────────┐
│  Today's review                  [Skip →]   │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  8 words due                        │    │
│  │  ~10 minutes                        │    │
│  │                                     │    │
│  │  From:                              │    │
│  │  📍 Silom Office    (5 words)       │    │
│  │  📍 Café Amazon     (3 words)       │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  [SessionProgressBar: 0 / 8]               │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Start session  (primary)          │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  [Quick mode: 3 words, 2 min]               │  ← ghost button
└─────────────────────────────────────────────┘
```

### REV-02: Flashcard Node

Template: CardCenterStage

```
┌─────────────────────────────────────────────┐
│  [≡]  ──████░░░░──  3 of 8      [✕]         │  ← SessionProgressBar
│                                             │
│  📍 Silom Office  ☀️ 22°C  😤 6/10          │  ← SensoryTagBar
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │                                     │    │
│  │        STAKEHOLDER                  │    │  ← target-word, 28px bold
│  │        [🔊]                         │    │  ← audio button
│  │                                     │    │
│  │   ──────────────────────────────    │    │
│  │                                     │    │
│  │   [Tap card or swipe up to reveal]  │    │  ← caption, neutral-400
│  │                                     │    │
│  └─────────────────────────────────────┘    │
│         ↑ FlashcardFlip component           │
└─────────────────────────────────────────────┘

AFTER FLIP — self-rating appears below card:
│                                             │
│  How did you do?  (body, neutral-700)       │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │ 😕 Hard  │  │ 🙂  OK   │  │ 😄 Easy  │  │
│  └──────────┘  └──────────┘  └──────────┘  │

Rating maps to SRS grade: Hard=0, OK=1, Easy=2
Tapping any rating advances to next node (250ms slide transition)
```

### REV-03: Fill-Blank Node

Template: CardCenterStage

```
┌─────────────────────────────────────────────┐
│  [≡]  ──█████░░░──  4 of 8     [✕]          │
│                                             │
│  📍 Silom Office  ☀️ 22°C                   │
│                                             │
│  Complete the sentence:  (h3)               │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  "Please send the _____ to all      │    │  ← FillBlankInput
│  │   team members before the meeting." │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  ┌──────────┐  ┌──────────┐                 │
│  │  agenda  │  │  brief   │                 │
│  └──────────┘  └──────────┘                 │
│  ┌──────────┐  ┌──────────┐                 │
│  │ proposal │  │follow-up │                 │
│  └──────────┘  └──────────┘                 │
│                                             │
│  Hint: [📍 Silom Office, Day 1]             │  ← TagPill
└─────────────────────────────────────────────┘

Post-selection feedback (150ms):
  Correct: selected option turns success-500 border + success-100 bg
  Incorrect: selected option turns error-400 border + error-100 bg,
             correct answer shown in success green simultaneously
  Neither state is alarming — both read as neutral annotation, not punishment
Auto-advance: 1.2s after correct, 2s after incorrect (shows correct answer)
```

### REV-04: Koko Conversation Node

Template: FullScreenScrollable with fixed input area at bottom

```
┌─────────────────────────────────────────────┐
│  [≡]  ──██████░░──  5 of 8     [✕]          │
│                                             │
│  [koko-listening.json → koko-speaking.json] │  ← size sm (40pt) in bubble
│                                             │
│  ┌───────────────────────────────────────┐  │
│  │ [Koko 40pt]  "Your manager just       │  │  ← ConversationBubble (Koko)
│  │               walked in. How do you   │  │
│  │               tell her the proposal   │  │
│  │               is ready?"              │  │
│  └───────────────────────────────────────┘  │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  Your response:  (label)            │    │
│  │  ________________________           │    │  ← text input
│  │  [🎤 Tap to speak]                  │    │  ← or voice
│  └─────────────────────────────────────┘    │
│                                             │
│  Suggested:  [proposal]  [ready]  [send]    │  ← TagPill chips
│              [update]                       │
└─────────────────────────────────────────────┘

After user responds:
Koko replies in ConversationBubble with correction or encouragement
koko-listening.json → koko-speaking.json during Koko's reply
"Good — you used 'proposal' naturally. Filing it." (Koko voice copy)
```

### REV-05: Pronunciation Node

```
┌─────────────────────────────────────────────┐
│  [≡]  ──███████░──  6 of 8     [✕]          │
│                                             │
│  Say this word:  (h3)                       │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │                                     │    │
│  │         STAKEHOLDER                 │    │  ← target-word, 28px
│  │      /ˈsteɪkhoʊldər/               │    │  ← romanization (IPA)
│  │         [🔊 Listen]                 │    │  ← plays TTS audio
│  │                                     │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  [PronunciationWaveform — animated bars]    │  ← active during recording
│  ┌─────────────────────────────────────┐    │
│  │  ~~~~~~~~~~~~    [🎤 Record]        │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  Koko: "Try again — stress the first        │  ← ConversationBubble, Koko speaking
│          syllable: STAKE."                  │
└─────────────────────────────────────────────┘

PronunciationWaveform:
  Idle: flat line, neutral-200
  Recording: animated bars, brand-500, random heights 4–24px
  Playback: animated bars, neutral-400

STT FAILURE STATE:
  If STT returns error or times out after 5s:
  Koko bubble: "I didn't catch that. Tap the mic and try again."
  Retry: waveform area shows Button (secondary) "Try again"
  After 2 consecutive failures: ghost skip option appears
  "Skip pronunciation for now" → advances to next node,
  flags word with pronunciation_skipped=true, re-queues for next session
```

### REV-06: Session Complete

Template: CardCenterStage  
Koko animation: koko-correct.json (plays once) → koko-idle.json

```
┌─────────────────────────────────────────────┐
│                                             │
│  ✅  Session Complete!  (h1)                │
│                                             │
│  [koko-correct.json → koko-idle.json]       │  ← lg size (120pt)
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  ScoreResultCard                    │    │
│  │                                     │    │
│  │  7 / 8 correct  •  + 85 XP          │    │
│  │  Streak: 🔥 13 days                 │    │
│  │                                     │    │
│  │  Strongest:  stakeholder            │    │
│  │  Needs more: agenda                 │    │
│  │                                     │    │
│  │  Next review:                       │    │
│  │  📍 Silom Office → in 3 days        │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Back to home  (primary)           │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │   Snap another place  (secondary)   │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

---

## 11. SCREEN SPECIFICATIONS — SHOP TAB

### SHO-00: Shop — Pre-Phase 4 Placeholder State

During Phase 2 and Phase 3 builds, the Shop tab is visible in the BottomTabBar but purchase logic is not implemented. The placeholder state prevents user confusion and avoids broken tap targets.

**Design decision: option B — UI visible, purchases disabled with tooltip.**

```
┌─────────────────────────────────────────────┐
│  Shop                          🪙 — XP      │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  ⭐ Kotoka Premium                  │    │  ← banner visible but greyed
│  │  Coming soon to your version.       │    │  ← neutral-500 text
│  │  [Notify me when available]         │    │  ← ghost button, stores flag
│  └─────────────────────────────────────┘    │
│                                             │
│  Vocab Packs ─────────────────────────────  │
│  ┌─────────────┐  ┌─────────────┐           │
│  │  PackCard   │  │  PackCard   │           │  ← cards visible
│  │  ☕ Café    │  │  🏥 Medical │           │
│  │  🔒 Soon    │  │  🔒 Soon    │           │  ← lock icon replaces XP cost
│  └─────────────┘  └─────────────┘           │
│                                             │
│  Tapping a locked PackCard → toast:         │
│  "Shop opens in the next update. Stay tuned!"│
└─────────────────────────────────────────────┘

PackCard locked state:
  lock icon: Ionicons lock-closed-outline, neutral-400
  XP badge replaced by TagPill "Soon" in neutral-300 bg
  card opacity: 0.7
  tap: fires Toast (bottom, 2s), no navigation
```

### SHO-01: Shop Home

Template: FullScreenScrollable

```
┌─────────────────────────────────────────────┐
│  Shop                          🪙 240 XP    │  ← h1 + XP badge
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  ⭐  Kotoka Premium                 │    │  ← Premium banner, brand-700 bg
│  │  Unlimited snaps, offline packs,    │    │     white text
│  │  Koko priority replies              │    │
│  │                                     │    │
│  │  ฿299/month                         │    │
│  │  [Start 7-day trial]  (white btn)   │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  Vocab Packs ─────────────────────────────  │
│  (h2, neutral-900)                          │
│                                             │
│  ┌─────────────┐  ┌─────────────┐           │
│  │  PackCard   │  │  PackCard   │           │  ← 2-col ShopGrid
│  │  ☕ Café    │  │  🏥 Medical │           │
│  │  200 words  │  │  150 words  │           │
│  │  🪙 500 XP  │  │  🪙 500 XP  │           │
│  └─────────────┘  └─────────────┘           │
│  ┌─────────────┐  ┌─────────────┐           │
│  │  ✈️ Travel  │  │  💼 Office  │           │
│  │  180 words  │  │  220 words  │           │
│  │  🪙 500 XP  │  │  🪙 500 XP  │           │
│  └─────────────┘  └─────────────┘           │
│                                             │
│  [Home]  [Snap]  [Review]  [Shop]  [Me]     │
└─────────────────────────────────────────────┘

PackCard:
  bg: white, radius-md, elev-1
  Icon: emoji, 48px, top-left
  Title: h3
  Word count: caption, neutral-500
  XP cost: Badge (XP variant), bottom-right
  Tap: navigates to SHO-02
  Purchased: shows "✓ Owned" label over XP badge
```

### SHO-02: Pack Detail

```
┌─────────────────────────────────────────────┐
│  ←  Office Pack                             │
│                                             │
│  💼  Office  (hero icon, 64px)              │
│  220 words  •  8 topics                     │
│                                             │
│  Topics:                                    │
│  [Meetings]  [Emails]  [Deadlines]          │
│  [Proposals] [Reports] [HR]                 │
│  [Finance]   [Projects]                     │
│  (TagPill grid)                             │
│                                             │
│  Preview words:                             │
│  stakeholder, deadline, deliverable,        │
│  agenda, follow-up, minutes, KPI, ...       │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Unlock for 🪙 500 XP  (primary)   │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  "Premium members unlock all packs free."   │
│  [See Premium →]  (ghost)                   │
└─────────────────────────────────────────────┘
```

### SHO-03: Premium Paywall

Template: FullScreenScrollable

```
┌─────────────────────────────────────────────┐
│  ←                                          │
│                                             │
│  ⭐ Kotoka Premium  (h1, brand-700)          │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  ✓ Unlimited snaps per day          │    │
│  │  ✓ All vocab packs unlocked         │    │
│  │  ✓ Koko priority replies            │    │
│  │  ✓ Offline review mode              │    │
│  │  ✓ Advanced analytics               │    │
│  └─────────────────────────────────────┘    │
│  (Each row: 20px gap, checkmark: success)   │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   ฿299/month                        │    │
│  │   [Start 7-day free trial]          │    │  ← primary, full width
│  └─────────────────────────────────────┘    │
│                                             │
│  No credit card required.                   │
│  Cancel anytime. (caption, neutral-500)     │
│                                             │
│  ReceiptModal: shown post-purchase          │
└─────────────────────────────────────────────┘
```

---

## 12. SCREEN SPECIFICATIONS — PROFILE TAB

### PRO-01: Profile Overview

Template: FullScreenScrollable

```
┌─────────────────────────────────────────────┐
│  Profile                             ⚙️      │  ← settings icon, top-right
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │  [Avatar 64px]  Pam                 │    │
│  │                 Thai → English       │    │
│  │                 B1 Intermediate      │    │
│  │  🔥 13 days  •  📚 847 words         │    │
│  └─────────────────────────────────────┘    │
│                                             │
│  My Memory Map ───────────────────────────  │
│  [MemoryMapView compact, 200px height]      │
│  [shows all pins, tap → PRO-02 full screen] │
│                                             │
│  Stats this week ─────────────────────────  │
│  Words learned:   24                        │
│  Sessions:         7                        │
│  Accuracy:        83%                       │
│                                             │
│  Language pairs ──────────────────────────  │
│  [LanguagePairBadge]  TH → EN  (active)     │
│  [+ Add another language pair]              │
│                                             │
│  [Home]  [Snap]  [Review]  [Shop]  [Me]     │
└─────────────────────────────────────────────┘
```

### PRO-02: Memory Map — Full Screen

Template: Full-screen map (no tab chrome)

```
┌─────────────────────────────────────────────┐
│  ←  Memory Map                              │
│                                             │
│  [Full MemoryMapView — Google Maps]         │
│                                             │
│  [MemoryMapPin × n — all user locations]    │
│   Active pin (words due): brand-700 bg      │
│   Reviewed pin: brand-300 bg, smaller       │
│                                             │
│  [Tapped pin — expands BottomSheetOverlay:] │
│  📍 Silom Office                            │
│  8 words captured · 5 due · Last: 3 days ago│
│  [Review now →] (primary, in sheet)         │
│                                             │
│  [locate-me button, bottom-right, 44×44pt]  │
└─────────────────────────────────────────────┘
```

### PRO-03: Settings

```
┌─────────────────────────────────────────────┐
│  ←  Settings                                │
│                                             │
│  ACCOUNT ────────────────────────────────   │
│  Display name           Pam        [edit]   │
│  Email                  pam@...             │
│  Language pair          TH → EN    [change] │
│  Daily goal             10 min     [change] │
│                                             │
│  NOTIFICATIONS ───────────────────────────  │
│  Location reviews          [toggle ON]      │
│  Streak reminders          [toggle ON]      │
│  Mission updates           [toggle OFF]     │
│                                             │
│  LEARNING ────────────────────────────────  │
│  Proficiency level      B1         [retake] │
│  Reset progress                    [→]      │
│                                             │
│  ABOUT ────────────────────────────────────  │
│  Privacy & Data                    [→]      │
│  Terms of Service                  [→]      │
│  Version 1.0.0                              │
│  Sign out                          [→]      │
└─────────────────────────────────────────────┘
```

### PRO-04: Privacy & Data

```
┌─────────────────────────────────────────────┐
│  ←  Privacy & Data                          │
│                                             │
│  Your data, your control.  (h2)             │
│                                             │
│  What we collect:                           │
│  • Words you capture (stored in your        │
│    account, not shared)                     │
│  • Location geohash (approximate zone,      │
│    not exact coordinates)                   │
│  • Session performance (for scheduling)     │
│                                             │
│  What we never collect:                     │
│  • Raw photos (processed on-device only)    │
│  • Exact GPS coordinates                    │
│  • Microphone audio beyond the session      │
│                                             │
│  ┌─────────────────────────────────────┐    │
│  │   Export my data  (secondary)       │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │   Delete my account (ghost/danger)  │    │
│  └─────────────────────────────────────┘    │
│  (danger ghost: error-400 text, not red bg) │
└─────────────────────────────────────────────┘
```

---

## 13. INTERACTION PATTERNS & MICRO-ANIMATIONS

### 13.1 Touch Feedback

Every interactive element produces immediate (≤16ms) visual feedback. No element may feel unresponsive.

| Element | Feedback | Duration |
|---|---|---|
| Button (primary) | Scale 0.97, bg darkens to brand-800 | 150ms ease-standard |
| Button (secondary) | Scale 0.97, bg fills to brand-100 | 150ms |
| Button (ghost) | bg fills to brand-50 | 150ms |
| Tab bar icon | Scale 1.15 bounce | 150ms ease-spring |
| Card tap | Scale 0.98, shadow elevates to elev-2 | 150ms |
| FlashcardFlip | 180° Y-axis rotate | 250ms ease-spring |

### 13.2 Haptic Feedback

Haptics fire independently of visual motion. Reducing visual motion does NOT disable haptics — they serve a separate sensory channel. Haptics are implemented via `expo-haptics`.

| Event | Haptic type | expo-haptics call |
|---|---|---|
| Correct answer (fill-blank) | Notification success | `Haptics.notificationAsync(NotificationFeedbackType.Success)` |
| Incorrect answer (fill-blank) | Notification warning | `Haptics.notificationAsync(NotificationFeedbackType.Warning)` |
| Card flip (flashcard) | Impact light | `Haptics.impactAsync(ImpactFeedbackStyle.Light)` |
| Session complete | Notification success | `Haptics.notificationAsync(NotificationFeedbackType.Success)` |
| Streak milestone (every 7 days) | Impact heavy | `Haptics.impactAsync(ImpactFeedbackStyle.Heavy)` |
| Button tap (primary only) | Selection | `Haptics.selectionAsync()` |
| Word added to corpus (SNA-05 [+]) | Impact light | `Haptics.impactAsync(ImpactFeedbackStyle.Light)` |
| Word deleted | Impact medium | `Haptics.impactAsync(ImpactFeedbackStyle.Medium)` |

**No haptics on:** ghost buttons, tab bar taps, scroll events, loading states, error annotation display.

### 13.3 State Transition Catalog

**Correct answer feedback (fill-blank):**
1. User taps option (150ms): option border turns success-500, bg fills success-100
2. Wait 300ms (user sees result)
3. SessionProgressBar fill animates to next step (250ms ease-decelerate)
4. Slide to next node (250ms slide-from-right)

**Incorrect answer feedback (fill-blank):**
1. User taps option (150ms): option border error-400, bg error-100
2. Simultaneously: correct answer highlighted in success-500
3. Wait 1.5s (user sees both states simultaneously)
4. Advance to next node

**Session XP award:**
1. ScoreResultCard enters from bottom (slide up, 400ms ease-decelerate)
2. XP counter animates from 0 to final value (600ms, numeric counter, ease-standard)
3. Koko animation plays koko-correct.json once, then idles

**Memory Map pin proximity trigger:**
1. Pin pulses (scale 1.0 → 1.2 → 1.0, 800ms loop) when within 150m
2. FCM notification fires; on tap: BottomSheetOverlay rises with review prompt
3. User taps "Start review" → transitions to REV-01 with geohash-filtered words

### 13.3 Loading States

Every async operation longer than 300ms shows a loading indicator. Every operation longer than 1 second shows `LoadingPulse` plus copy explaining what is happening.

| Operation | Loading UI |
|---|---|
| App cold launch | Splash (ONB-01) with logo fade |
| Gemini processing (Snap) | SNA-04 full-screen with koko-reading + LoadingPulse |
| Session load | REV-01 with subtle LoadingPulse in progress bar area |
| Map tiles | MemoryMapView shows neutral-100 skeleton until tiles render |
| Profile stats | Skeleton placeholders (neutral-100 animated shimmer) |

### 13.4 Empty States

Every empty state has a clear call-to-action. No dead ends.

| Screen | Empty condition | Koko animation | CTA |
|---|---|---|---|
| HOM-02 | No words captured | koko-waving.json (md) | "Take my first Snap" |
| REV-00 | No words due | koko-correct.json → idle | "Snap a new place" |
| REV-00 | No words at all | koko-idle.json | "Take my first Snap" |
| Memory Map | No pins yet | None (map renders with pulse on current location) | "Snap near here" bottom sheet |

### 13.5 Error States

Errors are informational, never alarming. The visual weight of error states is deliberately lower than success states, because errors are expected events in language learning.

| Error type | Visual treatment |
|---|---|
| Network failure (Snap processing) | error-100 bg, body copy explaining state, retry button |
| Session load failure | Inline card with ghost retry button |
| Auth failure | Shake animation on button (150ms, ±4px horizontal), copy explains |
| Gemini timeout (8s) | Transition to error screen: "Taking longer than usual. Try again?" |

---

## 14. ACCESSIBILITY SPECIFICATION

Kotoka targets WCAG 2.1 AA compliance across all screens. The following requirements are non-negotiable for Phase 1 sign-off.

### 14.1 Color Contrast

| Text use | Background | Ratio | Requirement |
|---|---|---|---|
| Body text (neutral-900) | white | 18.1:1 | ≥ 4.5:1 ✓ |
| Body text (neutral-900) | brand-50 | 16.8:1 | ≥ 4.5:1 ✓ |
| Caption (neutral-500) | white | 4.6:1 | ≥ 4.5:1 ✓ |
| White text on brand-700 | brand-700 | 5.9:1 | ≥ 4.5:1 ✓ |
| Error annotation (error-400) | white | 4.6:1 | ≥ 4.5:1 ✓ |

**Rule:** Never use color as the sole differentiator. Correct/incorrect states must also use iconography or text labels — not color alone.

### 14.2 Touch Targets

All interactive elements: minimum **44×44pt**. This is not a recommended size; it is a hard constraint.

| Component | Touch area |
|---|---|
| BottomTabBar each tab | Full tab width × full bar height (~83pt) |
| Button (primary) | 52pt height, full available width |
| Button (icon) | 44×44pt padded area around 24pt icon |
| FlashcardFlip tap area | Full card area |
| Self-rating buttons | Full third of bottom area each |
| StreakFlame | 44×44pt padded area |

### 14.3 Screen Reader Support

Every non-text element requires an `accessibilityLabel`. The following specific cases must be implemented:

```
KokoAnimation:
  accessibilityLabel = "Koko {state description}"
  e.g. "Koko waving hello" / "Koko reading your photo"

SensoryTagBar:
  accessibilityLabel = "Captured at {zone}, {temp} degrees,
                        mood {n} out of 10, sound type {type}"

MoodColorDot:
  accessibilityHint = "Mood color indicator — {mood description}"
  accessibilityRole = "none" (decorative, label on parent)

ProgressRing:
  accessibilityLabel = "{n} percent complete"
  accessibilityRole = "progressbar"

FlashcardFlip (front):
  accessibilityLabel = "Vocabulary card: {word}. Double tap to reveal translation."

FlashcardFlip (back):
  accessibilityLabel = "{word}: {native text}. Example: {example sentence}.
                        Captured at {location}."

Rating buttons:
  accessibilityLabel = "Rate as Hard" / "Rate as OK" / "Rate as Easy"
```

### 14.4 Dynamic Type

All text components support Dynamic Type scaling up to `xxxLarge`. Cards must reflow, not clip, at 200% text size. Test all screens at maximum system text size before handoff.

### 14.5 Reduced Motion

Check `useReducedMotion()` at app launch and subscribe to changes. When true:

- All `KokoAnimation` components: replace with corresponding static PNG from `\Kokoanimation\static\`
- All transition animations: instant state change (0ms duration)
- `FlashcardFlip`: instant crossfade, no 3D rotation
- `LoadingPulse`: static bar at 50% fill
- Tab icon bounce: no bounce, just color change

---

## 15. CONTENT & COPY GUIDELINES

### 15.1 Voice Rules Summarized

```
DO:
  ✓ Short sentences (under 15 words per sentence)
  ✓ Second person ("your words", "your streak")
  ✓ Specific numbers ("3 words", "30 seconds", "12 days")
  ✓ Active voice ("Koko finds" not "words are found")
  ✓ Outcome-focused ("Your brain is filing it")
  ✓ Name the location, date, context — personalize always

DON'T:
  ✗ Exclamation marks for errors ("Wrong! Try again!")
  ✗ Passive voice ("Your words have been saved")
  ✗ Vague encouragement ("Great job!" without specifics)
  ✗ Clinical language ("Your spaced repetition interval is 3.2 days")
  ✗ Condescension ("Don't worry, you'll get it next time!")
  ✗ Generic content ("Keep up the good work!")
```

### 15.2 Screen-Level Copy Templates

**Onboarding headline formula:**
`"[Verb your action]. Your [noun] your [result]."` — short, personal, active.

Examples:
- "Snap your desk. Your office. Your language."
- "Your mood and surroundings matter. Koko reads them."

**Review prompt formula:**
`"You're near [Location]. [n]-second review?"` — personal, minimal ask.

**Error copy formula:**
`"[What happened]. [One-sentence fix]."` — never blame, always actionable.

Examples:
- "Connection lost. Check your signal and try again."
- "Gemini is thinking. Tap to retry."

**Session complete formula:**
`"[Streak/XP statement]. [Outcome statement]."` — achievement-first, forward-pointing.

Examples:
- "85 XP earned. Your brain just filed 'deadline' for good."
- "13-day streak. Clients won't know what hit them."

### 15.3 FCM Notification Copy

FCM messages must pass this three-question test before launch:

1. **Is it personal?** Does it name a specific location, word count, or streak length?
2. **Is the ask minimal?** Does it name a specific time (30 seconds, 3 words)?
3. **Does it avoid guilt?** Is the language warm, not shaming?

| Trigger | Template | Example |
|---|---|---|
| Location revisit | "You're near {location} — {n}-second review?" | "You're near Silom Office — 30-second review?" |
| Streak at risk | "🔥 Don't break your {n}-day streak. {m} words, {t} seconds." | "🔥 Don't break your 12-day streak. 3 words, 60 seconds." |
| Mission complete | "✅ {Pack name} complete. {n} words. {Confident outcome statement}." | "✅ Office Pack complete. 200 words. Your clients won't know what hit them." |
| Session reminder | "{Name}, {n} words are ready for review." | "Pam, 8 words are ready for review." |

### 15.4 Error Message Library

| Error code | User-facing copy |
|---|---|
| Network timeout (Snap) | "Gemini is taking longer than usual. Tap to try again." |
| Auth failed | "Sign-in didn't work. Check your Google account and try again." |
| Camera permission denied | "Kotoka needs camera access to snap your surroundings. Open Settings to allow." |
| Location permission denied | "Location helps Kotoka know when to send reminders. Open Settings to enable." |
| Gemini quota hit | "We're at capacity right now. Try snapping again in a minute." |
| No words found in image | "Koko couldn't find words here. Try a different angle or use Text mode." |

---

## 16. DESIGN HANDOFF CHECKLIST

This checklist must be completed for every screen before Phase 2 implementation begins. An incomplete checklist means the screen is not ready for development.

### 16.1 Per-Screen Checklist

For each of the 43 specified screens:

- [ ] Screen ID and name documented
- [ ] Template assigned (FullScreenScrollable / CardCenterStage / SplitHeaderContent / BottomSheetOverlay)
- [ ] All interactive elements identified and labeled with component names
- [ ] All states documented (empty / loading / error / success / edge case)
- [ ] All copy strings provided (no placeholder text in final spec)
- [ ] Touch target minimum 44×44pt verified for all interactive elements
- [ ] Color tokens only (no hex values in component spec)
- [ ] Spacing tokens only (no raw pixel values in component spec)
- [ ] Koko animation state specified if Koko appears on screen
- [ ] Navigation target specified for every tap action
- [ ] Reduced-motion fallback described if screen contains animation
- [ ] Screen-reader accessibilityLabel provided for all non-text elements

### 16.2 Design System Checklist

- [ ] All 14 atoms specified with all states (default, pressed, disabled, focused)
- [ ] All 12 molecules specified with all variants
- [ ] All 8 organisms specified with composition rules
- [ ] All 4 templates specified with safe-area instructions
- [ ] Color token table complete and named
- [ ] Typography token table complete and named
- [ ] Spacing token table complete
- [ ] Motion token table complete with reduced-motion fallbacks
- [ ] Koko animation asset inventory complete (7 Lottie files + 2 static PNGs)
- [ ] Font loading list complete (10 font files × 4 scripts)

### 16.3 Accessibility Checklist

- [ ] Contrast ratio verified for all text/background combinations
- [ ] All interactive elements ≥ 44×44pt
- [ ] All non-text elements have accessibilityLabel
- [ ] Dynamic Type tested at xxxLarge scale
- [ ] Reduced motion path tested for every animated component
- [ ] Screen reader traversal order verified (left-to-right, top-to-bottom)

### 16.4 Sign-Off Condition

Phase 2 implementation begins only when:

1. All 43 screens pass the per-screen checklist
2. All design system tokens are finalized and agreed with engineering
3. All Koko Lottie animation assets are delivered and quality-checked
4. Accessibility checklist is complete with no open items
5. A designer representative signs the handoff document with date

**Handoff document location:** `.omc/specs/design-handoff-v1.0.md`  
**Figma file:** Link to be added when Figma equivalent of this spec is delivered.

---

## APPENDIX A — DESIGN DECISIONS LOG

This section records design decisions that are non-obvious, where a future reviewer might question the choice.

**Why no dark mode in Phase 1?**  
Dark mode doubles the token system and every component's test matrix. Phase 1 must ship quickly. Dark mode token slots are reserved in the naming convention (`brand-50` → `dark:brand-900` etc.) for Phase 3.

**Why three self-rating options (Hard / OK / Easy) rather than five?**  
Five options (Anki-style: Again / Hard / Good / Easy / Perfect) create decision paralysis in 30-second review windows. Three options with emoji reduce cognitive load while providing sufficient signal for the FSRS algorithm. The mapping Hard=0, OK=1, Easy=2 maps directly to FSRS grade inputs.

**Why is the error state color (error-400 = #d8566a) softer than a typical red?**  
Design Law 1 prohibits guilt. A full saturated red (#EF4444) reads as alarming and activates negative associations with academic failure. `#d8566a` reads as annotation rather than danger — the semantic function is "this is the right answer" not "you failed." Both correct and incorrect annotations should feel informational.

**Why is MoodColorDot color-only (no text label)?**  
Within SensoryTagBar, adding a text label for mood ("stressed") would conflict with the tagline label ("6/10") that already describes the mood numerically. The dot provides visual differentiation between cards with different mood encodings at a glance. The accessibilityLabel on the SensoryTagBar reads the full mood value to screen readers.

**Why does the FlashcardFlip auto-advance after incorrect answers but not correct?**  
Correct answers already give the user the rating control (Hard / OK / Easy), which is itself the advance gesture. Incorrect answers skip this and auto-advance because showing the rating control after an incorrect answer creates a friction point that discourages honest reporting. The system infers a Hard rating after an incorrect fill-blank.

**Why is SNA-04 (Processing) a full-screen interstitial rather than an inline spinner?**  
Gemini processing averages 1.8 seconds. Anything over 1 second on a blank or partially-rendered screen causes anxiety. The full-screen Koko + copy pattern transforms the wait into a moment of brand character — "Koko is reading your photo" — which reduces perceived wait time and reinforces the personality.

---

## APPENDIX B — COMPONENT PROP TABLES

### Button States

| State | Background | Text color | Border | Shadow | Scale |
|---|---|---|---|---|---|
| Primary default | brand-700 | white | none | elev-1 | 1.0 |
| Primary pressed | brand-800 | white | none | elev-0 | 0.97 |
| Primary disabled | brand-300 | neutral-500 | none | none | 1.0 |
| Secondary default | transparent | brand-700 | 1.5px brand-700 | none | 1.0 |
| Secondary pressed | brand-100 | brand-700 | 1.5px brand-700 | none | 0.97 |
| Ghost default | transparent | brand-600 | none | none | 1.0 |
| Ghost pressed | brand-50 | brand-600 | none | none | 1.0 |

### VocabCard Mood Tint Mapping

| Mood score | Color token | Hex at 20% opacity | Condition |
|---|---|---|---|
| 7–10 (stressed) | mood-stressed | #ffdfa2 at 20% | Pale Yellow wash |
| 4–6 (neutral) | mood-neutral | #ffb6cb (brand-50) | Pink tint |
| 8–10 (energized, low stress) | mood-energized | #ffe1df at 20% | Light Peach wash |
| 1–3 (calm) | mood-calm | #e8e1f0 at 20% | Very Light Lavender wash |

---

*Document: KOTOKA DESIGN SPECIFICATION v1.0*  
*Phase: 1 — Design System & Full UI/UX Specification*  
*Gating condition: Phase 2 implementation may not begin until this document is signed off.*  
*Version date: 2026-04-23*
