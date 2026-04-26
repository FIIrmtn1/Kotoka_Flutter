# Kotoka Phase 1 Report
> Date: 2026-04-27 · Team: Aria (PM), Kai (Senior), Leo + Mai (Juniors), Nova (QA)

---

## Phase 1 Scope
Full UI/UX build: all onboarding screens (ONB-01–10) + 5 main tab screens + all sub-screens + core widgets.

## Screens Delivered

### Onboarding (ONB-01–10) — No bottom nav
| Screen | File | Status |
|--------|------|--------|
| ONB-01 Welcome | welcome_screen.dart | ✅ |
| ONB-02 Language Select | language_select_screen.dart | ✅ |
| ONB-03 Goal Select | goal_select_screen.dart | ✅ |
| ONB-04 Level Select | level_select_screen.dart | ✅ |
| ONB-05 Schedule | schedule_screen.dart | ✅ |
| ONB-06 Notifications | commitment_screen.dart | ✅ |
| ONB-07 PDPA Consent | pdpa_consent_screen.dart | ✅ |
| ONB-08 Profile Setup | profile_setup_screen.dart | ✅ |
| ONB-09 Mission | mission_screen.dart | ✅ |
| ONB-10 Summary | summary_screen.dart | ✅ |

### Main Tabs + Sub-screens
| Screen | File | Status |
|--------|------|--------|
| Home | home_screen.dart | ✅ |
| Snap (camera) | snap_screen.dart | ✅ |
| Snap (text) | snap_text_screen.dart | ✅ |
| Snap (processing) | snap_processing_screen.dart | ✅ |
| Snap (results) | snap_results_screen.dart | ✅ |
| Review | review_screen.dart | ✅ |
| Review Flashcard | review_flashcard_screen.dart | ✅ |
| Review Fill-Blank | review_fillblank_screen.dart | ✅ |
| Review Conversation | review_conversation_screen.dart | ✅ |
| Review Complete | review_complete_screen.dart | ✅ |
| Shop | shop_screen.dart | ✅ |
| Profile | profile_screen.dart | ✅ |

### Core Widgets Built
| Widget | Notes |
|--------|-------|
| KScaffold | Brand50 bg + ambient orbs stack |
| KAmbientOrbs | Brand400/7% + sky100/10% blurred orbs |
| KCard | White, brand400 border, animated selection |
| KSectionHeader | Brand600 color, w600 weight |
| KChip | Pill chip, brand400 active state |

---

## Design Compliance

### ✅ All Enforced
- Background `KColors.brand50` (#e8e1f0) on all screens
- CTA: `KColors.brand500` (#00c8cc) + white text
- Accents: `KColors.brand400` (#0cf6fc) ≥1 per screen
- Zero hardcoded colors/spacing — all from `tokens.dart`
- `KokoAnimation` exclusively (no Lottie/Rive)
- All mock data: `//MOCKDATA`
- 6 locales: en, th, zh, es, vi, lo
- PDPA cards expanded by default
- SRS: 4 rating buttons 😵😕🙂😄 (REV-02)
- Minimal snap viewfinder + ••• toggle (SNA-01)
- Beta free banner on Shop (SHO-03)
- No missions on Home (HOM-01)
- Review badge on nav (HOM-01b)
- Gemini output: `**bold**` parsed via `_parseGeminiBold()`
- Rate limits: 60 rpm default, 14 rpm Gemini

### 🔒 Security
- Firebase ID token on all API calls (stubbed, ready for wiring)
- SQLCipher local storage
- No secrets in client code

---

## Build Status
- `flutter analyze` → **0 errors** (34 pre-existing info-level only)
- `flutter build apk --debug` → ✅ success

---

## PRD Compliance
| PRD Item | ID | ✅ |
|----------|----|----|
| Minimal snap viewfinder | SNA-01 | ✅ |
| 4-rating SRS system | REV-02 | ✅ |
| Beta free access | SHO-03 | ✅ |
| Lavender bg + Koko wave | ONB-01 | ✅ |
| Dropdown language pair | ONB-04 | ✅ |
| PDPA reasons expanded | ONB-03 | ✅ |
| No missions home | HOM-01 | ✅ |
| Review badge on nav | HOM-01b | ✅ |
| Summary screen | ONB-07 | ✅ |
| Auto-advance Beginner/Advanced | ONB-05 | ✅ |

---

## Customer Testing — Step 9
> Status: ⏳ Pending Android MCP emulator test + 30-persona vote

Feedback form: `feedback_form/phase1.md`
Pass threshold: **weighted avg ≥ 85**

| Area | Weight |
|------|--------|
| Overall score | 40% |
| Onboarding ease | 20% |
| Core screens | 25% |
| Language quality | 10% |
| Performance | 5% |

---

## Known Limitations → Phase 2 Seeds
- Memory map placeholder (needs GPS-linked vocab)
- Review conversation: mock responses (needs real Gemini Vision)
- Snap: mock processing delay (needs real Gemini Vision API)
- Push notifications: not implemented
- Firebase Auth Google Sign-In: stubbed (`authCompletedProvider`)
- No backend persistence yet (all Firestore calls mocked)
