# Kotoka App — Project Instructions

## Stack
- **Framework:** Flutter (NOT React Native)
- **State:** Riverpod
- **Backend:** Cloud Run (Fastify) + Firestore + Cloud Storage
- **Auth:** Firebase Auth (Google Sign-In, 15-min ID token)
- **Push:** FCM

## Mandatory Rules

### i18n
Every page and widget MUST support all 6 languages: Thai (th), English (en), Mandarin (zh), Spanish (es), Vietnamese (vi), Lao (lo). Use `flutter_localizations` + ARB files. No hardcoded strings.
- Users MUST be able to change the display language **at any time** from within the app (Profile screen → Language setting), not only during onboarding.
- Language change MUST update all visible strings immediately via Riverpod `localeProvider`.
- Selected locale MUST be persisted to local storage and restored on cold start.

### Animation
Use `@Kokoanimation` package ONLY. NEVER use Lottie or rive for Koko character animations. Import: `package:kokoanimation/kokoanimation.dart`

### Database / Cache (Local Dev)
Docker Compose provides local Firestore emulator + Redis cache. Run `docker-compose up` before dev. All local data goes through emulator.

### Emojis / Images
- Every emoji rendered in the app MUST use **Twitter Emoji (Twemoji)** PNG assets bundled **locally** from `assets/twemoji/`. NEVER load from CDN. No system/platform emoji.
- Other customer-approved sources: Flutter Icons, Material Symbols.
- Use `KokoEmoji` for general emoji. Use `KokoFlag` for all national flag emoji — it applies `ClipRRect(borderRadius: BorderRadius.circular(radius))` for rounded corners.
- NEVER render flag emoji as raw Unicode text — always use `KokoFlag` widget.
- No AI-generated images.

### UI/UX
Apply /ui-ux-pro-max principles. Design tokens from `lib/core/theme/tokens.dart`. No hardcoded colors, sizes, or spacing. All values from token system.

### Navigation Bar (Theme Awareness)
- The bottom nav bar MUST use `theme.colorScheme.surface` for background (NOT `KColors.surfacePrimary` which is hardcoded white).
- Nav bar border MUST use `theme.colorScheme.outline`.
- Inactive icon/label color MUST use `theme.colorScheme.onSurfaceVariant`.
- This ensures the nav bar turns dark grey in dark mode and white in light mode automatically.

### Color Contrast on Colored Backgrounds
- NEVER use `KColors.brand400` (bright cyan #0cf6fc) as text on a `KColors.brand500` (teal) card — contrast ratio is too low.
- On teal (`KColors.brand500`) card backgrounds, use `KColors.neutral0` (white) for price/headline text.
- Always verify text contrast ratio ≥ 4.5:1 (WCAG AA) on any colored surface.

### 30-Persona Test Observation Rules
- In every 30-persona test, evaluate ALL visible elements: every button, every interactive widget, dropdown open states, picker sheets, text contrast, font size, and tap-target size.
- Specifically check: price text on colored cards, nav bar theme in dark mode, flag emoji rendering in picker sheets (open state), checkmark visibility on selected items.
- Report specific UI element names and colors (e.g. "฿299/month: white on teal, readable") — not general impressions only.
- Score threshold: avg ≥ 85 to pass.

### Gemini Output
All text returned from Gemini 2.5 Flash API MUST be formatted with `**bold**` markers in display widgets.

### Rate Limits
Every API endpoint MUST have rate limiting configured. Default: 60 req/min per user. Gemini endpoints: 14 RPM. Configure in `lib/core/api/rate_limiter.dart`.

### Mock Data
Every mock data value MUST be commented with `//MOCKDATA` on the same line.

### Security
- Firebase ID token on every API request (15-min expiry, auto-refresh)
- SQLCipher for local encrypted storage
- No secrets in client code
- Input validation at all API boundaries

## Design Tokens (Teal-Cyan Theme — updated 2026-04-26)
- **Primary CTA buttons: #00c8cc (brand-500, Teal) — ALL buttons use this, white text on top**
- Nav active / streaks / glows / icon tints: #0cf6fc (brand-400, Bright Cyan) — dominant brand color
- Decorative accents / illustrations ONLY: #682069 (brand-700, Deep Purple) — **NEVER on buttons**
- Section headings / labels / tags: #8c6792 (brand-600, Dark Purple)
- Secondary light blue: #7dd3fc (sky-300, info badges) · #e0f2fe (sky-100, container tints)
- Accent pink: #ffb6cb (soft badges, card tints)
- Background: #e8e1f0 (brand-50, Very Light Lavender)
- Surface light: #ffe1df (brand-100, Light Peach)
- Success: #10B981
- Error: #d8566a (Red/Pink — never alarming)
- Warning: #ffdfa2 (Pale Yellow/Tan)
- Typography: IBM Plex Sans (Latin), Sarabun (Thai), Noto Sans SC (ZH), Noto Sans Lao (LO)
- Theme MUST match DESIGN.md at all times

### Background Color Rules (mandatory)
- **Light mode page background:** `#e8e1f0` (lavender) — token: `KColors.brand50`
- **Dark mode page background:** `#444444` (dark gray) — token: `KColorsDark.bgPage`
- **CTA buttons:** `#00c8cc` (brand-500 teal) — never `#682069` (purple is decorative only)
- **Highlights / accents:** `#0cf6fc` (brand-400 cyan) for nav active, glows, streaks
- All background and accent values MUST come from `lib/core/theme/tokens.dart` — no hardcoded hex in screens

## Agent Workflow Rules
- **Token mode: /caveman active at all times** — minimize tokens, drop filler, fragments OK
- Token budget: every agent statement ≤ 30 words
- Developer team: PM (Opus) → Senior (Sonnet) → Junior×2 (Sonnet) → QA (Opus)
- Customer team: 30 SEA office worker personas in /personality/
- Phase workflow defined in /skills/phase.md
- Vote threshold: ≥ 85 to pass; otherwise repeat Steps 2–10
- Out-of-PRD feature requests MUST be escalated to user — never auto-implemented
- Read from /graphify-out for project context; do NOT read unattached files

## KokoAnimation Assets
- Files: Kokoanimation/koko-idle.webp, koko-celebrate.webp, koko-thinking.webp,
         koko-wave.webp, koko-excited.webp, koko-encourage.webp
- Use @Kokoanimation package ONLY — never Lottie, never rive

## Graph Tools
Use code-review-graph MCP tools before Grep/Glob/Read for codebase exploration.

## Code-Review-Graph
ALWAYS use code-review-graph MCP tools BEFORE using Grep/Glob/Read to explore the codebase.

## Android MCP Testing Rule
EVERY fix or feature MUST be tested on the Android emulator using Android MCP tools (mcp__android__screenshot, mcp__android__tap, mcp__android__get_ui_tree, etc.) after building the APK. Keep iterating with build → install → test until the feature works perfectly on the emulator. Never mark a task complete without a passing emulator test.
