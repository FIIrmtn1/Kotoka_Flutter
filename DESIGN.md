# Kotoka Design Specification
> v2.1 · 2026-04-26 · Source: stitch_kotoka_design_builder/STITCH_DESIGN_GUIDE.md

---

## Color System

### Primary — Bright Cyan *(dominant brand color)*

| Token | Hex | Use |
|-------|-----|-----|
| `KColors.brand400` | `#0cf6fc` | **THE main color** — nav active, streak badges, icon tints, glows, progress fill |
| `KColors.brand500` | `#00c8cc` | **All CTA buttons** — primary, ghost, outlined; progress darken; hover |

> **Rule:** Every screen must have at least one prominent `#0cf6fc` element.  
> **CTA rule:** All buttons use `#00c8cc` (brand500 teal) with white text. **NEVER purple for any button.**

### Secondary — Light Blue *(supporting, calm)*

| Token | Hex | Use |
|-------|-----|-----|
| `KColors.sky300` | `#7dd3fc` | Info badges, secondary borders, chip backgrounds |
| `KColors.sky100` | `#e0f2fe` | Container tints, hover bg |
| `KColors.skyDark` | `#0c4a6e` | Text on light-blue surfaces (on-secondary) |

### Purple / Pink — Decorative Accents Only *(never buttons or CTAs)*

| Token | Hex | Use |
|-------|-----|-----|
| `KColors.brand700` | `#682069` | Decorative accents, illustrations **only** — never buttons |
| `KColors.brand600` | `#8c6792` | Section headings, labels, tags |
| `KColors.accentPink` | `#ffb6cb` | Soft badges, card tints |

### Background / Surface

| Token | Hex | Use |
|-------|-----|-----|
| `KColors.brand50`  | `#e8e1f0` | **Page background** (lavender) — ALL screens |
| `KColors.neutral0` | `#ffffff` | Card / panel surface |
| `KColors.brand100` | `#ffe1df` | Warm card variant (tertiary surfaces) |

### Semantic

| Token | Hex | Use |
|-------|-----|-----|
| `KColors.error500` | `#d8566a` | Error (non-alarming red/pink) |
| `KColors.warning500`| `#ffdfa2` | Warning (pale yellow) |
| `#000000` | black | Primary body text |
| `#ffffff` | white | Text on teal/dark buttons and colored backgrounds |

**Rules:**
- Every screen has at least one prominent `#0cf6fc` element
- NEVER use `brand400` text on `brand500` bg — contrast ratio < 4.5:1
- NEVER use `brand700` (#682069) on any button or CTA
- Light mode only — no dark mode
- All values from `lib/core/theme/tokens.dart`

---

## Typography

IBM Plex Sans (Latin) · Sarabun (Thai) · Noto Sans SC (ZH) · Noto Sans Lao (LO)

| Style | Size | Weight | Line-height | Notes |
|-------|------|--------|-------------|-------|
| h1 | 48px | 600 | 1.2 | tracking-tight |
| h2 | 32px | 600 | 1.25 | — |
| h3 | 24px | 500 | 1.3 | — |
| body-lg | 18px | 400 | 1.6 | — |
| body-md | 16px | 400 | 1.5 | — |
| label-md | 14px | 500 | 1.4 | 0.02em letter-spacing |
| caption | 12px | 400 | 1.4 | — |

---

## Spacing

| Token | Value |
|-------|-------|
| `sp4` / `xs` | 4px |
| `sp8` / `sm` | 8px |
| `sp16` / `md` | 16px |
| `sp24` / `lg` | 24px |
| `sp32` / `xl` | 32px |
| `sp48` / `xxl` | 48px |
| `sp64` / `xxxl` | 64px |

- Page horizontal padding: `sp24` mobile · `sp32` desktop
- Section vertical gap: `sp32` between major sections
- Card internal padding: `sp24`
- List item / small card padding: `sp16`
- Gap between bento cells: `sp24`

---

## Border Radius

| Token | Value | Use |
|-------|-------|-----|
| `KRadius.xs` | 4px | Micro elements |
| `KRadius.sm` | 8px | Small chips, icon containers |
| `KRadius.md` | 12px | Cards, buttons, inputs (most common) |
| `KRadius.lg` | 24px | Large hero cards, product visuals |
| `KRadius.full` | 9999px | Pill buttons, avatar circles, progress dots, nav active capsule |

---

## Components

### Primary CTA Button
- Background: `KColors.brand500` (#00c8cc teal)
- Text: white (`#ffffff`)
- Border-radius: `KRadius.full` (pill) or `KRadius.md`
- Shadow: `brand500` at 30% opacity

### Secondary / Ghost Button
- Background: transparent
- Border: `brand500` at 40%
- Text: `brand500` (#00c8cc)

### Outlined Button
- Border: `brand500` (2px)
- Text: `brand500`
- Hover bg: `brand500` at 10%

### Cards
- Background: `KColors.neutral0` (white)
- Border: `brand400` at 20% opacity
- Border-radius: `KRadius.md` (12px)
- Shadow: `KElevation.shadow1`
- Active/selected: border-2 `brand400`, bg `brand400` at 5%, ring `brand400` at 10%

### Progress Bar / Ring
- Track: `neutral200` (slate-100)
- Fill: `brand400` (#0cf6fc) with glow `brand400/30`

### Icon Containers
- Background: `brand400` at 10–15%
- Border: `brand400` at 20–30%
- Icon color: `brand400`

### Input Fields
- Border: slate-200 default
- Focus border: `brand400`
- Focus ring: `brand400` at 20%

### Badges / Status Pills
- Primary: `brand500` bg + white text
- Outline: `brand500` border + `brand500` text

---

## Navigation Bar

- Background: white at 90% opacity + `backdrop-blur`
- Border-top: `brand400` at 20%
- Active tab: `brand400/10` capsule bg, `brand400` icon + label (filled icon)
- Inactive tab: `neutral500` (slate-400) icon + label
- Badge: `error500` red dot with white text

**5 tabs:** Home · Snap · Review · Shop · Me

---

## Glassmorphism Recipes

| Level | Implementation |
|-------|----------------|
| Light glass (on light bg) | `bg-white/70 backdrop-blur-xl border border-white/40` |
| Subtle hint glass (hero banner) | `bg-white/10 backdrop-blur-md border border-white/20` |
| Dark glass (camera / map overlay) | `bg-[#0b1c30]/60 backdrop-blur-md` |
| Nav shell | `bg-white/90 backdrop-blur-md border-t border-brand400/20` |

---

## Ambient Background Decoration

- Always `-z-10 pointer-events-none`
- Top-right warm orb: `brand400` at 5%, `blur-3xl`, `rounded-full`
- Bottom-left cool orb: `sky100` at 10%, `blur-3xl`, `rounded-full`
- Opacity range: 5–20% — never fully opaque

---

## Screen Backgrounds

| Context | Color |
|---------|-------|
| All onboarding screens | `KColors.brand50` (#e8e1f0 lavender) |
| All main screens | `KColors.brand50` (#e8e1f0 lavender) |
| Camera / Snap | Dark `#0b1c30` (preserved) |
| Card surfaces | `KColors.neutral0` white |

---

## Onboarding Screens

No bottom nav on ONB-01 through ONB-10. Header kept for brand anchor.

| Screen | Key Element |
|--------|-------------|
| ONB-01 Welcome | KokoAnimation wave, brand400 "Kotoka" title, brand400 CTA |
| ONB-02 Language | Two dropdowns + KokoFlag, brand400 border on selected |
| ONB-03 Goal | Chip grid, brand400 active chip |
| ONB-04 Level | ProgressRing brand400, emoji icons, brand400 CTA (Intermediate) |
| ONB-05 Schedule | Radio cards, brand400 selected border |
| ONB-06 Notifications | Card layout, brand400 CTA |
| ONB-07 PDPA | Permission cards all expanded, brand400 CTA |
| ONB-08 Profile | White card, brand400 CTA |
| ONB-09 Mission | KokoAnimation celebrating, brand500 heading, brand400 CTA |
| ONB-10 Summary | "You're all set!", KokoAnimation celebrating, white summary card |

---

## 14 UX Fixes (locked)

| ID | Fix |
|----|-----|
| SNA-01 | Minimal snap viewfinder; ••• toggle |
| REV-02 | 4 rating buttons with emoji |
| SHO-03 | Beta free access, no premium pricing |
| ONB-01 | Tagline updated + bg = brand50 |
| ONB-04 | Dropdown language pair selector |
| ONB-03 | PDPA reasons expanded by default |
| HOM-01 | No missions section |
| HOM-01b | Review badge on nav tab |
| ONB-07 | Summary screen added |
| ONB-05 | Auto-advance for Beginner/Advanced |
