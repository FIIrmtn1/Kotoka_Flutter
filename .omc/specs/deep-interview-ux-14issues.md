# Deep Interview Spec: Kotoka UX/UI — 14 Issues from 5-Persona Simulation

## Metadata
- Interview ID: kotoka-ux-14issues
- Rounds: 14
- Final Ambiguity Score: ~12%
- Type: brownfield (Flutter / Riverpod / Firebase)
- Generated: 2026-04-26
- Threshold: 20%
- Status: PASSED

## Clarity Breakdown
| Dimension | Score | Weight | Weighted |
|-----------|-------|--------|----------|
| Goal Clarity | 0.92 | 0.35 | 0.322 |
| Constraint Clarity | 0.89 | 0.25 | 0.223 |
| Success Criteria | 0.86 | 0.25 | 0.215 |
| Context Clarity (brownfield) | 0.82 | 0.15 | 0.123 |
| **Total Clarity** | | | **0.883** |
| **Ambiguity** | | | **~12%** |

---

## Resolved Decisions

### 🔴 SNA-01 — Camera (Snap & Learn) Simplification
**Decision:** The camera is a "Snap & Learn" feature. Open it in a minimal viewfinder-first mode — single tap to capture, Koko analyses the image for vocabulary. Hide all manual/pro controls by default.
**Acceptance Criteria:**
- [ ] Camera opens with a clean viewfinder + single large shutter button
- [ ] No ISO, shutter speed, or manual controls visible on first open
- [ ] After snap, vocabulary cards appear overlaid or on a result screen
- [ ] User can access advanced settings via a collapsed "..." menu if needed

### 🔴 REV-02 — Flashcard 4-Rating System
**Decision:** Keep 4 ratings. Improve labels to be friendlier and less technical.
**Suggested labels:** Again → "Missed it" | Hard → "Almost" | Good → "Got it!" | Easy → "Too easy"
**Acceptance Criteria:**
- [ ] 4 buttons remain on the review screen
- [ ] Labels updated to plain language (not ANKI/SM-2 jargon)
- [ ] Button colors remain distinct (red / orange / green / blue or similar)

### 🔴 SHO-03 — Paywall Timing
**Decision:** Everything is free during beta. The paywall screen should NOT block any lesson or feature.
**Acceptance Criteria:**
- [ ] No paywall screen shown during onboarding
- [ ] All lessons, missions, and features accessible without payment
- [ ] Any pricing/subscription screens are hidden or replaced with "Beta — Free Access" messaging

### 🟠 ONB-01 — App Tagline
**Decision:** New tagline: **"Snap your world, speak any languages"**
**Acceptance Criteria:**
- [ ] Tagline on splash/onboarding screen updated to "Snap your world, speak any languages"
- [ ] Tagline rendered in all 6 supported languages via ARB localisation files

### 🟠 ONB-04 — Language Swap Button → Dropdown
**Decision:** Replace the ⇄ swap icon with a **dropdown selector** for each language. No swap button needed — users select source and target language independently via dropdowns.
**Acceptance Criteria:**
- [ ] Source language shown as a tappable dropdown (shows language name + flag via KokoFlag)
- [ ] Target language shown as a second tappable dropdown
- [ ] Swapping is implicit: user just re-selects; no dedicated swap button required
- [ ] Dropdowns support all 6 app languages

### 🟠 ONB-03 — Permissions with Plain-Language Reasons
**Decision:** Show one plain-language reason per permission before the system dialog.
- Camera → "to snap & learn new words from the world around you"
- Microphone → "so Kotoka can hear your pronunciation and guide you"
- Notifications → "for your daily study reminder (you can turn this off anytime)"
**Acceptance Criteria:**
- [ ] Pre-permission explanation screen shows each permission with its human reason
- [ ] All 3 permission reasons are localised in ARB files
- [ ] User can skip optional permissions (notifications)

### 🟠 HOM-01 — Remove Missions
**Decision:** Remove the Missions section from the home screen entirely.
**Acceptance Criteria:**
- [ ] No "Mission" widget/card/section appears on the home screen
- [ ] Home screen layout reflows cleanly without the missions block
- [ ] Any navigation that deep-links to missions is updated or removed

### 🟡 Dark Mode
**Decision:** Skip for beta. Backlog item.
**Note:** Ensure all existing colors continue to use theme tokens (no hardcoded hex added in upcoming fixes) so dark mode remains addable later.

### 🟡 ONB-07 — Post-Onboarding Summary Screen
**Decision:** Add a "You're all set!" summary screen as the final step before entering the app.
**Acceptance Criteria:**
- [ ] Summary screen shows: chosen language pair, selected level, daily goal
- [ ] Koko celebrate animation plays on this screen
- [ ] "Start learning" CTA button proceeds to home
- [ ] Screen is localised in all 6 languages

### 🟡 ONB-06 — Pricing Screen During Beta
**Decision:** Everything is free for beta. Skip the pricing/tier screen entirely.
**Acceptance Criteria:**
- [ ] Pricing/subscription screen is not shown during onboarding flow
- [ ] If screen exists in codebase, it should be gated or skipped in beta build

### 🟡 Currency Display
**Decision:** Skip for beta. All content is free, currency display is not needed now.

### 🟡 "LIMITED OFFER" Banner
**Decision:** Remove the banner entirely. No promotional urgency messaging during beta.
**Acceptance Criteria:**
- [ ] "LIMITED OFFER" banner/badge removed from all screens
- [ ] No replacement banner needed (clean UI)

### 🟡 ONB-05 — Graduate Koko Card Action
**Decision:** Tapping Graduate Koko sets level to Advanced and goes straight to the home screen. No placement test.
**Acceptance Criteria:**
- [ ] Graduate card tap → sets proficiency level = Advanced → proceeds to next onboarding step
- [ ] Child card tap → sets proficiency level = Beginner → proceeds to next onboarding step

### 🟡 HOM-01 — "Continue Review" Shortcut
**Decision:** Add a badge on the Review bottom nav tab when cards are due. Tapping the badge/tab jumps directly into review mode.
**Acceptance Criteria:**
- [ ] Bottom nav Review tab shows a numeric badge (e.g. "12") when review cards are due
- [ ] Badge count comes from Riverpod provider (due card count)
- [ ] Tapping the tab navigates directly to the review session (skips intermediary screen if cards are due)
- [ ] Badge disappears when 0 cards are due

---

## Non-Goals (Explicitly Out of Scope for This Sprint)
- Dark mode implementation
- Currency locale detection
- Pricing/subscription tiers
- Placement test flow
- Manual camera controls

## Technical Context
- Flutter + Riverpod state management
- ARB localisation files for all 6 languages (th, en, zh, es, vi, lo)
- KokoFlag widget for all flag emoji
- KokoAnimation package for Koko character animations (celebrate, wave, idle, etc.)
- Design tokens from lib/core/theme/tokens.dart — no hardcoded hex allowed
- All changes must be tested on Android emulator via Android MCP tools before marking complete

## Interview Transcript Summary
| # | Issue | Decision |
|---|-------|----------|
| 1 | SNA-01 Camera | Snap & Learn — minimal viewfinder, hide pro controls |
| 2 | REV-02 Flashcard | Keep 4 ratings, friendlier labels |
| 3 | SHO-03 Paywall | All free for beta |
| 4 | ONB-01 Tagline | "Snap your world, speak any languages" |
| 5 | ONB-04 Swap button | Replace with dropdown selectors |
| 6 | ONB-03 Permissions | One plain-language reason per permission |
| 7 | HOM-01 Missions | Remove entirely |
| 8 | Dark mode | Backlog — skip for beta |
| 9 | ONB-07 Summary | Add "You're all set!" summary screen |
| 10 | ONB-06 Tiers | All free for beta — skip pricing screen |
| 11 | Currency | Skip for beta |
| 12 | LIMITED OFFER | Remove banner |
| 13 | ONB-05 Graduate | Goes straight to app (Advanced level) |
| 14 | HOM-01 Review shortcut | Bottom nav badge + direct to review |
