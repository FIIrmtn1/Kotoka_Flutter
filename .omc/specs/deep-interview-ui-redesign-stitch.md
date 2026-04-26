# Deep Interview Spec: Kotoka UI Redesign — STITCH Design System

## Metadata
- Interview ID: ui-redesign-stitch
- Rounds: 5
- Final Ambiguity Score: 16.1%
- Type: brownfield
- Generated: 2026-04-26
- Threshold: 20%
- Status: PASSED

## Clarity Breakdown
| Dimension | Score | Weight | Weighted |
|-----------|-------|--------|----------|
| Goal Clarity | 0.92 | 0.35 | 0.322 |
| Constraint Clarity | 0.75 | 0.25 | 0.188 |
| Success Criteria | 0.82 | 0.25 | 0.205 |
| Context Clarity | 0.83 | 0.15 | 0.125 |
| **Total Clarity** | | | **0.839** |
| **Ambiguity** | | | **16.1%** |

---

## Goal
Rebuild the **UI layer** of all 22 Kotoka Flutter screens to match the STITCH Design Guide exactly. Delete and replace all Widget `build()` methods, layouts, colors, and styling. Preserve all logic: Riverpod providers, Firebase auth, i18n ARB files, navigation routing, and state management.

---

## Constraints
- **UI layer only**: Only `build()` methods and styling are changed. No provider, Firebase, routing, or ARB file modifications.
- **All 22 screens**: Every screen in `lib/screens/` gets the STITCH treatment — not just the 13 documented ones.
- **Token-based**: All colors and spacing from `lib/core/theme/tokens.dart`. No hardcoded hex values anywhere.
- **i18n preserved**: All 6 languages (th, en, zh, es, vi, lo) must continue working after redesign.
- **Flutter only**: No web frameworks. STITCH CSS patterns must be translated to Flutter equivalents.
- **KokoAnimation only**: Use `package:kokoanimation/kokoanimation.dart` for all mascot animations. Never Lottie/Rive.
- **Twemoji**: All emoji via `KokoEmoji` / `KokoFlag` widgets with local assets. Never raw Unicode.
- **Android emulator test**: Every screen must pass emulator test before marking complete.

## Non-Goals
- Logic refactoring (Riverpod, Firebase, routing)
- Adding new features or screens
- Dark mode (light mode only for this pass)
- Backend/API changes
- ARB translation updates

---

## Resolved UX Decisions (from STITCH Section 17)

| Screen | Question | Decision |
|--------|----------|----------|
| REV-02 Flashcard | Rating button style | **4-button Anki-style**: Again (1m) · Hard (2d) · Good (4d) · Easy (7d) |
| HOM-01 Home | Information density | **Full dashboard**: streak hero + missions bento + spatial map + 4 stat tiles, all visible on scroll |
| SNA-01 Camera | UI complexity | **Minimal default**: shutter + flip + gallery only. Swipe-up to reveal AI/sensor overlays |
| ONB-04 Language | Swap button clarity | Add explicit **"Switch languages"** text label below the swap icon |

---

## Acceptance Criteria
- [ ] Every screen has ≥1 prominent `#0cf6fc` (brand400) element
- [ ] Page background is `#f8f9ff` (light) with ambient lavender/cyan blur orbs (`-z-10`)
- [ ] Bottom nav: glassmorphic (`bg-white/90 backdrop-blur`), cyan active capsule, 5 tabs — already done, verify unchanged
- [ ] All CTA buttons: `#682069` (brand700) on white surfaces, `#0cf6fc` pill variant on colored/dark surfaces
- [ ] Cards: `rounded-xl` (12px), `border border-brand400/20`, `shadow-sm`; active/selected: `border-2 border-brand400 bg-brand400/5 ring`
- [ ] Typography: IBM Plex Sans across all screens, STITCH type scale (h1=48/600, h2=32/600, h3=24/500, body-md=16/400, label-md=14/500, caption=12/400)
- [ ] Bento-grid layout on Home, Shop, and Profile screens
- [ ] Ambient blur orbs on every screen (`brand50/10` top-right, `sky100/10` bottom-left, `-z-10 pointer-events-none`)
- [ ] KokoAnimation used on correct screens per STITCH guide (koko-wave: ONB-01, koko-celebrate: ONB-07, koko-thinking: REV-02, koko-encourage: ONB-06, koko-excited: SHO-03 paywall, koko-idle/encourage: HOM-01)
- [ ] REV-02: 4 rating buttons (Again/Hard/Good/Easy with interval labels)
- [ ] SNA-01: Minimal camera by default; AI/sensor panels revealed only on swipe-up
- [ ] HOM-01: Full dashboard layout (streak hero + SVG progress ring + missions bento + map + stats)
- [ ] ONB-04: Swap icon has "Switch languages" text label
- [ ] No hardcoded hex colors anywhere in `lib/screens/`
- [ ] All 6 language strings still rendering correctly
- [ ] 30-persona test score ≥85 (per CLAUDE.md project rules)
- [ ] Android emulator screenshot approved for each screen

---

## Screen Implementation Priorities

### Priority 1 — Core Post-Onboarding (highest daily use)
1. `lib/screens/home/home_screen.dart` → HOM-01
2. `lib/screens/review/review_flashcard_screen.dart` → REV-02
3. `lib/screens/shop/shop_screen.dart` → SHO-01
4. `lib/screens/snap/snap_screen.dart` → SNA-01

### Priority 2 — Onboarding Flow (first-impression critical)
5. `lib/screens/onboarding/welcome_screen.dart` → ONB-01
6. `lib/screens/onboarding/language_select_screen.dart` → ONB-04
7. `lib/screens/onboarding/level_select_screen.dart` → ONB-05
8. `lib/screens/onboarding/goal_select_screen.dart` → ONB-06
9. `lib/screens/onboarding/mission_screen.dart` → ONB-07
10. `lib/screens/onboarding/pdpa_consent_screen.dart` → ONB-03
11. `lib/screens/onboarding/schedule_screen.dart` → (schedule)
12. `lib/screens/onboarding/profile_setup_screen.dart` → (profile setup)

### Priority 3 — Secondary Screens
13. `lib/screens/review/review_screen.dart`
14. `lib/screens/review/review_conversation_screen.dart`
15. `lib/screens/review/review_fillblank_screen.dart`
16. `lib/screens/review/review_complete_screen.dart`
17. `lib/screens/shop/` (pack detail, paywall) → SHO-02, SHO-03
18. `lib/screens/snap/snap_processing_screen.dart`
19. `lib/screens/snap/snap_results_screen.dart`
20. `lib/screens/snap/snap_text_screen.dart`
21. `lib/screens/profile/profile_screen.dart`

---

## Design System Translation (CSS → Flutter)

| STITCH CSS | Flutter Equivalent |
|------------|-------------------|
| `bg-[#0cf6fc]` | `color: KColors.brand400` |
| `bg-[#e8e1f0]` / `bg-[#f8f9ff]` | `color: KColors.brand50` / `KColors.neutral50` |
| `bg-white/70 backdrop-blur-xl` | `BackdropFilter(filter: ImageFilter.blur(sigmaX:12, sigmaY:12))` + `Color(0xB3FFFFFF)` |
| `rounded-xl` (12px) | `borderRadius: BorderRadius.circular(12)` |
| `rounded-full` | `borderRadius: BorderRadius.circular(999)` |
| `shadow-sm` | `BoxShadow(blurRadius: 4, offset: Offset(0,2), color: Colors.black12)` |
| `shadow-[#0cf6fc]/30` | `BoxShadow(color: KColors.brand400.withOpacity(0.3), blurRadius: 12)` |
| `p-lg` (24px) | `padding: EdgeInsets.all(KSpace.lg)` |
| `gap-lg` (24px) | `SizedBox(height: KSpace.lg)` / `mainAxisSpacing: KSpace.lg` |
| `grid-cols-2` bento | `Row` with `Expanded` children or `GridView` |
| `animate-pulse` | `AnimationController` + `FadeTransition` |
| `active:scale-95` | `GestureDetector` + `ScaleTransition` / `AnimatedScale` |

---

## Assumptions Exposed & Resolved
| Assumption | Challenge | Resolution |
|------------|-----------|------------|
| "Delete all old design" = delete dart files | Would destroy i18n and state logic | UI layer only — keep logic intact |
| STITCH background = lavender #e8e1f0 | STITCH Section 6 shows #f8f9ff for elevation 0 | Use #f8f9ff as page bg; brand50 orbs for ambient depth |
| Camera should be full-featured | STITCH Section 17 flags as "professional, not casual" | Minimal default + swipe-up reveal |
| 4-button review is too complex | STITCH Section 17 suggests 2 or 3 button alternatives | User confirmed 4-button Anki-style |

---

## Technical Context

**Existing foundation (brownfield):**
- `lib/core/theme/tokens.dart` — All STITCH colors already defined as `KColors` constants
- `lib/core/theme/app_theme.dart` — Material 3 light theme fully configured
- `lib/core/widgets/bottom_tab_bar.dart` — Already glassmorphic + cyan; minimal changes needed
- `lib/screens/` — 22 screen files, all using Riverpod for state
- `lib/l10n/` — 6 ARB files, all must remain untouched

**Gap areas requiring most work:**
1. Page backgrounds: switch from white to `#f8f9ff` + ambient orbs
2. Cards: add `border-brand400/20`, glassmorphism on hero cards
3. Home screen: full bento-grid rebuild (current = stacked list)
4. Shop screen: featured card + category filter chips + 2-col grid
5. Snap screen: minimal-first camera UI

---

## Ontology (Key Entities)

| Entity | Type | Fields | Relationships |
|--------|------|--------|---------------|
| Screen | core domain | file path, priority, STITCH ref | has many Components |
| UILayer | core domain | build() method, layout, styling | belongs to Screen |
| LogicLayer | supporting | providers, Firebase, routing, i18n | preserved, not changed |
| DesignSystem | supporting | colors, spacing, typography, tokens | applied to UILayer |
| Component | core domain | type (button/card/nav/chip), STITCH variant | used by Screen |
| KokoAnimation | external system | koko-idle/wave/celebrate/thinking/excited/encourage | overlaid on Screen |

---

## Interview Transcript
<details>
<summary>Full Q&A (5 rounds)</summary>

### Round 1
**Q:** Which screens should be redesigned?
**A:** "Delete all old design and make new design follow STITCH guide" — ALL screens
**Ambiguity:** 52.5% (Goal: 0.70, Constraints: 0.20, Criteria: 0.30, Context: 0.70)

### Round 2
**Q:** UI layer only vs. full file rewrite?
**A:** UI layer only — keep Riverpod, Firebase, i18n, routing intact
**Ambiguity:** 32.8% (Goal: 0.85, Constraints: 0.70, Criteria: 0.35, Context: 0.75)

### Round 3
**Q:** Flashcard rating button style?
**A:** 4-button Anki-style (Again 1m / Hard 2d / Good 4d / Easy 7d)
**Ambiguity:** 27.4% (Goal: 0.87, Constraints: 0.72, Criteria: 0.50, Context: 0.78)

### Round 4
**Q:** Home screen density — full dashboard or simplified?
**A:** Full dashboard as wireframed (streak + missions + map + stats)
**Ambiguity:** 22% (Goal: 0.90, Constraints: 0.73, Criteria: 0.65, Context: 0.80)

### Round 5
**Q:** Camera UI — full overlay or minimal default?
**A:** Minimal default + swipe-up to reveal AI/sensor overlays
**Ambiguity:** 16.1% (Goal: 0.92, Constraints: 0.75, Criteria: 0.82, Context: 0.83) ✅ PASSED

</details>
