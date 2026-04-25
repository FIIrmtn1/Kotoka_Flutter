# Phase 1 Checklist — Kotoka Flutter App

**Owner:** Kai Tanaka (Senior) | **QA:** Nova Patel | **Date:** 2026-04-25

---

## US-001: Flutter Project Scaffold + Design Tokens
- [ ] `pubspec.yaml` has: flutter_localizations, flutter_riverpod, go_router, firebase_core, firebase_auth, cloud_firestore, kokoanimation
- [ ] `lib/core/theme/tokens.dart` exports all color tokens (brand-50 → brand-900, semantic, mood tints)
- [ ] `lib/core/theme/tokens.dart` exports typography scale (h1–target-word, all 4 font families)
- [ ] `lib/core/theme/tokens.dart` exports spacing scale (4px base, sp4–sp64)
- [ ] `flutter pub get` runs clean (no errors)
- [ ] `lib/main.dart` bootstraps with MaterialApp + all 6 locales
- [ ] No hardcoded color/size values anywhere (grep check)

## US-002: i18n ARB Files — 6 Languages
- [ ] `lib/l10n/app_en.arb` exists with all keys
- [ ] `lib/l10n/app_th.arb` exists with Thai translations
- [ ] `lib/l10n/app_zh.arb` exists with Simplified Chinese translations
- [ ] `lib/l10n/app_es.arb` exists with Spanish translations
- [ ] `lib/l10n/app_vi.arb` exists with Vietnamese translations
- [ ] `lib/l10n/app_lo.arb` exists with Lao translations
- [ ] All onboarding string keys present in all 6 ARB files
- [ ] `flutter gen-l10n` runs without error
- [ ] AppLocalizations used in all widgets (no hardcoded strings)

## US-003: Docker Local Dev Environment
- [ ] `docker-compose.yml` at project root
- [ ] Firestore emulator service defined (port 8080)
- [ ] Redis cache service defined (port 6379)
- [ ] `docker-compose up` starts both services
- [ ] Flutter app uses `useFirestoreEmulator('localhost', 8080)` in debug mode
- [ ] `.env.local` template provided with emulator vars

## US-004: KokoAnimation Component
- [ ] `lib/core/widgets/koko_animation.dart` exists
- [ ] Uses `package:kokoanimation/kokoanimation.dart` (NOT lottie)
- [ ] Supports states: `idle`, `celebrating`, `thinking`, `error_warm`
- [ ] Widget accepts `state` parameter
- [ ] No Lottie/rive imports anywhere (grep check)
- [ ] Renders correctly on 320px–428px screen widths
- [ ] Animation loops correctly in idle state

## US-005: Navigation Architecture
- [ ] `lib/core/router/app_router.dart` with go_router
- [ ] Routes defined: `/onboarding`, `/home`, `/snap`, `/review`, `/shop`, `/profile`
- [ ] Bottom tab bar: Home, Snap, Review, Shop, Profile (5 tabs)
- [ ] Route guard: unauthenticated user → `/onboarding`
- [ ] All routes render without crash
- [ ] Deep link support configured
- [ ] Back navigation works correctly

## US-006: Onboarding Flow (7 Screens)
- [ ] `screens/onboarding/welcome_screen.dart` — KokoAnimation present
- [ ] `screens/onboarding/language_select_screen.dart` — 6 language pairs selectable
- [ ] `screens/onboarding/goal_select_screen.dart` — Career/Travel/Academic/Personal goals
- [ ] `screens/onboarding/level_select_screen.dart` — Beginner/Intermediate/Advanced
- [ ] `screens/onboarding/schedule_screen.dart` — 5/10/15/30 min daily options
- [ ] `screens/onboarding/pdpa_consent_screen.dart` — Photos/GPS/Voice checkboxes
- [ ] `screens/onboarding/profile_setup_screen.dart` — Name + avatar
- [ ] ALL strings use AppLocalizations (no hardcoded text)
- [ ] ALL colors/sizes use tokens.dart (no hardcoded values)
- [ ] Navigation between all 7 screens works
- [ ] KokoAnimation on welcome + completion
- [ ] PDPA screen requires all 3 consents before proceed

## US-007: Home Screen
- [ ] `screens/home/home_screen.dart` exists
- [ ] Streak counter widget (shows day count)
- [ ] Daily mission card (shows today's goal)
- [ ] Quick review CTA button (one-tap session start)
- [ ] Mood tint overlay applied to background
- [ ] All mock data tagged `//MOCKDATA`
- [ ] All strings i18n'd
- [ ] All values from tokens.dart
- [ ] Responsive: works on small (375px) and large (428px) screens

## US-008: Design System Component Library
- [ ] `lib/core/widgets/kotoka_button.dart` — primary/secondary/ghost variants
- [ ] `lib/core/widgets/vocab_card.dart` — word display + SensoryTagBar slot
- [ ] `lib/core/widgets/sensory_tag_bar.dart` — location/weather/mood/energy/sound tags
- [ ] `lib/core/widgets/kotoka_text_field.dart` — branded input field
- [ ] `lib/core/widgets/progress_ring.dart` — circular progress indicator
- [ ] All components use tokens.dart exclusively
- [ ] SensoryTagBar non-optional on VocabCard (enforced via required param)
- [ ] All components support all 6 locales
- [ ] No hardcoded colors/sizes in any component

## US-009: API Rate Limiter + Security Layer
- [ ] `lib/core/api/rate_limiter.dart` implements token bucket algorithm
- [ ] Default limit: 60 req/min per user
- [ ] Gemini endpoints: 14 RPM configured
- [ ] Firebase ID token attached to all API requests (interceptor)
- [ ] Token auto-refresh before 15-min expiry
- [ ] Rate limit exceeded → graceful error widget (no crash)
- [ ] `lib/core/api/api_client.dart` uses rate_limiter

## US-010: REPORT.md + README.md
- [ ] `REPORT.md` at project root
- [ ] REPORT.md has: Phase 1 summary, all US-001–US-009 results, files changed list
- [ ] `README.md` at project root
- [ ] README.md has: prerequisites, `docker-compose up`, `flutter pub get`, `flutter run`
- [ ] README.md has: project structure overview
- [ ] Both files accurate (no placeholder text)

---

## QA Sign-off Gate

Before QA sign-off, ALL items above must be checked. Nova will:
1. Run grep for hardcoded colors: `grep -r "#[0-9A-Fa-f]" lib/ --include="*.dart"`
2. Run grep for lottie: `grep -r "lottie\|rive" lib/ --include="*.dart"`
3. Run grep for missing MOCKDATA: verify all mock values tagged
4. Run `flutter analyze` — zero errors
5. Verify all 6 ARB files have identical key sets

**Sign-off:** [ ] Nova Patel — QA Approved
