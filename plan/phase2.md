# Phase 2 — Snap / Review / Shop / Profile + 5-Tab Wiring

**Owner:** Aria (PM) · **Stack:** Flutter + Riverpod + go_router · **Theme:** Teal-Purple
**Builds on:** phase1_2 (Onboarding + Home complete). Completes the 5-tab BottomNavBar.

---

## 1. Executive Summary

**Scope:** 4 new top-level screens + sub-flows, wired into `BottomTabBar` (5 tabs).
- **Snap** — camera capture → POST `/analyze-image` (Gemini vision) → SensoryTag picker → save to vocab.
- **Review** — SRS session home + 3 review modes (Flashcard, Fill-blank, Conversation).
- **Shop** — KotoCoin balance + Premium ฿99/mo subscription + B2B info card.
- **Profile** — User stats, language/level settings, streak history, consent toggles.

**Architecture decisions**
- `go_router` ShellRoute hosts `BottomTabBar`; each tab is a `StatefulShellBranch` to preserve scroll/state across switches.
- Reuse Phase 1 design tokens, `KokoStage`, `kokoVisibleProvider`, `tooltipSeenProvider`.
- All API calls go through Phase 1's `apiClient` (Firebase ID token auto-attach + `rate_limiter.dart`).
- SRS state mutations use optimistic Riverpod updates with Firestore writeback.
- Camera uses `camera` package; gallery fallback via `image_picker`. Both gated by runtime permission prompts (no-guilt copy).

**Phase 1 dependencies (must exist):** `apiClient`, `KokoStage`, `kokoStateProvider`, design tokens, ARB i18n loader, `BottomTabBar` skeleton (Home tab only wired), `SensoryTagBar` molecule, `VocabCard` molecule, `kokoVisibleProvider`.

---

## 2. Screen List & Component Breakdown

| ID | Screen | Reused (Phase 1) | New |
|----|--------|------------------|-----|
| SNAP-01 | Camera + capture + analyzing-loader | `KokoStage(thinking)`, `PrimaryButton`, `GhostButton`, `ToastBanner` | `CameraPreview` (organism), `CaptureButton` (atom), `AnalyzingOverlay` (molecule), `AnalysisResultCard` (organism) |
| SNAP-02 | Sensory tag picker + save-to-vocab | `SensoryTagBar`, `PrimaryButton`, `VocabCard` (preview) | `SensoryTagPicker` (organism — multi-select chip grid across 6 channels) |
| REV-01 | Review home (pending count + start) | `KokoStage(encourage)`, `PrimaryButton`, `StatsBadge`(new) | `PendingCardsBadge` (molecule), `ReviewModePill` (atom) |
| REV-02 | Flashcard mode | `VocabCard`, `KokoStage(idle→celebrate)` | `FlashcardFlip` (organism — front/back AnimatedSwitcher), `RatingBar` (molecule — Again/Hard/Good/Easy) |
| REV-03 | Fill-blank mode | `KokoStage(thinking→celebrate)`, `PrimaryButton` | `FillBlankInput` (organism — masked sentence + text field + validate) |
| REV-04 | Conversation bubble mode | `KokoStage(wave→encourage)` | `ConversationBubble` (molecule), `BubbleStream` (organism — chat-style scroll), `ReplyChips` (molecule — suggested replies) |
| SHOP-01 | Coin balance + sub + B2B | `KokoStage(idle)`, `PrimaryButton`, `GhostButton` | `CoinBalanceCard` (organism), `SubscriptionCard` (organism — ฿99/mo CTA), `B2BInfoCard` (molecule) |
| PROF-01 | Profile home | `KokoStage(wave)`, `ToastBanner`, `FocusModeToggle` | `ProfileHeader` (organism — avatar + name + level), `StatsBadge` (molecule — XP/streak/words), `SettingsListTile` (atom), `ConsentToggleRow` (molecule) |

---

## 3. Component Build Order (delta — new only)

**Wave-1 atoms (3)**
- `CaptureButton` — large round shutter, teal accent, haptic on tap.
- `ReviewModePill` — pill chip with mode icon + label; selected/unselected token states.
- `SettingsListTile` — leading icon + label + trailing chevron/switch slot; tappable row.

**Wave-2 molecules (8)**
- `AnalyzingOverlay` — translucent scrim + `KokoStage(thinking)` + progress dots + cancel.
- `PendingCardsBadge` — count + "cards due" copy + colored dot (red >20, amber 5–20, teal <5).
- `RatingBar` — 4-button row (Again/Hard/Good/Easy) emitting SM-2 `quality` int.
- `ConversationBubble` — left/right bubble with mood-tint background; supports text + audio play btn.
- `ReplyChips` — horizontal-scrolling suggested replies; tap fills next bubble.
- `B2BInfoCard` — "For your team?" with link to landing page.
- `StatsBadge` — single stat (icon + value + label); used in row form on PROF-01.
- `ConsentToggleRow` — label + description + switch; writes to `ConsentRecord` via API.

**Wave-3 organisms (10)**
- `CameraPreview` — wraps `camera` controller; permission gate; gallery fallback button.
- `AnalysisResultCard` — Gemini result: word, definition, example, confidence chip.
- `SensoryTagPicker` — 6-channel grid (sound/sight/smell/taste/touch/emotion); multi-select chips.
- `FlashcardFlip` — `AnimatedBuilder` Y-axis flip; front=target word, back=meaning + `SensoryTagBar`.
- `FillBlankInput` — masked sentence with `____` slot, `TextField` validates → `KokoStage(celebrate/encourage)`.
- `BubbleStream` — `ListView` of `ConversationBubble` + bottom input row + `ReplyChips`.
- `CoinBalanceCard` — large coin icon + balance + "How to earn" tap-expand.
- `SubscriptionCard` — Premium ฿99/mo features list + PromptPay CTA + Google Play billing CTA.
- `ProfileHeader` — Google avatar + display name + level pill + edit button.
- `BottomTabBar` (re-wire) — 5 items, active-tab teal underline, badge dot for Review pending count.

**New Riverpod providers (7)**
- `cameraControllerProvider` (FutureProvider; init/dispose lifecycle).
- `analyzeImageProvider` (FutureProvider.family<String path>, calls `/analyze-image`).
- `pendingCardsProvider` (StreamProvider, listens Firestore `userWords` due ≤ now).
- `currentReviewSessionProvider` (StateNotifier — queue + cursor + per-card rating buffer).
- `coinBalanceProvider` (StreamProvider, Firestore `users/{uid}/wallet`).
- `subscriptionStatusProvider` (FutureProvider, GET `/shop/plans` + RevenueCat / Play billing state).
- `profileProvider` (StreamProvider, Firestore `users/{uid}`).

---

## 4. KokoAnimation State Mapping

| Screen | webp State | Trigger |
|--------|-----------|---------|
| SNAP-01 | wave → thinking | mount → on capture analyzing |
| SNAP-02 | excited | on tag select ≥1 |
| REV-01 | encourage | mount (if pending>0); idle (if 0) |
| REV-02 | idle → celebrate (Good/Easy) / encourage (Again/Hard) | per rating |
| REV-03 | thinking → celebrate / encourage | on validate |
| REV-04 | wave → encourage | mount → on user reply |
| SHOP-01 | idle | mount |
| PROF-01 | wave | mount |

All honor `kokoVisibleProvider`. Import: `package:kokoanimation/kokoanimation.dart`. Never Lottie/rive.

---

## 5. New i18n Keys (6 ARB files: th, en, zh, es, vi, lo)

**snap.***: `snap.title`, `snap.cta.capture`, `snap.cta.gallery`, `snap.permission.camera`, `snap.analyzing`, `snap.result.add`, `snap.result.discard`, `snap.tagPicker.title`, `snap.tagPicker.channel.{sound,sight,smell,taste,touch,emotion}`, `snap.error.network`, `snap.error.noWord`.

**review.***: `review.title`, `review.pending.{plural,zero}`, `review.start`, `review.mode.{flashcard,fillBlank,conversation}`, `review.rate.{again,hard,good,easy}`, `review.fill.placeholder`, `review.fill.correct`, `review.fill.tryAgain`, `review.session.complete`, `review.session.xpEarned`.

**shop.***: `shop.title`, `shop.coin.balance`, `shop.coin.howToEarn`, `shop.sub.title`, `shop.sub.price`, `shop.sub.features.{1,2,3,4}`, `shop.sub.ctaPromptPay`, `shop.sub.ctaPlay`, `shop.b2b.title`, `shop.b2b.cta`.

**profile.***: `profile.title`, `profile.edit`, `profile.stats.{streak,xp,words,sessions}`, `profile.settings.title`, `profile.settings.{language,level,notifications,focusMode,privacy,signOut}`, `profile.consent.{analytics,location,marketing}`, `profile.streak.history`.

**a11y.***: `a11y.snap.shutter`, `a11y.flashcard.flip`, `a11y.review.rateButton`.

---

## 6. API Endpoints (Cloud Run / Fastify)

| Method | Path | Rate Limit | Notes |
|--------|------|-----------|-------|
| POST | `/analyze-image` | **14 RPM** (Gemini) | multipart image; returns `{word, definition, example, confidence, suggestedTags[]}` |
| GET | `/srs-schedule` | 60 RPM | returns `{cards: [{id, word, mode, dueAt}], nextReviewAt}` |
| POST | `/srs-rate` | 60 RPM | body `{cardId, quality:0–3}`; updates EF + interval (SM-2) |
| GET | `/shop/plans` | 60 RPM | returns `{premium:{priceTHB, features[]}, b2b:{priceTHB, url}}` |
| POST | `/shop/checkout` | 30 RPM | body `{plan, method: promptpay\|googlePlay}`; returns redirect/URL |
| GET | `/profile` | 60 RPM | returns user doc + aggregated stats |
| POST | `/profile/consent` | 30 RPM | body `{key, granted}`; appends to `ConsentRecord` (PDPA) |

All require Firebase ID token (15-min, auto-refresh). Configured in `lib/core/api/rate_limiter.dart`. All Gemini text bolded with `**` markers per CLAUDE.md.

---

## 7. Definition of Done

Inherit all phase1_2 DoD items, plus:

- [ ] `BottomTabBar` shows 5 tabs (Home, Snap, Review, Shop, Profile); ShellRoute preserves per-tab state across switches.
- [ ] Tab badge on Review reflects `pendingCardsProvider` count in real time.
- [ ] **Snap:** camera permission prompt uses no-guilt copy; gallery fallback works; POST `/analyze-image` with Firebase ID token; result card renders within 5s P95; `SensoryTagPicker` requires ≥1 tag before save; saved word appears in HOME-01 vocab list.
- [ ] **Review:** REV-01 shows correct pending count; starting session enters REV-02/03/04 based on `card.mode`; each rating POSTs `/srs-rate` and advances cursor; session complete shows XP earned + streak update; Firestore `userWords` doc reflects new EF/interval/dueAt.
- [ ] **Shop:** `coinBalanceProvider` reflects Firestore wallet in real time; `SubscriptionCard` ฿99/mo CTA opens PromptPay deep link OR Google Play billing flow per platform; B2B card links to landing page.
- [ ] **Profile:** `ProfileHeader` shows real Google avatar/displayName (no `//MOCKDATA`); stats row shows real streak/XP/word counts; settings list lets user change language (rebuilds ARB), level, focus mode, consent toggles; `POST /profile/consent` writes ConsentRecord.
- [ ] All 4 new tabs support 6 languages; no hardcoded strings; new ARB keys present in all 6 files.
- [ ] No hardcoded colors/sizes — all from `lib/core/theme/tokens.dart`.
- [ ] All mock data values commented `//MOCKDATA`; zero `//MOCKDATA` in PROF-01 prod build.
- [ ] Rate limits configured for all 7 new endpoints; `/analyze-image` enforces 14 RPM client-side.
- [ ] Customer vote with 30 personas: average **≥85** to PASS Phase 2.

---

**Next:** Confirm plan → handoff to executor for Wave-1 atoms → Wave-2 molecules → Wave-3 organisms → screen assembly → vote.
