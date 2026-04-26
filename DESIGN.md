# Kotoka Design Specification
> v2.0 · 2026-04-26 · Source: stitch_kotoka_design_builder/STITCH_DESIGN_GUIDE.md

---

## Color System

| Token | Hex | Use |
|-------|-----|-----|
| `KColors.brand400` | `#0cf6fc` | **PRIMARY** — CTAs, nav active, streaks, glows, icon tints |
| `KColors.brand500` | `#00c8cc` | Progress fill, hover darken |
| `KColors.brand600` | `#8c6792` | Section headings, labels, tags |
| `KColors.brand700` | `#682069` | Supporting purple accents |
| `KColors.brand50`  | `#e8e1f0` | **Page background** (lavender) — ALL screens |
| `KColors.neutral0` | `#ffffff` | Card / panel surface |
| `KColors.brand100` | `#ffe1df` | Warm card variant (tertiary surfaces) |
| `KColors.error500` | `#d8566a` | Error |
| `KColors.warning500`| `#ffdfa2` | Warning |
| `#000000` | black | Text on brand400 CTA |

**Rules:**
- Every screen has at least one prominent `#0cf6fc` element
- NEVER use `brand400` text on `brand500` bg (contrast < 4.5:1)
- Light mode only — no dark mode
- All values from `lib/core/theme/tokens.dart`

---

## Typography

IBM Plex Sans (Latin) · Sarabun (Thai/Lao) · Noto Sans SC (ZH)

| Style | Size | Weight |
|-------|------|--------|
| h1 | 32px | 700 |
| h2 | 24px | 700 |
| h3 | 20px | 600 |
| h4 | 17px | 600 |
| body | 15px | 400 |
| caption | 12px | 400 |
| button | 15px | 600 |

---

## Spacing

`sp4=4` · `sp8=8` · `sp12=12` · `sp16=16` · `sp20=20` · `sp24=24` · `sp32=32`

- Page horizontal padding: `sp24`
- Section vertical gap: `sp24–sp32`
- Card internal padding: `sp16–sp20`

---

## Components

### Primary CTA Button
- Background: `KColors.brand400` (#0cf6fc)
- Text: `KColors.neutral1000` (black)
- Border-radius: `KRadius.full` (pill)
- Shadow: `brand400` at 30% opacity

### Secondary Button
- Background: transparent
- Border: `brand400` at 40%
- Text: `brand400`

### Cards
- Background: `KColors.neutral0` (white)
- Border: `brand400` at 20% opacity
- Border-radius: `KRadius.md` (12px)
- Shadow: `KElevation.shadow1`

### Progress Bar / Ring
- Track: `neutral200`
- Fill: `brand400` with glow `brand400/30`

---

## Navigation Bar

- Background: white at 90% opacity + `backdrop-blur`
- Border-top: `brand400` at 20%
- Active tab: `brand400/10` capsule bg, `brand400` icon + label
- Inactive tab: `neutral500` icon + label
- Badge: `error500` red dot with white text

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
