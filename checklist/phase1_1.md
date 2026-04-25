# Phase 1 Implementation Checklist — phase1_1

**Team:** Mia (Infra), Leo (Atoms + Screens ONB-01..04), Kai (Molecules + Organisms), Rex (QA)
**Acceptance format:** `- [ ] [OWNER] [WAVE] Description — acceptance criterion`

---

## Wave 0 — Infra [Mia]

### Design Tokens
- [ ] [Mia] [W0] `lib/core/theme/tokens.dart` defines teal-purple color palette: primary `#682069`, bg `#e8e1f0`, accent `#00c8cc`, success `#10B981`, error `#F87171` — no literal hex anywhere else in `lib/`
- [ ] [Mia] [W0] `tokens.dart` exports spacing scale (xs, sm, md, lg, xl, screenPad), radius scale (sm, md, lg, pill), elevation scale (sm, md), motion durations (fast, med, slow), and typography ramps (labelLg, tag, bodyMd, bodySm, headingSm, headingMd) — all values referenced by name, never literal
- [ ] [Mia] [W0] `lib/core/theme/app_theme.dart` constructs `ThemeData` exclusively from `tokens.dart` values — `flutter analyze` passes, no `Color(0x`, no `EdgeInsets.all(<n>)`, no `Duration(milliseconds:<n>)` in this file

### i18n
- [ ] [Mia] [W0] `lib/core/i18n/app_th.arb` exists and contains all keys: `common.*` (continue, back, skip, allow, notNow), `onb.*` (all onboarding keys), `home.*` (streak.label, mission.title, vocab.empty), `a11y.*` (koko states: idle, wave, celebrate, thinking, encourage, excited) — Thai is the default locale
- [ ] [Mia] [W0] `lib/core/i18n/app_en.arb` exists with all same keys as `app_th.arb` — English values present for every key, no `[MISSING]` in release build
- [ ] [Mia] [W0] `lib/core/i18n/app_zh.arb` exists with all same keys — Mandarin values or `[MISSING]` debug flag present
- [ ] [Mia] [W0] `lib/core/i18n/app_es.arb` exists with all same keys — Spanish values or `[MISSING]` debug flag present
- [ ] [Mia] [W0] `lib/core/i18n/app_vi.arb` exists with all same keys — Vietnamese values or `[MISSING]` debug flag present
- [ ] [Mia] [W0] `lib/core/i18n/app_lo.arb` exists with all same keys — Lao values or `[MISSING]` debug flag present
- [ ] [Mia] [W0] `pubspec.yaml` declares `flutter_localizations` and `intl` dependencies; `l10n.yaml` points to `lib/core/i18n/` — `flutter gen-l10n` runs without error

### Rate Limiter
- [ ] [Mia] [W0] `lib/core/api/rate_limiter.dart` implements default bucket: 60 req/min per user — bucket enforced on all non-Gemini API calls
- [ ] [Mia] [W0] `lib/core/api/rate_limiter.dart` implements Gemini bucket: 14 RPM — bucket enforced on all Gemini API calls
- [ ] [Mia] [W0] `rate_limiter.dart` exposes `RateLimiter.wrap(fn, bucket)` or equivalent; every API call site imports and calls it — no raw `http.get/post` without rate limiter wrapper

### Docker / Emulator
- [ ] [Mia] [W0] `docker-compose.yml` defines service `firestore-emulator` on port 8080 — `curl localhost:8080` returns Firestore emulator UI after `docker-compose up`
- [ ] [Mia] [W0] `docker-compose.yml` defines service `auth-emulator` on port 9099 — Firebase Auth emulator reachable at `localhost:9099`
- [ ] [Mia] [W0] `docker-compose.yml` defines service `redis` on port 6379 — Redis responds to `PING` at `localhost:6379`
- [ ] [Mia] [W0] `docker-compose.yml` defines service `storage-emulator` on port 9199 — Cloud Storage emulator reachable at `localhost:9199`
- [ ] [Mia] [W0] `firebase.json` contains emulator block with all four ports committed — `firebase emulators:start` uses same ports
- [ ] [Mia] [W0] `.env.local` contains `FIRESTORE_EMULATOR_HOST=localhost:8080` and `FIREBASE_AUTH_EMULATOR_HOST=localhost:9099` — listed in `.gitignore`, not committed
- [ ] [Mia] [W0] `lib/core/firebase/bootstrap.dart` switches all Firebase calls to emulator when `kDebugMode == true` — prod build hits real Firebase
- [ ] [Mia] [W0] `tools/seed_emulator.dart` creates mock vocab entries and mock user; every mock value has `//MOCKDATA` on same line — `dart run tools/seed_emulator.dart` completes without error
- [ ] [Mia] [W0] `Makefile` target `dev` runs `docker-compose up -d && flutter run` — `make dev` launches app against emulators

---

## Wave 1 — Atoms [Leo] (12 widgets)

- [ ] [Leo] [W1] `lib/widgets/atoms/token_text.dart` — `TokenText` widget wraps `Text` with mandatory `textStyle` from `tokens.dart` type ramp; accepts `semanticsLabel`; no hardcoded `TextStyle` values — widget test passes, golden en+th committed
- [ ] [Leo] [W1] `lib/widgets/atoms/primary_button.dart` — `PrimaryButton` uses `tokens.colors.primary`, `tokens.radius.md`, `tokens.spacing.md`, `tokens.motion.fast`; min tap target 48dp; accepts `onPressed`, `label` (i18n string); disabled state visible — widget test + golden committed
- [ ] [Leo] [W1] `lib/widgets/atoms/ghost_button.dart` — `GhostButton` uses outline style from tokens; min tap target 48dp; matches `PrimaryButton` API shape — widget test + golden committed
- [ ] [Leo] [W1] `lib/widgets/atoms/icon_btn.dart` — `IconBtn` wraps `IconButton` with 48dp min touch area; icon from Material Symbols or Flutter Icons only; no AI-generated image assets — widget test passes
- [ ] [Leo] [W1] `lib/widgets/atoms/chip_token.dart` — `ChipToken` uses `tokens.colors.surface`, `tokens.radius.pill`, `tokens.type.tag`; supports selected/unselected states; no hardcoded colors — widget test + golden committed
- [ ] [Leo] [W1] `lib/widgets/atoms/radio_token.dart` — `RadioToken` renders radio button from token colors; accessible with semantics label; passes contrast AA — widget test passes
- [ ] [Leo] [W1] `lib/widgets/atoms/flag_icon.dart` — `FlagIcon` renders language flag from documented CDN source or Flutter Icons; no AI-generated images; accepts `languageCode` (th, en, zh, es, vi, lo) — widget test passes for all 6 codes
- [ ] [Leo] [W1] `lib/widgets/atoms/streak_flame.dart` — `StreakFlame` displays streak count with flame icon from Material Symbols; uses `tokens.colors.accent`; no Lottie/rive — widget test passes
- [ ] [Leo] [W1] `lib/widgets/atoms/progress_dot.dart` — `ProgressDot` renders filled/empty dot from token colors; accepts `filled` bool and `size` token — widget test passes
- [ ] [Leo] [W1] `lib/widgets/atoms/xp_bar.dart` — `XPBar` renders horizontal progress bar using token colors and radius; accepts `current` and `max` int; no hardcoded sizes — widget test + golden committed
- [ ] [Leo] [W1] `lib/widgets/atoms/koko_logo.dart` — `KokoLogo` renders app logo from `assets/`; no AI-generated image; accepts `size` token — widget test passes
- [ ] [Leo] [W1] `lib/widgets/atoms/divider_token.dart` — `DividerToken` renders divider using `tokens.colors.surface` and token thickness; replaces all `Divider()` usages — widget test passes

---

## Wave 2 — Molecules [Kai] (14 widgets)

- [ ] [Kai] [W2] `lib/widgets/molecules/language_pill_row.dart` — `LanguagePillRow` renders a `FlagIcon` + language label row for each of 6 languages; selected language highlighted via token; fires `onLanguageSelected(String langCode)` callback — widget test covers all 6 selections, golden en+th committed
- [ ] [Kai] [W2] `lib/widgets/molecules/goal_chip_grid.dart` — `GoalChipGrid` renders 4 `ChipToken` items (travel, work, study, culture) using `onb.goal.*` i18n keys; fires `onGoalSelected(String goal)`; supports multi-select — widget test + golden committed
- [ ] [Kai] [W2] `lib/widgets/molecules/level_option_row.dart` — `LevelOptionRow` renders `RadioToken` + `TokenText` for one proficiency level; used in a `ListView` by `LevelPickerCard`; fires `onSelected` — widget test passes
- [ ] [Kai] [W2] `lib/widgets/molecules/koko_stage.dart` — `KokoStage` loads webp animation via `package:kokoanimation/kokoanimation.dart`; accepts `KokoState` enum (idle, wave, thinking, encourage, excited, celebrate); uses `tokens.size.kokoStage` for fixed size; lazy-loaded via `precacheImage`; never imports Lottie/rive — widget test for each state, golden for idle committed
- [ ] [Kai] [W2] `lib/widgets/molecules/sensory_tag_bar.dart` — `SensoryTagBar` renders horizontal scrollable row of sensory tags using `tokens.colors.accent`, `tokens.radius.pill`, `tokens.type.tag`; mandatory on every `VocabCardBody` instance — widget test + golden committed
- [ ] [Kai] [W2] `lib/widgets/molecules/vocab_card_body.dart` — `VocabCardBody` renders word, definition, example using `TokenText`; always includes `SensoryTagBar` as child; uses `tokens.colors.surface`, `tokens.radius.lg`, `tokens.elevation.sm` — widget test verifies `SensoryTagBar` presence, golden committed
- [ ] [Kai] [W2] `lib/widgets/molecules/mission_card.dart` — `MissionCard` renders mission title (`home.mission.title`), progress indicator, and `IconBtn`; uses token card styles; mock data tagged `//MOCKDATA` — widget test + golden committed
- [ ] [Kai] [W2] `lib/widgets/molecules/streak_header.dart` — `StreakHeader` renders `StreakFlame` + streak count + `home.streak.label` i18n key; uses token spacing — widget test passes
- [ ] [Kai] [W2] `lib/widgets/molecules/toast_banner.dart` — `ToastBanner` renders success/error/info variants using token colors (success `#10B981`, error `#F87171`); accessible with semantics — widget test for all 3 variants
- [ ] [Kai] [W2] `lib/widgets/molecules/loading_shimmer.dart` — `LoadingShimmer` renders shimmer placeholder using token surface colors; no hardcoded animation durations (uses `tokens.motion.med`) — widget test passes
- [ ] [Kai] [W2] `lib/widgets/molecules/empty_state.dart` — `EmptyState` renders `KokoLogo` + `TokenText` with `home.vocab.empty` i18n key; no hardcoded strings — widget test en+th passes
- [ ] [Kai] [W2] `lib/widgets/molecules/bottom_nav_item.dart` — `BottomNavItem` renders icon + label using token colors; selected/unselected states from tokens; min tap 48dp — widget test passes
- [ ] [Kai] [W2] `lib/widgets/molecules/streak_commit_row.dart` — `StreakCommitRow` renders streak day indicators + commit CTA using `onb.streak.commit` i18n key; fires `onCommit` callback — widget test passes, golden committed
- [ ] [Kai] [W2] `lib/widgets/molecules/mission_teaser.dart` — `MissionTeaser` renders first mission preview using `onb.done.cta` i18n key and `MissionCard` molecule; mock data tagged `//MOCKDATA` — widget test passes

---

## Wave 3 — Organisms [Kai] (8)

- [ ] [Kai] [W3] `lib/widgets/organisms/language_selector.dart` — `LanguageSelector` composes `LanguagePillRow` inside a scrollable card; updates Riverpod locale provider on selection; Scaffold bg = `KColors.brand50` — integration test covers all 6 language selections
- [ ] [Kai] [W3] `lib/widgets/organisms/welcome_hero.dart` — `WelcomeHero` composes `KokoStage(wave)` + `TokenText` (onb.welcome.title, onb.welcome.sub) + `PrimaryButton` (common.continue); KokoState=wave wired on mount — widget test + golden en+th committed
- [ ] [Kai] [W3] `lib/widgets/organisms/goal_picker_card.dart` — `GoalPickerCard` composes `GoalChipGrid` + `PrimaryButton`; selected goals stored in Riverpod `goalProvider`; `KokoStage(thinking)` shown on user idle >2s — widget test + golden committed
- [ ] [Kai] [W3] `lib/widgets/organisms/level_picker_card.dart` — `LevelPickerCard` composes `LevelOptionRow` list (beginner/intermediate/advanced) + `PrimaryButton`; selection stored in Riverpod `levelProvider`; `KokoStage(thinking)` on mount — widget test + golden committed
- [ ] [Kai] [W3] `lib/widgets/organisms/permission_prompt.dart` — `PermissionPrompt` composes `KokoStage(encourage)` + `TokenText` (onb.notif.title, onb.notif.body) + `PrimaryButton` (common.allow) + `GhostButton` (common.notNow); triggers FCM permission request on allow — widget test + golden committed
- [ ] [Kai] [W3] `lib/widgets/organisms/streak_promise_card.dart` — `StreakPromiseCard` composes `StreakCommitRow` + `KokoStage`; KokoState switches to excited on commit tap via `kokoStateProvider`; uses `onb.streak.title` — widget test verifies state transition
- [ ] [Kai] [W3] `lib/widgets/organisms/onboarding_complete.dart` — `OnboardingComplete` composes `KokoStage(celebrate)` + `TokenText` (onb.done.title) + `PrimaryButton` (onb.done.cta) + `MissionTeaser`; navigates to HOME-01 on CTA tap — widget test + golden en+th committed
- [ ] [Kai] [W3] `lib/widgets/organisms/home_feed.dart` — `HomeFeed` composes `StreakHeader` + list of `MissionCard` + `VocabCardBody`+`SensoryTagBar`; `EmptyState` shown when list empty; backed by Riverpod feed provider; `KokoState` driven by `kokoStateProvider` — integration test covers empty + populated states

---

## Wave 4 — Screens

### Onboarding Screens [Leo]

- [ ] [Leo] [W4] `lib/screens/onboarding/onb_01_language.dart` (ONB-01) — composes `LanguageSelector`; Scaffold bg = `KColors.brand50`; `KokoState=idle` on mount; all strings via `AppLocalizations.of(context)` — golden test en+th committed, renders at 360×640 + 390×844 + 768×1024
- [ ] [Leo] [W4] `lib/screens/onboarding/onb_02_welcome.dart` (ONB-02) — composes `WelcomeHero`; Scaffold bg = `KColors.brand50`; `KokoState=wave` on mount + loop; all strings via `AppLocalizations.of(context)` — golden test en+th committed, 3 breakpoints
- [ ] [Leo] [W4] `lib/screens/onboarding/onb_03_goal.dart` (ONB-03) — composes `GoalPickerCard`; Scaffold bg = `KColors.brand50`; `KokoState=thinking` on user idle >2s; all strings via `AppLocalizations.of(context)` — golden test en+th committed, 3 breakpoints
- [ ] [Leo] [W4] `lib/screens/onboarding/onb_04_level.dart` (ONB-04) — composes `LevelPickerCard`; Scaffold bg = `KColors.brand50`; `KokoState=thinking` on mount; all strings via `AppLocalizations.of(context)` — golden test en+th committed, 3 breakpoints

### Onboarding Screens [Mia]

- [ ] [Mia] [W4] `lib/screens/onboarding/onb_05_permission.dart` (ONB-05) — composes `PermissionPrompt`; Scaffold bg = `KColors.brand50`; `KokoState=encourage` on mount; all strings via `AppLocalizations.of(context)` — golden test en+th committed, 3 breakpoints
- [ ] [Mia] [W4] `lib/screens/onboarding/onb_06_streak.dart` (ONB-06) — composes `StreakPromiseCard`; Scaffold bg = `KColors.brand50`; `KokoState=excited` on streak commit tap; all strings via `AppLocalizations.of(context)` — golden test en+th committed, 3 breakpoints
- [ ] [Mia] [W4] `lib/screens/onboarding/onb_07_done.dart` (ONB-07) — composes `OnboardingComplete`; Scaffold bg = `KColors.brand50`; `KokoState=celebrate` on mount; all strings via `AppLocalizations.of(context)`; navigates to HOME-01 — golden test en+th committed, 3 breakpoints

### Home Screen [Mia]

- [ ] [Mia] [W4] `lib/screens/home/home_01.dart` (HOME-01) — composes `HomeFeed` + `BottomNav`; Scaffold bg = `KColors.brand50`; `kokoStateProvider` drives KokoState: idle (default), celebrate (streak++), encourage (mission start), thinking (Gemini loading); all Gemini text rendered with `**bold**` markers; all strings via `AppLocalizations.of(context)`; mock data tagged `//MOCKDATA` — golden test en+th committed, 3 breakpoints

---

## QA Gates [Rex]

### Static Analysis
- [ ] [Rex] [QA] No `Color(0x` literal in any file under `lib/` except `tokens.dart` — `grep -r "Color(0x" lib/ | grep -v tokens.dart` returns empty
- [ ] [Rex] [QA] No hardcoded `EdgeInsets.all(<number>)` in any file under `lib/` except `tokens.dart` — CI lint rule passes
- [ ] [Rex] [QA] No hardcoded `Duration(milliseconds:<number>)` in any file under `lib/` except `tokens.dart` — CI lint rule passes
- [ ] [Rex] [QA] All raw strings replaced: every user-visible string uses `AppLocalizations.of(context)` — `grep -r '"[A-Z]' lib/screens lib/widgets` returns no matches outside ARB files

### Animation
- [ ] [Rex] [QA] KokoAnimation import is `package:kokoanimation/kokoanimation.dart` throughout — `grep -r "import.*lottie\|import.*rive" lib/` returns empty
- [ ] [Rex] [QA] Every screen listed in KokoAnimation state map (Section 4 of plan) has `KokoStage` present and `kokoStateProvider` wired — manual review of 8 screen files confirms

### Rate Limiting
- [ ] [Rex] [QA] `rate_limiter.dart` wired to all API call sites — `grep -r "http.get\|http.post\|dio.get\|dio.post" lib/ | grep -v rate_limiter` returns empty
- [ ] [Rex] [QA] Gemini endpoints use 14 RPM bucket — unit test for `RateLimiter` confirms Gemini bucket config

### Mock Data
- [ ] [Rex] [QA] Every mock data value has `//MOCKDATA` comment on same line — `grep -rn "//MOCKDATA" lib/ tools/` lists all expected seed values

### Accessibility
- [ ] [Rex] [QA] All `KokoStage` instances have `a11y.*` semantics labels from ARB — widget tests assert `Semantics` wrapper present
- [ ] [Rex] [QA] All interactive elements have min tap target 48dp — `flutter analyze` + manual spot-check confirms

### Golden Tests
- [ ] [Rex] [QA] Golden snapshot committed for every atom, molecule, organism, and screen in both `en` and `th` locales, light theme — `flutter test --update-goldens` passes clean, files committed to `test/goldens/`
- [ ] [Rex] [QA] No golden regression on re-run after final token update — `flutter test` passes with zero failures
