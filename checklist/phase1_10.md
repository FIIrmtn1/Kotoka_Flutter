# Phase 1 Checklist — Kotoka UI/UX Build
> Senior Kai Tanaka · Compare against PRD.md + plan/phase1_10.md

---

## GLOBAL RULES (every item below must pass these)
- [ ] Background: `KColors.brand50` (#e8e1f0) on ALL screens
- [ ] CTA buttons: `KColors.brand500` (#00c8cc) + white text
- [ ] Accents/active: `KColors.brand400` (#0cf6fc) — ≥1 per screen
- [ ] Purple `KColors.brand700`: decorative ONLY, never on any button
- [ ] Zero hardcoded hex/colors/spacing — all from `tokens.dart`
- [ ] All strings from `AppLocalizations` — no hardcoded text
- [ ] All 6 locales present: en, th, zh, es, vi, lo
- [ ] KokoAnimation used exclusively — no Lottie, no Rive
- [ ] All mock data has `//MOCKDATA` comment
- [ ] WCAG AA contrast ≥4.5:1 on all text
- [ ] Gemini output rendered with `**bold**` markers
- [ ] Rate limits active: 60 rpm default, 14 rpm Gemini
- [ ] No AI-generated images
- [ ] Twemoji via `KokoEmoji`/`KokoFlag` — no system emoji
- [ ] Flags via `KokoFlag` — never raw Unicode flag text

---

## WIDGETS

### KScaffold + KAmbientOrbs
- [ ] `lib/core/widgets/k_scaffold.dart` exists
- [ ] Background: `KColors.brand50`
- [ ] Two ambient orbs: top-right brand400/7%, bottom-left sky100/10%
- [ ] Orbs: pointer-events none, behind content

### KCard
- [ ] `lib/core/widgets/k_card.dart` exists
- [ ] Default: white bg, brand400/20 border, KRadius.md, shadow1
- [ ] Selected: brand400/5 bg, brand400 border (2px), animated 180ms

### KChip
- [ ] `lib/core/widgets/k_chip.dart` exists
- [ ] Selected: brand400/12 bg, brand400 border, brand500 text bold
- [ ] Unselected: white bg, brand400/25 border
- [ ] KRadius.full (pill shape)

### KSectionHeader
- [ ] `lib/core/widgets/k_section_header.dart` exists
- [ ] Color: `KColors.brand600` (#8c6792)
- [ ] FontWeight.w600

### KotokaButton
- [ ] Primary: brand500 bg, white text, KRadius.full or KRadius.md
- [ ] Ghost: transparent bg, brand500 border 40%, brand500 text
- [ ] Outlined: brand500 border 2px, brand500 text
- [ ] Disabled state: opacity 0.38
- [ ] Loading state: spinner visible, button disabled

### BottomTabBar
- [ ] 5 tabs: Home · Snap · Review · Shop · Me
- [ ] Background: `theme.colorScheme.surface` (NOT hardcoded white)
- [ ] Border: `theme.colorScheme.outline`
- [ ] Active: brand400/10 capsule, brand400 icon+label (filled icon)
- [ ] Inactive: `theme.colorScheme.onSurfaceVariant`
- [ ] Review tab badge shows live due-card count

---

## ONBOARDING SCREENS (No bottom nav on ONB-01–ONB-10)

### ONB-01 Welcome
- [ ] `lib/screens/onboarding/welcome_screen.dart` exists
- [ ] `KokoAnimation(asset: KokoAssets.wave)` visible
- [ ] "Kotoka" title: brand400 color
- [ ] Tagline: `l10n.welcomeTagline` (all 6 locales)
- [ ] CTA: brand400/brand500, goes to `/onboarding/language`
- [ ] Background: brand50

### ONB-02 Language Select
- [ ] `lib/screens/onboarding/language_select_screen.dart` exists
- [ ] "I speak" dropdown — `KokoFlag` per language
- [ ] "I want to learn" dropdown — `KokoFlag` per language
- [ ] Selected dropdown: brand400 border highlight
- [ ] 6 languages available: th, en, zh, es, vi, lo
- [ ] CTA disabled until both languages selected and different
- [ ] Selection saved to `onboardingProvider`

### ONB-03 Goal Select
- [ ] `lib/screens/onboarding/goal_select_screen.dart` exists
- [ ] Chip grid, multi-select
- [ ] Active chip: brand400/12 bg, brand400 border, brand500 text
- [ ] ≥6 goal options, all localized
- [ ] CTA disabled until ≥1 goal selected
- [ ] Selection saved to `onboardingProvider`

### ONB-04 Level Select
- [ ] `lib/screens/onboarding/level_select_screen.dart` exists
- [ ] 3 cards: Beginner / Intermediate / Advanced
- [ ] Each card: `KokoEmoji` + `ProgressRing` (brand400 fill)
- [ ] Beginner → auto-advance to schedule (300ms delay)
- [ ] Advanced → auto-advance to schedule (300ms delay)
- [ ] Intermediate → shows CTA button
- [ ] Level saved to `onboardingProvider`

### ONB-05 Schedule
- [ ] `lib/screens/onboarding/schedule_screen.dart` exists
- [ ] Radio cards: 5/10/15/20/30 min/day
- [ ] Selected card: brand400 border
- [ ] Radio color: brand400
- [ ] CTA disabled until selection made
- [ ] Selection saved to `onboardingProvider`

### ONB-06 Notifications
- [ ] `lib/screens/onboarding/commitment_screen.dart` exists
- [ ] Card layout, encouraging copy (localized)
- [ ] Brand400 CTA
- [ ] Requests notification permission

### ONB-07 PDPA Consent
- [ ] `lib/screens/onboarding/pdpa_consent_screen.dart` exists
- [ ] 3 permission cards: Camera, Location, Notifications
- [ ] ALL cards expanded by default (reasons visible)
- [ ] Icon containers: brand400/12 bg, brand400 icon
- [ ] Brand400 "Agree & Continue" CTA

### ONB-08 Profile Setup
- [ ] `lib/screens/onboarding/profile_setup_screen.dart` exists
- [ ] White KCard container
- [ ] Display name text field (KotokaTextField)
- [ ] Avatar: initials circle fallback (brand400/20 bg, brand400 text)
- [ ] Brand400 CTA

### ONB-09 Mission
- [ ] `lib/screens/onboarding/mission_screen.dart` exists
- [ ] `KokoAnimation(asset: KokoAssets.celebrate)` visible
- [ ] Heading: brand500 color (not brand700)
- [ ] Brand400 CTA → summary

### ONB-10 Summary
- [ ] `lib/screens/onboarding/summary_screen.dart` exists
- [ ] "You're all set!" heading
- [ ] `KokoAnimation(asset: KokoAssets.celebrate)` visible
- [ ] White summary card: shows language pair + level + daily minutes
- [ ] Brand400 CTA → home (`/home`)

---

## MAIN SCREENS

### Home Screen
- [ ] `lib/screens/home/home_screen.dart` exists
- [ ] NO missions section (HOM-01)
- [ ] StreakCommitRow widget visible
- [ ] "Start Review" button shows if dueCount > 0 (HOM-01b)
- [ ] Recent vocab list (VocabCard)
- [ ] `KokoAnimation(asset: KokoAssets.idle)` in header
- [ ] Brand400 accents present
- [ ] All text from l10n

### Snap Screen
- [ ] `lib/screens/snap/snap_screen.dart` exists
- [ ] Dark bg `#0b1c30`
- [ ] Minimal viewfinder by default (SNA-01)
- [ ] `•••` toggle reveals: flash, grid controls
- [ ] Text mode tab accessible
- [ ] Camera → `/snap/processing`

### Snap Text Screen
- [ ] `lib/screens/snap/snap_text_screen.dart` exists
- [ ] `KotokaTextField` with brand400 focus border
- [ ] Submit → `/snap/processing`

### Snap Processing
- [ ] `lib/screens/snap/snap_processing_screen.dart` exists
- [ ] `KokoAnimation(asset: KokoAssets.thinking)` visible
- [ ] Animated loading dots
- [ ] "Analyzing..." text (localized)
- [ ] Gemini rate limiter: 14 RPM enforced

### Snap Results
- [ ] `lib/screens/snap/snap_results_screen.dart` exists
- [ ] Vocab card grid
- [ ] Gemini output: `**bold**` formatting applied
- [ ] "Add to deck" button: brand500
- [ ] //MOCKDATA on any placeholder vocab

### Review Screen
- [ ] `lib/screens/review/review_screen.dart` exists
- [ ] Due count + estimated time shown
- [ ] Brand400 "Start" CTA

### Review Flashcard
- [ ] `lib/screens/review/review_flashcard_screen.dart` exists
- [ ] Card flip animation: 150ms ease-out
- [ ] Front: target word; Back: translation + example
- [ ] 4 SRS rating buttons (REV-02):
  - [ ] 😵 Missed it — error500 (#d8566a)
  - [ ] 😕 Almost — warning500 (#ffdfa2)
  - [ ] 🙂 Got it! — sky300 (#7dd3fc)
  - [ ] 😄 Too easy — brand400 (#0cf6fc)
- [ ] All button emoji via `KokoEmoji`
- [ ] Rating saves via SRS provider

### Review Fill-Blank
- [ ] `lib/screens/review/review_fillblank_screen.dart` exists
- [ ] Sentence with visible blank
- [ ] `KotokaTextField` for input
- [ ] Submit + hint buttons

### Review Conversation
- [ ] `lib/screens/review/review_conversation_screen.dart` exists
- [ ] AI conversation mode
- [ ] Gemini output: `**bold**` formatted
- [ ] 14 RPM rate limit active

### Review Complete
- [ ] `lib/screens/review/review_complete_screen.dart` exists
- [ ] `KokoAnimation(asset: KokoAssets.celebrate)` visible
- [ ] Stats: cards reviewed, accuracy %, XP (//MOCKDATA)
- [ ] Brand400 CTA → home

### Shop Screen
- [ ] `lib/screens/shop/shop_screen.dart` exists
- [ ] Beta banner at top (SHO-03)
- [ ] NO premium pricing shown
- [ ] "Free in beta" badge on all packs
- [ ] Vocab pack cards: KCard style

### Profile Screen
- [ ] `lib/screens/profile/profile_screen.dart` exists
- [ ] Stats: words learned, sessions, accuracy (//MOCKDATA)
- [ ] Language pair: changeable at any time
- [ ] Language change → `localeProvider` updates immediately
- [ ] Locale persisted to local storage
- [ ] All strings localized

---

## NAVIGATION + ROUTING

- [ ] All 17 routes defined in `app_router.dart`
- [ ] Onboarding routes: NO bottom nav
- [ ] Main routes: bottom nav visible
- [ ] Back navigation: predictable, preserves state
- [ ] Deep links: all key screens reachable

---

## i18n

- [ ] `flutter gen-l10n` runs with 0 errors
- [ ] All 6 ARB files updated with all new keys
- [ ] No missing translation warnings
- [ ] Language switcher in Profile updates all strings immediately

---

## INFRASTRUCTURE

- [ ] `docker-compose up` starts Firestore emulator + Redis
- [ ] `rate_limiter.dart`: 60 rpm default
- [ ] `rate_limiter.dart`: 14 rpm Gemini endpoints
- [ ] API client uses emulator in debug mode
- [ ] Firebase ID token on every request
- [ ] SQLCipher for local encrypted storage

---

## BUILD VERIFICATION

- [ ] `flutter analyze` → 0 errors
- [ ] `flutter build apk --debug` → success
- [ ] APK installs on emulator
- [ ] All screens navigate correctly
- [ ] KokoAnimation loads on: ONB-01, ONB-09, ONB-10, Home, Snap Processing, Review Complete
- [ ] No crash on any screen
- [ ] Font loads: IBM Plex Sans (Latin), Sarabun (Thai), Noto Sans SC (ZH), Noto Sans Lao (LO)
