# Phase 1.2 Implementation Checklist

**Team:** Leo (Atoms + Screens), Mia (Providers + i18n + Molecules), Rex (QA)
**Iteration:** delta over phase1_1 — addresses top-6 customer issues from vote 70.9
**Acceptance format:** `- [ ] [OWNER] [WAVE] Description — acceptance criterion`

---

## Wave 1 — New Atom [Leo]

- [ ] [Leo] [W1] `lib/widgets/atoms/focus_mode_toggle.dart` — `FocusModeToggle` is a labeled `Switch` atom using teal-purple tokens (`tokens.colors.primary` for active track, `tokens.colors.accent` for thumb); label reads `onb.welcome.focusToggle` i18n key; hint text reads `onb.welcome.focusToggleHint`; emits bool via `onChanged` callback to `kokoVisibleProvider`; min tap target 48dp; `Semantics` wraps with `a11y.focusToggle.on` / `a11y.focusToggle.off` from ARB — widget test covers on/off state, golden en+th committed

---

## Wave 2 — Modified Molecules [Leo, Mia]

- [ ] [Mia] [W2] `lib/widgets/molecules/koko_stage.dart` — wrap `build` body in `Consumer`; when `kokoVisibleProvider == false` return `SizedBox.shrink()` with same fixed dimensions as normal `tokens.size.kokoStage` (collapsed, preserves layout spacing); when false, skip `precacheImage` call entirely — widget test asserts `SizedBox.shrink()` returned when provider false; asset fetch skipped (no `precacheImage` invocation verifiable via mock); existing goldens unaffected when provider true

- [ ] [Mia] [W2] `lib/widgets/molecules/goal_chip_grid.dart` — expand chip set from 4 to 6: `{travel, workMeeting, emailWriting, presentation, study, culture}`; i18n keys `onb.goal.travel`, `onb.goal.workMeeting`, `onb.goal.emailWriting`, `onb.goal.presentation`, `onb.goal.study`, `onb.goal.culture`; grid layout reflows to 2×3 (2 columns, 3 rows); multi-select preserved — widget test verifies 6 chips render with no overflow at 360×640; updated golden en+th committed

- [ ] [Mia] [W2] `lib/widgets/molecules/streak_commit_row.dart` — add `gracePeriodCopy` slot below commit CTA; renders `TokenText` with i18n key `onb.commit.grace` ("Miss a day? You get 1 free pass per week."); slot is always visible (not conditional) — widget test verifies grace copy present below CTA button; updated golden committed

---

## Wave 2 — Riverpod Provider Updates [Mia]

- [ ] [Mia] [W2] `lib/providers/koko_visible_provider.dart` — `kokoVisibleProvider` as `StateProvider<bool>` with default `true`; persisted via `SharedPreferences` key `koko_visible`; restored on app cold start — unit test: toggle false → restart → provider reads false

- [ ] [Mia] [W2] `lib/providers/tooltip_seen_provider.dart` — `tooltipSeenProvider` as `StateProvider<bool>` with default `false`; persisted via `SharedPreferences` key `tooltip_sensory_seen`; writing `true` survives app restart — unit test: set true → restart → provider reads true

- [ ] [Mia] [W2] `lib/providers/goal_selection_provider.dart` — update `GoalOption` enum to `{travel, workMeeting, emailWriting, presentation, study, culture}` (removes old `work`; adds `workMeeting`, `emailWriting`, `presentation`); `goalSelectionProvider` continues as `StateProvider<Set<GoalOption>>` — unit test: enum has exactly 6 values; existing multi-select logic passes

---

## Wave 3 — New Organism [Leo]

- [ ] [Leo] [W3] `lib/widgets/organisms/commitment_card.dart` — `CommitmentCard` composes: `KokoStage(encourage)` at top; `TokenText` for `onb.commit.title`, `onb.commit.valueProp1`, `onb.commit.valueProp2`; `PrimaryButton` labeled `onb.commit.allow` (triggers FCM permission request); `GhostButton` labeled `common.notNow`; `StreakCommitRow` with grace copy; both buttons advance caller to next screen (via `onAllow` / `onNotNow` callbacks); replaces standalone `PermissionPrompt` + `StreakPromiseCard` organisms — widget test: both buttons invoke their callbacks; `KokoStage` present; grace copy visible; golden en+th committed

---

## Wave 4 — Screen Changes

### ONB-02 Welcome Screen — FocusModeToggle Integration [Leo]

- [ ] [Leo] [W4] `lib/screens/onboarding/onb_02_welcome.dart` — add `FocusModeToggle` atom below `WelcomeHero` body copy; wires directly to `kokoVisibleProvider` via `ref.read(...).state = value`; toggle takes effect from ONB-03 onward (Koko hidden or shown based on provider value); Scaffold bg = `KColors.brand50`; all strings via `AppLocalizations.of(context)` — golden test en+th updated, 3 breakpoints (360×640, 390×844, 768×1024); integration test: toggle off on ONB-02 → proceed to ONB-03 → `KokoStage` returns `SizedBox.shrink()`

### app_router.dart — 7 → 5 Onboarding Screens [Leo]

- [ ] [Leo] [W4] `lib/core/router/app_router.dart` — reduce onboarding route count from 7 to 5; route table: `ONB-01` (language), `ONB-02` (welcome + focus toggle), `ONB-03` (goal), `ONB-04` (level), `ONB-05` (commitment — merged notif + streak); remove old `ONB-05` (permission) and `ONB-06` (streak) as standalone routes; `ONB-06` (done/first-mission) renumbered from old `ONB-07`; all `go_router` paths updated consistently — router unit test: `goNamed('onb-05')` reaches `CommitmentCard` screen; no route resolves to deleted `PermissionPrompt` or `StreakPromiseCard` standalone screens; total named onboarding routes == 5

### ONB-05 Commitment Screen (merged) [Leo]

- [ ] [Leo] [W4] `lib/screens/onboarding/onb_05_commitment.dart` — new screen composes `CommitmentCard`; Scaffold bg = `KColors.brand50`; `KokoState=encourage` on mount → `excited` on streak commit tap (via `kokoStateProvider`); `onAllow` navigates to ONB-06; `onNotNow` also navigates to ONB-06; all strings via `AppLocalizations.of(context)` — golden test en+th committed, 3 breakpoints

### HOME-01 — SensoryTagBar ToastBanner [Mia]

- [ ] [Mia] [W4] `lib/screens/home/home_01.dart` — on first `VocabCard` render, check `tooltipSeenProvider`; if `false`, auto-show `ToastBanner` with `home.tooltip.sensoryTag` i18n key ("Tags show how a word feels — sound, sight, action. Tap to explore."); tap-to-dismiss writes `true` to `tooltipSeenProvider` (persisted); second app visit with provider `true` suppresses banner entirely — integration test: first mount → banner visible; dismiss → `tooltipSeenProvider == true`; second mount → banner absent

---

## Wave 0 — i18n ARB Updates [Mia]

### Add 13 new keys to all 6 ARB files (th, en, zh, es, vi, lo)

- [ ] [Mia] [W0] `app_th.arb`, `app_en.arb`, `app_zh.arb`, `app_es.arb`, `app_vi.arb`, `app_lo.arb` — add key `onb.welcome.focusToggle` ("Focus Mode (hide Koko)" in English) with locale-appropriate translation in each file — `flutter gen-l10n` passes; key present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.welcome.focusToggleHint` ("Minimal UI for professional use." in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.goal.workMeeting` ("Work Meeting" in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.goal.emailWriting` ("Email Writing" in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.goal.presentation` ("Presentation" in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.commit.title` ("Stay on track" in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.commit.valueProp1` ("Daily reminder at your chosen time." in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.commit.valueProp2` ("Streak nudge so you never break the chain." in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.commit.allow` ("Allow notifications" in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `onb.commit.grace` ("Miss a day? You get 1 free pass per week." in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `home.tooltip.sensoryTag` ("Tags show how a word feels — sound, sight, action. Tap to explore." in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `a11y.focusToggle.on` ("Focus mode on, Koko hidden" in English) — present in all 6 files

- [ ] [Mia] [W0] all 6 ARB files — add key `a11y.focusToggle.off` ("Focus mode off, Koko visible" in English) — present in all 6 files

### Remove onb.notif.* keys from all 6 ARB files

- [ ] [Mia] [W0] all 6 ARB files — delete key `onb.notif.title` from `app_th.arb`, `app_en.arb`, `app_zh.arb`, `app_es.arb`, `app_vi.arb`, `app_lo.arb`; replaced by `onb.commit.title` — `grep -r "onb.notif.title" lib/core/i18n/` returns empty after removal

- [ ] [Mia] [W0] all 6 ARB files — delete key `onb.notif.body` from all 6 ARB files; content folded into `onb.commit.valueProp1` + `onb.commit.valueProp2` — `grep -r "onb.notif.body" lib/core/i18n/` returns empty after removal

- [ ] [Mia] [W0] `flutter gen-l10n` runs without error after all 13 additions and 2 removals; no `[MISSING]` placeholder in `en` locale build — CI gen-l10n step passes clean

---

## QA Gates [Rex] — Phase 1.2 Delta

- [ ] [Rex] [QA] Onboarding end-to-end flow completes in exactly 5 screens (ONB-01 → ONB-02 → ONB-03 → ONB-04 → ONB-05 → ONB-06); no route navigates to a 6th or 7th onboarding screen — integration test with `WidgetTester` traverses full flow, counts distinct screens == 5 pre-HOME

- [ ] [Rex] [QA] `FocusModeToggle` toggled off on ONB-02 hides `KokoStage` on ONB-03, ONB-04, ONB-05, ONB-06, and HOME-01; toggle state persists after app cold restart — integration test + `SharedPreferences` mock confirms persistence

- [ ] [Rex] [QA] `KokoStage` returns `SizedBox.shrink()` (no child, same layout slot) when `kokoVisibleProvider == false`; no `precacheImage` call made in that state — widget test with provider override asserts widget type is `SizedBox` and no image cache side-effects

- [ ] [Rex] [QA] `GoalChipGrid` renders exactly 6 chips; no overflow at 360×640 smallest breakpoint — layout test at 360×640 passes with zero overflow pixels

- [ ] [Rex] [QA] `CommitmentCard` renders `PrimaryButton(onb.commit.allow)` + `GhostButton(common.notNow)` + grace copy + `StreakCommitRow`; both buttons fire navigation to ONB-06 — widget test taps each button, verifies `onAllow` and `onNotNow` callbacks invoked

- [ ] [Rex] [QA] `ToastBanner` auto-shows on first HOME-01 mount only; `tooltipSeenProvider` written `true` on dismiss; banner absent on second mount — integration test mounts HOME-01 twice, asserts banner present only on first

- [ ] [Rex] [QA] All 13 new i18n keys present in all 6 ARB files; `onb.notif.title` and `onb.notif.body` absent from all 6 ARB files — `flutter gen-l10n` clean + `grep` assertions pass

- [ ] [Rex] [QA] No usage of deleted `onb.notif.*` keys anywhere in `lib/` — `grep -r "onb.notif" lib/` returns empty

- [ ] [Rex] [QA] Goldens updated for: `FocusModeToggle` (on/off), `GoalChipGrid` (6 chips), `StreakCommitRow` (with grace copy), `CommitmentCard`, `onb_02_welcome` (with toggle), `onb_05_commitment` — all committed in `test/goldens/`, `flutter test` passes with zero golden failures

- [ ] [Rex] [QA] Customer re-vote with 30 SEA personas scores average **≥ 85** — vote run recorded; score documented in phase1_2 vote log
