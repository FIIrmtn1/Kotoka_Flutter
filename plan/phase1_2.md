# Phase 1 — UI/UX Implementation Plan (phase1_2)

**Owner:** Aria (PM) · **Stack:** Flutter + Riverpod + go_router · **Theme:** Teal-Purple
**Iteration:** delta over phase1_1 (vote 70.9 — FAIL). Addresses top-6 customer issues; PRD scope unchanged.

---

## 1. What Changed vs 1.1 (Delta Summary)

| # | Change | Rationale (vote issue #) |
|---|--------|--------------------------|
| 1 | Onboarding 7 → 5 screens; ONB-05 (Notif) merged into ONB-06 (Commitment) | #1 onboarding too long, #2 streak polarizing, #4 notif weak |
| 2 | "Focus Mode" toggle on ONB-02 hides Koko app-wide via `kokoVisibleProvider` | #3 mascot vs. professional credibility |
| 3 | Goal chips 4 → 6 (Travel, Work Meeting, Email Writing, Presentation, Study, Culture) | #5 goal taxonomy too vague |
| 4 | Merged Commitment screen: explicit "Not now" GhostButton + 2-line value-prop copy | #4 notif no skip / no value |
| 5 | SensoryTagBar first-use ToastBanner on HOME-01; `tooltipSeenProvider` persists state | #7 SensoryTagBar unexplained |
| 6 | Streak grace-period copy on StreakCommitRow: "1 free pass per week" | #9 streak rules unclear |

Out of scope (deferred): dark mode (#6), offline indicator (#8), onboarding audio (#10).

---

## 2. Updated Screen List

| ID | Screen | Notes |
|----|--------|-------|
| ONB-01 | Splash / Language Pick | unchanged |
| ONB-02 | Welcome (Koko wave) + **Focus Mode toggle** | new toggle atom |
| ONB-03 | Goal Selection (**6 chips**) | grid reflows 2×3 |
| ONB-04 | Level / Proficiency | unchanged |
| ONB-05 | **Commitment** (merged Notif + Streak Promise) | replaces old ONB-05+06 |
| ONB-06 | First Mission Intro | renumbered (was ONB-07) |
| HOME-01 | Home (+ first-use SensoryTagBar tooltip) | adds ToastBanner trigger |

Total onboarding: **5 screens** (target ≤5 met).

---

## 3. Component Changes Only

**New atoms (1)**
- `FocusModeToggle` — labeled switch atom; teal-purple tokens; emits to `kokoVisibleProvider`.

**Modified molecules (3)**
- `GoalChipGrid` — 4 → 6 chips, 2-col responsive grid (was 2×2).
- `StreakCommitRow` — adds 1-line `gracePeriodCopy` slot below commit CTA.
- `KokoStage` — wraps build in `Consumer`; returns `SizedBox.shrink()` when `kokoVisibleProvider == false`.

**New organism (1)**
- `CommitmentCard` — composes `KokoStage(encourage)` + `PermissionPrompt` body + `StreakCommitRow` + `GhostButton("Not now")`. Replaces standalone `PermissionPrompt` and `StreakPromiseCard`.

**Modified molecule usage (HOME-01)**
- `ToastBanner` (existing) gated by `tooltipSeenProvider`; auto-shows on first VocabCard render; tap-to-dismiss writes `true`.

**Removed**
- `StreakPromiseCard` organism (folded into `CommitmentCard`).

**New Riverpod providers (3)**
- `kokoVisibleProvider` (StateProvider<bool>, default `true`, persisted via SharedPreferences).
- `tooltipSeenProvider` (StateProvider<bool>, default `false`, persisted).
- `goalSelectionProvider` updated enum: `{travel, workMeeting, emailWriting, presentation, study, culture}`.

---

## 4. Koko State Mapping (5-screen onboarding)

| Screen | webp State | Trigger | Honors `kokoVisibleProvider` |
|--------|-----------|---------|------------------------------|
| ONB-01 | idle | mount | yes |
| ONB-02 | wave | mount + loop | yes (toggle lives here; takes effect ONB-03+) |
| ONB-03 | thinking | user idle >2s | yes |
| ONB-04 | thinking | mount | yes |
| ONB-05 | encourage | mount; → excited on streak commit tap | yes |
| ONB-06 | celebrate | mount | yes |
| HOME-01 | idle / celebrate / encourage / thinking | Riverpod `kokoStateProvider` | yes |

Import: `package:kokoanimation/kokoanimation.dart`. Never Lottie/rive. Focus Mode hides asset but preserves layout spacing (collapsed `SizedBox`).

---

## 5. New / Changed i18n Keys (delta only)

Add to all 6 ARB files (`th, en, zh, es, vi, lo`):

- `onb.welcome.focusToggle` — "Focus Mode (hide Koko)"
- `onb.welcome.focusToggleHint` — "Minimal UI for professional use."
- `onb.goal.workMeeting` — "Work Meeting"
- `onb.goal.emailWriting` — "Email Writing"
- `onb.goal.presentation` — "Presentation"
- `onb.commit.title` — "Stay on track"
- `onb.commit.valueProp1` — "Daily reminder at your chosen time."
- `onb.commit.valueProp2` — "Streak nudge so you never break the chain."
- `onb.commit.allow` — "Allow notifications"
- `onb.commit.notNow` — reuse `common.notNow`
- `onb.commit.grace` — "Miss a day? You get 1 free pass per week."
- `home.tooltip.sensoryTag` — "Tags show how a word feels — sound, sight, action. Tap to explore."
- `a11y.focusToggle.on` / `a11y.focusToggle.off`

Removed/renamed: `onb.notif.*` keys folded into `onb.commit.*` (delete `onb.notif.title`, `onb.notif.body`).

---

## 6. Definition of Done (delta over phase1_1 §9)

Inherit all phase1_1 DoD items, plus:

- [ ] Onboarding flow completes in **≤5 screens** end-to-end (ONB-01 → ONB-06).
- [ ] `FocusModeToggle` on ONB-02 hides Koko on ONB-03/04/05/06 + HOME-01; persists across app restart.
- [ ] `KokoStage` returns collapsed widget when `kokoVisibleProvider == false`; no asset network/disk fetch in that state (verify via `precacheImage` skip).
- [ ] `GoalChipGrid` renders **6 chips** in 2×3 grid; passes 360×640 layout test (no overflow).
- [ ] `CommitmentCard` shows `PrimaryButton(allow)` + `GhostButton(notNow)` + grace-period copy; both buttons advance to ONB-06.
- [ ] `ToastBanner` auto-shows on first HOME-01 mount only; `tooltipSeenProvider` persisted; second visit shows nothing.
- [ ] All 13 new/changed i18n keys present in 6 ARB files; old `onb.notif.*` keys removed.
- [ ] Re-run customer vote with 30 personas; target average **≥85** to PASS Phase 1.

---

**Next:** Confirm plan → handoff to executor for Wave-1 (atom `FocusModeToggle`) and Wave-2 (modified molecules) → re-vote.
