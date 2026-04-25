# /phase — Kotoka Phase Execution Skill

Orchestrates a full Kotoka development phase using the 5-agent team, 30 SEA customer voter pool, and the 10-step workflow established in Phase 1.

## Usage

```
/phase do phase 2
/phase do phase 3
/phase <phase name or number>
```

## Trigger

When the user types `/phase` or `phase do phase N`, invoke this skill before any action.

---

## Team Composition

Always assemble the same 5-agent team:

| Role | Name | Model | Personality file |
|------|------|-------|-----------------|
| PM | Aria | Opus | `personality/pm_aria.md` |
| Senior Dev | Kai | Sonnet | `personality/senior_dev_kai.md` |
| Junior Dev | Mai | Sonnet | `personality/junior_dev_mai.md` |
| Junior Dev | Leo | Sonnet | `personality/junior_dev_leo.md` |
| QA | Nova | Opus | `personality/qa_nova.md` |

Customer voters: 30 SEA office workers in `personality/customer_*.md` (mixed Sonnet/Haiku). Threshold: **≥ 85/100** average to pass.

---

## 10-Step Workflow

### Step 1 — Load graphify context
Run `graphify-out/` knowledge graph to understand current codebase state before planning. Use `semantic_search_nodes` and `get_architecture_overview` from MCP graph tools.

### Step 2 — PM plan
Aria writes `plan/phase<N>.md`:
- Feature list for this phase
- Tech stack decisions
- Task assignments (which agent builds what)
- Architecture decisions
- Dependencies on prior phases

### Step 3 — Brainstorm
Team reviews plan. Each agent (Aria, Kai, Mai, Leo, Nova) adds concerns, suggestions, risks. Consolidate into updated plan.

### Step 4 — Checklist
Nova writes `checklist/phase<N>.md` — QA checklist covering all features in the phase. Must include grep-verifiable checks.

### Step 5 — Execute
Parallel execution by agent role:
- Kai: architecture, complex features, performance-critical code
- Mai + Leo: UI screens, widget implementations (parallel where independent)
- All code: Flutter/Dart, Material 3, Riverpod, go_router
- **Mandatory constraints** (never skip):
  - All strings via ARB + AppLocalizations (6 locales: en/th/zh/es/vi/lo)
  - `@Kokoanimation` for all animations — **never lottie**
  - All mock data tagged `//MOCKDATA`
  - No hardcoded colors/sizes — tokens.dart only
  - Gemini API rate limit: 14 RPM (rate_limiter.dart)
  - All other APIs: 60 RPM default
  - KColorsDark for dark mode variants
  - Thai/Lao font: 15px minimum (`_minThaiSize`)
  - `**` formatting for Gemini outputs

### Step 6 — QA
Nova runs `checklist/phase<N>.md`. Must reach 100% pass. Block until all checks green.

### Step 7 — HTML feedback mockups
Create pixel-perfect HTML mockups for all new screens in `feedback/screens/`:
- Dark mode default (`body.dark` class)
- IBM Plex Sans from Google Fonts
- 390px phone frame
- Match Flutter token values exactly (colors, spacing, radius)
- At least 90% visual parity to Flutter screens

### Step 8 — Playwright screenshots
Run `feedback/run_capture.js` to capture all new screens. Add new HTML files to the `FILES` array. Output to `feedback/screenshots/`.

### Step 9 — Customer vote
Run `feedback/customer_vote.js` (or `customer_vote_v2.js`). Target: **average ≥ 85/100**.

If vote fails:
- Read `topImprovements` from `vote_results.json`
- Apply fixes to both Flutter code AND HTML mockups
- Re-capture screenshots
- Re-run vote
- Iterate until ≥ 85

### Step 10 — Phase report
Write `REPORT.md` updates (or `REPORT_phase<N>.md`):
- All user stories status
- Customer vote result (score, top loved, top improvements)
- Design decisions made this phase
- Known limitations / next phase seeds

---

## PRD Structure for Each Phase

Create `.omc/prd_phase<N>.json` (or update `.omc/prd.json`) with user stories specific to the phase. Each story must have:
- Concrete acceptance criteria (not generic "implementation is complete")
- `passes: false` at start
- Verified and set to `passes: true` only after grep/test evidence

---

## Constraints (always active)

```
Flutter only — no React Native
@Kokoanimation — never lottie, never rive
i18n — 6 languages, all user-facing strings in ARB
//MOCKDATA — tag every mock value
tokens.dart — no hardcoded values in widgets
Dark mode — KColorsDark, ThemeMode.dark default
Rate limits — Gemini 14 RPM, others 60 RPM
Thai/Lao — 15px minimum font size
Docker — Firestore emulator :8080, Redis :6379
```

---

## Completion

Phase is complete when:
1. All PRD stories `passes: true`
2. QA checklist 100%
3. Customer vote ≥ 85/100
4. Architect verification: APPROVED
5. ai-slop-cleaner pass on changed files
6. Post-deslop regression passes
7. REPORT.md updated
8. `/oh-my-claudecode:cancel` run

---

## Example invocation

User: `/phase do phase 2`

Response: Read `plan/phase1.md` and `REPORT.md` for context → spawn Aria for phase 2 plan → follow 10-step workflow → complete when customer vote ≥ 85.
