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

### Animation
Use `@Kokoanimation` package ONLY. NEVER use Lottie or rive for Koko character animations. Import: `package:kokoanimation/kokoanimation.dart`

### Database / Cache (Local Dev)
Docker Compose provides local Firestore emulator + Redis cache. Run `docker-compose up` before dev. All local data goes through emulator.

### Emojis / Images
Use outsourced assets only (Flutter Icons, Material Symbols, or documented CDN sources). No AI-generated images.

### UI/UX
Apply /ui-ux-pro-max principles. Design tokens from `lib/core/theme/tokens.dart`. No hardcoded colors, sizes, or spacing. All values from token system.

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

## Design Tokens (Teal-Purple Theme — updated 2026-04-26)
- Primary CTA: #682069 (brand-700, Deep Purple)
- Accent: #00c8cc (brand-500, Teal/Cyan)
- Background: #e8e1f0 (brand-50, Very Light Lavender)
- Surface light: #ffe1df (brand-100, Light Peach)
- Highlight: #0cf6fc (brand-400, Bright Cyan)
- Success: #10B981
- Error: #d8566a (Red/Pink — never alarming)
- Warning: #ffdfa2 (Pale Yellow/Tan)
- Typography: IBM Plex Sans (Latin), Sarabun (Thai), Noto Sans SC (ZH), Noto Sans Lao (LO)
- Theme MUST match DESIGN.md at all times

## Agent Workflow Rules
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
