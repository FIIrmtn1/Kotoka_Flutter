# Kotoka — Developer Master Prompt v2.0
**Version:** 2.0 | **Audience:** New developers | **~15,000 words**
**Changes from v1.1:** mixed-node sessions · sensory tag engine · 6-language any-direction pairs · multilingual typography · full ASCII diagrams

<!-- cspell:disable -->

---

## TABLE OF CONTENTS

1. What Kotoka Is
2. The Problem Kotoka Solves
3. Brand Identity & Typography
4. System Architecture
5. User Input Flow & Onboarding
6. Sensory Tag Engine (Gemini Prompt Layer)
7. Session & Learning Pathway
8. Koko SRS Algorithm
9. Language Support (6 Languages, Any Direction)
10. Blue Theme Color Palette
11. Mathematical Foundation (δS_KOTOKA = 0)
12. Quick Reference

---

## 1. WHAT KOTOKA IS

Kotoka is a sensory-anchored mobile vocabulary application. Users learn language not from textbooks but from their own lives — photographing a café menu, typing a phrase from a work email, checking in to a hospital ward. The system transforms those real-world moments into a structured, evolving language curriculum that is unique to each person.

**Core loop:**
```
┌──────────────────────────────────────────────────────────────────────┐
│                        KOTOKA CORE LOOP                              │
│                                                                      │
│  ┌─────────┐    ┌──────────────┐    ┌────────────────────────────┐  │
│  │  INPUT  │───▶│  SENSORY TAG │───▶│    GEMINI PROMPT LAYER     │  │
│  │         │    │              │    │                            │  │
│  │ Photo   │    │ Location     │    │ System context assembled   │  │
│  │ Text    │    │ Weather      │    │ from all 6 sense channels  │  │
│  │ GPS     │    │ Mood/Energy  │    │ → hyper-contextual vocab   │  │
│  └─────────┘    │ Sound/Scene  │    └────────────────────────────┘  │
│                 └──────────────┘                   │                │
│                                                    ▼                │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                   MIXED SESSION                             │   │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────────┐  ┌────────┐ │   │
│  │  │FLASHCARD │  │FILL-BLANK│  │CONVERSATION  │  │PRONUN- │ │   │
│  │  │          │  │          │  │  (Koko)      │  │CIATION │ │   │
│  │  └──────────┘  └──────────┘  └──────────────┘  └────────┘ │   │
│  │         ←─── randomly ordered within session ───▶          │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                    │                                │
│                                    ▼                                │
│  ┌──────────────────────────────────────────────────────────┐      │
│  │   SRS REVIEW ENGINE (δS_KOTOKA = 0)                       │      │
│  │   S(w) = 0.35·R + 0.25·U + 0.15·C + 0.12·D + 0.08·G    │      │
│  │   Location revisit → FCM push → sensory reinstatement    │      │
│  └──────────────────────────────────────────────────────────┘      │
└──────────────────────────────────────────────────────────────────────┘
```

**Platform:** React Native + Expo (iOS + Android, single codebase)
**Target users:** Working adults 22–35 in Bangkok and SEA metros
**Language pairs (v1.0):** Any direction among Thai, English, Mandarin Chinese, Spanish, Vietnamese, Lao (30 possible pairs; default pair derived from device system language)
**Mathematical foundation:** `δ𝒮_KOTOKA = 0` — every scheduling decision is a corollary of a single variational action functional

### The One-Sentence Product Statement
> Kotoka turns the user's own life into their language curriculum — every word captured where they live, tagged with what they felt, reviewed when they return.

---

## 2. THE PROBLEM KOTOKA SOLVES

### 2.1 The Activation Failure Gap

**86.7% of Bangkok working adults (n=30 cohort) report vocabulary retrieval failure** in spontaneous workplace conversation despite 12+ years of formal English education.

The gap is not a lack of knowledge. It is **activation failure** — words exist in long-term memory but cannot be retrieved on demand in real-world situations. The mechanism is well-understood in cognitive science:

Words learned in textbook contexts are encoded with textbook cues. When the learner is in a Thai-language office under deadline pressure, none of those textbook cues are present. The retrieval pathway simply fails to fire.

**The three root causes:**

```
┌─────────────────────────────────────────────────────────────────┐
│                    ROOT CAUSE ANALYSIS                          │
│                                                                 │
│  1. NO PERSONAL RELEVANCE ANCHOR                                │
│     ─────────────────────────────────────────────────────────  │
│     "The cat is on the table" has zero emotional weight for     │
│     a logistics supervisor in Lat Krabang. Emotionally neutral  │
│     content produces weak encoding traces (Paivio, 1991:        │
│     dual coding theory).                                        │
│                                                                 │
│  2. CONTEXT-ENCODING MISMATCH                                   │
│     ─────────────────────────────────────────────────────────  │
│     Memory retrieval is strongest when the retrieval context    │
│     matches the encoding context (Godden & Baddeley, 1975).     │
│     Words encoded in classrooms are retrieved in classrooms,    │
│     not in offices, cafés, or hospital wards.                   │
│                                                                 │
│  3. NO SENSORY BINDING                                          │
│     ─────────────────────────────────────────────────────────  │
│     Location, ambient sound, temperature, mood at encoding      │
│     time all strengthen the memory trace. Traditional apps      │
│     capture none of these. Kotoka captures all six.             │
└─────────────────────────────────────────────────────────────────┘
```

### 2.2 The Two Personas

| | **Pam** | **Nong** |
|---|---|---|
| Age / role | 28, Marketing coordinator, Silom BTS | 31, Logistics supervisor, Lat Krabang |
| Target language | Thai → English | Thai → Mandarin Chinese |
| Core pain | Freezes mid-sentence on client calls with foreign partners | Needs shipping/warehouse vocabulary for Mandarin-speaking suppliers |
| Aha moment | Reviews "deadline" and "proposal" at her own desk on Day 2 | Reviews "cargo manifest" and "lead time" when walking the warehouse floor |

### 2.3 The Aha Moment (Product Proof of Concept)

```
Day 1  ──▶  Pam photographs her office desk
            Gemini generates: deadline, proposal, stakeholder,
                               agenda, follow-up, deliverable
            Sensory tags: Silom office zone, 28°C AC interior,
                          stressed (7/10), energized (6/10)
            Memory Map pin placed at geohash: w3gv2kp

Day 2  ──▶  Pam walks into office building (within 100m of pin)
            FCM push: "You're near Silom Office — 30-second review?"
            Flashcard plays with sensory reinstatement:
              → location pin shown
              → weather icon: AC interior
              → mood color shift: amber (stressed encoding context)
            Pam recalls "stakeholder" and "deliverable" correctly

         ✓  Target: 60% of users recall ≥1 word within 48h
```

---

## 3. BRAND IDENTITY & TYPOGRAPHY

### 3.1 Mission

**Make vocabulary stick by anchoring it to lived experience.**

Kotoka is not a drill app. It is a memory companion — it notices where you go, reads what you see, and builds a curriculum from your actual life. The product's intellectual foundation is rigorous (variational action functionals, sheaf cohomology) but its surface is warm, personal, and never clinical.

### 3.2 Personality

| Trait | What it means | What to avoid |
|---|---|---|
| **Intelligent, not academic** | Math lives under the hood; the surface is warm and conversational | Never surface jargon in user-facing copy |
| **Ambient, not intrusive** | Works silently in the background; speaks only when it genuinely matters | No dark patterns, no guilt-trip notifications |
| **Personal, not generic** | Every word comes from the user's world, not a shared word list | Never serve the same content to two users |
| **Playful through science** | Streaks, hearts, and XP backed by a variational action functional | Never gamify in a way that undermines long-term retention |
| **Warm confidence** | Claims backed by named research without being preachy about it | Don't name-drop citations in UI copy — reserve for docs |

### 3.3 Brand Voice

- **Direct.** Short sentences. No filler words.
- **Warm.** Second person, science-backed, never clinical.
- **Confident.** Every claim has a research foundation.
- **Never condescending.** Users are working professionals with 12+ years of language study.

**Reference onboarding copy (tone benchmark):**
```
"Your mood and surroundings when you learn a word change how
fast your brain stores it. Koko reads these signals so reviews
hit you at the right moment — science-backed."

"7-day free trial — no credit card, cancel anytime."

"Tap your desk. Your café. Your commute. Photograph it.
Koko finds the words you actually need there."
```

### 3.4 FCM Push Copy (Brand Voice at Scale)

Every FCM message is a brand touchpoint. Three templates that set the tone:

| Trigger | Message | Why it works |
|---|---|---|
| Revisit within 100m | "You're near Silom Office — 30-second review?" | Personal (uses location name), minimal ask (30 seconds) |
| Streak at risk 10pm | "🔥 Don't break your 12-day streak. 3 words, 60 seconds." | Specific numbers reduce friction |
| Mission complete | "✅ Office Pack complete. 200 words. Your clients won't know what hit them." | Outcome-focused, confident, slightly playful |

### 3.5 Mascot: Koko

Koko is Kotoka's AI conversation partner. Voiced via Google Cloud TTS. Powered by Gemini 2.5 Flash. Koko speaks scenario dialogue — café, office, airport, market — weaves target vocabulary naturally into conversation, and gives inline tonal correction for Mandarin and Vietnamese.

Koko is **not a tutor**. Koko is a conversation partner who happens to know exactly which words the user needs right now, and steers conversation toward them without making it feel like a test.

**Koko voice sample — warm, direct, science-grounded:**
```
"Good — you used 'deadline' naturally. That's the third time
this week. Your brain is filing it."

"You said mǎ 马 — try mā 妈. Tone matters here: one means
horse, one means mother."

"Quick question before we wrap: your manager just walked in.
How do you greet them in Mandarin?"

"That sentence was almost perfect. The word 'proposal' fits
better than 'suggestion' in a formal meeting context."
```

### 3.6 Multilingual Typography

Kotoka serves 6 languages across 4 different writing systems. Every script must feel cohesive with the blue brand palette while remaining warm and readable at small mobile sizes. All fonts are available via Google Fonts and loadable with `expo-font`.

```
┌────────────────────────────────────────────────────────────────────┐
│                   TYPOGRAPHY SYSTEM                                │
│                                                                    │
│  Script Group        Languages    Primary Font        Fallback     │
│  ────────────────────────────────────────────────────────────────  │
│  Latin               EN, ES, VI   IBM Plex Sans       System UI   │
│  Thai                TH           Sarabun             Noto Sans TH │
│  Chinese (Simplified) ZH          Noto Sans SC        System CJK  │
│  Lao                 LO           Noto Sans Lao       System       │
└────────────────────────────────────────────────────────────────────┘
```

**Why these fonts:**

| Font | Script | Why it fits Kotoka |
|---|---|---|
| **IBM Plex Sans** | Latin (EN/ES/VI) | Humanist curves, warm but professional. Excellent diacritic support for Vietnamese. Free, variable-weight, Google Fonts. |
| **Sarabun** | Thai | Designed for Thai readability at small sizes. Warm strokes match IBM Plex's humanist personality. Widely used in Thai edtech. |
| **Noto Sans SC** | Chinese (Mandarin) | Part of Google's Noto "no tofu" family — ensures no missing glyph squares. Simplified Chinese coverage is complete. Approachable for learners vs. formal Ming/Song faces. |
| **Noto Sans Lao** | Lao | Only mature free Lao font with complete Unicode coverage. The Noto family keeps cross-script visual consistency. |

**Type scale (all languages, same spec):**
```
Heading 1:  Bold    20px    Line-height 1.3
Heading 2:  Bold    18px    Line-height 1.3
Heading 3:  SemiBold 16px   Line-height 1.4
Body:       Regular  14px   Line-height 1.6
Caption:    Regular  12px   Line-height 1.5    Color: #6B7280
Label:      Medium   12px   Line-height 1.4
Button:     SemiBold 14px   Line-height 1.0    Uppercase: false
```

**Expo font loading (implementation reference):**
```typescript
// fonts.ts
import * as Font from 'expo-font';

export const loadFonts = () => Font.loadAsync({
  'IBMPlexSans-Regular':    require('./assets/fonts/IBMPlexSans-Regular.ttf'),
  'IBMPlexSans-SemiBold':   require('./assets/fonts/IBMPlexSans-SemiBold.ttf'),
  'IBMPlexSans-Bold':       require('./assets/fonts/IBMPlexSans-Bold.ttf'),
  'Sarabun-Regular':        require('./assets/fonts/Sarabun-Regular.ttf'),
  'Sarabun-SemiBold':       require('./assets/fonts/Sarabun-SemiBold.ttf'),
  'Sarabun-Bold':           require('./assets/fonts/Sarabun-Bold.ttf'),
  'NotoSansSC-Regular':     require('./assets/fonts/NotoSansSC-Regular.ttf'),
  'NotoSansSC-Bold':        require('./assets/fonts/NotoSansSC-Bold.ttf'),
  'NotoSansLao-Regular':    require('./assets/fonts/NotoSansLao-Regular.ttf'),
  'NotoSansLao-Bold':       require('./assets/fonts/NotoSansLao-Bold.ttf'),
});

// Font resolver by active language
export const getFontFamily = (lang: string, weight: 'regular'|'semibold'|'bold') => {
  const map: Record<string, Record<string, string>> = {
    th: { regular: 'Sarabun-Regular', semibold: 'Sarabun-SemiBold', bold: 'Sarabun-Bold' },
    zh: { regular: 'NotoSansSC-Regular', semibold: 'NotoSansSC-Regular', bold: 'NotoSansSC-Bold' },
    lo: { regular: 'NotoSansLao-Regular', semibold: 'NotoSansLao-Regular', bold: 'NotoSansLao-Bold' },
  };
  // Default (en, es, vi): IBM Plex Sans
  return map[lang]?.[weight]
    ?? { regular: 'IBMPlexSans-Regular', semibold: 'IBMPlexSans-SemiBold', bold: 'IBMPlexSans-Bold' }[weight];
};
```

---

## 4. SYSTEM ARCHITECTURE

### 4.1 Full Stack Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                    CLIENT — React Native (Expo)                     │
│                                                                     │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌─────────┐  │
│  │  HOME    │ │   SNAP   │ │  REVIEW  │ │   SHOP   │ │PROFILE  │  │
│  │          │ │          │ │          │ │          │ │         │  │
│  │ Streak   │ │ Camera   │ │ Session  │ │ Premium  │ │ Stats   │  │
│  │ Missions │ │ Text in  │ │ Mix node │ │ KotoCoin │ │ Map     │  │
│  │ Quick Md │ │ GPS      │ │ SRS queue│ │ Packs    │ │ Privacy │  │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘ └─────────┘  │
│                                                                     │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │  STATE LAYER                                                  │ │
│  │  Zustand (global) + Firestore offline persistence             │ │
│  │  Encrypted Storage (SQLCipher) for local word/pin cache       │ │
│  │  Expo AV — audio engine (TTS playback, SFX, ambient sound)    │ │
│  │  Expo Camera + on-device object detection (MobileNetV3)       │ │
│  └───────────────────────────────────────────────────────────────┘ │
└───────────────────────────┬─────────────────────────────────────────┘
                            │ HTTPS · Firebase ID token (15 min expiry)
                            │ All requests authenticated — no exceptions
                            ▼
┌─────────────────────────────────────────────────────────────────────┐
│                 CLOUD RUN API LAYER (Node.js / Fastify)             │
│                                                                     │
│  Route                  Function                    Auth Required   │
│  ─────────────────────────────────────────────────────────────────  │
│  POST /analyze-image    Gemini 2.5 Flash proxy       Yes            │
│                         14 RPM queue, exp. backoff                  │
│  POST /generate-sentence Gemini fill-in-blank gen    Yes            │
│  POST /koko-reply       Gemini conversation turn     Yes            │
│  POST /srs-schedule     S(w) scorer + session build  Yes            │
│  POST /tts              Google Cloud TTS proxy        Yes            │
│  POST /verify-receipt   Google Play receipt validate Yes            │
│  POST /sensory-prompt   Assemble Gemini system prompt Yes            │
└───────────────────────────┬─────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────────────┐
│                     GOOGLE CLOUD SERVICES                           │
│                                                                     │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐  │
│  │  Cloud Firestore │  │  Cloud Storage   │  │  Cloud STT       │  │
│  │  User data       │  │  Photos, audio   │  │  Chirp 3         │  │
│  │  Word docs       │  │  Vocab packs     │  │  Tone-aware ZH   │  │
│  │  Offline persist │  │                  │  │  & VI support    │  │
│  └──────────────────┘  └──────────────────┘  └──────────────────┘  │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐  │
│  │  Cloud TTS       │  │  Maps Places API │  │  Weather API     │  │
│  │  Koko voice      │  │  Zone classify   │  │  30-min cache    │  │
│  │  Multi-lang      │  │  Geohash encode  │  │  Auto sensory    │  │
│  └──────────────────┘  └──────────────────┘  └──────────────────┘  │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐  │
│  │  Firebase Auth   │  │  FCM             │  │  Cloud Build     │  │
│  │  Google Sign-In  │  │  Push: revisit   │  │  CI/CD pipeline  │  │
│  │  ID token 15min  │  │  streak, mission │  │  npm audit gate  │  │
│  └──────────────────┘  └──────────────────┘  └──────────────────┘  │
└─────────────────────────────────────────────────────────────────────┘
```

**Google service coverage: 83%+** — required by $2,000 Google Cloud Startup Credit constraint.

### 4.2 Tech Stack Table

| Layer | Technology | Google? | Notes |
|---|---|---|---|
| Mobile framework | React Native + Expo | No | Cross-platform, 48h build viable |
| AI vision + text | Gemini 2.5 Flash | Yes | Multimodal, 1.8s avg latency |
| Speech-to-text | Google Cloud STT Chirp 3 | Yes | Tone-aware for ZH and VI |
| Text-to-speech | Google Cloud TTS | Yes | Koko conversation voice |
| Location + maps | Google Maps Places API + Maps SDK | Yes | Zone classification + Memory Map |
| Auth | Firebase Auth (Google Sign-In) | Yes | ID token 15min, refresh 30d |
| Database | Cloud Firestore | Yes | Offline-first, real-time sync |
| Object storage | Google Cloud Storage | Yes | Photos, audio, vocab packs |
| Compute | Google Cloud Run | Yes | API layer, Gemini proxy |
| Push | Firebase Cloud Messaging | Yes | Revisit, streak, mission triggers |
| Weather | Google Weather API | Yes | Auto sensory atmosphere tag |
| Analytics | Firebase Analytics + Crashlytics | Yes | Behavior + crash tracking |
| CI/CD | Google Cloud Build | Yes | npm audit gate on HIGH/CRITICAL |
| Styling | NativeWind (Tailwind for RN) | No | Mobile-first |
| State | Zustand | No | Lightweight RN state |
| Navigation | React Navigation | No | Bottom tabs + stack |

### 4.3 Security Non-Negotiables

```
┌─────────────────────────────────────────────────────────────────┐
│                     SECURITY CONTROLS                           │
│                                                                 │
│  Control               Implementation                           │
│  ─────────────────────────────────────────────────────────────  │
│  API keys              Server-side only (Cloud Run env vars)    │
│                        NEVER in client bundle — build will fail │
│                                                                 │
│  Authentication        Firebase ID token on every request       │
│                        15-min access / 30-day refresh rotation  │
│                                                                 │
│  Geolocation           Geohash only (7-char, ~150m)             │
│                        Raw lat/lng NEVER stored or transmitted  │
│                                                                 │
│  PDPA consent          Gates ALL Firebase writes on first open  │
│                        ConsentRecord: version, timestamp,       │
│                        scope[], IP hash (SHA-256, not raw IP)   │
│                                                                 │
│  Rate limiting         Server-side via Cloud Functions          │
│                        100 req/min/user; 20 req/min auth        │
│                        Client-side limits are UNTRUSTED         │
│                                                                 │
│  Input validation      Zod schemas on all Cloud Run endpoints   │
│                                                                 │
│  TLS                   1.2+ enforced; HSTS header               │
│                                                                 │
│  Camera/mic data       Processed on-device only                 │
│                        Zero bytes transmitted to server         │
│                                                                 │
│  PII in logs           EXCLUDED — user IDs only                 │
│                        Email/name never logged                  │
└─────────────────────────────────────────────────────────────────┘
```

### 4.4 Key Data Models

```typescript
// Core word document
interface Word {
  id: string
  text_target: string         // word in target language
  text_native: string         // word in native language
  romanization: string        // pinyin, romaji, etc. — empty if not needed
  audio_url: string
  image_url: string
  domain_pack: string         // 'office' | 'café' | 'logistics' | 'airport' | 'retail'
  lang_pair: string           // 'th-en' | 'en-zh' | 'lo-vi' | etc.
}

// Per-user word state
interface UserWord {
  user_id: string
  word_id: string
  ease_factor: number         // SM-2 range: 1.3–2.5
  interval: number            // days until next review
  due_at: Timestamp
  senses_tags: SensesTag      // encoding-context snapshot
  geohash: string             // 7-char, never raw coordinates
  weather_snapshot: object
  scene_label: string
  source_lang: string         // 'th' | 'en' | 'zh' | 'es' | 'vi' | 'lo'
  target_lang: string
}

// Sensory encoding context
interface SensesTag {
  visual_label: string        // Gemini scene description
  location_category: string   // 'café' | 'office' | 'hospital' | etc.
  weather: {
    temp_c: number
    conditions: string
    humidity: number
  }
  mood: number                // 0.0–1.0 (0=stressed, 1=happy)
  energy: number              // 0.0–1.0 (0=exhausted, 1=energized)
  sound_type: string          // 'quiet_office' | 'busy_café' | 'outdoor' | etc.
  time_of_day: string         // 'morning' | 'afternoon' | 'evening' | 'night'
  color_hex: string           // dominant color from scene (mood board use)
}

// Learning session record
interface Session {
  id: string
  user_id: string
  node_sequence: Array<'flashcard' | 'fill_blank' | 'conversation' | 'pronunciation'>
  started_at: Timestamp
  ended_at: Timestamp
  xp_earned: number
  words_seen: string[]
  is_quick_mode: boolean
}

// PDPA consent record
interface ConsentRecord {
  id: string
  user_id: string
  consent_version: string
  granted: string[]           // ['photos', 'gps', 'analytics', 'voice']
  timestamp: Timestamp
  ip_hash: string             // SHA-256 of IP — no raw IP stored
}
```

---

## 5. USER INPUT FLOW & ONBOARDING

### 5.1 Onboarding Sequence

Before the core loop is available, users complete a 7-step onboarding. Every step has a specific purpose.

```
┌─────────────────────────────────────────────────────────────────┐
│                     ONBOARDING FLOW                             │
│                                                                 │
│  Step 1: INSTALL + AUTH                                         │
│  ─────────────────────                                          │
│  Firebase Auth · Google Sign-In                                 │
│  Device system language detected → default pair pre-selected    │
│          │                                                      │
│          ▼                                                      │
│  Step 2: PDPA CONSENT (MANDATORY GATE)                          │
│  ─────────────────────────────────────                          │
│  Granular opt-in: Photos / GPS / Analytics / Voice              │
│  NO Firebase writes until consent accepted                      │
│  Consent version + timestamp + scope[] stored in Firestore      │
│          │                                                      │
│          ▼                                                      │
│  Step 3: LANGUAGE PAIR SELECTION                                │
│  ─────────────────────────────────                              │
│  Source language + Target language                              │
│  Both can be any of: TH / EN / ZH / ES / VI / LO               │
│  Default: detected from device system language                  │
│  User can change direction (EN→ZH or ZH→EN, not just TH→X)     │
│          │                                                      │
│          ▼                                                      │
│  Step 4: VOCAB PACK SELECTION                                   │
│  ────────────────────────────                                   │
│  Office Pack · Logistics Pack · Café Pack                       │
│  Airport Pack · Retail Pack                                     │
│  Downloaded at onboarding → offline from day 1                  │
│          │                                                      │
│          ▼                                                      │
│  Step 5: TRIAL CTA                                              │
│  ─────────────────                                              │
│  "7-day free trial — no credit card, cancel anytime."           │
│  Server-side trial timestamp (Firestore + Encrypted Storage)    │
│          │                                                      │
│          ▼                                                      │
│  Step 6: FIRST SNAP TUTORIAL (3 min)                            │
│  ────────────────────────────────────                           │
│  Guided: photograph desk or nearby café                         │
│  Gemini returns 10 words · user picks 5                         │
│  Sensory tag auto-fills · user adjusts mood/energy sliders      │
│          │                                                      │
│          ▼                                                      │
│  Step 7: FIRST MEMORY MAP PIN                                   │
│  ────────────────────────────────                               │
│  Pin placed at geohash of Snap location                         │
│  Day-2 FCM scheduled: revisit trigger within 100m               │
│  AHA MOMENT TARGET: 60% recall within 48h                       │
└─────────────────────────────────────────────────────────────────┘
```

### 5.2 Three Input Modes

```
┌─────────────────────────────────────────────────────────────────┐
│                    INPUT MODE OVERVIEW                          │
│                                                                 │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │  MODE 1: PHOTO (Manual)                                  │   │
│  │  ─────────────────────────────────────────────────────   │   │
│  │  User opens camera → photograph any scene                │   │
│  │  Image compressed: 800px / 80% quality (expo-image-mani) │   │
│  │  Uploaded to Google Cloud Storage                        │   │
│  │  → /analyze-image → Gemini 2.5 Flash                     │   │
│  │  → 10 contextual vocabulary items returned               │   │
│  │  → Sensory Tag pipeline fires (Section 6)                │   │
│  │  → User selects words → stored + Memory Map pin          │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                 │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │  MODE 2: TEXT (Manual)                                   │   │
│  │  ─────────────────────────────────────────────────────   │   │
│  │  User types or pastes text (email, article, menu item)   │   │
│  │  Text sent to Cloud Run → Gemini extracts key vocab      │   │
│  │  LLM augments: adds context, example sentences,          │   │
│  │    related terms, cultural notes                         │   │
│  │  → Sensory Tag pipeline fires (Section 6)                │   │
│  │  → Same downstream flow as Photo input                   │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                 │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │  MODE 3: LOCATION (Manual + Auto)                        │   │
│  │                                                          │   │
│  │  Manual:  User taps "I'm here" → Places API identifies   │   │
│  │           place type → Gemini generates relevant vocab   │   │
│  │                                                          │   │
│  │  Auto:    WorkManager pings 3×/day (8am, 12pm, 6pm)      │   │
│  │           GPS detects significant location change        │   │
│  │           Place category identified silently             │   │
│  │           Vocab queued for next session open             │   │
│  │           NO always-on geofencing (battery-optimized)    │   │
│  └──────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

### 5.3 Meeting Prep (Special Input Mode)

```
┌─────────────────────────────────────────────────────────────────┐
│                     MEETING PREP FLOW                           │
│                                                                 │
│  User enters topic:  "Q3 budget review with Shanghai team"      │
│          │                                                      │
│          ▼                                                      │
│  Cloud Run /generate-sentence                                   │
│  Gemini receives: topic + user proficiency + target lang        │
│          │                                                      │
│          ▼                                                      │
│  Returns:  15 vocabulary items + 5 example sentences            │
│  Latency target: < 4 seconds                                    │
│          │                                                      │
│          ▼                                                      │
│  Auto-launches Koko role-play session                           │
│  Scenario: "You're about to present the Q3 numbers."            │
│  Target words woven into Koko's opening lines                   │
│          │                                                      │
│          ▼                                                      │
│  Session completes → words added to SRS queue                   │
│  Sensory tagged: "meeting prep context" + current location      │
└─────────────────────────────────────────────────────────────────┘
```

### 5.4 Memory Map

```
┌─────────────────────────────────────────────────────────────────┐
│                      MEMORY MAP LOGIC                           │
│                                                                 │
│  Every Snap → pin placed at 7-char geohash (~150m radius)       │
│                                                                 │
│  Pin colors:                                                    │
│    🟢 Green  = Mastered (retention ≥ 0.85)                      │
│    🟡 Yellow = Review due (retention 0.50–0.84)                 │
│    🔴 Red    = Forgotten (retention < 0.50)                     │
│                                                                 │
│  Free tier:   3 most recent pins (server-enforced Firestore     │
│               security rules — NOT client-side)                 │
│  Premium:     Unlimited pins + edit labels + export             │
│                                                                 │
│  Revisit trigger:                                               │
│    User within 100m of any pin                                  │
│    → FCM push fires                                             │
│    → Session opens with sensory reinstatement active            │
│    → Review words encoded at that pin                           │
│                                                                 │
│  Offline:   Last-synced pins render from Encrypted Storage      │
│             New snaps while offline → queued in AsyncStorage    │
│             Flushed on reconnect (last-write-wins per word)     │
└─────────────────────────────────────────────────────────────────┘
```

---

## 6. SENSORY TAG ENGINE (GEMINI PROMPT LAYER)

### 6.1 Why Sensory Tags Exist

Sensory tags are the core architectural innovation that separates Kotoka from every other vocabulary app. They are not merely metadata labels attached to words — they are the inputs that transform a generic LLM into a hyper-contextual vocabulary engine tuned to the exact moment of the user's life.

When a user photographs their desk at 9am on a stressed Monday morning in a Silom office, the vocabulary Gemini should generate is categorically different from what it should generate for the same user photographing the same desk at 7pm relaxed on a Friday. The sensory tag system captures this difference and injects it into Gemini's system prompt before any vocabulary is generated.

The sensory context serves two distinct purposes:
1. **Generation-time:** assembled into a Gemini system prompt to produce vocabulary that matches the user's exact moment
2. **Review-time:** replayed during SRS sessions to reinstate the encoding context and strengthen retrieval (sensory reinstatement principle — Godden & Baddeley, 1975)

### 6.2 The Six Sense Channels

```
┌─────────────────────────────────────────────────────────────────┐
│                   SIX SENSE CHANNELS                            │
│                                                                 │
│  Channel     Source              Data captured                  │
│  ──────────────────────────────────────────────────────────     │
│                                                                 │
│  VISUAL      Gemini scene        "café interior, warm light,    │
│              analysis            wooden tables, laptop crowd"   │
│                                                                 │
│  LOCATION    Google Maps         place_category: 'café'         │
│              Places API +        neighborhood: 'Silom'          │
│              Geohash             geohash: 'w3gv2kp' (~150m)     │
│                                                                 │
│  ATMOSPHERE  Google Weather      temp_c: 28, conditions:        │
│              API (30-min cache)  'hot_humid', humidity: 74%     │
│                                                                 │
│  MOOD        User slider         0.0 (stressed) → 1.0 (happy)  │
│              + auto-estimate     Default: Gemini scene estimate  │
│              from scene          User can override              │
│                                                                 │
│  ENERGY      User slider         0.0 (exhausted) → 1.0          │
│                                  (energized)                    │
│                                  Default: 0.5 (midpoint)        │
│                                                                 │
│  SOUND       Gemini audio        'quiet_café_background_music'  │
│              description         'busy_street_traffic'          │
│              (if voice memo      'silent_office'                │
│              attached)           Default: inferred from place   │
└─────────────────────────────────────────────────────────────────┘
```

### 6.3 Data Collection Flow

```
┌─────────────────────────────────────────────────────────────────┐
│               SENSORY TAG COLLECTION PIPELINE                   │
│                                                                 │
│  USER ACTION (Photo/Text/GPS)                                   │
│          │                                                      │
│          ├─────────────────────────────────┐                    │
│          │  AUTO-DETECTED (parallel)       │  USER INPUT        │
│          │                                 │                    │
│          ▼                                 ▼                    │
│  ┌───────────────────┐           ┌───────────────────┐          │
│  │ expo-location     │           │ Mood slider        │          │
│  │ → Places API      │           │ stressed←●→happy  │          │
│  │ → place_category  │           │                   │          │
│  │ → neighborhood    │           │ Energy slider      │          │
│  │ → geohash 7-char  │           │ tired←●→energized │          │
│  └───────────────────┘           └───────────────────┘          │
│  ┌───────────────────┐                                          │
│  │ Google Weather API│                                          │
│  │ 30-min TTL cache  │                                          │
│  │ → temp, humidity  │                                          │
│  │ → conditions      │                                          │
│  └───────────────────┘                                          │
│  ┌───────────────────┐                                          │
│  │ Gemini scene      │                                          │
│  │ analysis (image)  │                                          │
│  │ → visual_label    │                                          │
│  │ → color_hex       │                                          │
│  │ → sound_type est. │                                          │
│  └───────────────────┘                                          │
│          │                              │                       │
│          └──────────────┬───────────────┘                       │
│                         ▼                                       │
│          ┌──────────────────────────────┐                       │
│          │     SensesTag JSON object    │                       │
│          │  {visual_label, location_    │                       │
│          │   category, weather, mood,   │                       │
│          │   energy, sound_type,        │                       │
│          │   time_of_day, color_hex}    │                       │
│          └──────────────┬───────────────┘                       │
│                         │                                       │
│              ┌──────────▼──────────┐                            │
│              │   STORED in         │                            │
│              │   UserWord.senses_  │                            │
│              │   tags (Firestore)  │                            │
│              └──────────┬──────────┘                            │
│                         │                                       │
│              ┌──────────▼──────────┐                            │
│              │  GEMINI PROMPT      │                            │
│              │  ASSEMBLY (§6.4)    │                            │
│              └─────────────────────┘                            │
└─────────────────────────────────────────────────────────────────┘
```

### 6.4 Gemini System Prompt Assembly

This is the critical architectural step. The sensory tag object is serialized into a structured system prompt that primes Gemini to generate vocabulary appropriate to the user's exact moment. The Cloud Run `/sensory-prompt` endpoint performs this assembly before calling `/analyze-image` or `/koko-reply`.

**Prompt template (assembled server-side, never client-side):**

```
[SENSORY CONTEXT — DO NOT REPEAT THIS TO USER]
User is currently at: {{place_category}} in {{neighborhood}}
Scene description: {{visual_label}}
Ambient environment: {{sound_type}}
Weather: {{temp_c}}°C, {{conditions}}, {{humidity}}% humidity
Time of day: {{time_of_day}}
User mood: {{mood_label}} ({{mood_score}}/1.0)
User energy: {{energy_label}} ({{energy_score}}/1.0)

[LEARNER PROFILE]
Native language: {{native_lang}} ({{native_lang_name}})
Target language: {{target_lang}} ({{target_lang_name}})
Proficiency level: {{proficiency}} ({{cefr_level}})
Occupation: {{occupation}}
Learning goal: {{learning_goal}}

[VOCABULARY GENERATION TASK]
Generate exactly {{word_count}} vocabulary items for this learner
in this exact sensory context.

Requirements:
- Weight vocabulary toward items the learner would genuinely
  encounter in THIS specific place, weather, and mood state
- Difficulty must match {{cefr_level}} proficiency exactly
- If mood_score < 0.4 (stressed): prefer shorter, high-utility
  words. Avoid complex grammar in example sentences.
- If energy_score < 0.4 (tired): prefer recognition vocabulary
  over production vocabulary
- If place_category is 'office' + occupation is known:
  weight heavily toward occupation-specific workplace vocabulary
- Include tonal guides for ZH and VI target languages
- Example sentences must be set in THIS scene context,
  not generic textbook scenarios

Output format per item:
  target_word | romanization | native_translation |
  example_sentence_in_scene | domain_tag
```

**How sensory context changes output — concrete example:**

```
SAME USER, SAME LOCATION, DIFFERENT SENSORY STATE:
─────────────────────────────────────────────────

  State A: Silom office, 9am, stressed (0.2), energized (0.8)
  → Gemini generates: deadline, urgent, stakeholder, approve,
    submit, escalate, bottleneck, milestone, sign-off, brief

  State B: Silom office, 3pm, happy (0.8), tired (0.3)
  → Gemini generates: coffee break, colleague, catch up,
    wrap up, handover, out of office, thank you, well done,
    great job, finish

  Same place. Completely different vocabulary.
  The sensory context IS the curriculum.
```

### 6.5 Sensory Reinstatement During Review

When a word enters the SRS review queue, its encoding context is replayed to reinstate the memory conditions at learning time:

```
┌─────────────────────────────────────────────────────────────────┐
│                  SENSORY REINSTATEMENT                          │
│                                                                 │
│  During flashcard review, the card shows:                       │
│                                                                 │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │                                                          │   │
│  │  📍 Silom BTS, Silom    🌡 28°C humid    🕘 9:02am       │   │
│  │                                                          │   │
│  │              ┌────────────────────┐                      │   │
│  │              │   S T A K E H O L D E R │                      │   │
│  │              │                    │                      │   │
│  │              │  [tap to reveal]   │                      │   │
│  │              └────────────────────┘                      │   │
│  │                                                          │   │
│  │  ████████░░  mood at encoding: stressed                  │   │
│  │  (amber background wash — matches encoding mood color)   │   │
│  │                                                          │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                 │
│  What is shown:                                                 │
│  • Location pin name (not raw geohash — human-readable)         │
│  • Weather icon + temperature from encoding snapshot            │
│  • Time-of-day icon                                             │
│  • Card background color shifted to encoding mood color_hex     │
│  • Ambient sound from encoding (if voice memo was attached)     │
│                                                                 │
│  What is NOT shown:                                             │
│  • Raw geohash                                                  │
│  • Mood/energy numeric scores (too clinical)                    │
│  • Full sensory JSON                                            │
└─────────────────────────────────────────────────────────────────┘
```

### 6.6 Sensory Tag Data Schema (Firestore)

```typescript
// Stored in: users/{uid}/words/{wordId}/senses_tags
interface SensesTag {
  // Visual channel
  visual_label:      string    // "café interior, warm lighting, laptop crowd"
  color_hex:         string    // "#D4956A" — dominant scene color for mood board

  // Location channel
  location_category: string    // 'café' | 'office' | 'hospital' | 'gym' | etc.
  neighborhood:      string    // "Silom" — human-readable, from Places API
  geohash:           string    // "w3gv2kp" — 7-char, ~150m precision

  // Atmosphere channel
  weather: {
    temp_c:     number         // 28.4
    conditions: string         // "hot_humid" | "cool_ac" | "rainy" | etc.
    humidity:   number         // 74 (percent)
  }

  // Subjective channels (user-controlled)
  mood:   number               // 0.0–1.0 (0=stressed, 1=happy)
  energy: number               // 0.0–1.0 (0=exhausted, 1=energized)

  // Ambient channel
  sound_type:   string         // 'quiet_café' | 'busy_street' | 'silent_office'
  time_of_day:  string         // 'morning' | 'afternoon' | 'evening' | 'night'

  // Derived labels (for display)
  mood_label:   string         // "a bit stressed" | "relaxed" | "focused"
  energy_label: string         // "tired" | "alert" | "energized"
}
```

---

## 7. SESSION & LEARNING PATHWAY

### 7.1 Session Architecture: Mixed-Node Design

**V2.0 change:** Sessions no longer pick exactly one node type. A single session mixes items from all four node types in randomized order. This change is driven by research on interleaved practice (Kornell & Bjork, 2008): mixing retrieval types within a session produces stronger long-term retention than blocked practice.

```
┌─────────────────────────────────────────────────────────────────┐
│                 MIXED SESSION ARCHITECTURE                      │
│                                                                 │
│  Session starts → SRS scores all due words via S(w)             │
│  Top N words selected (N = session capacity)                    │
│                                                                 │
│  Each word is assigned a node type by NodeRouter.ts:            │
│  ─────────────────────────────────────────────────────────────  │
│                                                                 │
│  Word 1  → FLASHCARD        (offline ✓)                         │
│  Word 2  → FILL-BLANK       (offline ✓)                         │
│  Word 3  → PRONUNCIATION    (network required)                  │
│  Word 4  → FLASHCARD        (offline ✓)                         │
│  Word 5  → CONVERSATION     (network required)                  │
│  Word 6  → FILL-BLANK       (offline ✓)                         │
│  Word 7  → FLASHCARD        (offline ✓)                         │
│  Word 8  → PRONUNCIATION    (network required)                  │
│          ↑                                                      │
│      Shuffled order — user never sees the same sequence twice   │
│                                                                 │
│  OFFLINE MODE: Conversation + Pronunciation items removed        │
│  from sequence. Remaining items shuffled. Session proceeds.     │
│                                                                 │
│  NodeRouter weights (NodeRouter.ts):                            │
│  ─────────────────────────────────────────────────────────────  │
│  Flashcard:      base_weight = 0.35                             │
│  Fill-blank:     base_weight = 0.30                             │
│  Conversation:   base_weight = 0.20                             │
│  Pronunciation:  base_weight = 0.15                             │
│                                                                 │
│  Each weight is adjusted per word by:                           │
│  • nodes with fewer recent attempts → weight increased          │
│  • user accuracy on this node type → weight decreased if poor   │
│  • network availability → Convo/Pronun weight = 0 if offline    │
└─────────────────────────────────────────────────────────────────┘
```

### 7.2 The Four Node Types

#### Flashcard Node

```
┌─────────────────────────────────────────────────────────────────┐
│  FLASHCARD NODE                                    OFFLINE ✓    │
│                                                                 │
│  Front:                                                         │
│  ┌──────────────────────────────────────────────┐               │
│  │  📍 Silom Office  🌡28°C  🕘 9am             │               │
│  │  ┌──────────────────────────────────────┐    │               │
│  │  │                                      │    │               │
│  │  │         S T A K E H O L D E R        │    │               │
│  │  │                                      │    │               │
│  │  │      [tap anywhere to flip]          │    │               │
│  │  └──────────────────────────────────────┘    │               │
│  │  (amber background = stressed encoding)      │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  Back (after flip):                                             │
│  ┌──────────────────────────────────────────────┐               │
│  │  ผู้มีส่วนได้เสีย / Phûu Mii Sùan Dâai Sǐa  │               │
│  │  "Every stakeholder needs a progress update."│               │
│  │  [▶ play audio]                              │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  How well did you know this?                                    │
│  ─────────────────────────────────────────────────────────────  │
│                                                                 │
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐  ┌─────────┐  │
│  │   ✗    │  │   ○    │  │   △    │  │   ✓    │  │   ⚡    │  │
│  │        │  │        │  │        │  │        │  │         │  │
│  │ Forgot │  │ Missed │  │  Hard  │  │  Good  │  │ Perfect │  │
│  │  q=0   │  │  q=2   │  │  q=3   │  │  q=4   │  │   q=5   │  │
│  └────────┘  └────────┘  └────────┘  └────────┘  └─────────┘  │
│  RED(sm)    ORANGE(sm)   YELLOW(md)   BLUE(lg)   DEEP BLUE(lg) │
│  ← smaller buttons          ·          larger buttons →        │
│  All buttons: min 44×44pt touch target (WCAG 2.1 §Appendix B)  │
│                                                                 │
│  Swipe left = Forgot (q=0)  ·  Swipe right = Perfect (q=5)     │
│                                                                 │
│  Sound feedback per response:                                   │
│  Forgot  → low thud    440 Hz  120ms                            │
│  Oops    → soft tone   520 Hz  100ms                            │
│  Hard    → neutral     660 Hz   80ms                            │
│  Good    → chime       880 Hz  100ms                            │
│  Perfect → bright     1047 Hz  150ms  + haptic vibration        │
│                                                                 │
│  Offline: Firestore cache + Encrypted Storage                   │
│  Audio: pre-downloaded TTS file from Cloud Storage              │
└─────────────────────────────────────────────────────────────────┘
```

#### Fill-in-the-Blank Node

```
┌─────────────────────────────────────────────────────────────────┐
│  FILL-BLANK NODE                                   OFFLINE ✓    │
│                                                                 │
│  Beginner (MCQ):                                                │
│  ┌──────────────────────────────────────────────┐               │
│  │  "Before the meeting, please update all      │               │
│  │   __________ on the project timeline."       │               │
│  │                                              │               │
│  │  A  stakeholders    B  deadlines             │               │
│  │  C  deliverables    D  milestones            │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  Intermediate/Advanced (open input):                            │
│  ┌──────────────────────────────────────────────┐               │
│  │  "Before the meeting, please update all      │               │
│  │   __________ on the project timeline."       │               │
│  │                                              │               │
│  │  [ Type your answer...                   ]   │               │
│  │  💡 Hint: starts with 's'                    │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  Sentences: Gemini-generated, set in user's actual scene context│
│  Offline: cached question bank, answers sync on reconnect       │
└─────────────────────────────────────────────────────────────────┘
```

#### AI Conversation Node (Koko Speaking)

```
┌─────────────────────────────────────────────────────────────────┐
│  CONVERSATION NODE (Koko)                     NETWORK REQUIRED  │
│                                                                 │
│  3-turn MVP flow (v1.0) / 5-turn in v1.1:                       │
│                                                                 │
│  Turn 1 — Koko speaks:                                          │
│  ┌──────────────────────────────────────────────┐               │
│  │  🤖 Koko (TTS audio + text):                 │               │
│  │  "You're about to present the Q3 numbers.    │               │
│  │   How would you open the meeting?"           │               │
│  │  [▶ tap to hear Koko]                        │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  Turn 2 — User responds:                                        │
│  ┌──────────────────────────────────────────────┐               │
│  │  🎤 [Hold to speak]                          │               │
│  │  Google Cloud STT (Chirp 3) captures speech  │               │
│  │  Levenshtein match checks for target words   │               │
│  │  ZH: tonal scoring separate (v1.1)           │               │
│  │  VI: 6-tone scoring (v1.1)                   │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  Turn 3 — Koko evaluates + replies:                             │
│  ┌──────────────────────────────────────────────┐               │
│  │  🤖 Gemini evaluates: did user use target    │               │
│  │  words? Correct tones? Natural grammar?      │               │
│  │  Koko replies with feedback + continues      │               │
│  │  conversation naturally                      │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  ZH inline correction: "you said mǎ 马 — try mā 妈"             │
│  word use detected: Levenshtein distance ≤ 2 = match            │
└─────────────────────────────────────────────────────────────────┘
```

#### Pronunciation Node

```
┌─────────────────────────────────────────────────────────────────┐
│  PRONUNCIATION NODE                           NETWORK REQUIRED  │
│                                                                 │
│  ┌──────────────────────────────────────────────┐               │
│  │  stakeholder                                 │               │
│  │  /ˈsteɪk.hoʊl.dər/                           │               │
│  │                                              │               │
│  │  [▶ hear native]        [🎤 Record]           │               │
│  │                                              │               │
│  │  ████████████░░░░░░░░░  Recording...         │               │
│  │                          (no countdown —     │               │
│  │                           anxiety avoidance) │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  After recording:                                               │
│  ┌──────────────────────────────────────────────┐               │
│  │  Visual waveform comparison:                 │               │
│  │  Native:  ▁▂▄▆█▆▄▂▁▂▄▆█▆▄▂▁▁▂▄▆            │               │
│  │  You:     ▁▂▄▅█▅▄▂▁▂▄▅█▅▃▂▁▁▂▃▅            │               │
│  │                                              │               │
│  │  Phoneme breakdown:                          │               │
│  │  ✓ /steɪk/  ✓ /hoʊl/  ~ /dər/ ← soften 'd' │               │
│  └──────────────────────────────────────────────┘               │
│                                                                 │
│  ZH tonal scoring (v1.1): tone-level separate from phoneme      │
│  VI 6-tone scoring (v1.1): mirrors ZH pipeline                  │
│  No countdown timer — reduces performance anxiety               │
└─────────────────────────────────────────────────────────────────┘
```

### 7.3 Quick Mode

```
┌─────────────────────────────────────────────────────────────────┐
│                        QUICK MODE                               │
│                                                                 │
│  Target: workers post-8pm, 3–5 min available                    │
│  Always visible on Home screen as a persistent CTA tile         │
│                                                                 │
│  Content: 5 words + 1 Koko conversation turn only               │
│  Node mix: Flashcard-weighted (offline-safe)                    │
│  Streak: NO penalty on exit                                     │
│  Hearts: normal rules apply                                     │
│  Offline: 5 cached flashcards available in airplane mode        │
│                                                                 │
│  Research basis: spaced micro-sessions produce stronger         │
│  retention than equivalent massed review (Kornell & Bjork,      │
│  2008). The 5-minute constraint is a feature, not a limitation. │
└─────────────────────────────────────────────────────────────────┘
```

### 7.4 Gamification Loop

```
┌─────────────────────────────────────────────────────────────────┐
│                   GAMIFICATION MECHANICS                        │
│                                                                 │
│  HEARTS (Energy System)                                         │
│  ─────────────────────────────────────────────────────────────  │
│  Start each day with 5 hearts  ❤️❤️❤️❤️❤️                       │
│  Wrong answer:  −1 heart                                        │
│  Correct answer: +1 heart (cap: 5)                              │
│  At 0 hearts → ungraded practice mode (no loss, just practice)  │
│  Refill: +1 per correct answer in practice mode                 │
│  Premium: unlimited top-up available                            │
│                                                                 │
│  STREAKS                                                        │
│  ─────────────────────────────────────────────────────────────  │
│  +1 streak for any session completed (including Quick Mode)     │
│  Streak freeze: spend 50 KotoCoins to protect for 1 day         │
│  Streak shown in Home header: 🔥 12                              │
│                                                                 │
│  KOTOCOINS                                                      │
│  ─────────────────────────────────────────────────────────────  │
│  Earned: daily missions, achievements, correct streaks          │
│  Spent:  streak freeze (50) · heart top-up (30) · boosts        │
│  Ledger: Firestore + Cloud Functions (server-authoritative)     │
│                                                                 │
│  XP + LEVELS                                                    │
│  ─────────────────────────────────────────────────────────────  │
│  XP earned per session, shown in Profile                        │
│  Levels gate achievement badges (non-functional gates)          │
│  Never gate core learning content behind XP level               │
└─────────────────────────────────────────────────────────────────┘
```

### 7.5 Missions System

Daily missions are the primary driver of habitual engagement. A mission is a short, achievable goal that expires at midnight local time. Users see up to 3 active missions on the Home screen. Completing a mission earns KotoCoins; the set refreshes daily.

```
┌─────────────────────────────────────────────────────────────────┐
│                      MISSIONS SYSTEM                            │
│                                                                 │
│  Type               Goal                 KotoCoins  Resets      │
│  ─────────────────────────────────────────────────────────────  │
│  Daily Snap         Complete 1 Snap       20        Midnight    │
│  Word Review        Review 10 words       15        Midnight    │
│  Quick Mode         Complete 1 QM         10        Midnight    │
│  Location Visit     Revisit a Map pin     25        Daily       │
│  Koko Chat          Complete 1 Convo node 20        Daily       │
│  7-Day Streak       7 consecutive days   100        Weekly      │
│  Pack Complete      Finish a vocab pack  200        One-time    │
│                                                (permanent badge)│
│                                                                 │
│  Daily rotation: 3 missions drawn from pool per user            │
│  Never repeat the same type twice in one 3-mission set          │
│  Server-authoritative: KotoCoin ledger updated by Cloud Fns     │
│  Client: optimistic update — reversed on server conflict        │
└─────────────────────────────────────────────────────────────────┘
```

**Mission generation logic (MissionEngine.ts):**

At midnight local time, Cloud Scheduler triggers `generate-daily-missions` for each active user. The weighted draw follows these adjustment rules:

- If user has ≥10 pending SRS reviews: `word_review` weight ×2
- If user skipped yesterday: `quick_mode` always included (re-engagement hook)
- If user has an uncompleted Pack in progress: `pack_complete` weight ×1.5
- Pack Complete mission is excluded once the pack is fully mastered

```typescript
interface Mission {
  id:            string
  user_id:       string
  type:          MissionType
  target_count:  number
  current_count: number
  reward_coins:  number
  expires_at:    Timestamp        // midnight local time
  completed:     boolean
  completed_at:  Timestamp | null
}

type MissionType =
  | 'daily_snap'
  | 'word_review'
  | 'quick_mode'
  | 'location_visit'
  | 'koko_chat'
  | 'streak_7day'
  | 'pack_complete'
```

**Mission progress tracking:** Every session event fires a `checkMissionProgress(userId, eventType)` call via Cloud Functions. Progress increments are idempotent — duplicate events within the same second are deduplicated by event_id. KotoCoins are credited only once per mission per day, enforced by Firestore transaction.

**Home screen mission tile:** Shows the 3 active missions with a progress bar, coin reward, and expiry time. Tapping a mission deep-links to the relevant screen (Snap screen for `daily_snap`, Review for `word_review`, etc.). Completed missions show a checkmark and grey out — they remain visible until midnight to reinforce the dopamine loop.

---

## 8. KOKO SRS ALGORITHM

### 8.1 Mathematical Foundation (Operational Summary)

Every scheduling decision is a discrete approximation of `δ𝒮_KOTOKA = 0`. The full theoretical derivation is in Section 11. This section covers the operational engine.

### 8.2 Composite Priority Score

```
S(w) = α₁·R(w) + α₂·U(w) + α₃·C(w) + α₄·D(w) + α₅·G(w) + α₆·V(w)

α₁ = 0.35  →  R(w): Retention/recency — how close to forgetting?
α₂ = 0.25  →  U(w): Urgency — days overdue × decay risk
α₃ = 0.15  →  C(w): Consistency — how regular is the review streak?
α₄ = 0.12  →  D(w): Difficulty/depth — needs more exposure types?
α₅ = 0.08  →  G(w): Gap fill — in the Galois vocabulary gap?
α₆ = 0.05  →  V(w): Dormant velocity — was recently fast-learned?

Implemented in: SRSEngine.ts
```

### 8.3 Session Construction Pipeline

```
┌─────────────────────────────────────────────────────────────────┐
│                SESSION CONSTRUCTION FLOW                        │
│                                                                 │
│  1. CAPACITY CALCULATION                                        │
│     N(u) = ⌊(L_actual / τ_avg) × safety_factor⌋                 │
│     L_actual = observed session length (minutes)                │
│     τ_avg    = avg time per item this user (calibrated)         │
│     safety_factor = 0.85 (cognitive load buffer)                │
│                                                                 │
│  2. CONTENT MIX RATIO                                           │
│     r_review(A) = clamp(0.60 + 0.40×(0.80−A), 0.45, 0.80)      │
│     A = exponential moving avg of session accuracy              │
│     High accuracy → more new words                              │
│     Low accuracy  → more reviews                                │
│                                                                 │
│  3. WORD SELECTION                                              │
│     Due words scored by S(w)                                    │
│     Submodular greedy: maximize S(w) under constraint N(u)      │
│     Scene clustering: co-learned words batched together         │
│     (respects T^σ scene entanglement term in the action)        │
│                                                                 │
│  4. NODE ASSIGNMENT (NodeRouter.ts)                             │
│     Each selected word assigned a node type                     │
│     Weights: 0.35/0.30/0.20/0.15 adjusted per word history      │
│     Offline: Conversation + Pronunciation weight → 0            │
│                                                                 │
│  5. SEQUENCE SHUFFLE                                            │
│     Fisher-Yates shuffle on the assembled item list             │
│     No two consecutive items of the same node type (preference) │
└─────────────────────────────────────────────────────────────────┘
```

### 8.4 Optimal Notification Timing

```
Thompson Sampling across 3 candidate times:
  Arm 1: morning (07:00–09:00)
  Arm 2: midday  (12:00–13:00)
  Arm 3: evening (19:00–21:00)

Calibration period: 7 days
Reward signal: session completion within 30 min of notification
After calibration: arm with highest expected reward gets ≥70% of sends
```

### 8.5 Location-Triggered Review

```
┌─────────────────────────────────────────────────────────────────┐
│               LOCATION-TRIGGERED REVIEW FLOW                   │
│                                                                 │
│  WorkManager: 3 background checks/day                           │
│  Times: 8:00am · 12:00pm · 6:00pm                               │
│  (NOT always-on geofencing — battery optimized)                 │
│                                                                 │
│  On each check:                                                 │
│  Current geohash (5-char prefix, ~5km) vs all user pins         │
│  Match within 100m radius? → FCM push queued                    │
│                                                                 │
│  FCM message: "You're near [pin name] — 30-second review?"      │
│                                                                 │
│  On tap: session opens with sensory reinstatement mode          │
│  Only shows words encoded at that pin (or within 100m pins)     │
│  Quick Mode rules apply (no streak penalty)                     │
│                                                                 │
│  Graceful degradation:                                          │
│  GPS denied → weather + scene tags only                         │
│  Word flagged for geo-enrichment when GPS re-enabled            │
└─────────────────────────────────────────────────────────────────┘
```

### 8.6 SM-2 Update Rules

After each review item, the SM-2 algorithm updates `ease_factor` and `interval`. These updates are the engineering implementation of the continuity equation `∂ₜρ + ∇·(ρv) = 0` from Section 11.3 — knowledge density is conserved during transport.

**Quality score mapping (UI → SM-2 q):**

```
┌─────────────────────────────────────────────────────────────────┐
│                  QUALITY SCORE MAPPING                          │
│                                                                 │
│  q = 5  Correct, instant recall                                 │
│  q = 4  Correct, slight hesitation                              │
│  q = 3  Correct, with difficulty                                │
│  q = 2  Incorrect; answer remembered on reveal                  │
│  q = 1  Incorrect; answer seems familiar on reveal              │
│  q = 0  Incorrect; complete blackout                            │
│                                                                 │
│  Kotoka UI → q mapping:                                         │
│  ─────────────────────────────────────────────────────────────  │
│  Flashcard [Forgot]  button / swipe left   → q = 0              │
│  Flashcard [Oops]    button                → q = 2              │
│  Flashcard [Hard]    button                → q = 3              │
│  Flashcard [Good]    button                → q = 4              │
│  Flashcard [Perfect] button / swipe right  → q = 5              │
│  Fill-blank correct, no hint   → q = 5                          │
│  Fill-blank correct, with hint → q = 3                          │
│  Fill-blank incorrect          → q = 1                          │
│  Koko: target word used + correct tone → q = 5                  │
│  Koko: target word used + wrong tone   → q = 3                  │
│  Koko: target word not used            → q = 1                  │
└─────────────────────────────────────────────────────────────────┘
```

**Interval and ease_factor update formulas:**

```
If q < 3:
  interval     = 1 day (relearn — word re-enters new-word queue)
  ease_factor  = max(1.3, ease_factor − 0.20)

If q ≥ 3:
  new_interval    = round(old_interval × ease_factor)
  new_interval    = max(1, new_interval)
  new_ease_factor = old_ef + (0.1 − (5−q) × (0.08 + (5−q) × 0.02))
  new_ease_factor = clamp(new_ease_factor, 1.3, 2.5)

Example interval progression (ease_factor = 2.5, always q=5):
  After 1st review  → 1 day
  After 2nd review  → 3 days
  After 3rd review  → 8 days
  After 4th review  → 20 days
  After 5th review  → 50 days
  After 6th review  → 125 days
```

**Kotoka extension — sensory reinstatement bonus:**

```
If review was triggered by location proximity (sensory reinstatement mode):
  effective_q = min(5, q + 1)

Rationale: the location cue reduces retrieval effort. The same correct
recall under sensory reinstatement represents stronger underlying
encoding than the same recall without the cue. This maps to the
T^σ scene entanglement term in the KOTOKA Lagrangian — co-encoded
words benefit from the scene's retrieval coupling strength.

Implementation: SRSEngine.ts receives isSensoryReinstatement: boolean
from the session context. The bonus is applied before the SM-2
formulas above, not after.
```

**New word bootstrapping:**

```
First presentation of any word (interval = 0):
  Step 1: show flashcard (no score recorded)
  Step 2: show again within same session
  Step 3: user responds → first SM-2 update applied
  Initial ease_factor = 2.5 for all new words
  Initial interval    = 1 day after first correct response
```

These rules are implemented in `SRSEngine.ts::updateWordAfterReview()` and are unit-tested in `__tests__/SRSEngine.test.ts` (see Appendix G).

---

## 9. LANGUAGE SUPPORT (6 LANGUAGES, ANY DIRECTION)

### 9.1 Supported Language Set

Kotoka v1 supports exactly 6 languages. Any language can be source or target — there is no Thai-as-source restriction. The device system language determines the default pair at onboarding; the user can change both directions freely.

```
┌─────────────────────────────────────────────────────────────────┐
│               SUPPORTED LANGUAGE MATRIX                         │
│                                                                 │
│  Code  Language              Script         Tones  STT quality  │
│  ────────────────────────────────────────────────────────────── │
│  EN    English               Latin          None   Excellent    │
│  TH    Thai                  Thai           None*  Excellent    │
│  ZH    Mandarin Chinese      Chinese+Pinyin 4      Excellent†   │
│  ES    Spanish               Latin          None   Excellent    │
│  VI    Vietnamese            Latin+diacrit. 6      Good         │
│  LO    Lao                   Lao script     6      Limited‡     │
│                                                                 │
│  * Thai has no lexical tones affecting meaning in the same way  │
│  † Google Cloud STT Chirp 3 is tone-aware for Mandarin          │
│  ‡ Lao STT is experimental; Pronunciation node degraded to      │
│    text-only feedback for LO target until Google support matures│
└─────────────────────────────────────────────────────────────────┘
```

### 9.2 All 30 Language Pair Directions

```
┌─────────────────────────────────────────────────────────────────┐
│                  PAIR DIRECTION MATRIX                          │
│         (✓ = supported, ~ = limited, v1.1 = post-MVP)           │
│                                                                 │
│         TARGET →    EN    TH    ZH    ES    VI    LO            │
│  SOURCE ↓                                                       │
│  EN               ——     ✓     ✓     ✓     ✓     v1.1           │
│  TH               ✓     ——     ✓     v1.1  v1.1  v1.1           │
│  ZH               ✓     v1.1  ——     v1.1  v1.1  v1.1           │
│  ES               ✓     v1.1  v1.1  ——     v1.1  v1.1           │
│  VI               ✓     v1.1  v1.1  v1.1  ——     v1.1           │
│  LO               v1.1  v1.1  v1.1  v1.1  v1.1  ——             │
│                                                                 │
│  v1.0 default pairs (fully tested, 48h build scope):           │
│    TH→EN · TH→ZH · EN→TH · EN→ZH · ZH→EN · ZH→TH             │
│    ES→EN · EN→ES                                               │
│                                                                 │
│  System language default mapping:                              │
│    Device lang TH → default pair: TH→EN                        │
│    Device lang EN → default pair: EN→ZH                        │
│    Device lang ZH → default pair: ZH→EN                        │
│    Device lang ES → default pair: ES→EN                        │
│    Device lang VI → default pair: VI→EN                        │
│    Device lang LO → default pair: LO→TH                        │
│    Other         → default pair: EN→ZH                         │
└─────────────────────────────────────────────────────────────────┘
```

### 9.3 Per-Language Technical Requirements

```
┌─────────────────────────────────────────────────────────────────┐
│             PER-LANGUAGE TECHNICAL REQUIREMENTS                 │
│                                                                 │
│  ENGLISH (EN)                                                   │
│  Font: IBM Plex Sans                                            │
│  Romanization: none needed                                      │
│  Tonal scoring: N/A                                             │
│  Special: none                                                  │
│                                                                 │
│  THAI (TH)                                                      │
│  Font: Sarabun                                                  │
│  Romanization: RTGS system (optional display)                   │
│  Tonal scoring: N/A (Thai tones don't map to STT scoring)       │
│  Special: Thai word segmentation (no spaces between words)      │
│           → use ICU word break iterator for display             │
│                                                                 │
│  MANDARIN CHINESE (ZH)                                          │
│  Font: Noto Sans SC                                             │
│  Romanization: Pinyin (always shown for learners)               │
│  Tonal scoring: Chirp 3 tone-aware · 4-tone model (v1.1)        │
│  Special: Simplified Chinese only (v1.0)                        │
│           Progressive display: Pinyin → Hanzi as proficiency↑   │
│           Inline tonal correction in Conversation node           │
│                                                                 │
│  SPANISH (ES)                                                   │
│  Font: IBM Plex Sans (full diacritic support: á é í ó ú ñ ü)   │
│  Romanization: none needed                                      │
│  Tonal scoring: N/A                                             │
│  Special: Latin American vs Castilian toggle (onboarding)       │
│                                                                 │
│  VIETNAMESE (VI)                                                │
│  Font: IBM Plex Sans (full Vietnamese diacritic set)            │
│  Romanization: none (VI uses Latin script natively)             │
│  Tonal scoring: 6-tone model via Chirp 3 (v1.1)                 │
│  Special: 5 diacritic combining marks (à á â ã ạ etc.)          │
│           IBM Plex Sans verified complete for Unicode VI block  │
│                                                                 │
│  LAO (LO)                                                       │
│  Font: Noto Sans Lao                                            │
│  Romanization: transliteration display for learners             │
│  Tonal scoring: STT experimental — Pronunciation node           │
│                 falls back to text-only phoneme feedback         │
│  Special: Limited Google STT support → Pronunciation node       │
│           displays waveform reference + written correction only  │
│           Voice conversation (Koko) available TTS-only for LO   │
└─────────────────────────────────────────────────────────────────┘
```

### 9.4 Vocab Pack Localization

All 5 domain packs are generated per language pair via Gemini. Each pack has 200 items localized to the pair.

```
Pack Name     Domain          Primary pairs (v1.0)      Items
───────────────────────────────────────────────────────────────────
Office Pack   Business/work   TH↔EN · TH↔ZH · EN↔ZH    200/pair
Logistics     Shipping/whse   TH↔EN · TH↔ZH             200/pair
Café Pack     Food/beverage   All pairs                  200/pair
Airport       Travel/transit  All pairs                  200/pair
Retail        Shopping/svc    All pairs                  200/pair
```

### 9.5 Language Version Roadmap

```
v1.0 (48h build)
  Full: EN · TH · ZH
  Partial: ES (no tonal scoring needed — clean addition)
  Degraded: VI · LO (Pronunciation node text-only)

v1.1 (+1–2 weeks post-MVP)
  Full: + VI (6-tone STT scoring mirrors ZH pipeline)
  Full: + KO (removed from scope — not in user's 6-lang list)
  Remaining LO: still experimental STT

v1.2 (+2–4 weeks)
  All remaining pair combinations added
  LO: full voice when Google STT matures
```

---

## 10. BLUE THEME COLOR PALETTE

### 10.1 Design Direction

Kotoka uses a **deep blue brand palette** — professional, trustworthy, calm. Chosen for working-adult users who need focus and clarity, not playful neon. Blue communicates reliability and intelligence, aligning with the product's science-backed positioning.

### 10.2 Primary Blue Scale

```
┌─────────────────────────────────────────────────────────────────┐
│                    PRIMARY BLUE SCALE                           │
│                                                                 │
│  Name              Hex       Swatch   Usage                     │
│  ─────────────────────────────────────────────────────────────  │
│  Primary Blue      #1565C0   ████     Buttons, active nav,      │
│                                       headers, progress bars    │
│                                                                 │
│  Primary Blue Lt   #42A5F5   ████     Hover states, secondary   │
│                                       buttons, highlights       │
│                                                                 │
│  Primary Blue Dk   #0D47A1   ████     Pressed states, deep      │
│                                       accents, gradient end     │
│                                                                 │
│  Sky Blue          #E3F2FD   ████     Card backgrounds, chip     │
│                                       fills, info banners       │
│                                                                 │
│  Splash Gradient:  #1565C0  ───▶  #0D47A1  (top to bottom)      │
└─────────────────────────────────────────────────────────────────┘
```

### 10.3 Full Palette

| Role | Hex | Usage |
|---|---|---|
| Primary Blue | `#1565C0` | Buttons, active nav, headers, progress bars |
| Primary Blue Light | `#42A5F5` | Hover, secondary buttons |
| Primary Blue Dark | `#0D47A1` | Pressed states, gradient end |
| Sky Blue | `#E3F2FD` | Card BG, chips, info banners |
| Background | `#F5F7FA` | Page background |
| Card Surface | `#FFFFFF` | Cards, modals, inputs |
| Text Primary | `#1A1A2E` | Headings, body |
| Text Secondary | `#6B7280` | Subtitles, labels |
| Text Muted | `#9CA3AF` | Placeholders, disabled |
| Accent Orange | `#FF6B35` | Streaks, fire icon, urgent |
| Accent Yellow | `#FFD93D` | XP, stars, rewards |
| Accent Green | `#4CAF50` | Correct answers, success |
| Accent Red | `#EF4444` | Wrong answers, errors |
| Accent Purple | `#7C3AED` | Premium badges, shop |
| Divider | `#E5E7EB` | Borders, separators |
| Nav Active | `#1565C0` | Active tab icon + label |
| Nav Inactive | `#9CA3AF` | Inactive tab |
| Overlay Dark | `rgba(0,0,0,0.5)` | Modal backdrops |
| Success BG | `#E8F5E9` | Correct answer card |
| Error BG | `#FFEBEE` | Wrong answer card |

### 10.4 Accessibility Ratios

```
┌─────────────────────────────────────────────────────────────────┐
│                   WCAG AA COMPLIANCE                            │
│                                                                 │
│  Pair                          Ratio   WCAG grade              │
│  ─────────────────────────────────────────────────────────────  │
│  #1A1A2E  on  #F5F7FA          12.6:1  AAA ✓  (body text)      │
│  #1565C0  on  #FFFFFF           6.1:1  AA  ✓  (primary button) │
│  #FFFFFF  on  #1565C0           6.1:1  AA  ✓  (button label)   │
│  #42A5F5  on  #0D47A1           4.5:1  AA  ✓  (highlight text) │
│  #6B7280  on  #FFFFFF           4.6:1  AA  ✓  (secondary text) │
│  #1565C0  on  #E3F2FD           5.2:1  AA  ✓  (chip label)     │
│                                                                 │
│  Touch target minimum: 44×44pt on all interactive elements     │
│  Focus ring: 2px #1565C0 offset 2px (keyboard navigation)      │
└─────────────────────────────────────────────────────────────────┘
```

### 10.5 Component Specification

```
┌─────────────────────────────────────────────────────────────────┐
│                   COMPONENT SPEC                                │
│                                                                 │
│  Component              Value                                   │
│  ─────────────────────────────────────────────────────────────  │
│  Header height          56px                                    │
│  Bottom nav height      60px                                    │
│  Card border-radius     12px                                    │
│  Button border-radius   8px                                     │
│  Input border-radius    8px                                     │
│  Chip border-radius     16px (pill)                             │
│  Card shadow            0 2px 8px rgba(0,0,0,0.08)             │
│  Button shadow          0 2px 4px rgba(21,101,192,0.24)         │
│  Progress bar height    6px, rounded ends                       │
│  Input border           1px solid #E5E7EB                       │
│  Input focus border     2px solid #1565C0                       │
│  Page padding (H)       16px                                    │
│  Section spacing        16px                                    │
│  Card inner padding     16px                                    │
└─────────────────────────────────────────────────────────────────┘
```

### 10.6 Navigation Structure

```
┌────────────────────────────────────────────────────────────────┐
│                     BOTTOM TAB BAR                             │
│                                                                │
│  +──────────+──────────+──────────+──────────+──────────+      │
│  │  🏠      │  📷      │  🔄      │  🛒      │  👤      │      │
│  │  Home    │  Snap    │  Review  │  Shop    │  Profile │      │
│  +──────────+──────────+──────────+──────────+──────────+      │
│  Active: #1565C0 (icon + label)                                │
│  Inactive: #9CA3AF                                             │
│  Background: #FFFFFF                                           │
│  Border-top: 1px solid #E5E7EB                                 │
│  Height: 60px + safe area inset                                │
└────────────────────────────────────────────────────────────────┘
```

---

## 11. MATHEMATICAL FOUNDATION (δS_KOTOKA = 0)

### 11.1 The Principle

Every scheduling, scoring, and session construction decision in Kotoka is a corollary of a single variational principle:

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║                   δ  𝒮_KOTOKA   =   0                        ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

The same mathematical structure governs classical mechanics (Newton's laws), optics, and general relativity. Applied to learning: the optimal sequence of review sessions is the trajectory that makes the KOTOKA action functional stationary.

### 11.2 State Space

Three fields fully describe a learner's state at any time `t`:

```
┌─────────────────────────────────────────────────────────────────┐
│                     STATE SPACE                                 │
│                                                                 │
│  ρ(w, t)  ∈ ℝ≥0    Knowledge density at word w, time t         │
│                     0 = no knowledge; larger = more mastered    │
│                                                                 │
│  v(w, t)            Velocity of knowledge flow at w             │
│                     Positive = knowledge being built up         │
│                     Negative = decay                            │
│                                                                 │
│  φ(w, t)  ∈ ℝ       Lagrange multiplier / value function        │
│                     Derived quantity: the optimal scheduler's   │
│                     cost-to-go. From δS/δv=0: v = ∇φ           │
│                     (optimal curriculum = gradient flow on φ)   │
└─────────────────────────────────────────────────────────────────┘
```

### 11.3 The Full Lagrangian

```
ℒ_KOTOKA(ρ, v, φ; t)

   =  ½⟨ρ, ‖v‖²⟩                     ← kinetic: effort cost of
                                          moving knowledge

   −  𝓕[ρ]                            ← free energy: forgetting
                                          pressure toward equilibrium
                                          𝓕[ρ] = D_KL(ρ ‖ ρ_eq)
                                                − ⟨log p(obs|ρ)⟩

   +  ⟨φ, ∂ₜρ + ∇·(ρv)⟩              ← continuity: knowledge is
                                          conserved during transport

   −  𝓘_KOTOKA[ρ]                     ← KOTOKA-specific interactions
```

### 11.4 The Four KOTOKA Interactions

```
┌─────────────────────────────────────────────────────────────────┐
│              𝓘_KOTOKA[ρ] — FOUR TERMS                           │
│                                                                 │
│  Term 1: SCENE ENTANGLEMENT (ESCT)                              │
│  ─────────────────────────────────────────────────────────────  │
│  + λ₁⟨T^σ ρ, ρ⟩                                                 │
│                                                                 │
│  T^σ = symmetric PSD coupling tensor for scene σ               │
│  T^σ_ij = retrieval coupling strength between words i and j     │
│           in the same Snap scene                                │
│                                                                 │
│  Why: words co-learned from one Snap photo are episodically     │
│  bound. Reviewing one partially revives the others. Standard    │
│  SRS treats words independently — actively wrong for Kotoka.    │
│                                                                 │
│  Engineering: co-learned words clustered in sessions.           │
│                                                                 │
│  Term 2: LIFE-EPISODE GRAPH CURVATURE (LEG)                     │
│  ─────────────────────────────────────────────────────────────  │
│  + λ₂⟨exp(−κ^LEG), ρ⟩                                           │
│                                                                 │
│  κ^LEG = Ollivier-Ricci curvature of scene in the life graph    │
│  High curvature (well-embedded scene) → natural reinforcement   │
│  Low curvature (isolated scene: hospital visit, solo trip)      │
│    → exp(-κ^LEG) large → higher scheduling priority              │
│                                                                 │
│  Why: vocabulary from isolated contexts gets no passive         │
│  reinforcement from daily life. The system must compensate.     │
│                                                                 │
│  Engineering: location-isolated words get urgency weight boost. │
│                                                                 │
│  Term 3: GALOIS CLOSURE DRIVE                                   │
│  ─────────────────────────────────────────────────────────────  │
│  + λ₃⟨ρ, 𝟙_{Gap(u,t)}⟩                                          │
│                                                                 │
│  Gap(u,t) = (κ∘ε)(K_u(t)) \ K_u(t)                             │
│  The vocabulary that the user's environment demands             │
│  but they do not yet have. Derived from a Galois connection     │
│  between the knowledge lattice 𝒦 and environment lattice ℰ.    │
│                                                                 │
│  Why: fills the specific gaps this user's life creates,         │
│  not generic "high frequency" words.                            │
│                                                                 │
│  Engineering: workplace vocab packs fill domain-specific gaps.  │
│                                                                 │
│  Term 4: TRANSFER COHOMOLOGY PENALTY                            │
│  ─────────────────────────────────────────────────────────────  │
│  − λ₄ dim H¹(ℱ[ρ])                                              │
│                                                                 │
│  H¹(ℱ) = first cohomology of the context sheaf ℱ                │
│  dim H¹ = number of independent transfer failures               │
│  (contexts where local mastery fails to glue globally)          │
│                                                                 │
│  Why: knowing "stakeholder" in a study session ≠ knowing        │
│  it in a real board meeting. Cohomology penalizes                │
│  context-local mastery, driving toward transferable mastery.    │
│  H⁰(ℱ) (global sections) = the correct measure of real mastery. │
│                                                                 │
│  Engineering: 4 different node types force cross-context        │
│  retrieval, directly reducing dim H¹.                           │
└─────────────────────────────────────────────────────────────────┘
```

### 11.5 Euler-Lagrange Consequences

From `δ𝒮_KOTOKA = 0`, three equations emerge:

```
δS/δφ = 0  →  ∂ₜρ + ∇·(ρv) = 0           (continuity equation)
              Knowledge is conserved during transport.
              Engineering: FSRS/SM-2 stability updates per review.

δS/δv = 0  →  v = ∇φ                      (Benamou-Brenier)
              Optimal curriculum = gradient flow on value function φ.
              Engineering: S(w) composite score ≈ first-order
              expansion of φ around current knowledge state.

δS/δρ = 0  →  ∂ₜφ + ½‖∇φ‖² − δ𝓕/δρ
              − 2λ₁T^σρ − λ₂exp(−κ^LEG)
              − λ₃𝟙_{Gap} + λ₄δ(dim H¹)/δρ = 0
                                             (HJB with KOTOKA terms)
              The value function φ obeys Hamilton-Jacobi-Bellman.
              Engineering: the 6-factor weights α₁…α₆ in S(w).
```

### 11.6 Engineering Mapping

```
┌─────────────────────────────────────────────────────────────────┐
│         THEORY → IMPLEMENTATION MAPPING                         │
│                                                                 │
│  Theory term              Implemented as                        │
│  ─────────────────────────────────────────────────────────────  │
│  δS/δρ = 0 (HJB)          S(w) in SRSEngine.ts                 │
│  Continuity equation       SM-2 ease_factor + interval updates  │
│  Scene entanglement T^σ    Co-learned words cluster in sessions │
│  Life-graph curvature κ    Isolated-location urgency boost      │
│  Galois gap 𝟙_{Gap}        Workplace vocab packs (domain fill)  │
│  Transfer H¹ penalty       4 node types = cross-context reps    │
│  Optimal notification      Thompson Sampling (7-day calibration)│
│  Session capacity N(u)     ⌊(L_actual / τ_avg) × 0.85⌋          │
│  Content mix r(A)          clamp(0.60+0.40×(0.80−A), 0.45, 0.80)│
│  Submodular greedy         Word selection in SessionBuilder.ts  │
└─────────────────────────────────────────────────────────────────┘
```

### 11.7 Conservation Laws (Noether's Theorem)

```
Symmetry                          →   Conserved quantity
────────────────────────────────────────────────────────────────
Time translation (stationary env) →   Learning-energy budget
Intra-scene permutation (aut T^σ) →   Scene-aggregate gain
Context gauge reparametrization   →   H⁰(ℱ) — transferable mastery
Galois closure fixed-point        →   Gap ≡ 0 — absorbing end-state
```

**H⁰(ℱ) is the coordinate-invariant definition of true mastery.** Any mastery metric that depends on which context was tested is not a real property of the learner. Only global sections of the context sheaf are real.

**Full derivation (10 levels, beginner → formal theory):**
`Main_resources/kotoka_signature.md`

---

## 12. QUICK REFERENCE

### 12.1 Key Engineering Numbers

| Metric | Value |
|---|---|
| Gemini RPM cap | 14 (exponential backoff on 429) |
| Fallback scene packs | 50 pre-cached (triggered if Gemini >4s) |
| Geohash precision | 7-char (~150m radius) |
| FCM check-in times | 8am · 12pm · 6pm (WorkManager) |
| Revisit trigger radius | 100m |
| Hearts start / cap | 5 / 5 |
| Free words per snap | 5 |
| Premium words per snap | 10 |
| Trial period | 7 days, no credit card |
| Google Cloud budget | $2,000 startup credit |
| Thompson Sampling calibration | 7 days |
| Session capacity formula | `N(u) = ⌊(L_actual / τ_avg) × 0.85⌋` |
| Content mix ratio | `r(A) = clamp(0.60+0.40×(0.80−A), 0.45, 0.80)` |
| SM-2 ease factor range | 1.3 – 2.5 |
| ID token expiry | 15 min access / 30 day refresh |
| Rate limit (general) | 100 req/min/user |
| Rate limit (auth) | 20 req/min |
| Image compress target | 800px / 80% quality |
| Weather API cache TTL | 30 minutes |
| Streak freeze cost | 50 KotoCoins |
| Heart top-up cost | 30 KotoCoins |

### 12.2 Freemium Pricing

| Plan | Price | Key features |
|---|---|---|
| Free | ฿0 | 5 words/snap · 3 map pins · 3 AI Convo sessions/day · 5 Pronunciation/day |
| Premium Intro | ฿99/mo (first 3 months) | 10 words/snap · unlimited pins · unlimited AI Convo · full analytics |
| Premium Standard | ฿149/mo (after intro) | Same as Intro |

### 12.3 Offline Capability

```
┌─────────────────────────────────────────────────────────────────┐
│                    OFFLINE MODE TABLE                           │
│                                                                 │
│  Mode              Offline?   Mechanism                         │
│  ─────────────────────────────────────────────────────────────  │
│  Flashcard         YES        Firestore cache + Encrypted Store │
│  Fill-in-Blank     YES        Cached questions, sync on connect  │
│  Quick Mode        PARTIAL    5 cached flashcards max           │
│  AI Conversation   NO         Requires Gemini + STT + TTS       │
│  Pronunciation     NO         Requires Google Cloud STT         │
│  Memory Map        PARTIAL    Last-synced pins; new snaps queue │
│  Vocab Packs       YES        Pre-downloaded at onboarding      │
│  Weather tags      STALE      30-min TTL, stale-while-revalidate│
│                                                                 │
│  Offline detection: NetInfo API                                 │
│  On reconnect: flush pending_snaps[], sync UserWord updates     │
│  Conflict resolution: last-write-wins per UserWord              │
│  ConsentRecord: server-authoritative (no client override)       │
└─────────────────────────────────────────────────────────────────┘
```

### 12.4 Retention Targets

| Metric | Target | Industry benchmark |
|---|---|---|
| D1 retention | ≥40% | 26% |
| D7 retention | ≥20% | 13% |
| D30 retention | ≥10% | <3% (education) |
| 48h location recall | ≥60% | — |
| Free → premium (day 7) | ≥5% | 2.6–5.1% SaaS |
| Quick Mode post-8pm | ≥60% of evening sessions | — |

### 12.5 Font Loading Reference

| Language | Font | Google Fonts ID | Weight variants |
|---|---|---|---|
| EN / ES / VI | IBM Plex Sans | `IBM+Plex+Sans` | 400, 600, 700 |
| TH | Sarabun | `Sarabun` | 400, 600, 700 |
| ZH | Noto Sans SC | `Noto+Sans+SC` | 400, 700 |
| LO | Noto Sans Lao | `Noto+Sans+Lao` | 400, 700 |

### 12.6 Cloud Run Environment Variables

```bash
# Server-side only — NEVER in client bundle
GEMINI_API_KEY=
FIREBASE_SERVICE_ACCOUNT_JSON=
GCS_BUCKET_NAME=kotoka-snaps
GOOGLE_MAPS_API_KEY=          # Server-side only
WEATHER_API_KEY=              # Server-side only

# Client (.env) — EXPO_PUBLIC_ prefix only
EXPO_PUBLIC_FIREBASE_API_KEY=
EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN=
EXPO_PUBLIC_FIREBASE_PROJECT_ID=
EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET=
EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=
EXPO_PUBLIC_FIREBASE_APP_ID=
EXPO_PUBLIC_GOOGLE_WEB_CLIENT_ID=    # Google Sign-In OAuth only
```

### 12.7 Source Document Index

| Document | Contains |
|---|---|
| `Main_resources/concept.md` | PRD v3.0 · 48h build plan · wireframes · freemium model |
| `Main_resources/kotoka_signature.md` | Full 10-level derivation of δS_KOTOKA=0 |
| `Main_resources/kotoka_system_architecture.md` | Complete system spec · SRS engine · data models · PDPA |

### 12.8 Key Source File Reference

Critical files a new developer will touch first. Paths relative to the Expo project root.

```
kotoka/
├── app/                         React Navigation screen tree
│   ├── (tabs)/
│   │   ├── index.tsx            Home screen (streak, missions, Quick Mode CTA)
│   │   ├── snap.tsx             Camera + text input + sensory tag UI
│   │   ├── review.tsx           Session orchestrator (mixed-node)
│   │   ├── shop.tsx             Premium upgrade + KotoCoin store
│   │   └── profile.tsx          Stats, Memory Map, privacy settings
│   └── onboarding/
│       └── index.tsx            7-step onboarding flow
│
├── src/
│   ├── engine/
│   │   ├── SRSEngine.ts         S(w) scorer + SM-2 update rules
│   │   ├── NodeRouter.ts        Node type assignment + weight logic
│   │   ├── SessionBuilder.ts    Session construction pipeline
│   │   └── MissionEngine.ts     Daily mission generation + progress
│   ├── api/
│   │   ├── client.ts            Circuit breaker + retry wrapper
│   │   ├── gemini.ts            /analyze-image + /koko-reply proxy
│   │   ├── stt.ts               Google Cloud STT Chirp 3 wrapper
│   │   └── tts.ts               Google Cloud TTS / Koko voice
│   ├── sensory/
│   │   ├── tagCollector.ts      Parallel: GPS + weather + Gemini scene
│   │   └── promptAssembler.ts   Sensory tag → Gemini system prompt
│   ├── store/
│   │   └── useAppStore.ts       Zustand global state
│   └── fonts.ts                 Font loader + getFontFamily() resolver
│
├── cloud-run/                   Node.js / Fastify API layer
│   ├── routes/
│   │   ├── analyzeImage.ts      POST /analyze-image
│   │   ├── kokoReply.ts         POST /koko-reply
│   │   ├── srsSchedule.ts       POST /srs-schedule
│   │   └── verifyReceipt.ts     POST /verify-receipt
│   └── middleware/
│       └── auth.ts              Firebase ID token verification
│
└── __tests__/
    ├── SRSEngine.test.ts        SM-2 unit tests (see Appendix G.3)
    ├── NodeRouter.test.ts       Node weight + offline degradation
    └── e2e/                     Detox P0 test suite (Appendix G.2)
```

---

*Color palette: blue (#1565C0 primary) overrides teal (#00897B) from concept.md. Blue is the active brand color.*
*Session design: mixed 4-node sessions override PRD §6.6 "exactly 1 node per session." Mixed sessions are the v2.0 design.*
*Language scope: TH · EN · ZH · ES · VI · LO — any source/target direction. Default pair from device system language.*

---

## APPENDIX A: PDPA COMPLIANCE & SECURITY

### A.1 PDPA Compliance Checklist

Thailand's Personal Data Protection Act (PDPA) governs all user data. Every item below must be verified before launch.

```
┌─────────────────────────────────────────────────────────────────┐
│                  PDPA COMPLIANCE CHECKLIST                      │
│                                                                 │
│  CONSENT & COLLECTION                                           │
│  [ ] Privacy Policy published in Thai and English               │
│  [ ] Consent screen fires before any Firebase write             │
│  [ ] ConsentRecord stores: version, timestamp, scope[], IP hash │
│  [ ] Granular opt-in: required vs optional clearly separated    │
│  [ ] Minor users (<20): parental consent gate at signup         │
│  [ ] Policy version bump triggers re-consent on next app open   │
│                                                                 │
│  USER RIGHTS                                                    │
│  [ ] Right to access: data export in Profile → Privacy          │
│  [ ] Right to erasure: delete account → full purge ≤30 days     │
│  [ ] Right to withdraw: no service degradation on opt-out       │
│  [ ] Right to portability: export in machine-readable format    │
│                                                                 │
│  DATA HANDLING                                                  │
│  [ ] Retention policy: inactive accounts purged after 2 years   │
│      with 30-day email warning before deletion                  │
│  [ ] Raw GPS coordinates: never stored, never transmitted       │
│  [ ] Photos: stored in GCS, encrypted at rest, user-deletable   │
│  [ ] Voice recordings: processed server-side, not persisted     │
│  [ ] PII in logs: excluded. User IDs only.                      │
│                                                                 │
│  THIRD-PARTY PROCESSORS                                         │
│  [ ] All listed in Privacy Policy:                              │
│      Google Maps · Gemini · STT · TTS · FCM · Weather · Auth    │
│  [ ] DPAs signed with each processor                            │
│  [ ] DPO contact published in-app and Privacy Policy            │
│                                                                 │
│  INCIDENT RESPONSE                                              │
│  [ ] Breach notification SLA: 72-hour PDPC notification         │
│  [ ] Internal escalation path documented                        │
│  [ ] Breach log template ready                                  │
└─────────────────────────────────────────────────────────────────┘
```

### A.2 Threat Model

```
┌─────────────────────────────────────────────────────────────────┐
│                       THREAT MODEL                              │
│                                                                 │
│  Threat                  Like  Impact  Mitigation               │
│  ─────────────────────────────────────────────────────────────  │
│  Account takeover        Med   High    MFA option;              │
│                                        refresh token rotation   │
│                                                                 │
│  Firestore data breach   Low   High    Encryption at rest;      │
│                                        least-privilege svc acct │
│                                                                 │
│  On-device data leak     Low   Med     Encrypted Storage;       │
│                                        no raw PII in AsyncStore │
│                                                                 │
│  Gemini prompt injection Low   Med     Server-side prompt wrap; │
│                                        output sanitisation       │
│                                                                 │
│  Camera stream intercept V.Low Med     On-device only;          │
│                                        zero transmission        │
│                                                                 │
│  Rate limit bypass       Low   Med     Server-enforced only;    │
│                                        client limits untrusted  │
│                                                                 │
│  Geolocation misuse      Low   High    Geohash only;            │
│                                        raw coords never stored  │
│                                                                 │
│  ML model poisoning      V.Low Low     Bundled model;           │
│                                        no remote model updates  │
│                                                                 │
│  Billing fraud           Low   High    Server-side receipt      │
│                                        validation via /verify-  │
│                                        receipt endpoint         │
└─────────────────────────────────────────────────────────────────┘
```

### A.3 Security Controls Summary

| Control | Implementation | Status |
|---|---|---|
| HTTPS everywhere | TLS 1.2+ enforced; HSTS header | Required |
| JWT expiry | 15min access / 30d refresh rotation | Required |
| Password storage | Firebase Auth (bcrypt) — no custom flow | Required |
| NoSQL injection | Firestore SDK parameterised — no raw query strings | Required |
| XSS | React Native — no DOM; web views sandboxed | Required |
| Secrets | GCP Secret Manager + Expo EAS Secrets | Required |
| Dependency audit | `npm audit` in Cloud Build CI; blocks on HIGH/CRITICAL | Required |
| Encryption at rest | Firestore + GCS managed keys; Encrypted Storage on device | Required |
| Pen testing | OWASP MASVS L1 checklist — pre-launch | Scheduled |

---

## APPENDIX B: ACCESSIBILITY BASELINE

Kotoka targets WCAG 2.1 AA throughout. All interactive elements must meet the following standards.

```
┌─────────────────────────────────────────────────────────────────┐
│                  ACCESSIBILITY STANDARDS                        │
│                                                                 │
│  Requirement            Standard           Implementation       │
│  ─────────────────────────────────────────────────────────────  │
│  Colour contrast body   WCAG 2.1 AA ≥4.5:1  #1A1A2E/#F5F7FA    │
│  Colour contrast large  WCAG 2.1 AA ≥3:1    All headings ✓      │
│  Colour contrast UI     WCAG 2.1 AA ≥3:1    #1565C0/#FFFFFF ✓  │
│  Touch target           44×44pt minimum     All buttons/chips   │
│  Focus indicator        Visible ring        2px #1565C0 ring    │
│  Screen reader iOS      VoiceOver           accessibilityLabel  │
│                                             + accessibilityRole  │
│  Screen reader Android  TalkBack            accessible={true}   │
│                                             + contentDescription │
│  Audio captions         Auto subtitles      Word cards + Koko   │
│  Motion reduction       prefers-reduced     Flip/bounce off      │
│  Font scaling           Up to 200%          No fixed-height     │
│                         without H-scroll    containers          │
│  Language support       TH + EN UI          i18n locale files   │
│  Error messages         Text+icon always    Never colour-only   │
│  Tonal feedback         Visual waveform     Pronunciation node  │
│  Haptics                System setting      expo-haptics skip   │
│                         respecting          if reducedMotion     │
└─────────────────────────────────────────────────────────────────┘
```

### B.1 Screen Reader Implementation

```typescript
// Flashcard — VoiceOver / TalkBack annotation
<TouchableOpacity
  accessible={true}
  accessibilityLabel={`Flashcard: ${word.text_target}. Double tap to flip.`}
  accessibilityRole="button"
  accessibilityHint="Reveals translation and example sentence"
>

// Progress bar
<View
  accessible={true}
  accessibilityLabel={`Progress: ${current} of ${total} cards`}
  accessibilityRole="progressbar"
  accessibilityValue={{ min: 0, max: total, now: current }}
>

// Correct/wrong feedback — never colour-only
<Text style={styles.feedbackText}>
  {isCorrect ? '✓ Correct' : '✗ Incorrect'}
</Text>
// Also plays SFX — not audio-only
```

---

## APPENDIX C: UNIT ECONOMICS & BUDGET

### C.1 Per-User Daily Cost ($2,000 Credit)

| Service | Calls/day | Cost/call | ฿/user/day |
|---|---|---|---|
| Gemini 2.5 Flash (vision) | 1 | $0.00015 | ฿0.005 |
| Gemini text (conversation × 3 turns) | 9 | $0.00003 | ฿0.010 |
| Cloud STT (~1 min) | 1 min | $0.024 | ฿0.86 |
| Cloud TTS (Koko voice, 3 min) | 3 min | $0.016 | ฿0.35 |
| Maps + Places | 5 loads | free tier | ~฿0 |
| Cloud Run + Firestore (amortised) | — | — | ฿0.36 |
| **Total** | | | **~฿1.58/user/day** |

**Monthly COGS per active user:** ฿1.58 × 30 ≈ ฿47

**Gross margins:**
- At ฿99/mo intro: margin ~53% (฿52/mo contribution)
- At ฿149/mo standard: margin ~68% (฿102/mo contribution)

**Credit exhaustion:** ฿72,000 ÷ ฿47 ≈ **~1,530 premium-intensity MAU** before paid tier

### C.2 Cost Optimisation Levers

```
┌─────────────────────────────────────────────────────────────────┐
│                  COST OPTIMISATION                              │
│                                                                 │
│  Lever                    Saving     Notes                      │
│  ─────────────────────────────────────────────────────────────  │
│  Gemini rate limiting      High       14 RPM cap prevents       │
│  (14 RPM queue)                       runaway costs             │
│                                                                 │
│  Pre-cached scene packs    Med        50 packs eliminate        │
│  (50 packs offline)                   Gemini calls on latency   │
│                                       fallback                  │
│                                                                 │
│  Weather API 30-min cache  Low        Reduces API calls 30×     │
│                                       for active users          │
│                                                                 │
│  Offline Flashcard/Fill    Med        No STT/TTS cost for       │
│  served from local cache              offline-capable nodes     │
│                                                                 │
│  Freemium gate (5 words    High       Limits Gemini calls for   │
│  free vs 10 premium)                  non-paying users          │
│                                                                 │
│  Geohash proximity query   Low        Avoids Maps API calls     │
│  (local computation)                  for pin-proximity checks  │
└─────────────────────────────────────────────────────────────────┘
```

---

## APPENDIX D: 48-HOUR DEVELOPMENT PLAN (4 PHASES)

Four feature-focused phases, each 12 hours. Every phase lists which master prompt
sections it implements. Phases are sequenced so each builds on the previous.

```
TIME  0h──────────12h──────────24h──────────36h──────────48h
      │  PHASE 1  │  PHASE 2  │  PHASE 3  │  PHASE 4  │
      │ UI/UX +   │ Snap +    │ Session + │ Streak +  │
      │ Sound     │ Tag+Map   │ NearByWrd │ Mission   │
```

---

### D.1 PHASE 1 — UI/UX WITH SOUND (Hours 0–12)

**Master Prompt Sections:**
§3 Brand Identity & Typography · §3.6 Multilingual Typography ·
§7.2 Flashcard Node (5-button fix) · §8.6 SM-2 Quality Mapping ·
§6.5 Sensory Reinstatement (ambient audio replay)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 1 DELIVERABLES                          Hours 0–12       │
│                                                                 │
│  H0–2   Project scaffold                                        │
│         create-expo-app + Firebase + GCP services enabled       │
│         NativeWind · React Navigation · Zustand                 │
│                                                                 │
│  H2–5   FlashcardNode.tsx — 5-button response bar              │
│         ButtonResponseBar: onRate(q: 0|2|3|4|5)                 │
│         Swipe gesture shortcuts (L=Forgot / R=Perfect)          │
│         Card flip animation 300ms rotateY (§7.2)                │
│                                                                 │
│  H5–7   SoundEngine.ts — audio feedback per response           │
│         expo-av 5 tones: 440/520/660/880/1047 Hz (§7.2)         │
│         Haptics.impactAsync MEDIUM on Perfect                   │
│         TTS audio auto-play on card flip (§6.5)                 │
│                                                                 │
│  H7–9   SensoryAudioReplay.tsx                                  │
│         On review open: check sound_type from SensesTag (§6.5)  │
│         Play ambient preset: quiet_office/busy_café/outdoor     │
│         Mood color_hex as card background tint (§6.5)           │
│                                                                 │
│  H9–12  Typography + colour audit (§3.6 + §10)                  │
│         getFontFamily() for TH/ZH/LO/EN on all card text        │
│         Encoding context bar: 📍 🌡 🕘 icons row               │
│         WCAG AA contrast verified for all 5 response buttons    │
│                                                                 │
│  ACCEPTANCE CRITERIA:                                           │
│  ☐ 5 buttons fire correct q=0/2/3/4/5 to SRSEngine.ts          │
│  ☐ Swipe L → q=0 · Swipe R → q=5                               │
│  ☐ Each button plays its assigned Hz tone                       │
│  ☐ Perfect fires haptic vibration                               │
│  ☐ Card flip ≤300ms                                             │
│  ☐ TTS audio plays automatically on flip                        │
│  ☐ Ambient sound plays on location-triggered review             │
│  ☐ Font resolves per active language (§3.6)                     │
└─────────────────────────────────────────────────────────────────┘
```

**5-Button → SM-2 Quality Map (§8.6):**

```
Button    Label    q   Heart   Interval effect
────────────────────────────────────────────────────────────────
✗ Red     Forgot   0   −1      reset to 1d, EF − 0.20  relearn
○ Orange  Missed   2   −1      reset to 1d, EF − 0.20  relearn
△ Yellow  Hard     3   none    new_i = i×EF, EF − 0.14 slow grow
✓ Blue    Good     4   +1*     new_i = i×EF, EF unchanged
⚡ Deep   Perfect  5   +1*     new_i = i×EF, EF + 0.10 fast grow

* cap at 5 hearts · isSensory=true → effective_q = min(5, q+1) before update
```

---

### D.2 PHASE 2 — SNAP & LEARN · TAG YOUR SENSES · MEM MAP (Hours 12–24)

**Master Prompt Sections:**
§5.1 Onboarding / First Snap · §5.2 Three Input Modes ·
§5.4 Memory Map · §6.1–6.4 Sensory Tag Engine + Gemini Prompt Assembly ·
§6.6 SensesTag Firestore schema · §4.3 Security (geohash only)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 2 DELIVERABLES                         Hours 12–24       │
│                                                                 │
│  H12–15  SnapScreen.tsx (§5.2 Mode 1)                           │
│          expo-camera → compress 800px/80% → GCS upload          │
│          POST /analyze-image → Gemini → 10 words returned       │
│          WordSelectionGrid: user picks 5 of 10                  │
│                                                                 │
│  H15–18  SensoryTagPanel.tsx (§6.1–6.3)                         │
│          Auto-fill: GPS→Places API, Weather API 30-min cache    │
│          Mood slider: stressed←●→happy (0.0–1.0)                │
│          Energy slider: tired←●→energized (0.0–1.0)             │
│          Gemini visual_label + color_hex (§6.6)                 │
│          Confirm → SensesTag JSON → Firestore (§6.6 schema)     │
│                                                                 │
│  H18–20  GeohashEncoder.ts (§4.3 + §5.4)                        │
│          encode(lat,lng) → 7-char string (~150m)                │
│          distance(h1,h2) → meters (100m revisit check)          │
│          NEVER store raw lat/lng — geohash ONLY                 │
│                                                                 │
│  H20–22  MemoryMapScreen.tsx (§5.4)                             │
│          Google Maps SDK custom pin markers                     │
│          🟢≥0.85 / 🟡0.50–0.84 / 🔴<0.50 (S(w) retention)      │
│          Tap pin → word list for that location                  │
│          Free tier: 3 pins — Firestore security rule enforced   │
│                                                                 │
│  H20–22  TextInputScreen.tsx (§5.2 Mode 2)                       │
│          User types/pastes text (email, menu, article)          │
│          POST /generate-sentence → Gemini extracts key vocab    │
│          LLM augments: context, example, related, cultural note │
│          Same downstream flow as Photo (SensesTag + Firestore)  │
│          Meeting Prep (§5.3): topic → 15 vocab + Koko role-play │
│                                                                 │
│  H22–24  POST /sensory-prompt + /generate-sentence (Cloud Run)  │
│          /sensory-prompt: SensesTag + learner profile (§6.4)    │
│          Assemble Gemini system prompt template (§6.4)          │
│          /generate-sentence: topic + proficiency → vocab + sents│
│          Latency target: < 4s both endpoints (§5.3)             │
│                                                                 │
│  ACCEPTANCE CRITERIA:                                           │
│  ☐ Photo → 10 words returned < 4s (§5.3 latency target)        │
│  ☐ Text input → vocab extracted + SensesTag stored              │
│  ☐ /generate-sentence returns 15 vocab + 5 sentences < 4s      │
│  ☐ Selected words stored as UserWord docs in Firestore          │
│  ☐ SensesTag auto-fills on snap (location + weather)            │
│  ☐ Mood/energy sliders persist to UserWord.senses_tags          │
│  ☐ Map pins show correct retention colours                      │
│  ☐ Raw lat/lng NEVER stored — geohash only (§4.3)               │
│  ☐ 4th pin attempt → upsell modal (free tier gate)              │
└─────────────────────────────────────────────────────────────────┘
```

---

### D.3 PHASE 3 — STUDY SESSION · NEAR BY WORD (Hours 24–36)

**Master Prompt Sections:**
§7.1 Mixed-Node Session Architecture · §7.2 All Four Node Types ·
§7.3 Quick Mode · §8.2 Composite Priority Score S(w) ·
§8.3 Session Construction Pipeline · §8.5 Location-Triggered Review ·
§8.6 SM-2 Update Rules (5-button q values)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 3 DELIVERABLES                         Hours 24–36       │
│                                                                 │
│  H24–27  SRSEngine.ts — update for 5-button q (§8.6)           │
│          updateWordAfterReview(wordId, q: 0|2|3|4|5, isSensory) │
│          q<3 → interval=1, EF=max(1.3, EF-0.20)                │
│          q≥3 → new_i=round(i×EF), EF via SM-2 formula           │
│          isSensory=true → effective_q=min(5,q+1) BEFORE update  │
│          Unit tests: all 5 q values + sensory bonus             │
│                                                                 │
│  H27–30  NodeRouter.ts + SessionBuilder.ts (§7.1 + §8.3)        │
│          S(w) = α₁R+α₂U+α₃C+α₄D+α₅G+α₆V weights (§8.2)        │
│          N(u) = floor(L/τ × 0.85) capacity formula (§8.3)       │
│          Node weights FC:0.35/FB:0.30/CV:0.20/PR:0.15 (§7.1)   │
│          Offline: CV+PR weight → 0                              │
│          Fisher-Yates shuffle, no consecutive same-type         │
│                                                                 │
│  H30–32  SessionScreen.tsx (§7.2)                               │
│          Mixed node renderer: switch(nodeType) → component      │
│          Progress bar + heart display ❤️×5                       │
│          End-of-session XP summary + words reviewed             │
│                                                                 │
│  H32–34  NearByWordService.ts (§8.5)                            │
│          WorkManager 3×/day: 8am · 12pm · 6pm                  │
│          Geohash 5-char prefix vs all user pins                 │
│          Match within 100m → FCM: "Near [pin] — review?"        │
│          Session opens with isSensoryReinstatement=true         │
│          Quick Mode rules (no streak penalty)                   │
│                                                                 │
│  H34–35  QuickModeSession.tsx (§7.3)                            │
│          5 words + 1 Koko turn · always-on Home CTA tile        │
│          Offline: 5 cached flashcards from Encrypted Storage    │
│                                                                 │
│  H35–36  Offline detection + session degradation (§12.3)        │
│          NetInfo API: detect connectivity loss/restore          │
│          On offline: CV+PR weights→0, session rebuilds FC+FB    │
│          On reconnect: flush pending_snaps[], UserWord updates  │
│          Smoke test: airplane mode → session → reconnect flush  │
│                                                                 │
│  ACCEPTANCE CRITERIA:                                           │
│  ☐ All 5 q values produce correct SM-2 interval updates         │
│  ☐ Sensory q+1 bonus applies on location-triggered review       │
│  ☐ Session node sequence shuffled, no consecutive same type     │
│  ☐ Hearts −1 on q<3, +1 on q≥3 (cap 5)                         │
│  ☐ Background location check fires FCM on 100m match            │
│  ☐ Offline: CV+PR nodes excluded, FC+FB continue                │
│  ☐ Quick Mode: 5 words, ≤5 min, no streak penalty               │
└─────────────────────────────────────────────────────────────────┘
```

---

### D.4 PHASE 4 — STREAK · MISSION · ACHIEVEMENT (Hours 36–48)

**Master Prompt Sections:**
§7.4 Gamification Loop (Hearts, Streaks, KotoCoins, XP) ·
§7.5 Missions System · §3.4 FCM Push Copy ·
§4.1 Full Stack (Cloud Functions + Firestore transactions)

```
┌─────────────────────────────────────────────────────────────────┐
│  PHASE 4 DELIVERABLES                         Hours 36–48       │
│                                                                 │
│  H36–39  StreakEngine.ts (§7.4)                                 │
│          +1 streak on any session complete (incl. Quick Mode)   │
│          Streak freeze: 50 KotoCoins via Firestore transaction  │
│          Thompson Sampling: 3 arms 07:00/12:00/19:00 (§8.4)     │
│          7-day calibration → ≥70% sends to best arm             │
│          FCM copy matches §3.4 brand voice templates            │
│                                                                 │
│  H39–41  MissionEngine.ts (§7.5)                                │
│          Cloud Scheduler: midnight → generate-daily-missions    │
│          3 missions drawn from pool, no duplicate type          │
│          Adjustments: SRS≥10→word_review×2, skipped→quick_mode  │
│          checkMissionProgress(userId, eventType) — idempotent   │
│          KotoCoin credit: Firestore txn (server-authoritative)  │
│          Client: optimistic update reversed on conflict          │
│                                                                 │
│  H41–43  MissionTile.tsx — Home screen (§7.5)                   │
│          3 active missions: progress bar + coin reward + expiry │
│          Tap → deep-link to relevant screen                     │
│          Completed → checkmark + grey out until midnight        │
│                                                                 │
│  H43–45  AchievementSystem.ts (§7.4)                            │
│          Pack Complete: permanent badge + 200 KotoCoins         │
│          7-Day Streak: weekly badge + 100 KotoCoins             │
│          First Snap / First Recall / 100-word milestone         │
│          Achievement modal: animation + sound on first unlock   │
│          achievements[] array in user Firestore doc             │
│                                                                 │
│  H45–48  HomeScreen.tsx + QA sweep                              │
│          🔥 streak header · ❤️×5 · 3 mission tiles              │
│          Quick Mode CTA (persistent) · Memory Map thumbnail     │
│          E2E smoke test: full Snap→Tag→Map→Session→Streak loop  │
│          Offline smoke test + Crashlytics verify                │
│          EAS release build                                      │
│                                                                 │
│  FCM Copy — exact templates (§3.4):                             │
│  Revisit: "You're near [pin name] — 30-second review?"          │
│  Streak:  "🔥 Don't break your [N]-day streak. 3 words, 60s."  │
│  Mission: "✅ [Pack] complete. [N] words. Your clients won't   │
│            know what hit them."                                 │
│                                                                 │
│  ACCEPTANCE CRITERIA:                                           │
│  ☐ Streak increments on session complete (not word answer)      │
│  ☐ Streak freeze deducts 50 coins via server txn only           │
│  ☐ Missions regenerate at midnight local time                   │
│  ☐ KotoCoin ledger always server-authoritative                  │
│  ☐ Pack Complete badge permanent, not re-earnable               │
│  ☐ FCM push uses exact §3.4 copy templates above                │
│  ☐ Achievement modal fires on first unlock only                 │
│  ☐ Full E2E P0 test suite passes                                │
└─────────────────────────────────────────────────────────────────┘
```

### D.5 Master Prompt Coverage Map

```
┌─────────────────────────────────────────────────────────────────┐
│              MASTER PROMPT → PHASE REFERENCE MAP                │
│                                                                 │
│  §    Section                      Phase  Key deliverable       │
│  ─────────────────────────────────────────────────────────────  │
│  §3   Brand + Typography           P1     All UI components     │
│  §3.4 FCM Push Copy                P4     Streak/mission notifs │
│  §3.6 Multilingual Typography      P1     getFontFamily()       │
│  §4.3 Security Non-Negotiables     ALL    Geohash, no API keys  │
│  §5.2 Three Input Modes            P2     Snap + Text + GPS     │
│  §5.4 Memory Map                   P2     Geohash pins + colors │
│  §6.1–6.3 Sensory Tag Engine       P2     Tag collection flow   │
│  §6.4 Gemini Prompt Assembly       P2     /sensory-prompt       │
│  §6.5 Sensory Reinstatement        P1/P3  Ambient audio + q+1  │
│  §6.6 SensesTag Schema             P2     Firestore struct      │
│  §7.1 Mixed Session Architecture   P3     NodeRouter.ts         │
│  §7.2 Flashcard Node               P1     5-button fix          │
│  §7.3 Quick Mode                   P3     5-word session        │
│  §7.4 Gamification Loop            P4     Hearts/Streak/XP      │
│  §7.5 Missions System              P4     MissionEngine.ts      │
│  §8.2 S(w) Composite Score         P3     Word selection        │
│  §8.3 Session Construction         P3     SessionBuilder.ts     │
│  §8.4 Thompson Sampling            P4     Notification timing   │
│  §8.5 Location-Triggered Review    P3     NearByWordService.ts  │
│  §8.6 SM-2 Quality Mapping         P1/P3  5-button → q values  │
└─────────────────────────────────────────────────────────────────┘
```

### D.6 Risk Mitigation

| Risk | Probability | Fallback |
|---|---|---|
| Gemini latency >4s | Medium | 50 pre-cached scene packs per zone |
| Mandarin STT tonal scoring | Medium | Text-only Pinyin + tone marks v1.0; voice v1.1 |
| Maps quota exceeded | Low | Static tile snapshot mode |
| TTS voice quality poor | Low | Text-only Koko with TTS as async enhancement |
| Play Billing test track issues | Low | Firestore manual entitlement flag for beta testers |
| 48h overrun | Low | Cut: pronunciation waveform → text feedback only |
| Lao STT fails | High | Text-only phoneme feedback for LO throughout v1.0 |

---

## APPENDIX E: PILOT PLAN & SUCCESS CRITERIA

### E.1 Post-MVP Pilot (30 Days)

```
┌─────────────────────────────────────────────────────────────────┐
│                     30-DAY PILOT PLAN                           │
│                                                                 │
│  Cohort: 200 Bangkok users (22–35)                              │
│  Split: TH→EN (50%) · TH→ZH (50%)                              │
│                                                                 │
│  v1.1 expansion: +100 users per new pair (VI, added from ES)    │
│                                                                 │
│  PRIMARY METRICS (stop-gate if any <60% of target):             │
│  ─────────────────────────────────────────────────────────────  │
│  D7 retention          ≥20%                                     │
│  48h location recall   ≥60%                                     │
│  Vocab activation in   ≥50%                                     │
│    Koko conversation                                            │
│                                                                 │
│  SECONDARY METRICS:                                             │
│  ─────────────────────────────────────────────────────────────  │
│  NPS                   ≥+30                                     │
│  Weekly active days    ≥3                                       │
│  Trial→paid (day 7)    ≥5%                                      │
│                                                                 │
│  STOP GATE:                                                     │
│  Any primary metric <60% of target →                            │
│  B2B pivot activation (corporate English training packages)     │
│                                                                 │
│  INSTRUMENTATION:                                               │
│  Firebase Analytics + Firestore event log                       │
└─────────────────────────────────────────────────────────────────┘
```

### E.2 Key Event Tracking

| Event | Properties | Purpose |
|---|---|---|
| `snap_completed` | `word_count`, `lang_pair`, `place_category` | Funnel step 1 |
| `session_started` | `node_sequence`, `is_quick_mode`, `is_offline` | Session quality |
| `word_recalled` | `word_id`, `node_type`, `is_location_triggered` | Core metric |
| `location_revisit` | `geohash`, `words_at_pin`, `user_responded` | Aha moment |
| `trial_converted` | `day_of_conversion`, `plan` | Revenue |
| `session_abandoned` | `items_completed`, `items_total`, `exit_screen` | UX issues |
| `koko_word_used` | `word_id`, `levenshtein_distance`, `tone_correct` | Conversation quality |

---

## APPENDIX F: ERROR HANDLING & GRACEFUL DEGRADATION

### F.1 API Error Taxonomy

Every external API call has a defined fallback. Users must never see a blank screen or an unrecoverable error state from a cloud service failure.

```
┌─────────────────────────────────────────────────────────────────┐
│               API ERROR HANDLING MATRIX                         │
│                                                                 │
│  Failure              User sees               Recovery          │
│  ─────────────────────────────────────────────────────────────  │
│  Gemini >4s timeout   Pre-cached scene pack   Retry behind the  │
│                       vocab served silently    scenes; no UI err │
│                                                                 │
│  Gemini 429 (RPM)     14 RPM queue absorbs    Jittered backoff  │
│                       burst silently           1s→2s→4s→8s      │
│                                               ±500ms jitter     │
│                                                                 │
│  STT timeout/error    Koko turn becomes text  No retry —        │
│                       input mode: "Having      user types        │
│                       trouble hearing you —    answer instead    │
│                       type it instead"                          │
│                                                                 │
│  TTS failure          Koko text shown only;   Silent fallback   │
│                       no audio. Koko still     No error shown    │
│                       responds in text                          │
│                                                                 │
│  Maps API failure     Place name omitted;      Snap proceeds     │
│                       geohash still stored     without place tag │
│                       from device GPS                           │
│                                                                 │
│  Weather API stale    Cache used if ≤4h old   30-min retry TTL  │
│  (>30-min TTL miss)   If >4h: tag shows        stale-while-     │
│                       "Unknown conditions"     revalidate        │
│                                                                 │
│  FCM delivery fail    Silent — FCM retries    TTL = 28 days     │
│                       for user at next         (2419200s)        │
│                       opportunity                               │
│                                                                 │
│  Firestore offline    Encrypted Storage        Queue writes;     │
│                       serves reads; session    flush on reconnect│
│                       proceeds fully                            │
│                                                                 │
│  Cloud Run cold start Spinner for >2s:        <2s cold start    │
│                       "Warming up Koko..."     target (min inst) │
└─────────────────────────────────────────────────────────────────┘
```

### F.2 Circuit Breaker Pattern

All Cloud Run proxy calls use a client-side circuit breaker in `api/client.ts`. Three states: CLOSED (normal) → OPEN (failing fast) → HALF_OPEN (probing recovery).

```typescript
const CIRCUIT_BREAKER_CONFIG = {
  gemini:   { failThreshold: 3, resetTimeout: 30_000  },  // 30s
  stt:      { failThreshold: 2, resetTimeout: 10_000  },  // 10s
  maps:     { failThreshold: 5, resetTimeout: 60_000  },  // 60s
  weather:  { failThreshold: 3, resetTimeout: 120_000 },  // 2min
} as const
```

Fallback hierarchy when circuit is OPEN:

```
Gemini OPEN:
  1. Pre-cached scene pack for detected place_category (50 packs)
  2. Generic 10-word set from current domain pack
  3. If both unavailable: show "Snap saved — words loading soon"
     Queue the image; retry when circuit closes

STT OPEN:
  1. Conversation node → text input mode (no voice)
  2. Pronunciation node → text-only phoneme feedback
  3. Session continues uninterrupted; node type flag updated

Maps OPEN:
  1. Omit neighborhood name; show geohash zone (e.g. "Zone w3gv")
  2. Use user's last known place_category for Gemini prompt
  3. FCM proximity trigger disabled until Maps circuit closes
```

### F.3 Retry Policy Reference

```
Endpoint           Max retries  Backoff strategy     Jitter
──────────────────────────────────────────────────────────────
/analyze-image     3            Exponential 1s base  ±500ms
/koko-reply        2            Exponential 1s base  ±300ms
/generate-sentence 3            Exponential 1s base  ±500ms
/tts               2            Fixed 500ms          None
/srs-schedule      0            No retry; local      —
                                fallback (offline SM-2)
/verify-receipt    5            Exponential 2s base  ±1s
/sensory-prompt    3            Exponential 1s base  ±300ms
```

### F.4 Offline Queue Flush

When network connectivity is restored (detected via `NetInfo` event), the following flush sequence runs:

```
1. Flush pending_snaps[]     — POST /analyze-image for each queued snap
2. Flush UserWord updates    — Firestore batch write (last-write-wins per word)
3. Flush ConsentRecord       — Server-authoritative; retry until 200
4. Flush event analytics     — Firebase Analytics offline cache auto-flushes
5. Refresh weather cache     — Single GET; replaces any stale tags
6. Re-enable FCM triggers    — WorkManager reschedules proximity checks

Conflict resolution: last-write-wins per UserWord doc.
ConsentRecord: server-authoritative — no client override permitted.
```

---

## APPENDIX G: TESTING STRATEGY & P0 TEST CASES

### G.1 Test Pyramid

```
┌─────────────────────────────────────────────────────────────────┐
│                      TEST PYRAMID                               │
│                                                                 │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  E2E Tests (Detox)           ~15 tests                    │  │
│  │  P0 user flows. Simulator + real device.                  │  │
│  │  Run in Cloud Build on every PR to main.                  │  │
│  └───────────────────────────────────────────────────────────┘  │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  Integration Tests (Jest + supertest)    ~50 tests        │  │
│  │  Cloud Run endpoints. Firestore emulator.                 │  │
│  │  Gemini calls mocked (vcr cassettes).                     │  │
│  └───────────────────────────────────────────────────────────┘  │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  Unit Tests (Jest)          ~200 tests                    │  │
│  │  SRSEngine, NodeRouter, SessionBuilder, sensory tag       │  │
│  │  assembly, SM-2 update rules, geohash math,               │  │
│  │  MissionEngine, circuit breaker state machine.            │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

Cloud Build gate: any failing test in any tier blocks the merge. `npm audit --audit-level=high` also blocks on HIGH or CRITICAL CVEs.

### G.2 P0 E2E Test Cases

These 15 flows must all pass before any release build is cut:

```
P0-01  Auth happy path
       GIVEN fresh install → Google Sign-In → consent granted
       THEN user lands on Home; streak=0; no Firebase writes before consent

P0-02  PDPA gate — no write before consent
       GIVEN fresh install → dismiss consent screen
       THEN zero Firestore documents exist for uid

P0-03  Snap → Tag → Words → Pin flow
       GIVEN logged-in user → Snap → photo captured
       THEN 10 words returned, 5 selectable, Memory Map pin placed

P0-04  Offline flashcard session
       GIVEN airplane mode → Review → start session
       THEN flashcard + fill-blank items load; conversation +
            pronunciation absent from queue

P0-05  Location trigger end-to-end
       GIVEN word pinned at location A → user moves to within 100m of A
       THEN FCM fires; session opens in sensory reinstatement mode

P0-06  Freemium gate on word count
       GIVEN free account → Snap → attempt to select 6th word
       THEN paywall bottom sheet appears; 5th word accepted normally

P0-07  Streak increment
       GIVEN streak=5 → complete any session
       THEN Home screen shows streak=6

P0-08  Hearts drain → practice mode activation
       GIVEN hearts=1 → wrong answer in session
       THEN hearts=0; session switches to ungraded practice mode

P0-09  7-step onboarding completes
       GIVEN fresh install → complete all 7 onboarding steps
       THEN First Snap tutorial shown; Memory Map has 1 pin

P0-10  Meeting Prep latency
       GIVEN text topic entered in Meeting Prep input
       THEN 15 vocab + 5 sentences returned in <4s; Koko role-play launches

P0-11  Trial expiry gate
       GIVEN trial started → clock mocked +8 days
       THEN premium features gated; upgrade prompt shown on tap

P0-12  PDPA delete account
       GIVEN logged-in user → Profile → Delete Account → confirm
       THEN Firestore docs purged; GCS photos deleted; login rejected

P0-13  Quick Mode 5-item cap + no streak penalty
       GIVEN Quick Mode selected → exit after 3 items
       THEN streak unchanged; exactly 5 items maximum in queue

P0-14  Koko tonal correction (ZH pair)
       GIVEN ZH target language → Koko turn → user says mǎ (wrong tone)
       THEN Koko inline correction shown: "try mā 妈"

P0-15  Cloud Run unauthenticated request blocked
       GIVEN HTTP POST /analyze-image without Firebase ID token
       THEN HTTP 401 returned; zero Gemini API calls made
```

### G.3 Critical Unit Tests (SRSEngine.ts)

```typescript
describe('SRSEngine — SM-2 update rules', () => {
  it('scores overdue word higher than just-due word', () => {
    const overdue = makeWord({ due_at: daysAgo(5) })
    const due     = makeWord({ due_at: daysAgo(1) })
    expect(score(overdue)).toBeGreaterThan(score(due))
  })

  it('resets interval to 1 when q < 3', () => {
    const word   = makeWord({ interval: 30, ease_factor: 2.5 })
    const result = updateSM2(word, 2)
    expect(result.interval).toBe(1)
  })

  it('clamps ease_factor floor at 1.3', () => {
    const word   = makeWord({ ease_factor: 1.3 })
    const result = updateSM2(word, 0)
    expect(result.ease_factor).toBe(1.3)
  })

  it('clamps ease_factor ceiling at 2.5', () => {
    const word   = makeWord({ ease_factor: 2.5 })
    const result = updateSM2(word, 5)
    expect(result.ease_factor).toBeLessThanOrEqual(2.5)
  })

  it('sensory reinstatement bonus does not push q above 5', () => {
    const word     = makeWord({ ease_factor: 2.5, interval: 10 })
    const baseline = updateSM2(word, 5, { sensoryBonus: false })
    const boosted  = updateSM2(word, 5, { sensoryBonus: true })
    expect(boosted.interval).toBe(baseline.interval)
  })

  it('co-learned words (same snap_id) cluster in session', () => {
    const snapId = 'snap_abc'
    const words  = buildWordSet(10, { snap_id: snapId })
    const session = buildSession(words, { capacity: 5 })
    const inSession = session.filter(w => w.snap_id === snapId)
    expect(inSession.length).toBeGreaterThanOrEqual(2)
  })

  it('Thompson Sampling selects winning arm ≥70% after 7 days', () => {
    const arms  = simulateThompsonSampling({ days: 7, trueWinner: 'evening' })
    const share = arms.evening / arms.total
    expect(share).toBeGreaterThanOrEqual(0.70)
  })
})
```

### G.4 Performance Benchmarks

These thresholds are enforced in CI via `jest-performance` and manual profiling in the Phase 4 QA window (Hours 42–48):

| Benchmark | Target | Measurement method |
|---|---|---|
| Snap → words returned | <4s P95 | Cloud Run trace span |
| Session first item rendered | <500ms | React Native Perf Monitor |
| Flashcard swipe animation | 60fps | Reanimated frame drop counter |
| App cold start (JS bundle) | <2s | Expo startup trace |
| Offline session load | <200ms | AsyncStorage read time |
| FCM notification → app open | <1s | Firebase Performance SDK |
| Memory Map initial render (50 pins) | <1s | React Native Perf Monitor |
| Gemini conversation turn | <3s P95 | Cloud Run trace span |

---

## APPENDIX F: FREEMIUM GATE IMPLEMENTATION

### F.1 Gate Enforcement Architecture

All freemium gates are enforced **server-side via Firestore security rules and Cloud Functions**. Client-side gate checks are a UX hint only — they are never the authoritative enforcement.

```
┌─────────────────────────────────────────────────────────────────┐
│               FREEMIUM GATE ARCHITECTURE                        │
│                                                                 │
│  Feature            Free limit    Enforcement layer             │
│  ─────────────────────────────────────────────────────────────  │
│  Words per snap     5             Cloud Run /analyze-image      │
│                                   returns max 5 for free users  │
│                                                                 │
│  Memory Map pins    3 recent      Firestore security rules:     │
│                                   write blocked if pin count>3  │
│                                   Server-authoritative count    │
│                                                                 │
│  AI Conversation    3 sessions/d  Cloud Functions rate counter  │
│                                   keyed: {uid}:{date}:convo     │
│                                                                 │
│  Pronunciation      5 attempts/d  Cloud Functions rate counter  │
│                                   keyed: {uid}:{date}:pronun    │
│                                                                 │
│  Sensory tag history Last 7 days  Firestore query limit:        │
│                                   orderBy(created_at).limit(7)  │
│                                   for free tier                 │
│                                                                 │
│  Vocab Pack access  1 pack        Firestore: pack_access[]      │
│                                   array checked server-side     │
└─────────────────────────────────────────────────────────────────┘
```

### F.2 Subscription Validation

```typescript
// Cloud Run /verify-receipt
// Called after Google Play purchase
async function verifyReceipt(purchaseToken: string, productId: string) {
  // 1. Verify with Google Play Developer API (server-to-server)
  const receipt = await androidPublisher.purchases.subscriptions.get({
    packageName: 'com.kotoka.app',
    subscriptionId: productId,
    token: purchaseToken,
  });

  // 2. Check paymentState === 1 (payment received)
  if (receipt.data.paymentState !== 1) throw new Error('PAYMENT_INVALID');

  // 3. Write entitlement to Firestore (server-authoritative)
  await db.collection('users').doc(uid).update({
    subscription_tier: 'premium',
    trial_ends_at: null,
    premium_since: Timestamp.now(),
    receipt_token: purchaseToken,  // for renewal checks
  });
}
```

---

*Source documents: `Main_resources/concept.md` · `Main_resources/kotoka_signature.md` · `Main_resources/kotoka_system_architecture.md`*
*Color palette: blue (#1565C0) overrides teal (#00897B). Blue is the active brand color.*
*Session design: mixed 4-node sessions override PRD §6.6. Mixed sessions are the v2.0 design.*
*Language scope: TH · EN · ZH · ES · VI · LO. Any source/target direction. Default from device system language.*

