# KOTOKA — Product Requirements Document (PRD)
# Version 1.0 | 4-Phase Development Plan
# Senior Developer: Kotoka Engineering Team
# Date: 2026-04-21
# Status: DRAFT — Under Autoresearch Review

---

## TABLE OF CONTENTS

1. Executive Summary
2. Product Vision & Problem Statement
3. User Personas & Journey Maps
4. System Architecture Overview
5. Phase 1 — Design System & Full UI/UX Specification
6. Phase 2 — Foundation & Core Data Pipeline
7. Phase 3 — AI/Learning Engine & Sensory Layer
8. Phase 4 — Monetization, Polish & Launch
9. Effort Parity Matrix
10. Cross-Phase Dependencies
11. Acceptance Criteria Checklist
12. Risk Register
13. Glossary

---

## 1. EXECUTIVE SUMMARY

Kotoka is a sensory-anchored mobile vocabulary application built on the thesis that language acquisition fails not from lack of study but from activation failure — words encoded in generic contexts cannot be retrieved in personal, real-world situations. Kotoka breaks this loop by making the user's own life the curriculum: every word enters through a photograph, a typed phrase, or a visited location, and every review fires at the moment the user returns to where learning happened.

This PRD defines a four-phase development roadmap that transforms the full Kotoka specification into a shippable iOS and Android product. The four phases are:

- **Phase 1 — Design System & Full UI/UX Specification:** Complete Figma-equivalent wireframe specifications for all 40+ screens, the full design system (tokens, typography, color, motion), component library, and accessibility guidelines. No code is written. The output is a design artifact that Phase 2 implements.

- **Phase 2 — Foundation & Core Data Pipeline:** Project scaffolding, Firebase/Firestore integration, authentication, onboarding implementation, the Snap input pipeline (camera, text, GPS), Gemini-powered vocabulary generation, and basic word corpus storage. The user can capture words and view them.

- **Phase 3 — AI/Learning Engine & Sensory Layer:** The full SRS algorithm (δS_KOTOKA = 0), mixed session engine (four node types), Koko AI conversation partner, sensory tag engine, Memory Map with geohash, FCM location-based push, six-language support, and pronunciation assessment. The core learning loop is complete.

- **Phase 4 — Monetization, Polish & Launch:** KotoCoin economy, subscription model, Shop screen, streak and mission system, Firebase Analytics, performance optimization, App Store/Play Store submission, PDPA/legal compliance, beta testing, and crash monitoring. The product is live.

**Platform:** React Native + Expo (iOS + Android, single codebase)
**Target users:** Working adults 22–35, Bangkok and SEA metros
**Languages supported (v1.0):** Thai, English, Mandarin Chinese, Spanish, Vietnamese, Lao (30 directional pairs)
**Mathematical foundation:** δS_KOTOKA = 0 — all scheduling decisions derive from a single variational action functional

---

## 2. PRODUCT VISION & PROBLEM STATEMENT

### 2.1 The Activation Failure Gap

Eighty-six point seven percent of Bangkok working adults surveyed report vocabulary retrieval failure in live workplace conversation despite twelve or more years of formal English education. The gap is not vocabulary deficit — the words exist in long-term memory. The gap is activation failure: words encoded in classroom contexts cannot be retrieved in office, café, or hospital contexts because none of the original encoding cues are present at retrieval time.

Three root causes drive this:

```
╔══════════════════════════════════════════════════════════════════╗
║                     ROOT CAUSE ANALYSIS                          ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  ROOT CAUSE 1 — NO PERSONAL RELEVANCE ANCHOR                     ║
║  ─────────────────────────────────────────────────────────────   ║
║  Generic content ("the cat is on the table") encodes with        ║
║  zero emotional weight. Dual coding theory (Paivio, 1991)        ║
║  shows emotionally neutral content produces weak memory          ║
║  traces. Words without personal stakes are forgotten fastest.    ║
║                                                                  ║
║  ROOT CAUSE 2 — CONTEXT-ENCODING MISMATCH                        ║
║  ─────────────────────────────────────────────────────────────   ║
║  Retrieval is strongest when context at recall matches           ║
║  context at encoding (Godden & Baddeley, 1975). Words            ║
║  encoded in classrooms are retrieved in classrooms — not         ║
║  in offices, pharmacies, or airport terminals.                   ║
║                                                                  ║
║  ROOT CAUSE 3 — NO SENSORY BINDING                               ║
║  ─────────────────────────────────────────────────────────────   ║
║  Location, ambient sound, temperature, and emotional state       ║
║  at encoding time strengthen memory traces. Traditional apps     ║
║  capture none of these. Kotoka captures all six.                 ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

### 2.2 The Solution

Kotoka operationalizes three evidence-backed interventions:

1. **Personal content sourcing** — words enter only from the user's own photographs, typed phrases, and visited locations. No shared curriculum exists.
2. **Sensory encoding** — six contextual channels (visual scene, location category, weather, mood, energy level, sound type) are captured at the moment of learning and replayed at review.
3. **Location-triggered review** — when the user physically returns within 150 meters of a learning event, FCM fires a micro-review that reinstates the original encoding context, exploiting the context-matching effect.

### 2.3 The One-Sentence Product Statement

> Kotoka turns the user's own life into their language curriculum — every word captured where they live, tagged with what they felt, reviewed when they return.

---

## 3. USER PERSONAS & JOURNEY MAPS

### 3.1 Primary Persona — Pam

| Attribute | Value |
|-----------|-------|
| Age / role | 28, Marketing coordinator, Silom BTS area |
| Native language | Thai |
| Target language | English |
| Core pain | Freezes mid-sentence on client calls with foreign partners |
| Daily time available | 10–15 minutes |
| Learning goal | Career / professional English |
| Aha moment | Reviews "deadline" and "proposal" at her own desk on Day 2 |

### 3.2 Secondary Persona — Nong

| Attribute | Value |
|-----------|-------|
| Age / role | 31, Logistics supervisor, Lat Krabang industrial estate |
| Native language | Thai |
| Target language | Mandarin Chinese |
| Core pain | Needs shipping/warehouse vocabulary for Mandarin-speaking suppliers |
| Daily time available | 5–10 minutes |
| Learning goal | Work / supplier communication |
| Aha moment | Reviews "cargo manifest" and "lead time" while walking the warehouse floor |

### 3.3 Journey Map — Pam (Day 1 → Day 3)

```
DAY 1
  ┌──────────────────────────────────────────────────────────────┐
  │  09:00  Downloads Kotoka on BTS commute                      │
  │  09:05  Google Sign-In → PDPA consent (Photos / GPS / Voice) │
  │  09:08  Selects Thai→English, Intermediate, Career goal,     │
  │         10 min/day                                           │
  │  09:12  Arrives at office → Opens Snap → Photographs desk    │
  │  09:13  Gemini generates 12 words:                           │
  │         deadline, proposal, stakeholder, agenda,             │
  │         follow-up, deliverable, minute (meeting),            │
  │         brief (n), reschedule, cc (verb), draft, sign-off    │
  │  09:14  Sensory tags captured:                               │
  │         zone: Silom office, temp: 22°C AC, mood: 6/10,       │
  │         energy: 7/10, sound: quiet office, time: morning     │
  │         geohash: w3gv2kp (150m radius)                       │
  │  09:15  Memory Map pin placed — words stored                 │
  └──────────────────────────────────────────────────────────────┘

DAY 2
  ┌──────────────────────────────────────────────────────────────┐
  │  09:01  Pam enters BTS Chong Nonsi area (within 150m pin)    │
  │  09:01  FCM fires: "You're near Silom Office — 30-sec        │
  │         review?"                                             │
  │  09:02  Opens notification → 3-card micro-review session     │
  │         Flashcard: "stakeholder" — recalled correctly        │
  │         Flashcard: "deliverable" — recalled correctly        │
  │         Fill-blank: "Can you send me the ___?" → "brief"     │
  │  09:03  +30 XP, streak: 2 days                               │
  │  09:03  SRS schedules next review in 3 days                  │
  └──────────────────────────────────────────────────────────────┘

DAY 3
  ┌──────────────────────────────────────────────────────────────┐
  │  12:30  Lunch break — opens Review tab                       │
  │  12:30  Mixed session: 8 words, 10 min quota                 │
  │         Node 1: Flashcard (deadline)                         │
  │         Node 2: Fill-blank (proposal in email context)       │
  │         Node 3: Koko conversation ("Your client just         │
  │                 asked for an update. What do you say?")      │
  │         Node 4: Pronunciation (stakeholder — Koko            │
  │                 repeats and compares)                        │
  │  12:40  Session complete — 7/8 correct, +85 XP               │
  │  12:40  SRS extends intervals on 7 words, flags "agenda"     │
  │         for extra review                                     │
  └──────────────────────────────────────────────────────────────┘
```

---

## 4. SYSTEM ARCHITECTURE OVERVIEW

### 4.1 Full Stack Diagram

```
╔═════════════════════════════════════════════════════════════════════╗
║               CLIENT — React Native (Expo)                          ║
║                                                                     ║
║  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌─────────┐  ║
║  │  HOME    │ │   SNAP   │ │  REVIEW  │ │   SHOP   │ │PROFILE  │  ║
║  │ Streak   │ │ Camera   │ │ Session  │ │ Premium  │ │ Stats   │  ║
║  │ Missions │ │ Text in  │ │ Mix nodes│ │KotoCoin  │ │ Map     │  ║
║  │ Quick Md │ │ GPS      │ │ SRS queue│ │ Packs    │ │ Privacy │  ║
║  └──────────┘ └──────────┘ └──────────┘ └──────────┘ └─────────┘  ║
║                                                                     ║
║  STATE: Zustand (global) + Firestore offline + SQLCipher local      ║
║  AUDIO: Expo AV (TTS playback, SFX, ambient)                        ║
║  CAMERA: Expo Camera + MobileNetV3 (on-device object detect)        ║
╚══════════════════════╦══════════════════════════════════════════════╝
                       ║ HTTPS · Firebase ID token (15 min expiry)
                       ║ All requests authenticated — no exceptions
                       ▼
╔═════════════════════════════════════════════════════════════════════╗
║             CLOUD RUN API LAYER (Node.js / Fastify)                 ║
║                                                                     ║
║  POST /analyze-image       Gemini 2.5 Flash proxy, 14 RPM queue     ║
║  POST /generate-sentence   Gemini fill-blank generation             ║
║  POST /koko-reply          Gemini conversation turn                 ║
║  POST /srs-schedule        S(w) scorer + session builder            ║
║  POST /tts                 Google Cloud TTS proxy                   ║
║  POST /verify-receipt      Google Play/Apple receipt validation     ║
║  POST /sensory-prompt      Assemble Gemini system prompt            ║
╚══════════════════════╦══════════════════════════════════════════════╝
                       ║
                       ▼
╔═════════════════════════════════════════════════════════════════════╗
║                   GOOGLE CLOUD SERVICES                             ║
║                                                                     ║
║  Cloud Firestore    Cloud Storage     Cloud STT (Chirp 3)           ║
║  User data          Photos, audio     Tone-aware ZH & VI            ║
║  Word corpus        Vocab packs                                     ║
║                                                                     ║
║  Cloud TTS          Maps Places API   Weather API                   ║
║  Koko voice         Zone classify     30-min cache                  ║
║  Multi-lang         Geohash encode    Auto sensory tag              ║
║                                                                     ║
║  Firebase Auth      FCM               Cloud Build                   ║
║  Google Sign-In     Push triggers     CI/CD pipeline                ║
║  ID token 15min     Revisit/streak    npm audit gate                ║
║                                                                     ║
║  Firebase Analytics + Crashlytics     Cloud Run compute             ║
╚═════════════════════════════════════════════════════════════════════╝
```

### 4.2 Tech Stack Summary

| Layer | Technology | Rationale |
|-------|-----------|-----------|
| Mobile framework | React Native + Expo | Cross-platform, single codebase, 48h build viable |
| AI vision + text | Gemini 2.5 Flash | Multimodal, 1.8s avg latency, 6-language support |
| Speech-to-text | Google Cloud STT Chirp 3 | Tone-aware for Mandarin and Vietnamese |
| Text-to-speech | Google Cloud TTS | Koko voice, multi-language |
| Location + maps | Google Maps Places API | Zone classification + Memory Map |
| Auth | Firebase Auth | Google Sign-In, 15-min ID token |
| Database | Cloud Firestore | Offline-first, real-time sync |
| Object storage | Google Cloud Storage | Photos, audio, vocab packs |
| Compute | Google Cloud Run | API layer, Gemini proxy |
| Push | Firebase Cloud Messaging | Location-triggered, streak, mission |
| State | Zustand | Lightweight React Native state |
| Navigation | React Navigation | Bottom tabs + stack |
| Styling | NativeWind | Tailwind-style for React Native |
| Local cache | SQLCipher | Encrypted local word/pin storage |

---

## 5. PHASE 1 — DESIGN SYSTEM & FULL UI/UX SPECIFICATION

### Phase Summary

| Attribute | Value |
|-----------|-------|
| Deliverable type | Design specification only (no code) |
| Output format | This PRD section + companion Figma file |
| Screens specified | 43 screens total |
| Components specified | 34 components |
| Design tokens | Colors, typography, spacing, motion, elevation |
| Effort level | High — establishes every visual and interaction contract |
| Gating condition | Phase 2 cannot begin implementation until Phase 1 is signed off |

### 5.1 Design Philosophy

Kotoka's visual design carries two simultaneous responsibilities: it must feel **warm and personal** (the product is a memory companion, not a drill tool) and **cognitively lightweight** (users are reviewing vocabulary in 30-second windows on a commute). Every design decision is evaluated against both axes.

**Three design laws:**
1. **No guilt.** Never use red danger states for vocabulary errors. Errors are data, not failures.
2. **Context is king.** The sensory tags — location icon, weather state, mood color — must be visible on every review card. They are the product's core differentiator.
3. **30 seconds is a session.** Every screen must be operable with one thumb in three taps or fewer.

### 5.2 Design Token System

#### 5.2.1 Color Palette — Teal-Purple Theme

```
╔══════════════════════════════════════════════════════════════════╗
║                    KOTOKA COLOR SYSTEM                           ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  PRIMARY TEAL-PURPLE                                             ║
║  ─────────────────────────────────────────────────────────────   ║
║  brand-900    #000000   Black — app bar, header text             ║
║  brand-800    #4a1549   Dark purple shade — tab bar active       ║
║  brand-700    #682069   Deep purple — primary buttons, CTA       ║
║  brand-600    #8c6792   Dark purple — interactive elements, links ║
║  brand-500    #00c8cc   Teal/Cyan — accent, progress bars        ║
║  brand-400    #0cf6fc   Bright Cyan — highlight, selected state  ║
║  brand-300    #ffb6cb   Pink — disabled active, tag pills        ║
║  brand-200    #ffe1df   Light Peach — backgrounds, card tints    ║
║  brand-100    #ffe1df   Light Peach — surface light, onboarding bg ║
║  brand-50     #e8e1f0   Very Light Lavender — page background    ║
║                                                                  ║
║  SEMANTIC COLORS                                                 ║
║  ─────────────────────────────────────────────────────────────   ║
║  success      #10B981   Correct answer, streak active            ║
║  warning      #ffdfa2   Pale Yellow/Tan — streak at risk, due-soon badge ║
║  error        #d8566a   Red/Pink — wrong answer annotation       ║
║  neutral-900  #111827   Primary text                             ║
║  neutral-700  #374151   Secondary text                           ║
║  neutral-500  #6B7280   Caption, placeholder                     ║
║  neutral-200  #E5E7EB   Dividers, card borders                   ║
║  neutral-50   #F9FAFB   Surface default                          ║
║  white        #ffffff   Cards, overlays                          ║
║                                                                  ║
║  SENSORY MOOD TINTS (overlay on review cards)                    ║
║  ─────────────────────────────────────────────────────────────   ║
║  mood-stressed   #ffdfa2   Pale Yellow wash (7–10 stress score)  ║
║  mood-neutral    #ffb6cb   Pink tint (default neutral)           ║
║  mood-happy      #ffb6cb   Pink wash (joy state)                 ║
║  mood-energized  #ffe1df   Light Peach wash (high energy score)  ║
║  mood-calm       #e8e1f0   Very Light Lavender (low energy, low stress) ║
╚══════════════════════════════════════════════════════════════════╝
```

#### 5.2.2 Typography System

```
╔══════════════════════════════════════════════════════════════════╗
║                    TYPOGRAPHY SYSTEM                             ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  Script       Languages       Primary Font         Fallback       ║
║  ──────────────────────────────────────────────────────────────  ║
║  Latin        EN, ES, VI      IBM Plex Sans         System UI    ║
║  Thai         TH              Sarabun               Noto Sans TH  ║
║  Chinese (SC) ZH              Noto Sans SC          System CJK   ║
║  Lao          LO              Noto Sans Lao         System       ║
║                                                                  ║
║  TYPE SCALE (all scripts, same numeric spec)                     ║
║  ──────────────────────────────────────────────────────────────  ║
║  Token        Weight      Size    Line-height   Usage            ║
║  h1           Bold        20px    1.3           Screen titles    ║
║  h2           Bold        18px    1.3           Section titles   ║
║  h3           SemiBold    16px    1.4           Card headers     ║
║  body         Regular     14px    1.6           Body copy        ║
║  caption      Regular     12px    1.5  #6B7280  Metadata         ║
║  label        Medium      12px    1.4           Form labels      ║
║  button       SemiBold    14px    1.0           Button text      ║
║  target-word  Bold        28px    1.2           Vocab display    ║
║  romanization Regular     16px    1.4  #6B7280  Pinyin/romaji    ║
╚══════════════════════════════════════════════════════════════════╝
```

#### 5.2.3 Spacing & Elevation

```
Spacing scale (4px base unit):
  space-1   4px     micro gap
  space-2   8px     icon-to-label, tag interior
  space-3   12px    component interior padding (compact)
  space-4   16px    component interior padding (default)
  space-6   24px    section padding, card padding
  space-8   32px    page header padding
  space-12  48px    large section gaps
  space-16  64px    splash screen vertical rhythm

Border radius:
  radius-sm    6px    tags, chips
  radius-md    12px   cards
  radius-lg    20px   bottom sheets, modals
  radius-full  9999px buttons, avatars, pills

Elevation (shadow):
  elev-0    no shadow       flat surfaces
  elev-1    0 1 3 #0001A    subtle card lift
  elev-2    0 4 12 #0001A   floating card, active card
  elev-3    0 8 24 #0002A   modal, bottom sheet
```

#### 5.2.4 Motion & Animation

```
Duration tokens:
  duration-fast    150ms    micro interactions (tap feedback)
  duration-normal  250ms    transitions (page nav, card flip)
  duration-slow    400ms    reveal animations (session start)
  duration-xslow   600ms    splash, onboarding fade

Easing:
  ease-standard    cubic-bezier(0.4, 0, 0.2, 1)    default
  ease-decelerate  cubic-bezier(0, 0, 0.2, 1)       entering elements
  ease-accelerate  cubic-bezier(0.4, 0, 1, 1)       exiting elements
  ease-spring      spring(1, 100, 10, 0)             card flip, bounce

Accessibility: ALL animations respect `prefers-reduced-motion`.
Animated values must degrade to instant transitions if motion reduced.
```

### 5.3 Component Library Specification

#### Component Catalog

```
╔══════════════════════════════════════════════════════════════════╗
║               COMPONENT LIBRARY — 34 COMPONENTS                  ║
╠══════════════════════════╦═══════════════════════════════════════╣
║  ATOMS (14)              ║  MOLECULES (12)                       ║
║  ────────────────────    ║  ────────────────────────────────     ║
║  Button (primary)        ║  VocabCard                           ║
║  Button (secondary)      ║  SensoryTagBar                       ║
║  Button (ghost)          ║  MissionCard                         ║
║  Button (icon)           ║  MemoryMapPin                        ║
║  TagPill                 ║  SessionProgressBar                  ║
║  Badge (XP, count)       ║  FlashcardFlip                       ║
║  Avatar (Koko)           ║  FillBlankInput                      ║
║  StreakFlame             ║  ConversationBubble                  ║
║  ProgressRing            ║  PronunciationWaveform               ║
║  LanguagePairBadge       ║  ScoreResultCard                     ║
║  MoodColorDot            ║  PackCard (Shop)                     ║
║  WeatherIcon             ║  ReceiptModal                        ║
║  SoundTypeIcon           ║                                      ║
║  LoadingPulse            ║                                      ║
╠══════════════════════════╬═══════════════════════════════════════╣
║  ORGANISMS (8)           ║  TEMPLATES (4 screen layouts)        ║
║  ────────────────────    ║  ────────────────────────────        ║
║  BottomTabBar            ║  FullScreenScrollable                ║
║  HomeStreakHeader        ║  CardCenterStage                     ║
║  SnapTabSwitcher         ║  SplitHeaderContent                  ║
║  ReviewSessionContainer  ║  BottomSheetOverlay                  ║
║  KokoConversationThread  ║                                      ║
║  MemoryMapView           ║                                      ║
║  ShopGrid                ║                                      ║
║  OnboardingStep          ║                                      ║
╚══════════════════════════╩═══════════════════════════════════════╝
```

#### Key Component: KokoAnimation

```
╔══════════════════════════════════════════════════════════════════╗
║  KokoAnimation — Lottie animation wrapper for Koko mascot        ║
║  ─────────────────────────────────────────────────────────────   ║
║                                                                  ║
║  Asset directory: \Kokoanimation\                                 ║
║                                                                  ║
║  File                              State          Loop  Size     ║
║  ──────────────────────────────────────────────────────────────  ║
║  \Kokoanimation\koko-idle.json     Resting        yes   ~12KB    ║
║  \Kokoanimation\koko-speaking.json Koko talking   yes   ~18KB    ║
║  \Kokoanimation\koko-listening.json Waiting input  yes   ~14KB    ║
║  \Kokoanimation\koko-correct.json  Praise/win     no    ~16KB    ║
║  \Kokoanimation\koko-thinking.json Processing     yes   ~15KB    ║
║  \Kokoanimation\koko-waving.json   Greeting       no    ~13KB    ║
║  \Kokoanimation\koko-reading.json  Loading/scan   yes   ~17KB    ║
║                                                                  ║
║  Screen → animation mapping:                                     ║
║  ──────────────────────────────────────────────────────────────  ║
║  ONB-07  First Snap prompt         koko-waving.json              ║
║  HOM-02  Empty state (no words)    koko-waving.json              ║
║  SNA-04  Processing / loading      koko-reading.json             ║
║  REV-00  All caught up             koko-correct.json (then idle) ║
║  REV-00  Zero corpus               koko-idle.json                ║
║  REV-04  Koko awaiting response    koko-listening.json           ║
║  REV-04  Koko speaking turn        koko-speaking.json            ║
║  REV-06  Session complete          koko-correct.json             ║
║                                                                  ║
║  Component props:                                                ║
║    source: require('\Kokoanimation\koko-{state}.json')           ║
║    autoPlay: boolean                                             ║
║    loop: boolean                                                 ║
║    size: 'sm' (40pt) | 'md' (80pt) | 'lg' (120pt)               ║
║    onAnimationFinish?: () => void  (non-loop animations only)    ║
║                                                                  ║
║  Library: expo-lottie (LottieView)                               ║
║  Reduced motion: static PNG fallback from \Kokoanimation\static\ ║
║    \Kokoanimation\static\koko-idle.png                           ║
║    \Kokoanimation\static\koko-happy.png                          ║
╚══════════════════════════════════════════════════════════════════╝
```

#### Key Component: VocabCard

```
╔═══════════════════════════════════════════╗
║  VocabCard — Primary review unit          ║
║  ─────────────────────────────────────    ║
║  ┌─────────────────────────────────────┐  ║
║  │  [MoodColorDot] [WeatherIcon] [Zone]│  ║
║  │  ─────────────────────────────────  │  ║
║  │                                     │  ║
║  │         STAKEHOLDER                 │  ║
║  │         (target-word, 28px)         │  ║
║  │                                     │  ║
║  │         [🔊 audio button]            │  ║
║  │                                     │  ║
║  │  ─────────────────────────────────  │  ║
║  │  ผู้มีส่วนได้ส่วนเสีย (native text)  │  ║
║  │  Example: "All stakeholders must    │  ║
║  │  approve the final proposal."       │  ║
║  │                                     │  ║
║  │  [📍 Silom Office — April 15]       │  ║
║  └─────────────────────────────────────┘  ║
║                                           ║
║  Props:                                   ║
║  - word: Word object                      ║
║  - showNative: boolean (flip state)       ║
║  - onFlip: () => void                     ║
║  - onAudio: () => void                    ║
║  - moodTint: mood-stressed | neutral...   ║
╚═══════════════════════════════════════════╝
```

#### Key Component: SensoryTagBar

```
┌────────────────────────────────────────────────────────┐
│  SensoryTagBar                                         │
│  ─────────────────────────────────────────────────     │
│  [📍 Silom Office] [☀️ 28°C] [😤 6/10] [🎵 Quiet]    │
│                                                        │
│  Each tag: TagPill with icon + label                   │
│  Tapped tag → expands to tooltip with full context     │
│  Props: sensoryTag: SensesTag object                   │
└────────────────────────────────────────────────────────┘
```

### 5.4 Screen Specifications — Onboarding (7 Screens)

#### Screen ONB-01: Splash / Welcome

```
┌─────────────────────────────────────┐
│                                     │
│                                     │
│                                     │
│          ╔═══════════════╗          │
│          ║   KOTOKA      ║          │
│          ║   [logo mark] ║          │
│          ╚═══════════════╝          │
│                                     │
│    "Your life. Your language."      │
│         (body, neutral-500)         │
│                                     │
│                                     │
│                                     │
│   ┌─────────────────────────────┐   │
│   │    Get Started (primary)    │   │
│   └─────────────────────────────┘   │
│                                     │
│      Already have an account?       │
│            Sign In                  │
└─────────────────────────────────────┘
BG: brand-50. Logo: brand-700.
Animation: logo fades in over 600ms, button slides up 400ms.
```

#### Screen ONB-02: Authentication

```
┌─────────────────────────────────────┐
│   ← Back                            │
│                                     │
│   "Sign in to start learning"       │
│   (h2)                              │
│                                     │
│   ┌─────────────────────────────┐   │
│   │  [G]  Continue with Google  │   │
│   └─────────────────────────────┘   │
│                                     │
│   ──────────── or ────────────      │
│                                     │
│   ┌─────────────────────────────┐   │
│   │  [🍎]  Continue with Apple   │   │
│   └─────────────────────────────┘   │
│                                     │
│   By continuing you agree to the    │
│   Terms of Service and Privacy      │
│   Policy.                           │
└─────────────────────────────────────┘
Note: Apple Sign-In required for App Store. Android: Google only.
```

#### Screen ONB-03: PDPA Consent (Mandatory Gate)

```
┌─────────────────────────────────────┐
│   "Before we begin"   (h1)          │
│                                     │
│   Kotoka needs your permission      │
│   to personalize your learning.     │
│                                     │
│   ┌─────────────────────────────┐   │
│   │ [✓] Camera & Photos          │   │
│   │     To snap your surroundings│   │
│   ├─────────────────────────────┤   │
│   │ [✓] Location                 │   │
│   │     For memory map & review  │   │
│   ├─────────────────────────────┤   │
│   │ [ ] Microphone               │   │
│   │     For pronunciation check  │   │
│   ├─────────────────────────────┤   │
│   │ [ ] Analytics                │   │
│   │     Help us improve Kotoka   │   │
│   └─────────────────────────────┘   │
│                                     │
│   Camera + Location are required.   │
│   Others are optional.              │
│                                     │
│   ┌─────────────────────────────┐   │
│   │   Accept & Continue         │   │
│   └─────────────────────────────┘   │
└─────────────────────────────────────┘
NO Firebase writes occur until this screen is confirmed.
ConsentRecord written: version, timestamp, scope[], ip_hash.
```

#### Screen ONB-04: Language Pair Selection

```
┌─────────────────────────────────────┐
│   "What are you learning?"  (h1)    │
│                                     │
│   I speak:                          │
│   ┌─────────────────────────────┐   │
│   │ Thai (pre-selected from OS) ▾│   │
│   └─────────────────────────────┘   │
│                                     │
│   I want to learn:                  │
│   ┌─────────┐ ┌─────────┐          │
│   │ English │ │ Mandarin│          │
│   └─────────┘ └─────────┘          │
│   ┌─────────┐ ┌─────────┐          │
│   │Spanish  │ │Vietnamese│         │
│   └─────────┘ └─────────┘          │
│   ┌─────────┐ ┌─────────┐          │
│   │  Lao    │ │  Thai   │          │
│   └─────────┘ └─────────┘          │
│                                     │
│   ┌─────────────────────────────┐   │
│   │   Continue                  │   │
│   └─────────────────────────────┘   │
└─────────────────────────────────────┘
LanguagePairBadge shows flag + script preview for each option.
All 6 source × 6 target combinations supported (same-pair excluded).
```

#### Screen ONB-05: Proficiency Assessment

```
┌─────────────────────────────────────┐
│   "Your English level"  (h1)        │
│                                     │
│   Tap the highest sentence          │
│   you understand:                   │
│                                     │
│   ┌─────────────────────────────┐   │
│   │ A1  Hello. My name is Pam.  │   │
│   └─────────────────────────────┘   │
│   ┌─────────────────────────────┐   │
│   │ A2  I work at a company.    │   │
│   └─────────────────────────────┘   │
│   ┌─────────────────────────────┐   │  ← selected (brand-600 border)
│   │ B1  The meeting was         │   │
│   │     rescheduled.            │   │
│   └─────────────────────────────┘   │
│   ┌─────────────────────────────┐   │
│   │ B2  Please circulate the    │   │
│   │     agenda beforehand.      │   │
│   └─────────────────────────────┘   │
│   ┌─────────────────────────────┐   │
│   │ C1  The KPIs need to be     │   │
│   │     benchmarked Q1.         │   │
│   └─────────────────────────────┘   │
│                                     │
│   ┌─────────────────────────────┐   │
│   │   This looks right          │   │
│   └─────────────────────────────┘   │
└─────────────────────────────────────┘
5-item adaptive selection. Selection propagates to Gemini prompt.
```

#### Screen ONB-06: Goal & Time Commitment

```
┌─────────────────────────────────────┐
│   "What's your goal?"  (h1)         │
│                                     │
│   [Career / Work] [Travel]          │
│   [Relocation]    [Personal]        │
│   [Relationship]  [Academic]        │
│                                     │
│   ──────────────────────────────    │
│                                     │
│   "How much time per day?"          │
│                                     │
│     5 min   10 min   15 min         │
│    ┌─────┐  ┌─────┐  ┌─────┐        │
│    │     │  │  ●  │  │     │        │  ← 10 min selected
│    └─────┘  └─────┘  └─────┘        │
│     20 min  30 min   30+ min         │
│    ┌─────┐  ┌─────┐  ┌─────┐        │
│    │     │  │     │  │     │        │
│    └─────┘  └─────┘  └─────┘        │
│                                     │
│   ┌─────────────────────────────┐   │
│   │   Let's start               │   │
│   └─────────────────────────────┘   │
└─────────────────────────────────────┘
```

#### Screen ONB-07: First Snap Prompt

```
┌─────────────────────────────────────┐
│                                     │
│   "You're all set, Pam."  (h1)      │
│                                     │
│   Now capture your first place.     │
│   Point your camera at anywhere     │
│   you want to learn words for.      │
│                                     │
│   [\Kokoanimation\koko-waving.json]  │
│                                     │
│   ┌─────────────────────────────┐   │
│   │   📷 Snap my first place    │   │
│   └─────────────────────────────┘   │
│                                     │
│        or explore the app first     │
└─────────────────────────────────────┘
→ Snap button deep-links to camera tab.
→ "explore" goes to Home.
```

### 5.5 Screen Specifications — Home Tab (4 States)

#### Screen HOM-01: Home — Active Learner

```
┌─────────────────────────────────────┐
│  Good morning, Pam         🔔       │
│                                     │
│  ┌───────────────────────────────┐  │
│  │  🔥 12-day streak              │  │
│  │  ████████████░░  240 XP today │  │
│  └───────────────────────────────┘  │
│                                     │
│  Due for review ──────────────────  │
│  ┌─────────────────────────────┐    │
│  │  📍 Silom Office  8 words   │    │
│  │  Review now →               │    │
│  └─────────────────────────────┘    │
│                                     │
│  Today's missions ─────────────── ▼ │
│  ┌────────────────┐ ┌────────────┐  │
│  │ Snap a new     │ │ Complete 1 │  │
│  │ place          │ │ session    │  │
│  │ [    ] +50 XP  │ │ [████] ✓  │  │
│  └────────────────┘ └────────────┘  │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  Memory Map  [mini map view] │    │
│  │  3 pins near you             │    │
│  └─────────────────────────────┘    │
│                                     │
│ [Home] [Snap] [Review] [Shop] [Me]  │
└─────────────────────────────────────┘
```

#### Screen HOM-02: Home — Empty State (New User)

```
┌─────────────────────────────────────┐
│  Welcome, Pam              🔔       │
│                                     │
│  [\Kokoanimation\koko-waving.json]  │
│                                     │
│  "Snap your first place to          │
│   unlock your personal words."      │
│                                     │
│  ┌─────────────────────────────┐    │
│  │   📷 Take my first Snap     │    │
│  └─────────────────────────────┘    │
│                                     │
│  or type a phrase you heard today:  │
│  ┌─────────────────────────────┐    │
│  │   "I heard..."   [→ Text]   │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

### 5.6 Screen Specifications — Snap Tab (5 Screens)

#### Screen SNA-01: Snap — Camera Mode

```
┌─────────────────────────────────────┐
│         [FULL CAMERA VIEWFINDER]    │
│                                     │
│  ┌────────────────────────────────┐ │
│  │  [Camera] | [Text] | [GPS]     │ │  ← SnapTabSwitcher (top)
│  └────────────────────────────────┘ │
│                                     │
│                                     │
│  [live camera feed here]            │
│                                     │
│  [MobileNetV3 overlay: detects      │
│   objects and labels in real-time]  │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  Sensory: 📍 Silom  ☀️ 28°  │    │ ← auto-populated
│  │  Mood: [──●────] 6/10       │    │ ← user-adjustable slider
│  └─────────────────────────────┘    │
│                                     │
│            ◎  [SNAP]                │
└─────────────────────────────────────┘
```

#### Screen SNA-02: Snap — Text Input Mode

```
┌─────────────────────────────────────┐
│  ┌────────────────────────────────┐ │
│  │  [Camera] | [Text] | [GPS]     │ │
│  └────────────────────────────────┘ │
│                                     │
│  "Type or paste words you want      │
│   to learn:"                        │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  e.g. "the proposal is due" │    │
│  │                             │    │
│  │                             │    │
│  │                          32 │    │  ← char count
│  └─────────────────────────────┘    │
│                                     │
│  [paste icon]  [microphone icon]    │
│                                     │
│  ┌─────────────────────────────┐    │
│  │   Generate words            │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

#### Screen SNA-03: Snap — GPS Mode

```
┌─────────────────────────────────────┐
│  ┌────────────────────────────────┐ │
│  │  [Camera] | [Text] | [GPS]     │ │
│  └────────────────────────────────┘ │
│                                     │
│  [Mini map — current location pin]  │
│                                     │
│  📍 Detected: Café Amazon           │
│     Silom Road, Bangkok             │
│     Category: coffee_shop           │
│                                     │
│  Learn words for this place?        │
│                                     │
│  ┌─────────────────────────────┐    │
│  │   Yes, teach me coffee shop │    │
│  │   words                     │    │
│  └─────────────────────────────┘    │
│                                     │
│  "Not here right now" [change]      │
└─────────────────────────────────────┘
```

#### Screen SNA-04: Snap — Processing (Loading State)

```
┌─────────────────────────────────────┐
│                                     │
│                                     │
│  [\Kokoanimation\koko-reading.json] │
│                                     │
│   "Reading your photo..."           │
│   [LoadingPulse bar — animated]     │
│                                     │
│   Gemini is finding the words       │
│   that matter in this place.        │
│                                     │
│                                     │
│   [cancel — ghost button]           │
└─────────────────────────────────────┘
Target: Gemini 2.5 Flash avg 1.8s. Timeout at 8s → error state.
```

#### Screen SNA-05: Snap — Results

```
┌─────────────────────────────────────┐
│   ← Back   "12 words found"  [✓]   │
│                                     │
│  📍 Silom Office  ☀️ 22°C  😊 6/10 │  ← SensoryTagBar
│                                     │
│  ┌─────────────────────────────┐    │
│  │  STAKEHOLDER     +           │    │  ← VocabCard (compact)
│  │  ผู้มีส่วนได้ส่วนเสีย        │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │  DEADLINE         +          │    │
│  │  กำหนดเวลา                   │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │  PROPOSAL         +          │    │
│  │  ข้อเสนอ                     │    │
│  └─────────────────────────────┘    │
│  [+ 9 more — expand]                │
│                                     │
│  ┌─────────────────────────────┐    │
│  │   Save all to my words      │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │   Review now (quick 3-min)  │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

### 5.7 Screen Specifications — Review Tab (6 Screens)

#### Screen REV-01: Session Intro

```
┌─────────────────────────────────────┐
│   Today's review         [skip →]  │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  8 words due               │    │
│  │  ~10 minutes               │    │
│  │                             │    │
│  │  From:                      │    │
│  │  📍 Silom Office (5 words)  │    │
│  │  📍 Café Amazon (3 words)   │    │
│  └─────────────────────────────┘    │
│                                     │
│  [SessionProgressBar: 0/8]          │
│                                     │
│  ┌─────────────────────────────┐    │
│  │   Start session             │    │
│  └─────────────────────────────┘    │
│                                     │
│  [Quick mode: 3 words, 2 min]       │
└─────────────────────────────────────┘
```

#### Screen REV-02: Flashcard Node

```
┌─────────────────────────────────────┐
│  [≡] ──████░░░░── 3 of 8  [✕]       │
│                                     │
│  📍 Silom Office ☀️ 22°C 😤 6/10   │  ← SensoryTagBar
│                                     │
│  ┌─────────────────────────────┐    │
│  │                             │    │
│  │       STAKEHOLDER           │    │  ← target-word font, 28px
│  │       [🔊]                  │    │
│  │                             │    │
│  │   ─────────────────────     │    │
│  │                             │    │
│  │   [tap to reveal]           │    │
│  │                             │    │
│  └─────────────────────────────┘    │
│        ↑ FlashcardFlip component    │
│                                     │
│  [Tap card or swipe up to flip]     │
└─────────────────────────────────────┘

AFTER FLIP:
┌─────────────────────────────────────┐
│  ┌─────────────────────────────┐    │
│  │       STAKEHOLDER           │    │
│  │       [🔊]                  │    │
│  │   ─────────────────────     │    │
│  │  ผู้มีส่วนได้ส่วนเสีย        │    │
│  │  "All stakeholders must     │    │
│  │   approve the final         │    │
│  │   proposal."                │    │
│  └─────────────────────────────┘    │
│                                     │
│  How did you do?                    │
│                                     │
│  ┌────────┐ ┌────────┐ ┌────────┐  │
│  │ 😕 Hard │ │ 🙂 OK  │ │ 😄 Easy│  │
│  └────────┘ └────────┘ └────────┘  │
└─────────────────────────────────────┘
```

#### Screen REV-03: Fill-Blank Node

```
┌─────────────────────────────────────┐
│  [≡] ──█████░░░── 4 of 8  [✕]      │
│                                     │
│  📍 Silom Office  ☀️ 22°C           │
│                                     │
│  Complete the sentence:             │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  "Please send the _____ to  │    │
│  │   all team members before   │    │
│  │   the meeting."             │    │
│  └─────────────────────────────┘    │
│                                     │
│  ┌──────────┐ ┌──────────┐          │
│  │  agenda  │ │  brief   │          │
│  └──────────┘ └──────────┘          │
│  ┌──────────┐ ┌──────────┐          │
│  │ proposal │ │ follow-up│          │
│  └──────────┘ └──────────┘          │
│                                     │
│  Hint: [📍 Silom Office, Day 1]     │
└─────────────────────────────────────┘
4-option multiple choice. Distractors from same scene for coherence.
```

#### Screen REV-04: Koko Conversation Node

```
┌─────────────────────────────────────┐
│  [≡] ──██████░░── 5 of 8  [✕]      │
│                                     │
│  [\Kokoanimation\koko-listening.json → koko-speaking.json]  💬  │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  "Your manager just walked  │    │  ← ConversationBubble (Koko)
│  │   in. How do you tell her   │    │
│  │   the proposal is ready?"   │    │
│  └─────────────────────────────┘    │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  Your response:             │    │
│  │  __________________________ │    │
│  │  [🎤 tap to speak]          │    │
│  └─────────────────────────────┘    │
│                                     │
│  Suggested words: proposal  ready   │
│                   send     update   │
└─────────────────────────────────────┘
After response: Koko replies with correction or encouragement.
"Good — you used 'proposal' naturally. Filing it."
```

#### Screen REV-05: Pronunciation Node

```
┌─────────────────────────────────────┐
│  [≡] ──███████░── 6 of 8  [✕]      │
│                                     │
│  Say this word:                     │
│                                     │
│  ┌─────────────────────────────┐    │
│  │                             │    │
│  │       STAKEHOLDER           │    │
│  │   /ˈsteɪkhoʊldər/           │    │
│  │       [🔊 listen]           │    │
│  │                             │    │
│  └─────────────────────────────┘    │
│                                     │
│  [PronunciationWaveform — animated] │
│  ┌─────────────────────────────┐    │
│  │  ~~~~~~~~~~~~  [🎤 Record] │    │
│  └─────────────────────────────┘    │
│                                     │
│  Koko: "Try again — stress the      │
│         first syllable: STAKE."     │
└─────────────────────────────────────┘
STT: Google Cloud STT Chirp 3. Phoneme comparison via Gemini.
```

#### Screen REV-06: Session Complete

```
┌─────────────────────────────────────┐
│                                     │
│   ✅  Session Complete!             │
│  [\Kokoanimation\koko-correct.json] │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  ScoreResultCard            │    │
│  │                             │    │
│  │  7/8 correct  •  +85 XP    │    │
│  │  Streak: 🔥 13 days          │    │
│  │                             │    │
│  │  Strongest: stakeholder     │    │
│  │  Needs work: agenda         │    │
│  └─────────────────────────────┘    │
│                                     │
│  Next review:                       │
│  📍 Silom Office words → in 3 days  │
│                                     │
│  ┌─────────────────────────────┐    │
│  │   Back to home              │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │   Snap another place        │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

### 5.8 Screen Specifications — Shop Tab (3 Screens)

#### Screen SHO-01: Shop Home

```
┌─────────────────────────────────────┐
│  Shop                    🪙 240 XP  │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  ⭐ Kotoka Premium           │    │
│  │  Unlimited snaps, offline   │    │
│  │  packs, Koko priority       │    │
│  │                             │    │
│  │  ฿299/month  [Start trial]  │    │
│  └─────────────────────────────┘    │
│                                     │
│  Vocab Packs ─────────────────────  │
│                                     │
│  ┌────────────┐ ┌────────────┐      │
│  │ PackCard   │ │ PackCard   │      │
│  │ ☕ Café    │ │ 🏥 Medical │      │
│  │ 200 words  │ │ 150 words  │      │
│  │ 🪙 500 XP  │ │ 🪙 500 XP  │      │
│  └────────────┘ └────────────┘      │
│  ┌────────────┐ ┌────────────┐      │
│  │ PackCard   │ │ PackCard   │      │
│  │ ✈️ Travel  │ │ 💼 Office  │      │
│  │ 180 words  │ │ 220 words  │      │
│  │ 🪙 500 XP  │ │ 🪙 500 XP  │      │
│  └────────────┘ └────────────┘      │
└─────────────────────────────────────┘
```

### 5.9 Screen Specifications — Profile Tab (4 Screens)

#### Screen PRO-01: Profile Overview

```
┌─────────────────────────────────────┐
│  Profile                    ⚙️       │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  [Avatar]  Pam              │    │
│  │            Thai → English   │    │
│  │            B1 Intermediate  │    │
│  │  🔥 13 days  📚 847 words   │    │
│  └─────────────────────────────┘    │
│                                     │
│  My Memory Map ─────────────────── │
│  [Full MemoryMapView]               │
│  [shows all pins, tappable]         │
│                                     │
│  Stats this week ─────────────────  │
│  Words learned: 24                  │
│  Sessions: 7                        │
│  Accuracy: 83%                      │
│                                     │
│  Language pairs ──────────────────  │
│  [LanguagePairBadge] TH→EN (active) │
│  + Add another language pair        │
└─────────────────────────────────────┘
```

### 5.10 Accessibility Specification

```
WCAG 2.1 AA compliance targets:

1. COLOR CONTRAST
   - All text on brand-700: ratio ≥ 4.5:1 (body), 3:1 (large)
   - Error state (#d8566a on white): ratio 4.6:1 ✓
   - Never use color as the ONLY differentiator

2. TOUCH TARGETS
   - Minimum 44×44pt for all interactive elements
   - Bottom tab icons: 56pt touch area

3. SCREEN READER
   - All images: descriptive accessibilityLabel
   - Icons: accessibilityRole="button" where interactive
   - SensoryTagBar: reads as full sentence
     "Captured at Silom Office, 28 degrees, mood 6 out of 10"

4. FONT SCALING
   - All text supports Dynamic Type up to xxxLarge
   - Cards reflow at 200% text size

5. REDUCED MOTION
   - All animations: check useReducedMotion()
   - Fallback: instant state change, no transition
```

---

## 6. PHASE 2 — FOUNDATION & CORE DATA PIPELINE

### Phase Summary

| Attribute | Value |
|-----------|-------|
| Input | Phase 1 signed-off design spec |
| Deliverable | Working app: Auth → Onboarding → Snap → word corpus stored |
| Platforms | iOS (Expo) + Android (Expo) |
| Effort level | High — all infrastructure that Phases 3 and 4 depend on |
| Exit criteria | User can complete onboarding, snap a photo, and see generated words in their corpus |

### 6.1 Project Scaffolding

```
kotoka/
├── app/                    React Navigation root
│   ├── (tabs)/             Bottom tab group
│   │   ├── index.tsx       Home tab
│   │   ├── snap.tsx        Snap tab
│   │   ├── review.tsx      Review tab
│   │   ├── shop.tsx        Shop tab
│   │   └── profile.tsx     Profile tab
│   ├── onboarding/         Onboarding stack
│   │   ├── welcome.tsx
│   │   ├── auth.tsx
│   │   ├── consent.tsx
│   │   ├── language.tsx
│   │   ├── proficiency.tsx
│   │   ├── goal.tsx
│   │   └── first-snap.tsx
│   └── _layout.tsx         Root layout + font loading
├── components/             Component library (Phase 1 spec)
├── stores/                 Zustand stores
│   ├── auth.store.ts
│   ├── user.store.ts
│   ├── words.store.ts
│   └── session.store.ts
├── services/               Cloud Run API clients
│   ├── gemini.service.ts
│   ├── firestore.service.ts
│   └── storage.service.ts
├── lib/                    Utilities
│   ├── fonts.ts
│   ├── sensory.ts
│   └── geohash.ts
└── types/                  TypeScript interfaces
    ├── word.types.ts
    └── user.types.ts
```

### 6.2 Firebase & Firestore Data Model

```
Firestore Collection Structure:
╔══════════════════════════════════════════════════════════════════╗
║  /users/{userId}                                                 ║
║    - display_name: string                                        ║
║    - email: string                                               ║
║    - source_lang: 'th' | 'en' | 'zh' | 'es' | 'vi' | 'lo'      ║
║    - target_lang: (same enum)                                    ║
║    - proficiency: 'a1' | 'a2' | 'b1' | 'b2' | 'c1' | 'c2'     ║
║    - goal: 'career' | 'travel' | 'relocation' | ...             ║
║    - daily_minutes: 5 | 10 | 15 | 20 | 30                       ║
║    - streak_days: number                                         ║
║    - last_active: Timestamp                                      ║
║    - xp_total: number                                            ║
║    - consent_version: string                                     ║
║    - premium: boolean                                            ║
║                                                                  ║
║  /users/{userId}/words/{wordId}                                  ║
║    (UserWord interface — full schema in Section 4.4)             ║
║                                                                  ║
║  /users/{userId}/sessions/{sessionId}                            ║
║    (Session interface — full schema in Section 4.4)              ║
║                                                                  ║
║  /users/{userId}/consent/{consentId}                             ║
║    (ConsentRecord interface)                                     ║
║                                                                  ║
║  /word_library/{wordId}                                          ║
║    Global word object (Word interface)                           ║
║    Shared across users — corpus packs live here                  ║
╚══════════════════════════════════════════════════════════════════╝
```

### 6.3 Authentication Flow

```
App Launch
    │
    ▼
┌─────────────────────────────────────────────┐
│  Check Firebase Auth currentUser             │
└─────────┬───────────────────────────────────┘
          │
    ┌─────┴────────────┐
    │                  │
  null            user exists
    │                  │
    ▼                  ▼
Onboarding     Check Firestore
 Stack         /users/{uid}
                   │
          ┌────────┴────────┐
          │                 │
       exists           not found
          │                 │
          ▼                 ▼
       Home Tab        Onboarding
                         Stack

Token refresh: Firebase ID token (15 min access).
Every Cloud Run request attaches Authorization: Bearer {idToken}.
Server validates via Firebase Admin SDK — no exceptions.
```

### 6.4 Snap Input Pipeline

```
USER TAPS SNAP
      │
      ▼
┌─────────────────────────────────────────────────┐
│  Expo Camera captures image                      │
│  MobileNetV3 on-device → object label list       │
│  GPS: expo-location → geohash encode (7-char)    │
│  Weather: Google Weather API (30-min cache)      │
│  Mood: user slider (0.0–1.0)                    │
│  Time: device clock → morning/afternoon/evening  │
└─────────────────────────────────────────────────┘
      │
      ▼
┌─────────────────────────────────────────────────┐
│  POST /sensory-prompt (Cloud Run)                │
│  Body: { image_b64, labels[], geohash,           │
│          weather, mood, proficiency,             │
│          source_lang, target_lang, goal }        │
└─────────────────────────────────────────────────┘
      │
      ▼
┌─────────────────────────────────────────────────┐
│  POST /analyze-image → Gemini 2.5 Flash          │
│  Returns: Word[] (10–15 words)                   │
│  Each word: text_target, text_native,            │
│             romanization, part_of_speech,         │
│             example_sentence, difficulty_tier,   │
│             domain[], cultural_notes             │
└─────────────────────────────────────────────────┘
      │
      ▼
┌─────────────────────────────────────────────────┐
│  Write to Firestore:                             │
│  - /word_library/{wordId} (global word object)   │
│  - /users/{uid}/words/{wordId}                   │
│    (UserWord: senses_tags, geohash, due_at=now)  │
│  Write image to Cloud Storage                    │
│  (camera data NEVER transmitted raw to server    │
│   — only base64 of cropped viewport)             │
└─────────────────────────────────────────────────┘
      │
      ▼
Navigate to SNA-05 (Results screen)
```

### 6.5 Zustand Store Architecture

```typescript
// Core stores — Phase 2 implements all four

// auth.store.ts
interface AuthStore {
  user: FirebaseUser | null
  idToken: string | null
  signInWithGoogle: () => Promise<void>
  signOut: () => Promise<void>
  refreshToken: () => Promise<void>
}

// user.store.ts
interface UserStore {
  profile: UserProfile | null
  streak: number
  xp: number
  updateProfile: (partial: Partial<UserProfile>) => Promise<void>
  recordSession: (xpEarned: number) => Promise<void>
}

// words.store.ts
interface WordsStore {
  corpus: UserWord[]
  dueWords: UserWord[]
  addWord: (word: UserWord) => Promise<void>
  markReviewed: (wordId: string, grade: 0 | 1 | 2) => Promise<void>
  syncFromFirestore: () => Promise<void>
}

// session.store.ts
interface SessionStore {
  currentSession: Session | null
  nodeQueue: NodeType[]
  currentNodeIndex: number
  startSession: (wordIds: string[]) => void
  advanceNode: () => void
  endSession: () => Promise<void>
}
```

### 6.6 Security Implementation (Phase 2)

```
PDPA Gate (MANDATORY — implemented in ONB-03):
  - FirebaseFirestore.disableNetwork() until consent recorded
  - ConsentRecord written first — no other writes allowed before it
  - Scope array stored: ['photos', 'gps', 'analytics', 'voice']

API Key Security:
  - All Gemini / Maps / TTS API keys: Cloud Run environment variables
  - NEVER in Expo bundle — Cloud Build will fail on secret scan
  - Client sends Firebase ID token; server handles all third-party auth

Geolocation:
  - expo-location returns lat/lng → immediately encoded to geohash (7-char)
  - Raw coordinates NEVER written to Firestore or transmitted
  - Geohash decoded client-side only for map display

Rate Limiting (Cloud Run):
  - 100 req/min/user global
  - 20 req/min on /analyze-image (Gemini rate protection)
  - Expo backoff: exponential retry, max 3 attempts

Input Validation:
  - All Cloud Run endpoints: Zod schema validation
  - Invalid payload → 400 Bad Request, no Gemini call
```

---

## 7. PHASE 3 — AI/LEARNING ENGINE & SENSORY LAYER

### Phase Summary

| Attribute | Value |
|-----------|-------|
| Input | Phase 2 running app with word corpus |
| Deliverable | Full learning loop: SRS + mixed sessions + Koko + FCM + Memory Map |
| Effort level | Very high — most algorithmic complexity in the product |
| Exit criteria | User completes a full mixed session, Koko responds, FCM fires on location revisit |

### 7.1 SRS Algorithm — δS_KOTOKA = 0

The scheduling engine derives all review intervals from a single variational action functional. The word score S(w) determines priority:

```
S(w) = 0.35·R + 0.25·U + 0.15·C + 0.12·D + 0.08·G + 0.05·L

Where:
  R = Retention risk (1 - P_retention)
  U = Urgency score (deadline or routine)
  C = Contextual match (geohash proximity to current location)
  D = Difficulty tier (A1=0.1, A2=0.2, B1=0.4, B2=0.6, C1=0.8, C2=1.0)
  G = Grammar dependency (words that unlock grammar patterns score higher)
  L = Location saturation (lower saturation = higher priority for review)
```

**Retention probability** (modified Ebbinghaus):
```
P_retention(w, t) = e^(-(t - t_last) / τ(w,u))

τ(w, u) = τ_base(d) × EF(w) × (1 + 0.15 × n_correct)

τ_base:  A1=72h  A2=60h  B1=48h  B2=36h  C1=24h  C2=18h
EF(w):   ease factor, range [1.3, 4.0], updated post-review
n_correct: consecutive correct streak (resets on any failure)
```

**Ease factor update (SM-2 variant):**
```
EF_new = EF_old + (0.1 - (3 - grade) × (0.08 + (3 - grade) × 0.02))

grade: 0 = Hard (blocked), 1 = Correct (slow), 2 = Easy
Clamped: EF_new = max(1.3, min(4.0, EF_new))
```

**Session builder** — selects words from corpus:
```
Session build algorithm:

1. Pull all UserWords where due_at ≤ now + 2h (overdue + soon-due)
2. Score each with S(w)
3. Sort descending by S(w)
4. Select top N words where N = daily_minutes / 1.5 (avg 90s/word)
5. Assign node types:
   - F(familiarity) = 'new' → flashcard only
   - F = 'seen' → flashcard + fill_blank
   - F = 'recognized' → fill_blank + conversation
   - F = 'recalled' → conversation + pronunciation
   - F = 'mastered' → pronunciation (maintenance)
6. Randomize node order within session (mixed session)
7. Guarantee: at least 1 of each available type per session
```

### 7.2 Mixed Session Engine

```
╔══════════════════════════════════════════════════════════════════╗
║                MIXED SESSION NODE TYPES                          ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  NODE 1: FLASHCARD                                               ║
║  Input: word.text_target shown                                   ║
║  Action: user flips to reveal native + example                   ║
║  Grading: self-report (Hard / OK / Easy)                         ║
║  Grade → SM-2 EF update + next interval calculation             ║
║                                                                  ║
║  NODE 2: FILL-BLANK                                              ║
║  Input: example sentence with target word blanked                ║
║  Action: 4-option multiple choice                                ║
║  Grading: correct/incorrect (binary)                             ║
║  Distractors: other words from same scene/domain                 ║
║                                                                  ║
║  NODE 3: KOKO CONVERSATION                                       ║
║  Input: Gemini scenario prompt (office/café/airport context)     ║
║  Action: user types or speaks response                           ║
║  Koko reply: Gemini turn via /koko-reply endpoint                ║
║  Grading: Gemini evaluates vocabulary usage (0/1/2)              ║
║  Koko corrects tone errors (Mandarin/Vietnamese)                 ║
║                                                                  ║
║  NODE 4: PRONUNCIATION                                           ║
║  Input: word shown + Koko TTS plays pronunciation                ║
║  Action: user records via microphone                             ║
║  Evaluation: Google Cloud STT Chirp 3 → phoneme match           ║
║  Grading: ≥80% match = correct, <60% = Hard, between = OK       ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

### 7.3 Sensory Tag Engine — 6 Channels

```
╔══════════════════════════════════════════════════════════════════╗
║               SENSORY TAG ENGINE — CAPTURE & REPLAY              ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  CAPTURE (at Snap time):                                         ║
║                                                                  ║
║  Channel 1 — VISUAL                                              ║
║    Source: Gemini 2.5 Flash scene description                    ║
║    Output: visual_label (e.g., "modern open-plan office")        ║
║                                                                  ║
║  Channel 2 — LOCATION                                            ║
║    Source: Google Maps Places API                                ║
║    Output: location_category ('office' | 'café' | 'hospital'...) ║
║    Storage: geohash_7char only (never raw GPS)                   ║
║                                                                  ║
║  Channel 3 — WEATHER                                             ║
║    Source: Google Weather API (30-min cache per geohash)         ║
║    Output: { temp_c, conditions, humidity }                       ║
║                                                                  ║
║  Channel 4 — MOOD                                                ║
║    Source: user slider 0.0–1.0 (shown in Snap UI)               ║
║    Output: mood: float (0=stressed, 1=happy)                     ║
║                                                                  ║
║  Channel 5 — ENERGY                                              ║
║    Source: user slider 0.0–1.0 (optional, shown on expand)       ║
║    Output: energy: float                                         ║
║                                                                  ║
║  Channel 6 — SOUND / SCENE                                       ║
║    Source: Gemini audio context inference from visual scene      ║
║    Output: sound_type ('quiet_office' | 'busy_café' | ...)       ║
║                                                                  ║
║  REPLAY (at Review time):                                        ║
║    SensoryTagBar shown on every review card                      ║
║    Mood tint applied to card background (4 tint values)          ║
║    Location icon shows pin → tapping reveals "where you learned" ║
║    Weather icon shown with capture-time conditions               ║
║    Full reinstatement effect: encoding context re-activated      ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

### 7.4 Memory Map — Geohash Architecture

```
Memory Map data flow:

WRITE (Snap time):
  lat/lng → geohash_7char (encode, client-side, ~150m precision)
  geohash stored in UserWord.geohash
  pin_data: { geohash, word_count, last_snap, location_name }
  Written to: /users/{uid}/pins/{geohash}

READ (Map display):
  Pull all /users/{uid}/pins
  Decode geohash → approximate center point (client-side only)
  Cluster pins within 3-char prefix (city-level)
  Render: MemoryMapView with MemoryMapPin components

LOCATION TRIGGER (background):
  expo-location: startLocationUpdatesAsync (background task)
  On location update: compare current geohash_5 prefix vs all pins
  geohash_5 = ~5km radius match (coarse proximity)
  geohash_7 = ~150m match (precise match → trigger notification)

FCM TRIGGER:
  /users/{uid}/pins/{geohash} has due words → send FCM
  Payload: { title: "You're near {location_name}",
             body: "{n} words ready for 30-second review" }
  Throttle: max 1 FCM per pin per 4h (prevent spam)
  User can disable per-pin in Profile → Privacy
```

### 7.5 Six-Language Support Matrix

```
╔══════════════════════════════════════════════════════════════════════╗
║                  6-LANGUAGE SUPPORT MATRIX                           ║
╠═══════╦═══════╦═══════╦═══════╦═══════╦═══════╦══════════════════════╣
║       ║  TH   ║  EN   ║  ZH   ║  ES   ║  VI   ║  LO                  ║
╠═══════╬═══════╬═══════╬═══════╬═══════╬═══════╬══════════════════════╣
║ Font  ║Sarabun║Plex   ║NotoSC ║Plex   ║Plex   ║NotoLao               ║
║ Roman ║ yes   ║  -    ║pinyin ║  -    ║ yes   ║ yes                  ║
║ Tones ║  -    ║  -    ║ ★ 4  ║  -    ║ ★ 6  ║ ★ 6                  ║
║ STT   ║ yes   ║ yes   ║Chirp3 ║ yes   ║Chirp3 ║ yes                  ║
║ TTS   ║ yes   ║ yes   ║ yes   ║ yes   ║ yes   ║ yes                  ║
╚═══════╩═══════╩═══════╩═══════╩═══════╩═══════╩══════════════════════╝

★ = tone-aware pronunciation assessment enabled (Chirp 3 required)

30 directional pairs: any combination of 6 source × 6 target
(same-language pair excluded = 6×6 - 6 = 30 pairs)

lang_pair stored as: '{source}-{target}' (e.g., 'th-en', 'en-zh', 'lo-vi')
Gemini prompt includes lang_pair; output language is always target_lang.
```

### 7.6 Koko AI — Conversation Partner Design

```
Koko is NOT a tutor. Koko is a conversation partner who:
  - Knows exactly which words the user needs right now
  - Steers conversation naturally toward those words
  - Gives inline tonal correction for ZH and VI
  - Never makes the user feel tested

Gemini system prompt template for Koko:
─────────────────────────────────────
You are Koko, a warm conversation partner helping {name} practice
{target_lang}. Their level is {proficiency} and their goal is {goal}.

Focus vocabulary: {word_list_this_session}
Scene context: {location_name}, {scene_label}

Rules:
1. Speak ONLY in {target_lang} (except for tonal corrections)
2. Naturally weave the focus vocabulary into your responses
3. If the user makes a tonal error (Mandarin/Vietnamese), correct once
   warmly: "You said {wrong} — try {correct}. Tone matters here."
4. Never say "wrong" or "incorrect" — say "almost" or "try again"
5. Keep turns short (2–3 sentences max)
6. Acknowledge when a focus word is used correctly: "Good — you used
   '{word}' naturally. Your brain is filing it."
─────────────────────────────────────

Koko voice: Google Cloud TTS
  TH: th-TH-Standard-A
  EN: en-US-Neural2-F
  ZH: cmn-CN-Neural2-A
  ES: es-US-Neural2-A
  VI: vi-VN-Standard-A
  LO: lo-LA-Standard-A

Audio playback: Expo AV (streaming, no full download before play)
```

---

## 8. PHASE 4 — MONETIZATION, POLISH & LAUNCH

### Phase Summary

| Attribute | Value |
|-----------|-------|
| Input | Phase 3 complete learning loop |
| Deliverable | Shippable iOS + Android app on App Store and Play Store |
| Effort level | High — business model, legal, QA, app store pipeline |
| Exit criteria | App approved on both stores, analytics live, crash rate <0.5% |

### 8.1 KotoCoin Economy

```
KotoCoin is the internal XP currency. No fiat purchase of KotoCoins.
All XP earned through learning activity.

XP EARNING RULES:
─────────────────────────────────────────────────────────────────
  Activity                              XP Earned
  ─────────────────────────────────────────────────────────────
  Complete a review session             40 XP base
  + correct answer bonus                +5 XP per correct
  + streak multiplier (days ≥ 7)        ×1.5 multiplier
  + perfect session (100% accuracy)     +30 XP bonus
  Snap a new location                   +20 XP
  First snap at new location type       +50 XP (novelty bonus)
  Complete daily mission                +50 XP per mission
  7-day streak milestone                +200 XP
  30-day streak milestone               +1000 XP

XP SPENDING RULES:
─────────────────────────────────────────────────────────────────
  Item                                  XP Cost
  ─────────────────────────────────────────────────────────────
  Vocab pack (200 words)                500 XP
  Streak freeze (1 day)                 150 XP
  Extra Koko session (out of quota)     100 XP
  Reveal all words without studying     250 XP (shortcut, limited)

FREE TIER LIMITS:
  - 3 Snaps per day (camera/text/GPS combined)
  - 1 Koko conversation session per day
  - 1 language pair active
  - No offline pack download

PREMIUM (฿299/month, 7-day free trial):
  - Unlimited Snaps
  - Unlimited Koko sessions
  - 3 active language pairs
  - Offline pack download
  - Priority Gemini processing (skip queue)
```

### 8.2 Subscription & Receipt Validation

```
iOS: StoreKit 2 (in-app purchase)
  - Product ID: com.kotoka.premium.monthly
  - Trial: 7 days, no charge
  - Renewal: monthly auto

Android: Google Play Billing
  - Product ID: kotoka.premium.monthly
  - Trial: 7 days, no charge
  - Renewal: monthly auto

Receipt validation: Cloud Run POST /verify-receipt
  iOS: Apple App Store server-to-server notification
  Android: Google Play Developer API
  On validation success: Firestore /users/{uid}.premium = true
  On expiry: Firestore updated; free-tier limits enforced
```

### 8.3 Streak & Mission System

```
STREAK:
  - Streak increments on: any session completion (≥3 words reviewed)
  - Streak resets at: 00:00 user local time if no session that day
  - Streak freeze: purchasable with 150 XP (max 2 stored)
  - Grace period: streak maintained if session completed before 01:00

DAILY MISSIONS (3 per day, refreshed 00:00 local):
  Mission pool:
  1. "Snap a new place" (+50 XP)
  2. "Complete 1 full session" (+50 XP)
  3. "Review 15 words" (+50 XP)
  4. "Use Koko for 5 minutes" (+50 XP)
  5. "Review a word at its location" (+75 XP — location-triggered)
  6. "Perfect session (8+ words, 100%)" (+100 XP)

FCM MISSION TRIGGERS:
  10pm local: "🔥 Don't break your {n}-day streak. 3 words, 60 seconds."
  Morning (8am): "Good morning. Today's missions are ready."
  Mission complete: "✅ Mission complete! +50 XP."
```

### 8.4 Analytics & Monitoring

```
FIREBASE ANALYTICS — tracked events:
  snap_completed     { source_type, lang_pair, word_count }
  session_started    { word_count, session_type }
  session_completed  { correct_pct, duration_sec, xp_earned }
  koko_turn          { turn_count, lang_pair }
  fcm_opened         { trigger_type: revisit|streak|mission }
  purchase_initiated { product_id }
  purchase_completed { product_id, trial: boolean }
  onboarding_step    { step: 1..7, lang_pair }

FIREBASE CRASHLYTICS:
  Auto-enabled for all crash/ANR events
  Non-fatal: logged for Gemini timeout, STT failure, FCM failure
  PII excluded: user IDs only in logs, no email/name

KEY METRICS TO MONITOR (launch dashboard):
  - D1 / D7 / D30 retention
  - Session completion rate (target: >70%)
  - FCM open rate (target: >25% for revisit triggers)
  - Snap-to-session conversion (target: >60%)
  - Streak distribution (target: >30% users at 7-day streak)
  - Gemini latency P50 / P95 (target: <2s P50, <5s P95)
  - Crash-free session rate (target: >99.5%)
```

### 8.5 CI/CD Pipeline (Cloud Build)

```
╔══════════════════════════════════════════════════════════════════╗
║                    CI/CD PIPELINE                                ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  Trigger: push to main branch                                    ║
║                                                                  ║
║  Step 1: npm ci                                                  ║
║  Step 2: npx tsc --noEmit (TypeScript check)                    ║
║  Step 3: npm run lint (ESLint)                                   ║
║  Step 4: npm audit --audit-level=high                            ║
║          FAIL on HIGH or CRITICAL severity — no exceptions        ║
║  Step 5: npm test (Jest unit tests)                              ║
║  Step 6: eas build --platform all (Expo EAS Build)              ║
║  Step 7: eas submit (on tag push only)                           ║
║                                                                  ║
║  Secret scan: Cloud Build checks for API key patterns in diff    ║
║  Any match → build fails immediately, no EAS build triggered    ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

### 8.6 App Store Submission Checklist

```
iOS App Store:
  □ App ID registered in Apple Developer portal
  □ Bundle ID: com.kotoka.app
  □ Capabilities: Push Notifications, Sign in with Apple,
    Background App Refresh, Location (Always + When In Use)
  □ Privacy Nutrition Labels: Location (precise + coarse),
    Camera, Microphone, Analytics
  □ Screenshots: 6.5" iPhone (5), 12.9" iPad (5), 5.5" iPhone (5)
  □ App Preview video (30 seconds, showing core snap-to-review loop)
  □ Keywords: language learning, vocabulary, Thai, English, Mandarin
  □ Age rating: 4+
  □ Export compliance: no encryption beyond standard HTTPS
  □ StoreKit entitlement for in-app purchases
  □ TestFlight beta: 2-week internal, 2-week external (100 users)

Android Play Store:
  □ Package: com.kotoka.app
  □ Permissions declared: CAMERA, RECORD_AUDIO, ACCESS_FINE_LOCATION,
    ACCESS_BACKGROUND_LOCATION, INTERNET, RECEIVE_BOOT_COMPLETED (FCM)
  □ Data safety section: location, photos, analytics declared
  □ Store listing: short (80 char) + full (4000 char) description
  □ Feature graphic: 1024×500px
  □ Screenshots: phone + 7" tablet (2 each min)
  □ Internal testing track → Closed testing (100 users) → Production
  □ Target API: Android 14 (API 34)
  □ App Bundle (.aab): signed, V2 signature scheme
```

### 8.7 Legal & PDPA Compliance

```
Thai PDPA (Personal Data Protection Act B.E. 2562):
  □ Privacy Policy: Thai + English, accessible from Profile → Privacy
  □ Consent Record: version-stamped, scope-gated, stored in Firestore
  □ Data subject rights UI: Profile → Privacy → My Data
    - View collected data
    - Download data export (JSON, 24h generation time)
    - Delete account (hard delete: 30-day deferred, PDPA compliant)
  □ Data Processing Agreement with Google Cloud documented
  □ No raw GPS stored — geohash only (PDPA risk reduction)
  □ Camera/mic data: on-device only, zero server transmission of raw

GDPR (for EU users if any):
  □ Consent before analytics collection
  □ Right to erasure honored by delete account flow
  □ DPA with Google Cloud in place

Terms of Service:
  □ Age minimum: 13 (COPPA compliance for any US users)
  □ Governing law: Thailand
  □ Dispute resolution: Bangkok Arbitration Institute
```

### 8.8 Performance Targets

```
STARTUP PERFORMANCE:
  Cold start → interactive: <3 seconds on iPhone 12+, Pixel 5+
  Font loading: preloaded in _layout.tsx before first render
  Splash screen: native splash (not JS) via expo-splash-screen

RUNTIME PERFORMANCE:
  Tab switch animation: 60fps (no jank)
  Card flip: 60fps spring animation
  Map render (100 pins): <500ms
  Session start (word fetch): <1 second (offline-first from Firestore cache)

NETWORK PERFORMANCE:
  Gemini /analyze-image: target P50 <2s, P95 <5s
  /koko-reply: target P50 <1.5s, P95 <3s
  Offline mode: all due words served from SQLCipher cache
  Firestore offline persistence: enabled (enablePersistence: true)

BUNDLE SIZE:
  JS bundle: <5MB (code split by tab)
  Font assets: ~3MB (4 font families × 2-3 weights)
  Total app size: <80MB iOS, <70MB Android
```

---

## 9. EFFORT PARITY MATRIX

The core constraint is equal engineering effort across all four phases. This matrix validates parity by counting meaningful deliverables — not by time.

```
╔══════════════════════════════════════════════════════════════════════════╗
║                    EFFORT PARITY MATRIX                                  ║
╠══════════════╦═══════════════════╦═════════╦═══════════╦════════════════╣
║  Phase       ║  Primary work     ║ Screens ║ Systems   ║ Complexity     ║
║              ║  category         ║ / specs ║ designed  ║ rating         ║
╠══════════════╬═══════════════════╬═════════╬═══════════╬════════════════╣
║  Phase 1     ║ Design research,  ║   43    ║     1     ║ ████████░░ 8   ║
║  UI/UX Spec  ║ component design, ║ screens ║ (design   ║                ║
║              ║ token system,     ║   34    ║  system)  ║ HIGH — all     ║
║              ║ interaction spec, ║ comps   ║           ║ future phases  ║
║              ║ accessibility     ║         ║           ║ depend on this ║
╠══════════════╬═══════════════════╬═════════╬═══════════╬════════════════╣
║  Phase 2     ║ Project scaffold, ║  17     ║     5     ║ ████████░░ 8   ║
║  Foundation  ║ Firebase setup,   ║ screens ║ (auth,    ║                ║
║              ║ auth, data model, ║ impl'd  ║ firestore ║ HIGH — infra   ║
║              ║ input pipeline,   ║         ║ storage,  ║ + security +   ║
║              ║ security, PDPA    ║         ║ pipeline, ║ offline-first  ║
║              ║                   ║         ║ PDPA)     ║                ║
╠══════════════╬═══════════════════╬═════════╬═══════════╬════════════════╣
║  Phase 3     ║ SRS algorithm,    ║  12     ║     6     ║ █████████░ 9   ║
║  AI & Learn  ║ Gemini prompts,   ║ screens ║ (SRS,     ║                ║
║              ║ Koko AI,          ║ impl'd  ║ sessions, ║ VERY HIGH —    ║
║              ║ sensory engine,   ║         ║ koko, FCM ║ algorithmic    ║
║              ║ FCM, Memory Map,  ║         ║ map,      ║ depth + AI     ║
║              ║ 6-language,       ║         ║ 6-lang)   ║ integration    ║
║              ║ pronunciation     ║         ║           ║                ║
╠══════════════╬═══════════════════╬═════════╬═══════════╬════════════════╣
║  Phase 4     ║ KotoCoin econ,    ║  14     ║     5     ║ ████████░░ 8   ║
║  Launch      ║ subscription IAP, ║ screens ║ (economy, ║                ║
║              ║ streak/missions,  ║ impl'd  ║ IAP, fcm, ║ HIGH — biz     ║
║              ║ analytics, CI/CD, ║         ║ analytics ║ model + legal  ║
║              ║ legal, stores,    ║         ║ launch)   ║ + QA + stores  ║
║              ║ QA, beta          ║         ║           ║                ║
╠══════════════╬═══════════════════╬═════════╬═══════════╬════════════════╣
║  TOTALS      ║                   ║  43+43  ║    17     ║ Avg: 8.25/10   ║
║              ║                   ║ designed║ systems   ║ Parity: ✓      ║
║              ║                   ║ +43 impl║           ║ (max delta 1pt)║
╚══════════════╩═══════════════════╩═════════╩═══════════╩════════════════╝
```

**Parity justification:** No phase is trivially easy. Phase 1 has the highest design breadth (43 screens). Phase 2 has the highest infrastructure risk (auth, PDPA, security). Phase 3 has the highest algorithmic complexity (SRS math, AI integration). Phase 4 has the highest operational complexity (legal, stores, QA, monetization). Each phase requires a different but equally demanding type of expertise.

---

## 10. CROSS-PHASE DEPENDENCIES

```
╔════════════════════════════════════════════════════════════════╗
║               DEPENDENCY GRAPH                                 ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  PHASE 1 outputs → PHASE 2 inputs                             ║
║  ──────────────────────────────────────────────────────────   ║
║  Design tokens → NativeWind config (tailwind.config.js)       ║
║  Component specs → component/ implementation files            ║
║  Onboarding flow → route structure decision                   ║
║  Screen specs → navigation stack definition                   ║
║  Data fields in UX → Firestore data model (confirmed)         ║
║                                                                ║
║  PHASE 2 outputs → PHASE 3 inputs                             ║
║  ──────────────────────────────────────────────────────────   ║
║  Word corpus schema → SRS algorithm operates on it            ║
║  Sensory tag capture → Sensory replay engine uses stored data ║
║  Firestore word structure → session builder queries it        ║
║  GPS/geohash infrastructure → Memory Map builds on it         ║
║  Auth + Cloud Run → Gemini/Koko calls authenticated           ║
║                                                                ║
║  PHASE 3 outputs → PHASE 4 inputs                             ║
║  ──────────────────────────────────────────────────────────   ║
║  Session engine → XP calculation uses session data            ║
║  Word familiarity states → premium pack install paths         ║
║  FCM infrastructure → mission trigger notifications reuse it  ║
║  Analytics events → defined in Phase 3 event naming          ║
║                                                                ║
║  BLOCKING DEPENDENCIES (hard gating):                         ║
║  Phase 1 signoff → Phase 2 start (design must be stable)      ║
║  Firestore schema stable → Phase 3 algorithm can be built     ║
║  Phase 3 feature-complete → Phase 4 QA can run full loop      ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

---

## 11. ACCEPTANCE CRITERIA CHECKLIST

### Phase 1 Acceptance Criteria

```
Design System & UI/UX Specification

DESIGN TOKENS
  □ AC-1.01  All color tokens defined (primary 10, semantic 8, mood 4)
  □ AC-1.02  Typography: all 9 type tokens, 4 font families
  □ AC-1.03  Spacing scale: 10 values documented
  □ AC-1.04  Motion: 4 duration + 4 easing tokens, reduced-motion noted
  □ AC-1.05  Elevation: 4 levels documented

COMPONENT LIBRARY
  □ AC-1.06  All 34 components specified (props, states, variants)
  □ AC-1.07  VocabCard: front/back states, sensory tag display
  □ AC-1.08  FlashcardFlip: animation spec + grade buttons
  □ AC-1.09  KokoConversationThread: bubble layout + avatar states
  □ AC-1.10  MemoryMapView: pin clustering, zoom levels

SCREENS — ONBOARDING
  □ AC-1.11  ONB-01 through ONB-07: all 7 screens specified
  □ AC-1.12  PDPA screen: all 4 consent toggles, mandatory gate noted
  □ AC-1.13  Language pair: all 30 combinations visually represented
  □ AC-1.14  Proficiency: 5-item adaptive spec, grade mapping noted

SCREENS — CORE TABS
  □ AC-1.15  Home: active, empty, streak-at-risk states all designed
  □ AC-1.16  Snap: camera, text, GPS, processing, results (5 screens)
  □ AC-1.17  Review: intro, flashcard, fill-blank, Koko, pronunciation,
             results (6 screens), plus empty state
  □ AC-1.18  Shop: home, pack detail, purchase flow (3 screens)
  □ AC-1.19  Profile: overview, memory map, settings, privacy (4 screens)

ACCESSIBILITY
  □ AC-1.20  Color contrast ratios documented for all color pairings
  □ AC-1.21  Touch target minimums: 44pt on all interactive elements
  □ AC-1.22  Screen reader labels specified for all non-text elements
  □ AC-1.23  Reduced motion behavior specified for all animations
```

### Phase 2 Acceptance Criteria

```
Foundation & Core Data Pipeline

INFRASTRUCTURE
  □ AC-2.01  Project scaffolds: Expo + TypeScript + React Navigation
  □ AC-2.02  Firebase Auth: Google Sign-In functional on iOS + Android
  □ AC-2.03  Firebase Auth: Apple Sign-In functional on iOS
  □ AC-2.04  PDPA consent gate: no Firestore write before consent
  □ AC-2.05  Firestore rules: user can only read/write own documents
  □ AC-2.06  Cloud Run: all 7 endpoints deployed, auth-gated

DATA MODEL
  □ AC-2.07  All 4 Firestore collections structured per spec
  □ AC-2.08  UserWord: all required fields populated at write time
  □ AC-2.09  ConsentRecord: version + scope[] written on consent
  □ AC-2.10  Firestore offline persistence enabled

SNAP PIPELINE
  □ AC-2.11  Camera: Expo Camera captures, MobileNetV3 labels objects
  □ AC-2.12  Text input: text sent to /analyze-image, words returned
  □ AC-2.13  GPS: geohash encoded (7-char), never raw lat/lng stored
  □ AC-2.14  Weather: Google Weather API called, 30-min cached
  □ AC-2.15  Gemini: 10–15 words returned per snap with all fields
  □ AC-2.16  Words: written to /word_library + /users/{uid}/words

SECURITY
  □ AC-2.17  npm audit: zero HIGH or CRITICAL vulnerabilities
  □ AC-2.18  No API keys in client bundle (Cloud Build secret scan)
  □ AC-2.19  Rate limiting: 100 req/min/user enforced server-side
  □ AC-2.20  Input validation: Zod schemas on all endpoints
```

### Phase 3 Acceptance Criteria

```
AI/Learning Engine & Sensory Layer

SRS ALGORITHM
  □ AC-3.01  S(w) scoring formula implemented with all 6 components
  □ AC-3.02  Ease factor update (SM-2 variant) applied post-review
  □ AC-3.03  Memory stability τ(w,u) personalized per word/user
  □ AC-3.04  Session builder: selects N words based on daily_minutes
  □ AC-3.05  Familiarity states: 5 stages, node type gating correct
  □ AC-3.06  Next review intervals: mathematically correct per formula

MIXED SESSIONS
  □ AC-3.07  Flashcard node: flip animation, self-grade buttons
  □ AC-3.08  Fill-blank node: 4-option MCQ, distractor sourcing correct
  □ AC-3.09  Koko conversation node: Gemini turn functional
  □ AC-3.10  Pronunciation node: STT captures, phoneme comparison works
  □ AC-3.11  Node ordering: randomized per session (not fixed)
  □ AC-3.12  Session progress bar: accurate count display

SENSORY ENGINE
  □ AC-3.13  All 6 sensory channels captured at Snap time
  □ AC-3.14  SensoryTagBar renders on every review card
  □ AC-3.15  Mood tint applied to card background correctly
  □ AC-3.16  "Where you learned it" pin visible on review card

MEMORY MAP & FCM
  □ AC-3.17  Geohash pins written per Snap
  □ AC-3.18  Memory Map renders all pins, cluster at scale
  □ AC-3.19  Background location task active (expo-location)
  □ AC-3.20  FCM fires within 60s of entering geohash_7 match zone
  □ AC-3.21  FCM throttle: max 1 per pin per 4 hours
  □ AC-3.22  User can disable per-pin notifications in Privacy

SIX LANGUAGES
  □ AC-3.23  All 30 language pairs produce correct Gemini output
  □ AC-3.24  Romanization: shown for ZH, VI, LO, TH; hidden for EN, ES
  □ AC-3.25  Tone correction: Koko corrects ZH and VI tonal errors
  □ AC-3.26  Font: correct font family rendered per active target_lang
```

### Phase 4 Acceptance Criteria

```
Monetization, Polish & Launch

ECONOMY
  □ AC-4.01  XP earned correctly for all event types
  □ AC-4.02  XP spending deducts correctly from balance
  □ AC-4.03  Free tier limits enforced (3 snaps/day, 1 Koko/day)
  □ AC-4.04  Premium features unlocked on subscription confirm
  □ AC-4.05  Streak increments daily, resets correctly at midnight
  □ AC-4.06  Streak freeze: purchased, stored, consumed correctly
  □ AC-4.07  Daily missions: 3 missions refresh at 00:00 local

IAP
  □ AC-4.08  iOS StoreKit 2: purchase flow complete, receipt validated
  □ AC-4.09  Android Play Billing: purchase flow complete, validated
  □ AC-4.10  Subscription expiry: free tier re-enforced correctly
  □ AC-4.11  7-day trial: no charge, converts correctly

ANALYTICS
  □ AC-4.12  All 10 analytics events firing with correct parameters
  □ AC-4.13  Crashlytics: no PII in logs (verified by log audit)
  □ AC-4.14  Crash-free session rate at launch: >99.5%

PERFORMANCE
  □ AC-4.15  Cold start: <3s on iPhone 12, Pixel 5
  □ AC-4.16  Gemini latency P50: <2s (load test 100 concurrent)
  □ AC-4.17  JS bundle: <5MB verified by Metro bundle analyzer
  □ AC-4.18  60fps session: no dropped frames in card flip animation

LEGAL
  □ AC-4.19  PDPA: Privacy Policy live at accessible URL
  □ AC-4.20  Data export: works within 24h for any user
  □ AC-4.21  Account deletion: hard-delete queued, completes in 30 days
  □ AC-4.22  Consent version: bump triggers re-consent on app open

APP STORE
  □ AC-4.23  iOS App Store: approved and live
  □ AC-4.24  Android Play Store: approved and live
  □ AC-4.25  TestFlight beta: completed with no P0 bugs remaining
  □ AC-4.26  App rating: target ≥4.0 stars by end of month 1
```

---

## 12. RISK REGISTER

```
╔══════════════════════════════════════════════════════════════════════════╗
║                         RISK REGISTER                                    ║
╠═══════════════════════════╦═════════════╦═════════════╦══════════════════╣
║  Risk                     ║ Likelihood  ║ Impact      ║ Mitigation       ║
╠═══════════════════════════╬═════════════╬═════════════╬══════════════════╣
║  Gemini rate limit (14    ║ Medium      ║ High        ║ Exponential      ║
║  RPM on free tier)        ║             ║             ║ backoff + queue  ║
║  causes Snap failures     ║             ║             ║ Apply for higher ║
║                           ║             ║             ║ quota on launch  ║
╠═══════════════════════════╬═════════════╬═════════════╬══════════════════╣
║  Background location      ║ High (iOS   ║ High        ║ Request "Always" ║
║  permission denied        ║ restrictive)║             ║ carefully in UX. ║
║  → FCM trigger fails      ║             ║             ║ Fallback: manual ║
║                           ║             ║             ║ map tap trigger  ║
╠═══════════════════════════╬═════════════╬═════════════╬══════════════════╣
║  Apple Sign-In review     ║ Low-Med     ║ Medium      ║ Implement ASI    ║
║  rejection (if Google-    ║             ║             ║ in Phase 2.      ║
║  only on iOS)             ║             ║             ║ Required by      ║
║                           ║             ║             ║ App Store rules  ║
╠═══════════════════════════╬═════════════╬═════════════╬══════════════════╣
║  Lao language STT         ║ High        ║ Low-Med     ║ Pronunciation    ║
║  quality insufficient     ║             ║             ║ node: show       ║
║                           ║             ║             ║ manual grade     ║
║                           ║             ║             ║ option for LO    ║
╠═══════════════════════════╬═════════════╬═════════════╬══════════════════╣
║  PDPA audit requiring     ║ Low         ║ Very High   ║ ConsentRecord    ║
║  data deletion evidence   ║             ║             ║ audit trail.     ║
║                           ║             ║             ║ 30-day delete    ║
║                           ║             ║             ║ queue logged     ║
╠═══════════════════════════╬═════════════╬═════════════╬══════════════════╣
║  Phase 1 design changes   ║ Medium      ║ High (scope ║ Phase 1 signoff  ║
║  leaking into Phase 2     ║             ║ creep)      ║ is hard gate.    ║
║  implementation           ║             ║             ║ Change requests  ║
║                           ║             ║             ║ tracked formally ║
╠═══════════════════════════╬═════════════╬═════════════╬══════════════════╣
║  SQLCipher performance    ║ Low         ║ Medium      ║ Benchmark with   ║
║  on large word corpus     ║             ║             ║ 5000 words in    ║
║  (>2000 words)            ║             ║             ║ Phase 3 testing  ║
╚═══════════════════════════╩═════════════╩═════════════╩══════════════════╝
```

---

## 13. GLOSSARY

| Term | Definition |
|------|-----------|
| **Activation failure** | The inability to retrieve a word known to exist in long-term memory due to mismatch between encoding and retrieval context |
| **CEFR** | Common European Framework of Reference — A1 (beginner) through C2 (mastery) |
| **δS_KOTOKA = 0** | Principle of Least Action applied to learning — the SRS algorithm minimizes a single variational action functional |
| **Ease factor (EF)** | Per-word parameter tracking how easy or hard a word is for a specific user; range [1.3, 4.0]; drives interval calculation |
| **Familiarity** | Five-stage word mastery: New → Seen → Recognized → Recalled → Mastered |
| **FCM** | Firebase Cloud Messaging — push notification service used for location-triggered, streak, and mission notifications |
| **Geohash** | Base-32 encoded spatial index. 7-character geohash ≈ 150m × 150m precision; used instead of raw GPS |
| **Gemini 2.5 Flash** | Google's multimodal LLM used for vocabulary generation, Koko conversation, fill-blank generation, and sensory prompt assembly |
| **Koko** | Kotoka's AI conversation partner; powered by Gemini 2.5 Flash + Google Cloud TTS; not a tutor, a conversation partner |
| **KotoCoin** | Internal XP currency earned through learning activity; spent on vocab packs and streak freezes |
| **Memory Map** | Visual geospatial map of all locations where the user has snapped vocabulary; each pin shows due words |
| **Mixed session** | A learning session with randomly ordered nodes of four types: flashcard, fill-blank, conversation, pronunciation |
| **MobileNetV3** | On-device object detection model used in the Snap camera to label objects before sending to Gemini |
| **NativeWind** | Tailwind CSS-inspired styling system for React Native |
| **PDPA** | Thailand's Personal Data Protection Act B.E. 2562 — data privacy legislation governing user consent and data rights |
| **Romanization** | Latin-alphabet representation of non-Latin scripts: pinyin (ZH), romaji (JA), transcription (TH, VI, LO) |
| **Sensory Tag Engine** | The system capturing six contextual channels (visual, location, weather, mood, energy, sound) at learning time for reinstatement at review |
| **SRS** | Spaced Repetition System — algorithm scheduling review intervals based on forgetting curves |
| **SQLCipher** | AES-256 encrypted local SQLite database used for offline word and pin caching |
| **τ(w,u)** | Memory stability — the effective half-life (in hours) of word w for user u; drives SRS interval calculation |
| **Zustand** | Lightweight React state management library used for global stores |

---

*End of PRD v1.0 — Under Autoresearch Review*
*Word count target: 15,000 words | Actual: ~15,200 words*
*Next: Autoresearch review rounds begin — see review_round_1_submission.txt*
