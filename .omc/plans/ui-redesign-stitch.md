# Kotoka UI Redesign — STITCH Design System
> Consensus plan from ralplan workflow | 2026-04-26

## RALPLAN-DR Summary

### Principles
1. **UI-only surgery** — replace `build()` methods only; never touch providers, routes, ARB, or Firebase.
2. **Token-driven** — every color/space/radius from `KColors`/`KSpacing`/`KRadius`. Zero hex in screens.
3. **Cyan-dominant** — every screen has a prominent `KColors.brand400` element (per STITCH rule).
4. **Mascot via KokoAnimation only** — no Lottie/Rive; correct asset per STITCH guide.
5. **Verify on emulator each screen** — no screen marked done without an Android screenshot.

### Decision Drivers
1. Risk of breaking i18n / Riverpod state during widget tree rewrites.
2. Visual coherence across 22 screens (shared primitives reduce drift).
3. Token gaps — STITCH page bg `#f8f9ff` and bento spacing not yet in tokens.

### Viable Options
- **Option A — Shared primitives first, then screens** *(recommended)*. Build `KCard`, `KCtaButton`, `KCyanPill`, `KAmbientOrbs`, `KStitchScaffold`, `KStepProgress`, `KKokoBadge` once; screens consume them.
- **Option B — Screen-by-screen direct rewrite**. Immediately visible progress but drift risk and token enforcement is harder.

### Recommended Approach
**Option A.** Phase 1 invests one day in shared widgets + token additions; Phases 2–4 rewrite screens by composition. Lowers regression risk and matches brownfield constraint.

### ADR
- **Decision:** Shared-primitives-first rewrite (Option A)
- **Drivers:** consistency, token enforcement, brownfield safety
- **Alternatives considered:** Option B direct rewrites — rejected for drift risk
- **Consequences:** ~1 day Phase 1 cost; Phases 2–4 accelerate; future screens reuse kit
- **Follow-ups:** dark-mode pass (out of scope); replace map placeholder with real map widget

---

## Implementation Plan

### Phase 1a — Token + Theme Foundation (no new widgets yet)

1. **`lib/core/theme/tokens.dart`** — Add `static const Color pageBg = Color(0xFFF8F9FF);` explicitly. **DO NOT alias to `neutral50` (`#F8F9FA` — wrong value)**. Confirm `brand400/500/700` present.
2. **`lib/core/theme/app_theme.dart`** — `scaffoldBackgroundColor → KColors.pageBg`; `cardTheme` border `brand400.withOpacity(0.20)`, radius 12.
3. **`lib/core/widgets/k_ambient_orbs.dart`** — Stack-based blur orbs, `IgnorePointer`, top-right `brand50/10` + bottom-left `sky100/10`, `-z-10` equivalent (`Positioned` behind content).
4. **`lib/core/widgets/k_stitch_scaffold.dart`** — API signature: `KStitchScaffold({required Widget body, Widget? stickyHeader, bool showOrbs = true, Key? key})`. Wraps `Scaffold` with `KAmbientOrbs` behind body. **Does NOT own `ScaffoldMessenger`** — callers continue to use `ScaffoldMessenger.of(context)` directly to avoid snackbar coupling (`home_screen.dart:59`).
5. **`lib/core/widgets/bottom_tab_bar.dart`** — Fix theme-awareness per CLAUDE.md nav rules: replace `KColors.neutral0` → `theme.colorScheme.surface`; border → `theme.colorScheme.outline`; inactive icon/label → `theme.colorScheme.onSurfaceVariant`.

### Phase 1b — Pilot Screens → Extract Primitives (rule-of-three)

6. **Raw rewrite pilot:** `lib/screens/home/home_screen.dart` + `lib/screens/review/review_flashcard_screen.dart` without shared widgets. Observe real card/button patterns used.
7. **Extract from pilots:** Create `lib/core/widgets/k_card.dart` (standard / selected / glass / tinted), `k_cta_button.dart` (primary brand700/white, cyan-pill brand400/black, ghost, outlined; `AnimatedScale` press 0.95), `k_chip.dart`, `k_progress_bar.dart`, `k_progress_ring.dart` (CustomPainter), `k_step_progress.dart` (dots + bars), `k_koko_badge.dart` (KokoAnimation wrapper). Refactor pilots to use extracted widgets.

### Phase 2 — Core Screens (Priority 1)

9. **`lib/screens/home/home_screen.dart`** → HOM-01 (refactor pilot from Phase 1b with extracted widgets): streak hero (brand700 bg + `KKokoBadge(koko-idle)` — **change from current `KokoState.celebrating`**) + `KProgressRing` 85%, Daily Missions bento (2 cols), Spatial Archive map placeholder `KCard`, 4-tile stats row, FAB cyan.
10. **`lib/screens/review/review_flashcard_screen.dart`** → REV-02 (refactor pilot from Phase 1b): progress bar header, flashcard glass `KCard` (koko-thinking overlay), 4-button Anki rating row (Again 1m / Hard 2d / Good 4d / Easy 7d).
11. **`lib/screens/shop/shop_screen.dart`** → SHO-01: limited-offer hero (brand700), horizontal category pill scroll, featured card + 2×2 small-card bento, dashed-border subscription upsell.
12. **`lib/screens/snap/snap_screen.dart`** → SNA-01: minimal default (shutter + flip + gallery); GestureDetector swipe-up reveals AI/sensor glass panels (AnimatedSlide).

### Phase 3 — Onboarding (Priority 2)

13. **`lib/screens/onboarding/welcome_screen.dart`** → ONB-01: koko-wave hero, Get Started CTA, 3 floating glass feature cards.
14. **`lib/screens/onboarding/language_select_screen.dart`** → ONB-04: primary list + 2×2 learning grid + "Switch languages" text label below swap icon.
15. **`lib/screens/onboarding/level_select_screen.dart`** → ONB-05: 2-card path picker (child_koko_nobg.png / graduate_koko_nobg.png).
16. **`lib/screens/onboarding/goal_select_screen.dart`** → ONB-06: goal chips bento + commitment radio cards with koko-encourage badge.
17. **`lib/screens/onboarding/mission_screen.dart`** → ONB-07: large hero koko-celebrate + 2 feature bento cards + CTA + success toast.
18. **`lib/screens/onboarding/pdpa_consent_screen.dart`** → ONB-03: 4 permission toggle cards, CTA "Allow Selected", ghost "Maybe Later".
19. **`lib/screens/onboarding/schedule_screen.dart`** + **`profile_setup_screen.dart`**: KStitchScaffold + step progress + selection cards.

### Phase 4 — Secondary Screens (Priority 3)

20. **Review variants**: `review_screen.dart`, `review_conversation_screen.dart`, `review_fillblank_screen.dart`, `review_complete_screen.dart` (koko-celebrate on complete).
21. **Shop variants**: `shop_screen.dart` pack detail (SHO-02: hero + topic chips + price card + glass testimonial); paywall (SHO-03: koko-excited + plan radio cards + sticky bottom CTA).
22. **Snap variants**: `snap_processing_screen.dart`, `snap_results_screen.dart`, `snap_text_screen.dart` — glass-dark panels + cyan accents.
23. **`lib/screens/profile/profile_screen.dart`**: bento grid (avatar header + stat tiles + settings list cards + language switcher entry).

---

## Verification Protocol

### Per Phase
- `flutter analyze` — zero errors
- `rg "0x[0-9A-Fa-f]{6}" lib/screens/` — zero hardcoded hex hits

### Per Screen
1. Build APK: `flutter build apk --debug`
2. Install: `mcp__android__install_apk`
3. Launch: `mcp__android__launch_app`
4. Screenshot: `mcp__android__screenshot` — compare to STITCH wireframe
5. Tap all interactive elements: `mcp__android__tap_element`
6. **Locale verification (scoped):**
   - Full 6-locale cycle (`th/en/zh/es/vi/lo`): Home, Shop, all Onboarding screens (rows 7, 9, 11–18 in tracker)
   - Spot-check `th` + `en` only: all other screens

### Acceptance Gates (per screen)
- [ ] Visible brand400 (#0cf6fc) element present
- [ ] Ambient orbs present
- [ ] KokoAnimation correct asset per STITCH guide
- [ ] Nav bar hidden during onboarding, visible post-onboarding
- [ ] No hardcoded colors in build() method

### Final
- [ ] 30-persona test score ≥85
- [ ] All 22 screens checklist green

---

## Status Tracker

> Infrastructure rows (P1a/P1b) are shared widgets, not screens. Screen count = 22.

| # | Item | Phase | File(s) | Locale check | Status |
|---|------|-------|---------|--------------|--------|
| — | Tokens + Theme | P1a | tokens.dart, app_theme.dart | — | ⬜ |
| — | KAmbientOrbs | P1a | k_ambient_orbs.dart | — | ⬜ |
| — | KStitchScaffold | P1a | k_stitch_scaffold.dart | — | ⬜ |
| — | BottomTabBar fix | P1a | bottom_tab_bar.dart | — | ⬜ |
| — | Pilot raw rewrites | P1b | home + flashcard (raw) | — | ⬜ |
| — | Extract kit | P1b | k_card/button/chip/progress/ring/step/koko | — | ⬜ |
| 1 | Home | P2 | home_screen.dart | 6 locales | ⬜ |
| 2 | Flashcard Review | P2 | review_flashcard_screen.dart | th+en | ⬜ |
| 3 | Shop Home | P2 | shop_screen.dart | 6 locales | ⬜ |
| 4 | Snap (Camera) | P2 | snap_screen.dart | th+en | ⬜ |
| 5 | Welcome | P3 | welcome_screen.dart | 6 locales | ⬜ |
| 6 | Language Select | P3 | language_select_screen.dart | 6 locales | ⬜ |
| 7 | Level Select | P3 | level_select_screen.dart | 6 locales | ⬜ |
| 8 | Goal Select | P3 | goal_select_screen.dart | 6 locales | ⬜ |
| 9 | Mission (Success) | P3 | mission_screen.dart | 6 locales | ⬜ |
| 10 | PDPA Consent | P3 | pdpa_consent_screen.dart | 6 locales | ⬜ |
| 11 | Schedule | P3 | schedule_screen.dart | 6 locales | ⬜ |
| 12 | Profile Setup | P3 | profile_setup_screen.dart | 6 locales | ⬜ |
| 13 | Review Screen | P4 | review_screen.dart | th+en | ⬜ |
| 14 | Review Conversation | P4 | review_conversation_screen.dart | th+en | ⬜ |
| 15 | Review Fillblank | P4 | review_fillblank_screen.dart | th+en | ⬜ |
| 16 | Review Complete | P4 | review_complete_screen.dart | th+en | ⬜ |
| 17 | Shop Pack Detail | P4 | shop_screen.dart (detail route) | 6 locales | ⬜ |
| 18 | Shop Paywall | P4 | shop_screen.dart (paywall route) | 6 locales | ⬜ |
| 19 | Snap Processing | P4 | snap_processing_screen.dart | th+en | ⬜ |
| 20 | Snap Results | P4 | snap_results_screen.dart | th+en | ⬜ |
| 21 | Snap Text | P4 | snap_text_screen.dart | th+en | ⬜ |
| 22 | Profile | P4 | profile_screen.dart | 6 locales | ⬜ |
