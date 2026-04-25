# Phase 1 Plan — Kotoka Flutter App

## Executive Summary

Phase 1 establishes the complete foundation of the Kotoka language-learning app using Flutter. The scope covers project scaffolding, design system, i18n infrastructure, onboarding flow, home screen, navigation architecture, local dev environment, and security layer. All 10 user stories (US-001 through US-010) must reach `passes: true` before Phase 1 is considered done. No feature work (Snap, AI tutor, shop) begins until Phase 1 acceptance criteria are fully verified.

---

## Tech Stack Decisions

| Concern | Choice | Rationale |
|---|---|---|
| Mobile framework | Flutter (Dart) | Cross-platform with single codebase; replaces React Native per stakeholder decision |
| State management | Riverpod | Type-safe, testable, no BuildContext dependency; preferred over BLoC for this team size |
| Navigation | go_router | Declarative, supports deep links and route guards natively |
| Animation | @Kokoanimation | Proprietary Koko character package; Lottie/Rive explicitly prohibited |
| Backend | Cloud Run (Fastify) + Firestore | Unchanged from prior architecture; Flutter SDK replaces RN SDK calls |
| Auth | Firebase Auth (Google Sign-In) | 15-min ID token with auto-refresh; token forwarded on every API call |
| Local storage | SQLCipher | Encrypted at rest; no plaintext local DB |
| Local dev | Docker Compose (Firestore emulator + Redis) | Mirrors production topology; no live data during development |

---

## Task Breakdown

### Sprint 1 — Infrastructure (US-001, US-003)
- **Owner: Lead Engineer**
- Initialise Flutter project with correct `pubspec.yaml` dependencies
- Implement `lib/core/theme/tokens.dart` (colors, typography, spacing)
- Author `docker-compose.yml` with `firestore-emulator` and `redis` services
- Verify `flutter pub get` and `docker-compose up` both pass

### Sprint 2 — i18n + Navigation (US-002, US-005)
- **Owner: Frontend Engineer**
- Create all 6 ARB files (`app_en`, `app_th`, `app_zh`, `app_es`, `app_vi`, `app_lo`)
- Run `flutter gen-l10n` and wire `AppLocalizations` into `main.dart`
- Configure `go_router` with all 6 routes and auth guard redirect to `/onboarding`
- Implement 5-tab bottom nav shell

### Sprint 3 — Component Library + Animation (US-004, US-008)
- **Owner: Frontend Engineer + Designer**
- Build `KotokaButton`, `VocabCard`, `SensoryTagBar`, `KotokaTextField`, `ProgressRing`
- Implement `lib/core/widgets/koko_animation.dart` using `@Kokoanimation` only
- All components token-compliant; zero hardcoded values; RTL-ready

### Sprint 4 — Onboarding + Home (US-006, US-007)
- **Owner: Frontend Engineer**
- Build 7 onboarding screens with full i18n, PDPA consent checkboxes, KokoAnimation on Welcome/completion
- Build Home screen with streak counter, daily mission card, quick review CTA, mood tint overlay
- All mock data lines tagged `//MOCKDATA`

### Sprint 5 — Security + Docs (US-009, US-010)
- **Owner: Lead Engineer**
- Implement `lib/core/api/rate_limiter.dart` (token bucket, 60 RPM default, 14 RPM Gemini)
- Attach Firebase ID token interceptor to all API requests
- Write `README.md` and `REPORT.md`

---

## Architecture Decisions

- **Riverpod providers** live in `lib/core/providers/` and feature-level `providers/` subdirectories.
- **go_router** `redirect` callback reads auth state from a `StreamProvider` wrapping `FirebaseAuth.authStateChanges()`.
- **@Kokoanimation** widget wraps `KokoAnimationController` and exposes a `KokoState` enum (`idle`, `celebrating`, `thinking`, `error_warm`).
- **Rate limiter** uses an in-memory token bucket; state resets on app restart (server-side enforcement is the source of truth).
- **Design tokens** are Dart `const` values — not a theming extension — so they are tree-shaken at compile time.

---

## Dependencies and Constraints

- `@Kokoanimation` package must be available in the local path or private pub registry before Sprint 3 can start.
- Firebase project must be provisioned (google-services.json / GoogleService-Info.plist) before Sprint 4 auth flows can be tested end-to-end.
- Docker must be installed on all developer machines for Sprint 1 local emulator work.
- ARB translation strings for Thai, Lao, and Vietnamese require review by a native speaker before Phase 1 sign-off.

---

## Definition of Done

Phase 1 is complete when ALL of the following are true:

1. Every story in `.omc/prd.json` has `"passes": true`.
2. `flutter pub get` exits 0 with no dependency conflicts.
3. `docker-compose up` starts Firestore emulator on `:8080` and Redis on `:6379` without errors.
4. `flutter gen-l10n` generates `AppLocalizations` with no missing keys across all 6 locales.
5. No Lottie or Rive imports exist anywhere in `lib/`.
6. No hardcoded color, size, or spacing values exist outside `tokens.dart`.
7. All mock data lines carry the `//MOCKDATA` comment.
8. `REPORT.md` and `README.md` are present and accurate.
9. A code reviewer (separate context) has approved the diff with no blocking issues.
