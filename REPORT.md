# Kotoka — Phase 1 Completion Report

**Date:** 2026-04-25  
**Team:** Aria Chen (PM) · Kai Tanaka (Senior) · Mai Srisuk (Junior 1) · Leo Wirawan (Junior 2) · Nova Patel (QA)  
**Phase:** Phase 1 — Flutter App Scaffold, Design System & UI/UX Implementation

---

## Summary

Phase 1 complete. Flutter app scaffold built with full design system, 7 onboarding screens, home screen, component library (5 widgets), i18n for 6 languages, Docker local dev environment, rate limiter, Firebase security layer, and @Kokoanimation integration.

**Stack change:** React Native + Expo → **Flutter** (per user directive)  
**Animation:** Lottie → **@Kokoanimation** (local package, `packages/kokoanimation/`)

---

## Files Created

### Root
- `pubspec.yaml` — Flutter dependencies, font declarations, asset config
- `l10n.yaml` — ARB generation config
- `docker-compose.yml` — Firestore emulator (:8080) + Redis (:6379) + Redis Commander (:8081)
- `.env.local` — Local environment variable stubs
- `README.md` — Setup and run instructions
- `CLAUDE.md` — Project constraints (Flutter, @Kokoanimation, i18n, rate limits, //MOCKDATA)

### Core
- `lib/main.dart` — Firebase init, Riverpod, go_router, 6 locales, emulator connection (debug)
- `lib/core/theme/tokens.dart` — KColors, KSpacing, KRadius, KElevation, KMotion, KTypography
- `lib/core/theme/app_theme.dart` — Material 3 ThemeData using token system
- `lib/core/router/app_router.dart` — go_router, 5-tab shell, auth guard
- `lib/core/api/rate_limiter.dart` — Token bucket: 60 req/min default, 14 RPM Gemini
- `lib/core/api/api_client.dart` — Dio + Firebase ID token interceptor + rate limit interceptor

### Widgets (Design System)
- `lib/core/widgets/koko_animation.dart` — @Kokoanimation wrapper (idle/celebrating/thinking/errorWarm)
- `lib/core/widgets/kotoka_button.dart` — Primary/secondary/ghost variants
- `lib/core/widgets/vocab_card.dart` — Flashcard with required SensoryTagBar
- `lib/core/widgets/sensory_tag_bar.dart` — 6 sensory context chips
- `lib/core/widgets/kotoka_text_field.dart` — Branded input field
- `lib/core/widgets/progress_ring.dart` — Circular progress CustomPainter

### Screens
- `lib/screens/onboarding/welcome_screen.dart`
- `lib/screens/onboarding/language_select_screen.dart`
- `lib/screens/onboarding/goal_select_screen.dart`
- `lib/screens/onboarding/level_select_screen.dart`
- `lib/screens/onboarding/schedule_screen.dart`
- `lib/screens/onboarding/pdpa_consent_screen.dart`
- `lib/screens/onboarding/profile_setup_screen.dart`
- `lib/screens/home/home_screen.dart`

### i18n
- `lib/l10n/app_en.arb` · `app_th.arb` · `app_zh.arb` · `app_es.arb` · `app_vi.arb` · `app_lo.arb`
- 95 keys per locale, full key parity across all 6

### Local Package
- `packages/kokoanimation/pubspec.yaml`
- `packages/kokoanimation/lib/kokoanimation.dart`
- `packages/kokoanimation/lib/src/koko_animation_widget.dart`

### Project Artefacts
- `plan/phase1.md` — PM Phase 1 plan
- `checklist/phase1.md` — QA checklist (all items)
- `personality/` — 35 agent personality files (5 dev team + 30 SEA customer agents)

---

## User Story Status

| Story | Title | Status |
|-------|-------|--------|
| US-001 | Flutter scaffold + design tokens | ✅ COMPLETE |
| US-002 | i18n ARB files — 6 languages | ✅ COMPLETE |
| US-003 | Docker local dev environment | ✅ COMPLETE |
| US-004 | KokoAnimation component | ✅ COMPLETE |
| US-005 | Navigation architecture | ✅ COMPLETE |
| US-006 | Onboarding flow (7 screens) | ✅ COMPLETE |
| US-007 | Home screen | ✅ COMPLETE |
| US-008 | Design system component library | ✅ COMPLETE |
| US-009 | API rate limiter + security layer | ✅ COMPLETE |
| US-010 | REPORT.md + README.md | ✅ COMPLETE |

---

## Customer Vote Results

| Round | Score | Verdict |
|-------|-------|---------|
| Round 1 | 69.8/100 | ❌ Below threshold (dark mode missing, Thai font small) |
| Round 2 | 81.0/100 | ❌ Below threshold (KotoCoin unclear, loading animation slow) |
| Round 3 | **86.7/100** | ✅ **PASSED** (≥ 85 threshold met) |

**Top loved features (Round 3):**
- Clean professional UI — feels calm, not childish
- Language selection with flags — intuitive
- PDPA consent explains WHY — builds trust
- Sensory tags — never seen before, smart idea
- Streak design motivates without pressure

**Customer feedback applied to Flutter code:**
- `ThemeMode.dark` default via `themeModeProvider` in `main.dart`
- `KColorsDark` token class — dark scaffold, appBar, cards, inputs, navigation
- `_minThaiSize()` helper in `tokens.dart` — 15px floor for `th` and `lo` locales
- `OfflineBanner` widget with `offlineBannerVisibleProvider`
- `ThemeToggleButton` FAB (light ↔ dark)
- KotoCoin teaser card on Home screen (gradient brand-800→600, 🪙 icon)
- `VocabCard.exampleSentence` optional parameter added

**Feedback applied to HTML mockups:**
- `body.dark` default on all 5 screens
- KotoCoin teaser card in home mockup
- Card transition animations (300ms ease-in-out)

---

## QA Checks (Nova Patel)

| Check | Result |
|-------|--------|
| No lottie/rive imports in lib/ | ✅ PASS |
| No hardcoded hex colors outside tokens.dart | ✅ PASS |
| //MOCKDATA tags on all mock data | ✅ PASS |
| ARB key parity (all 6 locales) | ✅ PASS (95/95 keys) |
| @Kokoanimation usage (not lottie) | ✅ PASS |
| Rate limiter — 14 RPM Gemini | ✅ PASS |
| i18n in onboarding screens | ✅ PASS |
| All 30 required files present | ✅ PASS |

**QA Verdict: APPROVED**

---

## Design Decisions

| Decision | Rationale |
|----------|-----------|
| Flutter over React Native | User directive. Better performance, stronger type system, single codebase. |
| @Kokoanimation over Lottie | User directive. Custom mascot animations, no external animation file dependency. |
| Riverpod over Bloc | Less boilerplate, code generation, testable providers. |
| go_router | Official Flutter routing, deep links, type-safe routes. |
| Token bucket rate limiter | Matches PRD: 14 RPM Gemini, 60 RPM default. Prevents API abuse. |
| Firestore emulator + Redis Docker | Local-first dev. No cloud billing during development. |
| 6 ARB files, flutter_localizations | Official Flutter i18n pattern. Compile-time safety. |

---

## PRD Deviations

| Item | PRD Spec | Actual | Reason |
|------|----------|--------|--------|
| Framework | React Native + Expo | Flutter | User directive |
| State | Zustand | Riverpod | Flutter equivalent |
| Styling | NativeWind | Flutter tokens | Flutter equivalent |
| Navigation | React Navigation | go_router | Flutter equivalent |
| Local cache | SQLCipher | sqflite + flutter_secure_storage | Flutter equivalent; SQLCipher available via plugin in Phase 2 |

---

## Known Limitations (Phase 2 Items)

- Font TTF assets not bundled — IBM Plex Sans / Sarabun / Noto Sans SC require manual download
- Firebase project not provisioned — emulator only until Phase 2
- Snap / Review / Shop / Profile screens are placeholder stubs
- Gemini 2.5 Flash integration scaffolded but not wired (Phase 2)
- Unit and widget test coverage deferred to Phase 2
- SQLCipher encryption not yet wired (Phase 2)
- FCM location triggers not wired (Phase 3)

---

## Phase 2 Handoff

Phase 2 starts from this scaffold. Priority:
1. Provision Firebase project, wire real Auth
2. Implement Snap screen (camera + Gemini vision)
3. Wire Gemini vocabulary generation
4. Implement Review session (SRS algorithm)
5. Add SQLCipher local encryption
6. Wire FCM push
