# Kotoka — Product Requirements Document
> Version 2.0 · 2026-04-26 · Design system: STITCH_DESIGN_GUIDE.md

---

## 1. Product Vision

**Kotoka** is a contextual language learning app for Southeast Asian professionals and travellers. Users snap real-world photos to extract vocabulary anchored to the places and moments where they encountered them.

**Tagline:** "Snap your world, speak any languages."

---

## 2. Target Users

| Persona | Goal |
|---------|------|
| Bangkok office worker | Learn English for meetings and emails |
| Thai tourist | Learn conversational phrases for travel |
| Vietnamese student | Academic vocabulary for exams |
| SEA expat | Personal growth through daily language immersion |

---

## 3. Core Features

### 3.1 Snap & Learn
- Camera tab captures real-world scenes
- Gemini 2.5 Flash extracts vocabulary from images
- Words anchored to GPS location for spatial memory
- Text input mode for manual word entry
- Minimal viewfinder by default (••• toggle reveals advanced controls) — **SNA-01**

### 3.2 Spaced Repetition Review
- Flashcard system with 4-rating SRS — **REV-02**
  - 😵 Missed it · 😕 Almost · 🙂 Got it! · 😄 Too easy
- Fill-blank and conversation modes
- Review badge on bottom nav showing due count — **HOM-01b**
- Session completion screen

### 3.3 Shop (Beta)
- All vocab packs and Premium features free during beta — **SHO-03**
- "Free in beta" button on all packs
- Beta banner replaces premium upsell

### 3.4 Profile & Memory Map
- Learning stats (words learned, sessions, accuracy)
- Language pair management
- Memory map showing vocabulary by location

---

## 4. Onboarding Flow

| Step | Screen | Notes |
|------|--------|-------|
| ONB-01 | Welcome / Splash | Lavender bg, Koko wave, tagline updated — **ONB-01** |
| ONB-02 | Language Select | Dropdown pair selector (I speak / I want to learn) — **ONB-04** |
| ONB-03 | Goal Select | Grid of goal chips |
| ONB-04 | Level Select | 3-card with emoji + ProgressRing; Beginner/Advanced auto-advance — **ONB-05** |
| ONB-05 | Schedule | Daily commitment time picker |
| ONB-06 | Notifications | Stay on track screen |
| ONB-07 | PDPA Consent | All permission reasons expanded by default — **ONB-03** |
| ONB-08 | Profile Setup | Display name + avatar |
| ONB-09 | Mission Intro | First mission awaits — **ONB-06** |
| ONB-10 | Summary | "You're all set!" with setup recap — **ONB-07** |

---

## 5. Languages Supported

Thai · English · Mandarin · Spanish · Vietnamese · Lao

All 6 locales required across all screens (ARB files). Display language changeable at any time from Profile.

---

## 6. Technical Stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter (not React Native) |
| State | Riverpod |
| Navigation | go_router |
| Backend | Cloud Run (Fastify) + Firestore + Cloud Storage |
| Auth | Firebase Auth (Google Sign-In, 15-min ID tokens) |
| Push | FCM |
| Local storage | SQLCipher (encrypted) |
| AI | Gemini 2.5 Flash API |
| Local dev | Docker Compose (Firestore emulator + Redis) |

---

## 7. Design System

See **DESIGN.md** and **stitch_kotoka_design_builder/STITCH_DESIGN_GUIDE.md** for full spec.

**Token source:** `lib/core/theme/tokens.dart`

Key rules:
- No hardcoded colors, sizes, or spacing anywhere
- Page background = `KColors.brand50` (#e8e1f0 lavender) on all screens
- Primary CTA = `KColors.brand700` (#682069 deep purple) with white text
- Accent / nav active = `KColors.brand400` (#0cf6fc bright cyan)
- Light mode only — no dark mode in production beta

---

## 8. UX Decisions (from 14-issue deep-interview, 2026-04-26)

| ID | Decision |
|----|----------|
| SNA-01 | Snap viewfinder minimal by default; ••• reveals tabs/tags |
| REV-02 | Keep 4 rating buttons with emoji labels |
| SHO-03 | All free during beta — remove premium pricing |
| ONB-01 | Tagline: "Snap your world, speak any languages" |
| ONB-04 | Two dropdowns (I speak / I want to learn), no swap button |
| ONB-03 | PDPA reasons expanded by default (one per permission) |
| HOM-01 | Remove daily missions section from home screen |
| HOM-01b | Review badge on bottom nav tab |
| ONB-07 | Add summary screen "You're all set!" before home |
| ONB-06 | All packs free for beta |
| ONB-05 | Beginner/Advanced auto-advance; Intermediate requires Continue |
| DARK | Dark mode — backlog, skip for beta |
| CURRENCY | Currency display — skip for beta |
| OFFER | Remove LIMITED OFFER banner |

---

## 9. Security Requirements

- Firebase ID token on every API request (15-min expiry, auto-refresh)
- SQLCipher for local encrypted storage
- No secrets in client code
- Input validation at all API boundaries
- Rate limits: 60 req/min per user; Gemini endpoints: 14 RPM
- PDPA compliance (Thailand Personal Data Protection Act)

---

## 10. Mock Data Policy

Every mock data value MUST be commented with `//MOCKDATA` on the same line.
