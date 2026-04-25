# Phase 1 — UI/UX Implementation Plan (phase1_1)

**Owner:** Aria (PM) · **Stack:** Flutter + Riverpod + go_router · **Theme:** Teal-Purple
**Source:** GRAPH_REPORT.md (182 nodes, 17 communities) + PRD Phase 1 + DESIGN.md

---

## 1. Executive Summary

- Deliver Design Token system + 34-component library + 7 onboarding screens + Home screen, fully i18n (6 langs), KokoAnimation-driven, token-pure (no hardcoded values).
- Build atoms-up (tokens → atoms → molecules → organisms → screens) so every screen consumes only library widgets; SensoryTagBar mandatory on every VocabCard.
- Local dev runs against Docker Firestore emulator + Redis; all backend calls rate-limited (60 RPM default, 14 RPM Gemini), Gemini text rendered as `**bold**`.

---

## 2. Screen List & Component Breakdown

| ID | Screen | Atoms | Molecules | Organisms |
|----|--------|-------|-----------|-----------|
| ONB-01 | Splash / Language Pick | KokoLogo, TokenText, FlagIcon | LanguagePillRow | LanguageSelector |
| ONB-02 | Welcome (Koko wave) | TokenText, PrimaryButton | KokoStage(wave) | WelcomeHero |
| ONB-03 | Goal Selection | TokenText, ChipToken | GoalChipGrid | GoalPickerCard |
| ONB-04 | Level / Proficiency | TokenText, RadioToken, ProgressDot | LevelOptionRow | LevelPickerCard |
| ONB-05 | Notification Permission | TokenText, PrimaryButton, GhostButton | KokoStage(encourage) | PermissionPrompt |
| ONB-06 | Streak Promise | TokenText, StreakFlame | StreakCommitRow | StreakPromiseCard |
| ONB-07 | First Mission Intro | TokenText, PrimaryButton | KokoStage(excited), MissionTeaser | OnboardingComplete |
| HOME-01 | Home | StreakBadge, XPBar, IconBtn | StreakHeader, MissionCard, VocabCard(+SensoryTagBar) | HomeFeed, BottomNav |

---

## 3. Component Implementation Order (atoms → organisms)

**Wave 0 — Tokens & infra**
- `lib/core/theme/tokens.dart` (colors, spacing, radius, elevation, motion, typography ramps).
- `lib/core/theme/app_theme.dart` (ThemeData binding).
- `lib/core/i18n/` ARB scaffold (6 langs).
- `lib/core/router/app_router.dart` (go_router).
- `lib/core/api/rate_limiter.dart` (60 RPM default, 14 RPM Gemini bucket).

**Wave 1 — Atoms (12)**
TokenText, PrimaryButton, GhostButton, IconBtn, ChipToken, RadioToken, FlagIcon, StreakFlame, ProgressDot, XPBar, KokoLogo, Divider.

**Wave 2 — Molecules (14)**
LanguagePillRow, GoalChipGrid, LevelOptionRow, StreakCommitRow, MissionTeaser, KokoStage, StreakHeader, MissionCard, SensoryTagBar (mandatory), VocabCardBody, BottomNavItem, ToastBanner, LoadingShimmer, EmptyState.

**Wave 3 — Organisms (8)**
LanguageSelector, WelcomeHero, GoalPickerCard, LevelPickerCard, PermissionPrompt, StreakPromiseCard, OnboardingComplete, VocabCard (Body + SensoryTagBar), HomeFeed, BottomNav.

**Wave 4 — Screens** wire organisms into ONB-01…07 + HOME-01.

---

## 4. KokoAnimation State Mapping

| Screen | webp State | Trigger |
|--------|-----------|---------|
| ONB-01 | idle | mount |
| ONB-02 | wave | mount + loop |
| ONB-03 | thinking | user idle >2s |
| ONB-04 | thinking | mount |
| ONB-05 | encourage | mount |
| ONB-06 | excited | streak commit tap |
| ONB-07 | celebrate | mount |
| HOME-01 | idle (default), celebrate (streak++), encourage (mission start), thinking (Gemini loading) | state-driven via Riverpod `kokoStateProvider` |

Import: `package:kokoanimation/kokoanimation.dart`. Never Lottie/rive.

---

## 5. i18n Key List (initial)

Namespaces: `onb.*`, `home.*`, `common.*`, `a11y.*`.

- `common.continue`, `common.back`, `common.skip`, `common.allow`, `common.notNow`
- `onb.lang.title`, `onb.welcome.title`, `onb.welcome.sub`
- `onb.goal.title`, `onb.goal.travel`, `onb.goal.work`, `onb.goal.study`, `onb.goal.culture`
- `onb.level.title`, `onb.level.beginner`, `onb.level.intermediate`, `onb.level.advanced`
- `onb.notif.title`, `onb.notif.body`
- `onb.streak.title`, `onb.streak.commit`
- `onb.done.title`, `onb.done.cta`
- `home.streak.label`, `home.mission.title`, `home.vocab.empty`
- `a11y.koko.idle`, `a11y.koko.wave`, `a11y.koko.celebrate`, `a11y.koko.thinking`, `a11y.koko.encourage`, `a11y.koko.excited`

ARB files: `app_th.arb` (default), `app_en.arb`, `app_zh.arb`, `app_es.arb`, `app_vi.arb`, `app_lo.arb`.

---

## 6. Design Token Usage per Component Type

| Component Type | Tokens Used |
|---------------|-------------|
| Atom (Button) | `colors.primary` (#682069), `colors.onPrimary`, `radius.md`, `spacing.md`, `motion.fast`, `type.labelLg` |
| Atom (Text) | `type.*` ramp, `colors.textPrimary/Secondary`, `spacing.xs` |
| Molecule (Card) | `colors.surface`, `colors.bg` (#e8e1f0), `radius.lg`, `elevation.sm`, `spacing.lg` |
| Molecule (SensoryTagBar) | `colors.accent` (#00c8cc), `radius.pill`, `spacing.sm`, `type.tag` |
| Organism (KokoStage) | `spacing.xl`, `motion.med`, fixed asset size token `size.kokoStage` |
| Screen | `spacing.screenPad`, `colors.bg`, safe-area tokens |

Rule: zero literal hex / px / ms in widget code. CI lint rejects `Color(0x`, `EdgeInsets.all(<n>)`, `Duration(milliseconds:<n>)` outside `tokens.dart`.

---

## 7. Docker / Emulator Setup Checklist

- [ ] `docker-compose.yml` services: `firestore-emulator` (port 8080), `auth-emulator` (9099), `redis` (6379), `storage-emulator` (9199).
- [ ] `firebase.json` emulator block committed.
- [ ] `.env.local` with `FIRESTORE_EMULATOR_HOST=localhost:8080`, `FIREBASE_AUTH_EMULATOR_HOST=localhost:9099`.
- [ ] `lib/core/firebase/bootstrap.dart` switches to emulator when `kDebugMode`.
- [ ] Seed script `tools/seed_emulator.dart` loads mock vocab + mock user (tagged `//MOCKDATA`).
- [ ] `make dev` = `docker-compose up -d && flutter run`.
- [ ] Health check: `curl localhost:8080` returns Firestore UI.

---

## 8. Risks

1. **Token drift** — devs hardcode colors/sizes under deadline pressure. Mitigation: CI lint + PR template checkbox + `tokens.dart` as single source.
2. **i18n lag** — translations missing for zh/es/vi/lo at screen ship. Mitigation: ship with `en` fallback + `[MISSING]` flag in debug; block release on ARB completeness check.
3. **KokoAnimation asset weight** — 6 webp states × screens may bloat APK. Mitigation: lazy-load via `precacheImage` per route, audit size budget <2 MB total.

---

## 9. Definition of Done (per screen)

- [ ] Built only from library components (no inline widgets).
- [ ] Zero hardcoded colors/sizes/durations (lint passes).
- [ ] All strings via `AppLocalizations.of(context)`; 6 ARB files contain keys.
- [ ] KokoAnimation present where mapped (Section 4); state wired to Riverpod.
- [ ] SensoryTagBar present on every VocabCard instance.
- [ ] Mock data tagged `//MOCKDATA`.
- [ ] API calls go through `rate_limiter.dart`; Gemini calls render `**bold**`.
- [ ] Renders correctly at 360×640, 390×844, 768×1024.
- [ ] a11y: semantics labels for Koko states, min tap target 48dp, contrast AA.
- [ ] Golden test snapshot committed (light theme, en + th).
- [ ] Code review: `simplify` skill passed; verifier evidence attached.

---

**Next:** Confirm plan → handoff to `/oh-my-claudecode:start-work phase1_1`.
