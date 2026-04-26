# Kotoka UX 14-Issue Implementation Plan

**Source spec:** `.omc/specs/deep-interview-ux-14issues.md`
**Stack:** Flutter + Riverpod + go_router + ARB l10n (6 locales).
**ARB locales requiring sync per new key:** `app_en.arb`, `app_th.arb`, `app_zh.arb`, `app_es.arb`, `app_vi.arb`, `app_lo.arb` — regen via `flutter gen-l10n` after every batch.

## Pre-flight
1. `flutter pub get` clean.
2. After every ARB edit batch: `flutter gen-l10n` — do NOT hand-edit generated `app_localizations*.dart`.
3. Android emulator validation per CLAUDE.md after each phase.

---

## PHASE 1 — RED (P0, blocking)

### 1.1 SHO-03 — Hide paywall / pricing during beta
**File:** `lib/screens/shop/shop_screen.dart`
- Replace `_PremiumCard` body with "Beta — Free Access" banner (`KColors.brand500` bg, new ARB keys).
- Change "Get" buttons to no-op snackbar with `l10n.shopBetaUnlocked`.
- Remove XP balance from AppBar actions.

**New ARB keys (all 6 locales):**
- `shopBetaFreeTitle` — "Beta — Free Access"
- `shopBetaFreeBody` — "All packs and Premium features are free during beta."
- `shopBetaFree` — "Free in beta"
- `shopBetaUnlocked` — "Unlocked — already yours during beta"

**Acceptance:** No paywall/CTA-to-pay anywhere; Shop screen shows "Beta — Free Access".

### 1.2 SNA-01 — Camera "Snap & Learn" simplification
**File:** `lib/screens/snap/snap_screen.dart`
- Hide `_SnapTabSwitcher` and `SensoryTagBar` by default behind a `_advancedOpen` bool.
- Add "•••" `IconButton` in AppBar.actions to toggle `_advancedOpen`.
- Default open = clean viewfinder + single shutter button only.

**No new ARB keys. No new providers.**
**Acceptance:** First open shows ONLY viewfinder + shutter; advanced controls behind "•••".

### 1.3 REV-02 — Flashcard 4-rating labels
**File:** `lib/screens/review/review_flashcard_screen.dart`
- Change 3 buttons → 4. Rename: Again→"Missed it" | Hard→"Almost" | Good→"Got it!" (new) | Easy→"Too easy".
- Colors: Again=error (red), Hard=warning (orange), Good=success (green), Easy=brand500 (blue/teal).
- Use `Wrap` with `spacing: KSpacing.sp8` or `Expanded` flex to fit 4 buttons.
- Update `_rate()` to accept `'again'|'hard'|'good'|'easy'`.

**ARB changes (all 6 locales):**
- ADD `reviewRateAgain` — "Missed it"
- MODIFY `reviewRateHard` → "Almost"
- ADD `reviewRateGood` — "Got it!"
- MODIFY `reviewRateEasy` → "Too easy"
- DEPRECATE/REMOVE `reviewRateOk`

**Acceptance:** 4 buttons, plain-language labels, distinct colors, all 6 locales.

---

## PHASE 2 — ORANGE (P1)

### 2.1 ONB-01 — App tagline update
**File:** `lib/screens/onboarding/welcome_screen.dart` — code unchanged, ARB value only.

**ARB change (all 6 locales):**
- MODIFY `tagline` → "Snap your world, speak any languages"
- Provide native translations: th/zh/es/vi/lo.

### 2.2 ONB-04 — Language swap → dropdowns
**Finding:** Already implemented as two `_LangDropdown` widgets. No swap button exists in code.
**Action:** Add comment `// ONB-04: dropdown-based pair selection (no swap button)` at line 60 of `lib/screens/onboarding/language_select_screen.dart`. Mark as resolved.

### 2.3 ONB-03 — Permissions plain-language reasons
**File:** `lib/screens/onboarding/pdpa_consent_screen.dart`
- Change `_expanded` initialization (line ~40) to `{'camera', 'location', 'microphone'}` so reasons show by default.
- Notifications are optional (already handled in `commitment_screen.dart`).

**ARB value changes (all 6 locales):**
- MODIFY `pdpaCameraReason` → "to snap & learn new words from the world around you"
- MODIFY `pdpaMicrophoneReason` → "so Kotoka can hear your pronunciation and guide you"
- ADD `pdpaNotificationReason` → "for your daily study reminder (you can turn this off anytime)"

### 2.4 HOM-01a — Remove Mission ARB keys (no UI widget exists)
**Finding:** No Mission widget rendered on home screen. ARB keys exist but are unused.
**Action:** Delete unused ARB keys from all 6 locales: `homeMissions`, `homeTodaysMission`, `homeMissionReview`, `homeMissionNewWords`, `homeMissionProgress`. Regen localizations.

### 2.5 HOM-01b — Bottom-nav badge on Review tab
**New file:** `lib/core/providers/due_cards_provider.dart`
```dart
final dueCardsCountProvider = StateProvider<int>((ref) => 12); //MOCKDATA
```

**File:** `lib/core/widgets/bottom_tab_bar.dart`
- Convert to `ConsumerWidget`. Watch `dueCardsCountProvider`.
- In `_TabButton`, wrap Icon in Stack with red numeric badge when `badgeCount > 0`.

**File:** `lib/core/router/app_router.dart`
- Convert `ScaffoldWithNavBar` to `ConsumerWidget`.
- When index==2 (Review) AND `dueCount > 0`: `goBranch(2)` then push `ReviewFlashcardScreen` directly.

**New provider:** `dueCardsCountProvider` (StateProvider<int>, 12 stub //MOCKDATA).
**Acceptance:** Review tab shows "12" badge; tap jumps to flashcard session; badge gone at 0.

---

## PHASE 3 — YELLOW (P2)

### 3.1 ONB-05 — Graduate/Child card behavior on level select
**File:** `lib/screens/onboarding/level_select_screen.dart`
- Add emoji prefix: 👶 Beginner / 📘 Intermediate / 🎓 Advanced in `_LevelCard`.
- Make Advanced (🎓) and Beginner (👶) one-tap shortcuts: on tap, set level + auto-advance to next onboarding step via `WidgetsBinding.instance.addPostFrameCallback((_) => context.go('/onboarding/commitment'))`.
- Intermediate keeps two-step (select → Continue).

**No new ARB keys.**

### 3.2 ONB-06 — Skip pricing screen
**Finding:** No pricing/tier route exists in onboarding flow. Already handled by 1.1 (Shop screen). Mark N/A.

### 3.3 ONB-07 — Post-onboarding summary screen
**New file:** `lib/screens/onboarding/summary_screen.dart`
- Layout: KokoAnimation(celebrating) + "You're all set!" h2 + body + card (language pair, level, daily goal) + "Start learning" CTA → `context.go('/home')`.
- Move `authCompletedProvider` flip here from `mission_screen.dart`.

**New file:** `lib/core/providers/onboarding_providers.dart`
```dart
final selectedLanguagePairProvider = StateProvider<Map<String,String>?>((ref) => null);
final selectedLevelProvider = StateProvider<String?>((ref) => null);
final dailyGoalMinutesProvider = StateProvider<int?>((ref) => null);
```
Wire setters in: `language_select_screen.dart`, `level_select_screen.dart`, `schedule_screen.dart`.

**Router:** `lib/core/router/app_router.dart`
- Add `GoRoute(path: 'summary', ...)` after mission route.
- Update `mission_screen.dart` CTA: `context.go('/onboarding/summary')` instead of `/home`.

**New ARB keys (all 6 locales):**
- `onbSummaryTitle` — "You're all set!"
- `onbSummaryBody` — "Here's your learning setup:"
- `onbSummaryLanguagePair` — "Languages"
- `onbSummaryLevel` — "Level"
- `onbSummaryDailyGoal` — "Daily goal"
- `onbSummaryStart` — "Start learning"

### 3.4 LIMITED OFFER banner
**Finding:** No occurrence in `lib/`. Already resolved by 1.1. Mark N/A.

---

## Out of Scope (per spec)
- Dark mode
- Currency locale
- Pricing tiers
- Placement test
- Manual camera controls

---

## Parallelization Groups
| Group | Files | Phase |
|-------|-------|-------|
| A — l10n bulk | All 6 `app_*.arb` + regen | All phases — batch ARB edits, regen once per phase |
| B — Snap | `snap_screen.dart` | 1.2 |
| C — Review | `review_flashcard_screen.dart` | 1.3 |
| D — Shop | `shop_screen.dart` | 1.1 |
| E — Home + nav | `home_screen.dart`, `bottom_tab_bar.dart`, `app_router.dart`, NEW `due_cards_provider.dart` | 2.4+2.5 |
| F — Onboarding | `level_select_screen.dart`, `pdpa_consent_screen.dart`, `mission_screen.dart`, NEW `summary_screen.dart`, `app_router.dart`, NEW `onboarding_providers.dart` | 2.3+3.1+3.3 |

## New Files
- `lib/core/providers/due_cards_provider.dart`
- `lib/core/providers/onboarding_providers.dart`
- `lib/screens/onboarding/summary_screen.dart`

## Verification Gate
After each phase: build APK → install on Android emulator → screenshot-verify AC for each fix before proceeding.
