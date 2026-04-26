# Kotoka Stitch Design Guide
> Extracted from all 13 screen prototypes in `stitch_kotoka_design_builder/`

---

## 1. Brand Identity

**Personality:** Nurturing · Lucid · Sophisticated  
**Style:** Modern Glassmorphism with Tonal Clarity  
**Feel:** Light, airy, clean — depth through tonal stacking, not heavy shadows

---

## 2. Color System

Kotoka uses a **Cyan-dominant** palette. `#0cf6fc` is the **single dominant brand color** — used for nav active, streaks, CTAs, and all primary accents. Purple/pink are supporting tones. Light blue (`#7dd3fc`) is the calm secondary.

---

### Primary — Bright Cyan *(dominant brand color)*

| Token | Preview | Hex | Role |
|---|---|---|---|
| `primary` / `brand-400` | <span style="display:inline-block;width:20px;height:20px;background:#0cf6fc;border-radius:4px;border:1px solid #00d0d4;vertical-align:middle"></span> | `#0cf6fc` | **THE main color** — nav active, streak badges, CTAs, icon tints, glows |
| `primary-dim` / `brand-500` | <span style="display:inline-block;width:20px;height:20px;background:#00c8cc;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#00c8cc` | Darker teal — progress fill, hover darken on primary |
| `on-primary` | <span style="display:inline-block;width:20px;height:20px;background:#ffffff;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffffff` | White text on teal (ensures contrast on #00c8cc) |

<span style="display:inline-block;width:96px;height:64px;background:#0cf6fc;border-radius:10px;margin:3px;border:2px solid #00d0d4" title="PRIMARY #0cf6fc — dominant brand color"></span><span style="display:inline-block;width:64px;height:64px;background:#00c8cc;border-radius:10px;margin:3px" title="primary-dim #00c8cc"></span>

> **Rule:** Every screen must have at least one prominent `#0cf6fc` element. This is the color users associate with Kotoka.

---

### Secondary — Light Blue *(supporting, calm)*

| Token | Preview | Hex | Role |
|---|---|---|---|
| `secondary` / `sky-300` | <span style="display:inline-block;width:20px;height:20px;background:#7dd3fc;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#7dd3fc` | Light blue — info badges, secondary borders, chip backgrounds |
| `secondary-light` / `sky-100` | <span style="display:inline-block;width:20px;height:20px;background:#e0f2fe;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#e0f2fe` | Very light blue — container tints, hover bg |
| `on-secondary` | <span style="display:inline-block;width:20px;height:20px;background:#0c4a6e;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#0c4a6e` | Deep navy — text on light blue surfaces |

<span style="display:inline-block;width:64px;height:64px;background:#7dd3fc;border-radius:10px;margin:3px;border:1px solid #ccc" title="secondary #7dd3fc light blue"></span><span style="display:inline-block;width:64px;height:64px;background:#e0f2fe;border-radius:10px;margin:3px;border:1px solid #ccc" title="secondary-light #e0f2fe"></span>

---

### Purple / Pink — Decorative Accents Only *(not for buttons or CTAs)*

| Token | Preview | Hex | Role |
|---|---|---|---|
| `brand-700` | <span style="display:inline-block;width:20px;height:20px;background:#682069;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#682069` | Deep purple — decorative accents, illustrations only — **never buttons** |
| `heading` / `brand-600` | <span style="display:inline-block;width:20px;height:20px;background:#8c6792;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#8c6792` | Dark purple — section headings, labels, tags |
| `accent-pink` | <span style="display:inline-block;width:20px;height:20px;background:#ffb6cb;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffb6cb` | Pink — soft badges, card tints, hover tints |
| `on-cta` | <span style="display:inline-block;width:20px;height:20px;background:#ffffff;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffffff` | White — text on cyan buttons |

<span style="display:inline-block;width:64px;height:64px;background:#682069;border-radius:10px;margin:3px" title="CTA #682069"></span><span style="display:inline-block;width:64px;height:64px;background:#8c6792;border-radius:10px;margin:3px" title="heading #8c6792"></span><span style="display:inline-block;width:64px;height:64px;background:#ffb6cb;border-radius:10px;margin:3px;border:1px solid #e0a0b8" title="accent-pink #ffb6cb"></span>

---

### Background / Surface Stack

| Token | Preview | Hex | Role |
|---|---|---|---|
| `background` / `brand-50` | <span style="display:inline-block;width:20px;height:20px;background:#e8e1f0;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#e8e1f0` | Page background — Very Light Lavender |
| `surface` | <span style="display:inline-block;width:20px;height:20px;background:#ffffff;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffffff` | Card / panel surface |
| `surface-peach` | <span style="display:inline-block;width:20px;height:20px;background:#ffe1df;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffe1df` | Warm card variant — tertiary surfaces |

<span style="display:inline-block;width:64px;height:64px;background:#e8e1f0;border-radius:10px;margin:3px;border:1px solid #ccc" title="#e8e1f0 background"></span><span style="display:inline-block;width:64px;height:64px;background:#ffffff;border-radius:10px;margin:3px;border:1px solid #ccc" title="#ffffff surface"></span><span style="display:inline-block;width:64px;height:64px;background:#ffe1df;border-radius:10px;margin:3px;border:1px solid #e0c8c5" title="#ffe1df surface-peach"></span>

---

### Semantic Colors

| Token | Preview | Hex | Role |
|---|---|---|---|
| `error` | <span style="display:inline-block;width:20px;height:20px;background:#d8566a;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#d8566a` | Error — Red/Pink (non-alarming tone) |
| `warning` | <span style="display:inline-block;width:20px;height:20px;background:#ffdfa2;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffdfa2` | Warning — Pale Yellow/Tan |
| `on-surface` | <span style="display:inline-block;width:20px;height:20px;background:#000000;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#000000` | Primary body text |
| `on-colored` | <span style="display:inline-block;width:20px;height:20px;background:#ffffff;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffffff` | Text on dark colored backgrounds |

<span style="display:inline-block;width:64px;height:64px;background:#d8566a;border-radius:10px;margin:3px" title="#d8566a error"></span><span style="display:inline-block;width:64px;height:64px;background:#ffdfa2;border-radius:10px;margin:3px;border:1px solid #e0d080" title="#ffdfa2 warning"></span><span style="display:inline-block;width:64px;height:64px;background:#000000;border-radius:10px;margin:3px" title="#000000 text"></span><span style="display:inline-block;width:64px;height:64px;background:#ffffff;border-radius:10px;margin:3px;border:1px solid #ccc" title="#ffffff white"></span>

---

### Full Palette at a Glance

<span style="display:inline-block;width:56px;height:56px;background:#0cf6fc;border-radius:8px;margin:2px;border:2px solid #00d0d4" title="#0cf6fc PRIMARY"></span><span style="display:inline-block;width:48px;height:48px;background:#00c8cc;border-radius:8px;margin:2px" title="#00c8cc primary-dim"></span><span style="display:inline-block;width:48px;height:48px;background:#7dd3fc;border-radius:8px;margin:2px;border:1px solid #ccc" title="#7dd3fc secondary light blue"></span><span style="display:inline-block;width:48px;height:48px;background:#e0f2fe;border-radius:8px;margin:2px;border:1px solid #ccc" title="#e0f2fe secondary-light"></span><span style="display:inline-block;width:48px;height:48px;background:#682069;border-radius:8px;margin:2px" title="#682069 CTA purple"></span><span style="display:inline-block;width:48px;height:48px;background:#8c6792;border-radius:8px;margin:2px" title="#8c6792 heading purple"></span><span style="display:inline-block;width:48px;height:48px;background:#ffb6cb;border-radius:8px;margin:2px;border:1px solid #e0a0b8" title="#ffb6cb accent pink"></span><span style="display:inline-block;width:48px;height:48px;background:#e8e1f0;border-radius:8px;margin:2px;border:1px solid #ccc" title="#e8e1f0 background"></span><span style="display:inline-block;width:48px;height:48px;background:#ffe1df;border-radius:8px;margin:2px;border:1px solid #e0c8c5" title="#ffe1df surface-peach"></span><span style="display:inline-block;width:48px;height:48px;background:#ffdfa2;border-radius:8px;margin:2px;border:1px solid #e0c880" title="#ffdfa2 warning"></span><span style="display:inline-block;width:48px;height:48px;background:#d8566a;border-radius:8px;margin:2px" title="#d8566a error"></span><span style="display:inline-block;width:48px;height:48px;background:#000000;border-radius:8px;margin:2px" title="#000000 text"></span><span style="display:inline-block;width:48px;height:48px;background:#ffffff;border-radius:8px;margin:2px;border:1px solid #ccc" title="#ffffff white"></span>

---

### Usage Rules

| Situation | Color to use |
|---|---|
| **Nav active, streak, accent icons, glows** | `#0cf6fc` **(PRIMARY — use most, users must see it everywhere)** |
| Progress fill, hover darken | `#00c8cc` (primary-dim) |
| **Primary CTA button** | `#00c8cc` **(teal — all buttons use this, never purple)** |
| Section headings, labels, tags | `#8c6792` (heading purple) |
| Info chips, secondary borders | `#7dd3fc` (light blue) |
| Subtle container tint, hover bg | `#e0f2fe` (secondary-light) |
| Soft badge, card accent | `#ffb6cb` (accent pink) |
| Page background | `#f8f9ff` |
| Card / modal surface | `#ffffff` or `#ffe1df` |
| Error | `#d8566a` |
| Warning | `#ffdfa2` |
| Body text | `#000000` |
| Text on purple/dark buttons | `#ffffff` |
| **NEVER** | `#0cf6fc` text on `#00c8cc` bg — contrast ratio < 4.5:1 |

---

## 3. Typography

Font: **IBM Plex Sans** (all weights 300–700). No other Latin font used.

| Token | Size | Weight | Line-height | Letter-spacing |
|---|---|---|---|---|
| `h1` | 48px | 600 | 1.2 | tight (`tracking-tight`) |
| `h2` | 32px | 600 | 1.25 | — |
| `h3` | 24px | 500 | 1.3 | — |
| `body-lg` | 18px | 400 | 1.6 | — |
| `body-md` | 16px | 400 | 1.5 | — |
| `label-md` | 14px | 500 | 1.4 | 0.02em |
| `caption` | 12px | 400 | 1.4 | — |

**Usage patterns observed:**
- Page headings: `font-h1 text-h1` or `font-h2 text-h2`
- Card titles: `font-h3 text-h3`
- Button labels: `font-label-md text-label-md`
- Supporting text: `font-body-md text-body-md text-on-surface-variant`
- Metadata chips, uppercase labels: `font-label-md text-label-md uppercase tracking-widest`
- Fine print: `font-caption text-caption text-outline`

---

## 4. Spacing Scale

| Token | Value |
|---|---|
| `xs` | 4px |
| `sm` | 8px |
| `md` | 16px |
| `lg` | 24px |
| `xl` | 32px |
| `xxl` | 48px |
| `xxxl` | 64px |

- **Page horizontal padding:** `px-lg` (24px) on mobile, `px-xl` (32px) on desktop
- **Section vertical rhythm:** `space-y-xl` (32px) between major sections
- **Card internal padding:** `p-lg` (24px)
- **List item / small card padding:** `p-md` (16px)
- **Gap between bento cells:** `gap-lg` (24px)

---

## 5. Border Radius

| Token | Value | Use |
|---|---|---|
| `DEFAULT` | 0.25rem (4px) | Micro elements |
| `lg` | 0.5rem (8px) | Small chips, icon containers |
| `xl` | 0.75rem (12px) | Cards, buttons, inputs (most common) |
| `xxl` | 1.5rem (24px) | Large hero cards, product visuals |
| `full` | 9999px | Pill buttons, avatar circles, progress dots |

Observed shorthand: `rounded-xl` is the default for cards and buttons. `rounded-full` for chips, tags, nav active state capsule, FAB.

---

## 6. Elevation & Depth

| Level | Implementation |
|---|---|
| 0 — Background | `bg-background` (#f8f9ff) |
| 1 — Cards | `bg-white border border-outline-variant shadow-sm` |
| 2 — Elevated Cards | `shadow-md` on hover/active, or `shadow-lg` for hero cards |
| 3 — Glass Overlays | `bg-white/70 backdrop-blur-xl border border-white/40` |
| 4 — Dark Glass | `bg-on-surface/60 backdrop-blur-md` (camera overlay panels) |
| 5 — FAB / Sticky Shell | `shadow-2xl` or `shadow-lg shadow-primary-container/30` |

Hover transitions always use `transition-shadow` or `transition-all duration-200–300`.

---

## 7. Layout Patterns

### 7.1 Bento Grid

The primary layout system. Uses CSS grid with a 12-column base.

```
grid grid-cols-1 md:grid-cols-12 gap-lg
```

**Common span combinations:**
- `md:col-span-8` + `md:col-span-4` — main content + sidebar
- `md:col-span-7` + `md:col-span-5` — detail view (pack detail)
- `md:col-span-2` + `md:col-span-10` — sidebar stat + main
- `md:col-span-3` (stats row) × 4

**Asymmetric stagger:** Cards in the same row are intentionally offset vertically (`lg:mt-md` or `lg:-mt-md`) to create visual rhythm — seen in proficiency CEFR cards.

### 7.2 Split Layout (Auth Screen)

```
flex flex-col md:flex-row
  left: hidden md:flex md:w-1/2 lg:w-3/5   ← brand panel
  right: w-full md:w-1/2 lg:w-2/5          ← form panel
```

Left side: solid `bg-primary` with decorative blur orbs.  
Right side: `bg-white` with centered form.

### 7.3 Full-Screen Immersive (Camera / Splash)

Splash: `min-h-screen flex flex-col items-center justify-between` with a hero image anchored at bottom (`rounded-t-[48px]`).  
Camera: `absolute inset-0` camera feed + layered glass panels at top, sides, and bottom.

### 7.4 Asymmetric Content Grid (Language Selection, Goal Setting)

```css
.asymmetric-grid {
  display: grid;
  grid-template-columns: 1.2fr 0.8fr;
  gap: 24px;
}
/* mobile: grid-template-columns: 1fr */
```

A 12-col split: `lg:col-span-5` + `lg:col-span-2` (separator) + `lg:col-span-5`.

---

## 8. Component Library

> **Color rule:** All buttons and interactive CTAs use `#00c8cc` (teal). Accent icons, nav active states, and glows use `#0cf6fc`. Never use purple (`#682069`) for any button or CTA.

### 8.1 Buttons

**Primary CTA:**
```html
<button class="w-full py-md px-xl bg-[#00c8cc] text-white
               font-label-md text-label-md rounded-xl shadow-lg
               shadow-[#00c8cc]/30 hover:brightness-105
               active:scale-95 transition-all duration-300">
```

**Primary CTA (pill variant):**
```html
<button class="py-md px-xxl bg-[#00c8cc] text-white
               font-label-md rounded-full shadow-lg shadow-[#00c8cc]/30
               hover:brightness-110 active:scale-95 transition-all">
```

**Secondary / Ghost:**
```html
<button class="w-full py-md bg-transparent text-[#00c8cc]
               font-label-md rounded-xl border border-[#00c8cc]/40
               hover:bg-[#00c8cc]/5 transition-colors">
```

**Outlined:**
```html
<button class="border-2 border-[#00c8cc] text-[#00c8cc] w-full py-md
               rounded-xl font-label-md hover:bg-[#00c8cc]/10 transition-colors">
```

### 8.2 Cards

**Standard card:**
```html
<div class="bg-white border border-[#0cf6fc]/20 rounded-xl p-lg shadow-sm
            hover:border-[#0cf6fc]/60 hover:shadow-md transition-all">
```

**Active/selected card:**
```html
<div class="bg-[#0cf6fc]/5 border-2 border-[#0cf6fc]
            rounded-xl p-lg shadow-lg ring-4 ring-[#0cf6fc]/10">
```

**Glass card:**
```html
<div class="bg-white/70 backdrop-blur-xl p-md rounded-xl
            border border-[#0cf6fc]/20 shadow-xl">
```

**Bento info card (tinted):**
```html
<div class="bg-[#0cf6fc]/5 border border-[#0cf6fc]/20
            rounded-xl p-md flex gap-md items-start">
```

### 8.3 Goal / Filter Chips (Tags)

**Active:**
```html
<button class="flex items-center gap-sm px-lg py-md rounded-xl
               bg-[#00c8cc] text-white font-label-md shadow-md
               shadow-[#00c8cc]/30">
```

**Inactive:**
```html
<button class="flex items-center gap-sm px-lg py-md rounded-xl
               bg-white text-on-surface-variant border border-[#0cf6fc]/20
               hover:bg-[#0cf6fc]/5 hover:border-[#0cf6fc]/50
               font-label-md transition-all">
```

**Category filter (pill):**
```html
<button class="flex-shrink-0 bg-[#00c8cc] text-white
               px-lg py-sm rounded-full font-label-md"> <!-- active -->
<button class="flex-shrink-0 bg-white text-on-surface-variant
               border border-[#0cf6fc]/20 px-lg py-sm rounded-full
               font-label-md hover:bg-[#0cf6fc]/5"> <!-- inactive -->
```

### 8.4 Toggle Switch (CSS-only)

```html
<label class="relative inline-flex items-center cursor-pointer">
  <input type="checkbox" class="sr-only peer" checked />
  <div class="w-11 h-6 bg-slate-200 rounded-full peer
              peer-checked:bg-[#00c8cc]
              after:content-[''] after:absolute after:top-[2px] after:start-[2px]
              after:bg-white after:border after:rounded-full
              after:h-5 after:w-5 after:transition-all
              peer-checked:after:translate-x-full">
  </div>
</label>
```

### 8.5 Radio Cards (Commitment / Plan Selection)

```html
<label class="relative cursor-pointer group">
  <input type="radio" name="time" class="peer sr-only" />
  <div class="p-lg bg-white border border-slate-200 rounded-xl
              transition-all shadow-sm hover:shadow-md
              peer-checked:border-[#00c8cc] peer-checked:border-2
              peer-checked:ring-2 peer-checked:ring-[#00c8cc]/20
              peer-checked:bg-[#00c8cc]/5">
    <!-- content -->
  </div>
</label>
```

### 8.6 Progress Bar

```html
<div class="h-2 w-full bg-slate-100 rounded-full overflow-hidden">
  <div class="h-full bg-[#0cf6fc] w-[35%] rounded-full
              shadow-[0_0_6px_#0cf6fc]"></div>
</div>
```

### 8.7 Progress Ring (SVG)

```html
<svg class="w-full h-full -rotate-90">
  <circle cx="50%" cy="50%" r="45%" fill="transparent"
          stroke="rgba(12,246,252,0.2)" stroke-width="8"/>
  <circle cx="50%" cy="50%" r="45%" fill="transparent"
          stroke="#0cf6fc" stroke-dasharray="283"
          stroke-dashoffset="40" stroke-width="8"
          style="filter: drop-shadow(0 0 4px #0cf6fc)"/>
</svg>
```
Center overlay: `absolute flex flex-col items-center` with `font-h3` number and `font-caption` label.

### 8.8 Floating Action Button (FAB)

```html
<button class="fixed bottom-24 right-6 w-14 h-14 bg-[#00c8cc] text-white
               rounded-full shadow-2xl shadow-[#00c8cc]/40
               flex items-center justify-center
               transition-transform active:scale-90 z-40
               hover:brightness-110">
  <span class="material-symbols-outlined text-[28px]">add</span>
</button>
```

### 8.9 Step Progress Indicator

**Dot style (bottom):**
```html
<div class="fixed bottom-lg left-1/2 -translate-x-1/2 flex items-center gap-sm
            bg-white px-lg py-sm rounded-full shadow-lg
            border border-[#0cf6fc]/20 z-40">
  <div class="w-2 h-2 rounded-full bg-slate-200"></div>
  <div class="w-6 h-2 rounded-full bg-[#0cf6fc]
              shadow-[0_0_4px_#0cf6fc]"></div> <!-- active = wider + glow -->
  <div class="w-2 h-2 rounded-full bg-slate-200"></div>
  <div class="w-2 h-2 rounded-full bg-slate-200"></div>
</div>
```

**Bar style (header):**
```html
<div class="flex gap-xs">
  <div class="h-1.5 w-8 rounded-full bg-[#0cf6fc]"></div> <!-- completed -->
  <div class="h-1.5 w-8 rounded-full bg-slate-200"></div> <!-- pending -->
</div>
```

### 8.10 Icon Containers

```html
<!-- Small square -->
<div class="p-sm bg-[#0cf6fc]/10 rounded-lg border border-[#0cf6fc]/20">
  <span class="material-symbols-outlined text-[#0cf6fc]">photo_camera</span>
</div>

<!-- Medium rounded -->
<div class="w-12 h-12 bg-[#0cf6fc]/10 border border-[#0cf6fc]/30
            rounded-xl flex items-center justify-center">
  <span class="material-symbols-outlined text-[#0cf6fc]">photo_camera</span>
</div>

<!-- Tinted for feature cards -->
<div class="w-12 h-12 bg-[#0cf6fc]/15 rounded-xl
            flex items-center justify-center text-[#0cf6fc]">
  <span class="material-symbols-outlined text-3xl">business_center</span>
</div>
```

### 8.11 Toasts / Notification Chips

```html
<div class="fixed bottom-lg right-lg bg-white rounded-lg px-md py-sm
            flex items-center gap-sm border-l-4 border-[#0cf6fc] shadow-xl">
  <span class="material-symbols-outlined text-[#0cf6fc]"
        style="font-variation-settings: 'FILL' 1;">check_circle</span>
  <span class="font-label-md text-label-md text-on-surface">Setup Complete</span>
</div>
```

### 8.12 Input Fields

```html
<input class="w-full px-lg py-md rounded-xl border border-slate-200
              focus:border-[#0cf6fc] focus:ring-2 focus:ring-[#0cf6fc]/20
              outline-none transition-all duration-200
              font-body-md text-body-md placeholder:text-slate-400"/>
```

### 8.13 Badges / Status Pills

```html
<!-- Primary badge -->
<span class="bg-[#00c8cc] text-white text-xs font-bold
             px-sm py-xs rounded-full uppercase tracking-wider">
  Active
</span>

<!-- Outline badge -->
<span class="border border-[#00c8cc] text-[#00c8cc] text-xs font-bold
             px-sm py-xs rounded-full uppercase tracking-wider">
  New
</span>
```

---

## 9. Navigation Shell

### Bottom Navigation Bar

Fixed, glass-morphic. Present on all post-onboarding screens. Suppressed during linear onboarding flows.

```html
<nav class="fixed bottom-0 left-0 w-full z-50 flex justify-around items-center
            px-2 py-3 mb-safe
            bg-white/90 backdrop-blur-md
            border-t border-[#0cf6fc]/20 shadow-lg">
```

**5 tabs:** Home · Snap · Review · Shop · Me

**Active tab:**
```html
<a class="flex flex-col items-center text-[#0cf6fc]
          bg-[#0cf6fc]/10 rounded-xl px-3 py-1
          transition-transform active:scale-90
          border border-[#0cf6fc]/20">
  <span class="material-symbols-outlined"
        style="font-variation-settings: 'FILL' 1;">home</span>
  <span class="text-[10px] font-bold uppercase tracking-wider">Home</span>
</a>
```

**Inactive tab:**
```html
<a class="flex flex-col items-center text-slate-400 px-3 py-1
          transition-transform active:scale-90 hover:text-[#0cf6fc]">
  <span class="material-symbols-outlined">photo_camera</span>
  <span class="text-[10px] font-medium uppercase tracking-wider">Snap</span>
</a>
```

Note: Active indicator is a `bg-[#0cf6fc]/10 border border-[#0cf6fc]/20 rounded-xl` capsule. Icon and label both switch to `text-[#0cf6fc]`.

### Top App Bar (Sticky Header)

```html
<header class="sticky top-0 z-50 flex justify-between items-center px-4 py-2
               w-full bg-white shadow-sm border-b border-[#0cf6fc]/15">
```

- Brand wordmark: `text-2xl font-bold text-[#0cf6fc] tracking-tight`
- Back arrow: `text-[#0cf6fc]`
- Nav suppression rule: During onboarding (linear journey), bottom nav is hidden. Header kept for brand anchor + back arrow.

---

## 10. Screen-by-Screen Layout Reference

> Wireframes show **mobile portrait** (≈375px). KokoAnimation assets: `koko-idle` · `koko-wave` · `koko-celebrate` · `koko-thinking` · `koko-excited` · `koko-encourage`. Import via `package:kokoanimation/kokoanimation.dart`. Never use Lottie or Rive.

---

### ONB-01 — Splash

```
┌─────────────────────────┐
│                         │
│                         │  ← ambient blur orb top-left (primary-container/10)
│     ╔═══════════╗       │
│     ║  [KOKO]   ║       │  ← KokoAnimation: koko-wave (128×128, rounded-[40px])
│     ║  koko-wave║       │     bg-primary-container, shadow-xl
│     ╚═══════════╝       │
│                         │
│        Kotoka           │  ← h1, text-on-surface, tracking-tight
│                         │
│  Your serene memory     │  ← body-lg, text-outline, max-w-md
│  companion. Capture,    │
│  organize, and relive…  │
│                         │
│  ┌─────────────────┐    │
│  │   Get Started   │    │  ← bg-primary-container, rounded-xl, shadow-lg
│  └─────────────────┘    │
│                         │
│    Sign in to account   │  ← ghost, text-primary, font-label-md
│                         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┤  ← gradient-to-t from-background overlay
│  ┌──────┐ ┌────┐ ┌─────┐│  ← 3 floating glass cards (bg-white/70 blur-xl)
│  │📷    │ │⭐  │ │🔒   ││
│  │Snap  │ │AI  │ │Vault││
│  └──────┘ └────┘ └─────┘│
│                         │
│                         │  
└─────────────────────────┘
  No bottom nav (onboarding)
```

**KokoAnimation** → `koko-wave` replaces static logo icon in the brand mark container. Koko waves to welcome the user on first open.

---

### ONB-02 — Auth / Sign In

```
┌─────────────────────────┐  ← mobile: single column, bg-white
│  ┌────┐                 │
│  │[K] │  Kotoka         │  ← mobile only: icon + wordmark (hidden md:hidden)
│  └────┘                 │     bg-primary-container rounded-xl w-16 h-16
│                         │
│  Welcome back           │  ← h2, text-on-surface
│  Please enter details   │  ← body-md, text-outline
│                         │
│  ┌─────────────────────┐│
│  │ [G]  Continue Google ││  ← outlined, border-outline-variant, rounded-xl
│  └─────────────────────┘│
│  ┌─────────────────────┐│
│  │ [🍎] Continue Apple  ││  ← solid black bg, rounded-xl
│  └─────────────────────┘│
│                         │
│  ─────  or sign in  ────│  ← caption, uppercase, tracking-widest
│                         │
│  Email address          │  ← label-md, text-on-surface-variant
│  ┌─────────────────────┐│
│  │  name@company.com   ││  ← rounded-xl, focus:ring-2 primary-container/20
│  └─────────────────────┘│
│                         │
│  Password    Forgot? →  │
│  ┌─────────────────────┐│
│  │  ••••••••      [👁] ││  ← visibility toggle button absolute right
│  └─────────────────────┘│
│                         │
│  ☑  Remember 30 days    │  ← checkbox, w-5 h-5
│                         │
│  ┌─────────────────────┐│
│  │  Sign in to Kotoka  ││  ← bg-primary-container, font-bold, rounded-xl
│  └─────────────────────┘│
│                         │
│  No account? Sign up →  │  ← body-md, text-primary font-bold
│                         │
│  Privacy · Terms        │  ← caption, text-outline, opacity-60
└─────────────────────────┘
  Desktop: left half = bg-primary brand panel with blur orbs
           right half = this form (w-2/5, bg-white)
  No bottom nav (onboarding)
```

---

### ONB-03 — Permissions / Consent

```
┌─────────────────────────┐
│                         │  ← ambient orbs fixed top-right & bottom-left
│     ┌───────────┐       │
│     │  🛡 icon  │       │  ← w-xl h-xl, bg-primary-container/10, rounded-full
│     └───────────┘       │     icon text-h1 size, text-primary-container
│                         │
│   Help Kotoka learn     │  ← h2, text-on-surface, tracking-tight
│  To provide a seamless  │  ← body-md, text-on-surface-variant, max-w-sm
│  experience we need a   │
│  few permissions…       │
│                         │
│ ┌───────────────────────┐│
│ │ ┌──┐ Camera    ••• [●]││  ← white card, border-outline-variant
│ │ └──┘ Snap memories    ││     toggle ON = peer-checked:bg-primary-container
│ └───────────────────────┘│
│ ┌───────────────────────┐│
│ │ ┌──┐ Location   ••[○] ││  ← toggle OFF
│ │ └──┘ Geo-tag memories ││
│ └───────────────────────┘│
│ ┌───────────────────────┐│
│ │ ┌──┐ Microphone ••[●] ││
│ │ └──┘ Voice notes, AI  ││
│ └───────────────────────┘│
│ ┌───────────────────────┐│
│ │ ┌──┐ Notifications [●]││
│ │ └──┘ Smart reminders  ││
│ └───────────────────────┘│
│                          │
│  ┌──────────────────────┐│
│  │  Allow Selected      ││  ← primary CTA
│  └──────────────────────┘│
│      Maybe Later         │  ← ghost, text-primary
│                          │
│  Change anytime in       │  ← caption, text-on-surface-variant
│  Device Settings →       │
└──────────────────────────┘
  No bottom nav (onboarding)
```

---

### ONB-04 — Language Selection

```
┌─────────────────────────┐
│ ◀  Kotoka    Step 2 of 4│  ← sticky header, bg-white, shadow-sm
├─────────────────────────┤
│                         │
│  Choose your experience │  ← h1/h2, text-on-surface
│  Select your native and │  ← body-lg, text-on-surface-variant
│  learning language…     │
│                         │
│  🎙 Primary language    │  ← h3, text-on-surface
│  ┌───────────────────┐  │
│  │ 🔍 Search langs…  │  │  ← search input, rounded-xl
│  └───────────────────┘  │
│  ┌───────────────────┐  │
│  │ 🇺🇸 English  ✓    │  │  ← ACTIVE: border-2 primary-container, bg-10%
│  └───────────────────┘  │
│  ┌───────────────────┐  │
│  │ 🇪🇸 Español       │  │  ← inactive: bg-white border-outline-variant
│  └───────────────────┘  │
│  ┌───────────────────┐  │
│  │ 🇫🇷 Français      │  │
│  └───────────────────┘  │
│                         │
│     ── ⇄ swap ──        │  ← col-span-2 separator with swap_horiz icon
│                         │
│  🌐 Learning language   │  ← h3
│  ┌──────────┐┌──────────┐│
│  │ 🇯🇵 日本語 ✓││ 🇰🇷 한국어 ││  ← 2×2 grid, selected = border-2 + ring-2
│  └──────────┘└──────────┘│
│  ┌──────────┐┌──────────┐│
│  │ 🇩🇪 Deutsch││  + More  ││  ← dashed border "More Languages" btn
│  └──────────┘└──────────┘│
│  ┌──────────────────────┐│
│  │ 💡 Pro Tip           ││  ← bento info card, bg-surface-container-low
│  │ Kotoka AI adapts…    ││
│  └──────────────────────┘│
│                          │
│  ┌──────────────────────┐│
│  │ Confirm Selection  → ││  ← pill CTA, rounded-full
│  └──────────────────────┘│
│      I'll do this later  │  ← ghost text link
└──────────────────────────┘
  No bottom nav (onboarding)
```

---

### ONB-05 — Proficiency / Choose Your Path

> **Template reference:** `stitch_kotoka_design_builder/image.png` (Duolingo-style 2-card path selector)  
> **Assets:** `kotoka_logo/child_koko_nobg.png` (beginner) · `kotoka_logo/graduate_koko_nobg.png` (experienced)  
> Remove background via `stitch_kotoka_design_builder/remove_bg.py` before use.

```
┌─────────────────────────┐
│ ◀  Kotoka    Step 2 of 4│  ← sticky header, bg-white, shadow-sm
├─────────────────────────┤  ← bar-style step progress below header
│ ████████████░░░░░░░░░░░ │     h-1.5, bg-primary (#0cf6fc) fill 50%
│                         │
│   Choose your path      │  ← h1, text-on-surface, text-center, tracking-tight
│  How familiar are you   │  ← body-md, text-heading (#8c6792), text-center
│  with this language?    │
│                         │
│ ┌───────────────────────┐│  ← Card 1: bg-white, border-outline-variant
│ │                       ││     rounded-xl, p-lg, shadow-sm
│ │   ┌───────────────┐   ││     hover: border-2 border-primary shadow-md
│ │   │  child_koko   │   ││  ← child_koko_nobg.png, w-32 h-32, object-contain
│ │   │   _nobg.png   │   ││     mx-auto mb-md
│ │   └───────────────┘   ││
│ │  Learning for the     ││  ← label-md font-bold, text-on-surface, text-center
│ │  first time?          ││
│ │  Start from scratch!  ││  ← caption, text-outline, text-center
│ └───────────────────────┘│
│                          │
│ ┌───────────────────────┐│  ← Card 2: same style
│ │                       ││
│ │  ┌───────────────┐    ││
│ │  │ graduate_koko │    ││  ← graduate_koko_nobg.png, w-32 h-32, object-contain
│ │  │  _nobg.png    │    ││
│ │  └───────────────┘    ││
│ │  Already know some?   ││  ← label-md font-bold, text-on-surface, text-center
│ │  Check your level!    ││  ← caption, text-outline, text-center
│ └───────────────────────┘│
│                          │
│     ○  ━━  ○  ○          │  ← step dots, fixed bottom
└──────────────────────────┘
  Selected state (either card):
    border-2 border-primary (#0cf6fc)
    bg-primary/5 (#0cf6fc at 5% opacity)
    ring-2 ring-primary/20
    shadow-lg
  No bottom nav (onboarding)
```

**Flutter implementation notes:**
```dart
// Two-card layout
Row(children: [
  // OR Column on mobile (use LayoutBuilder for breakpoint)
  _PathCard(
    image: 'stitch_kotoka_design_builder/kotoka_logo/child_koko_nobg.png',
    title: 'Learning for the first time?',
    subtitle: 'Start from scratch!',
    isSelected: _selected == PathType.beginner,
    onTap: () => setState(() => _selected = PathType.beginner),
  ),
  _PathCard(
    image: 'stitch_kotoka_design_builder/kotoka_logo/graduate_koko_nobg.png',
    title: 'Already know some?',
    subtitle: 'Check your level here!',
    isSelected: _selected == PathType.experienced,
    onTap: () => setState(() => _selected = PathType.experienced),
  ),
])
```

**KokoAnimation** → No KokoAnimation on this screen — the Koko character images ARE the mascot content here. Adding koko-thinking on top would create visual conflict.

---

### ONB-06 — Goal Setting

```
┌─────────────────────────┐
│ ◀  Kotoka  ━━━━━━━○     │  ← header + bar-style step progress (3/4 filled)
├─────────────────────────┤
│                         │
│  What's your focus?     │  ← h1, text-on-surface
│  Set your personalized  │  ← body-lg, text-on-surface-variant
│  goals and daily rhythm │
│                         │
│  Select Goals  Step 1/2 │  ← h2 + badge pill
│ ┌───────────────────────┐│
│ │ [🧠 Mental Clarity ✓] ││  ← ACTIVE chip: bg-primary-container
│ │ [📖 Daily Journaling]  ││  ← inactive: bg-surface-container-low
│ │ [📷 Visual Memory]     ││
│ │ [📅 Routine Build ✓]   ││  ← ACTIVE chip
│ │ [⏳ Past Review]       ││
│ │ [⚡ Focus Sprints]     ││
│ └───────────────────────┘│
│                          │
│  ┌──────────┐┌──────────┐│  ← 2-col bento insight row
│  │ 💡       ││ [image]  ││
│  │ Lucid    ││ Inspiring││
│  │ Thinking ││ Spaces   ││
│  └──────────┘└──────────┘│
│                          │
│  Commitment    Step 2/2  │  ← h2 + badge pill
│                          │
│  ╔═══════════════════════╗│
│  ║  ╔════╗               ║│  ← KokoAnimation: koko-encourage (small, right)
│  ║  ║KOKO║  Breezy  ●   ║│     positioned top-right of commitment section
│  ║  ╚════╝  5-10m/day   ║│
│  ╚═══════════════════════╝│  ← radio SELECTED: peer-checked:border-primary
│ ┌───────────────────────┐ │
│ │  🕐  Steady  15-20m ○ │ │  ← radio inactive
│ └───────────────────────┘ │
│ ┌───────────────────────┐ │
│ │  🏋  Deep Dive 30m+ ○ │ │
│ └───────────────────────┘ │
│                           │
│  ┌─────────────────────┐  │
│  │  Confirm Selection →│  │  ← bg-primary, rounded-xl
│  └─────────────────────┘  │
│  Change goals in settings │  ← caption, text-outline
└───────────────────────────┘
  No bottom nav (onboarding)
```

**KokoAnimation** → `koko-encourage` small widget beside the commitment section title — motivates the user to commit to a daily habit.

---

### ONB-07 — Completion (Success)

```
┌─────────────────────────┐
│                         │
│   You're all set!       │  ← h1, text-on-surface, tracking-tight
│   Kotoka is now ready   │  ← body-lg, text-secondary, max-w-md
│   to help you preserve… │
│                         │
│ ┌═══════════════════════╗│
│ ║                       ║│  ← col-span-8, koko-mascot-bg (radial gradient)
│ ║   ╔═══════════════╗   ║│     bg: radial-gradient(#e6f9fa → #ffffff)
│ ║   ║  KOKO MASCOT  ║   ║│
│ ║   ║ koko-celebrate║   ║│  ← KokoAnimation: koko-celebrate (w-64 h-64)
│ ║   ║  or koko-wave ║   ║│     drop-shadow-xl, object-contain
│ ║   ╚═══════════════╝   ║│
│ ║  🛡 Account Secured   ║│  ← label-md, text-primary-container
│ ╚═══════════════════════╝│
│ ┌───────────────────────┐│
│ │ ⭐ Smart Tags         ││  ← col-span-4, bento-card (border #e5eeff)
│ │ Koko auto-categorizes ││
│ └───────────────────────┘│
│ ┌───────────────────────┐│
│ │ ☁  Cloud Sync         ││
│ │ Encrypted, all devices││
│ └───────────────────────┘│
│                          │
│  ┌──────────────────────┐│
│  │ Snap my first place →││  ← primary CTA, bg-primary-container
│  └──────────────────────┘│
│     Take a tour first    │  ← ghost, text-secondary
│                          │
│                ┌────────┐│  ← fixed bottom-right toast
│                │✓ Setup ││    border-l-4 border-primary
│                └────────┘│
└──────────────────────────┘
  No bottom nav (onboarding)
```

**KokoAnimation** → `koko-celebrate` is the hero of this screen. Centered in the large 8-col bento card on a soft radial teal gradient background. This is the primary celebratory moment in the onboarding flow.

---

### HOM-01 — Home

```
┌─────────────────────────┐
│ ☰   Kotoka         🔔   │  ← sticky header, bg-white, shadow-sm
├─────────────────────────┤
│ ┌═══════════════════════╗│
│ ║ 🔥 12 DAY STREAK      ║│  ← bg-primary-container, rounded-xl, p-xl
│ ║                       ║│     text: text-on-primary-container
│ ║  Keep the fire        ║│
│ ║  burning, Aiden.      ║│  ← h1/h2, leading-tight
│ ║                       ║│
│ ║  Your lucidity is at  ║│  ← body-lg, opacity-90
│ ║  an all-time high…    ║│
│ ║         ╭────────╮    ║│
│ ║         │  85%   │    ║│  ← SVG progress ring, w-32 h-32
│ ║         │  Daily │    ║│     stroke white/20 track + white progress
│ ║         ╰────────╯    ║│
│ ╚═══════════════════════╝│
│                          │
│  Daily Missions  View →  │  ← h3 + text-primary chevron link
│ ┌───────────────┐ ┌─────┐│
│ │ 📷 Visual     │ │[img]││  ← 2-col bento: md:col-span-2 + md:col-span-1
│ │   Anchor      │ │     ││     main card: bg-white, icon + title + body
│ │               │ │Grat.││     secondary: bg-surface-container-low + image hdr
│ │ [avatar] +12  │ │     ││
│ │ [Complete →]  │ │Resum││
│ └───────────────┘ └─────┘│
│                          │
│  Spatial Archive         │  ← h3 + filter/location icon buttons
│  Memories anchored…      │  ← caption, text-on-surface-variant
│ ┌────────────────────────┐│
│ │  [MAP IMAGE]    ❤ 📍  ││  ← h-[400px], relative, border-outline-variant
│ │                        ││     markers: bg-primary / bg-tertiary rounded-full
│ │    hover → [label]     ││     hover label: bg-white shadow-xl rounded-lg
│ │           ┌──────────┐ ││
│ │           │[img] Pk  │ ││  ← floating glass card: bg-white/90 blur-md
│ │           │2 nearby  │ ││
│ │           └──────────┘ ││
│ └────────────────────────┘│
│                          │
│ ┌──────┐┌──────┐┌──────┐┌┐│  ← 4-col stat tiles, bg-white, text-primary h2
│ │1,284 ││  92% ││  14  ││42│
│ │Mem.  ││Focus ││Cities││Cn│
│ └──────┘└──────┘└──────┘└┘│
│                        ⊕  │  ← FAB: fixed bottom-24 right-6, bg-primary
├─────────────────────────┤
│ [🏠]  📷    🧠    🛍   👤│  ← Home tab active (bg-cyan-50 rounded-xl capsule)
└─────────────────────────┘
```

**KokoAnimation** → `koko-idle` or `koko-encourage` as a small (64×64) widget tucked into the right side of the streak hero banner — gives the card personality and reinforces the Kotoka mascot identity during daily engagement.

---

### REV-02 — Flashcard Review

```
┌─────────────────────────┐
│ ☰   Kotoka         🔔   │
├─────────────────────────┤
│  Daily Review           │  ← h2, text-on-surface
│  Mastering your memory, │  ← body-lg, text-secondary
│  one card at a time.    │
│                  ⏱ 12m  │  ← timer chip: bg-surface-container-low, rounded-xl
│                          │
│  Card 14 of 40      35% │  ← label-md, text-secondary / text-primary font-bold
│  ████████░░░░░░░░░░░░░  │  ← h-2, bg-surface-container-highest track
│                          │     bg-primary-container fill w-[35%]
│ ┌════════════════════════╗│
│ ║              [Noun]   ║│  ← secondary-container badge, top-right absolute
│ ║                       ║│
│ ║       記憶             ║│  ← text-[64px], text-on-surface, leading-none
│ ║      ki-o-ku          ║│  ← body-lg, text-secondary, tracking-[0.2em]
│ ║                       ║│
│ ║  ╔═════════════════╗  ║│  ← KokoAnimation: koko-thinking (small, top-left)
│ ║  ║ KOKO-THINKING   ║  ║│     absolute, w-12 h-12, while card face-up
│ ║  ╚═════════════════╝  ║│
│ ║  [─ TAP TO REVEAL ─]  ║│  ← dashed border button, text-primary
│ ╚════════════════════════╝│
│                          │
│ ┌──────┐┌──────┐┌──────┐┌┐│  ← 4 rating buttons, grid-cols-4
│ │ 😣  ││ 😐  ││ 😊  ││😄│
│ │Again ││Hard  ││Good  ││Esy│
│ │  1m  ││  2d  ││  4d  ││7d│
│ └──────┘└──────┘└──────┘└┘│
│                          │
│ ┌──────────────┐┌────────┐│  ← 2-col context section
│ │ [image]      ││⭐Mnem. ││     left: rounded-xxl, gradient overlay, JP text
│ │ 彼には記憶が  ││Imagine ││     right: bg-surface-container, mnemonic + actions
│ │ He has no…   ││a key…  ││
│ └──────────────┘└────────┘│
├─────────────────────────┤
│  🏠   📷   [🧠]   🛍   👤│  ← Review tab active
└─────────────────────────┘
  Desktop sidebar (md:col-span-3, hidden mobile):
  ┌──────────────┐
  │ DECK INFO    │  ← label-md uppercase tracking-widest
  │ 📚 JLPT N2   │
  │ 📈 72% Mastery│
  └──────────────┘
  ┌──────────────┐
  │ 💡           │  ← bg-surface-container-low, border-primary/10
  │ Space your   │
  │ sessions…    │
  └──────────────┘
```

**KokoAnimation** → `koko-thinking` overlaid (small, absolute top-left) on the flashcard while the question face is shown. Swap to `koko-encourage` momentarily after user taps "Good" or "Easy" rating.

---

### SHO-01 — Shop Home

```
┌─────────────────────────┐
│ ☰   Kotoka     🔍   🔔● │  ← sticky header (● = notification dot, bg-error)
├─────────────────────────┤
│ ┌═══════════════════════╗│
│ ║ LIMITED OFFER         ║│  ← bg-primary-container, rounded-xl, h-64
│ ║                       ║│     abstract gradient bg at opacity-20
│ ║ Master Japanese with  ║│  ← h1/h2, text-on-primary
│ ║ Visual Logic          ║│
│ ║                       ║│
│ ║ Unlock the Full Deck  ║│  ← body-lg, opacity-90
│ ║ with Kotoka Premium.  ║│
│ ║                       ║│
│ ║ [Get Premium Now]     ║│  ← bg-white text-primary, rounded-xl
│ ╚═══════════════════════╝│
│                          │
│ [All] [Survival] [Biz] →│  ← horizontal scroll, gap-md, overflow-x-auto
│ [Travel] [Food] [Anime] │     active: bg-primary-container text-white rounded-full
│                          │     inactive: bg-surface-container rounded-full
│ ┌════════════════════════╗│
│ ║ [KYOTO IMAGE]         ║│  ← col-span-8 featured card
│ ║ BEST SELLER  ★★★★★    ║│     image hover: scale-105 duration-500
│ ║ Kyoto Survival        ║│     gradient overlay, badge chips absolute bottom
│ ║ Essentials            ║│
│ ╚════════════════════════╝│
│  500 cards · Audio  🎙   │  ← icon + caption metadata
│  $19.99      [Add Cart]  │  ← h2 text-primary + button
│                          │
│ ┌──────────┐┌────────────┐│  ← col-span-4 small cards × 4
│ │ 💼 Biz N3││🍜 Izakaya  ││     each: icon container (tinted) + h3 + body + price
│ │  $12.50  ││  $8.99     ││
│ └──────────┘└────────────┘│
│ ┌──────────┐┌────────────┐│
│ │✨Anime  ││🚃 Transit  ││
│ │  $14.99  ││  $5.99     ││
│ └──────────┘└────────────┘│
│                          │
│ ╔╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╗ │  ← dashed border upsell, bg-surface-container-low
│ ║ The Language Collector ║ │
│ ║ $9.99/mo  all packs    ║ │
│ ║ [Subscribe] [Learn]    ║ │
│ ╚╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╝ │
├─────────────────────────┤
│  🏠   📷    🧠   [🛍]  👤│  ← Shop tab active
└─────────────────────────┘
```

---

### SHO-02 — Pack Detail

```
┌─────────────────────────┐
│ ☰   Kotoka         🔔   │
├─────────────────────────┤
│ ┌════════════════════════╗│
│ ║  [OFFICE IMAGE]        ║│  ← aspect-[4/3], rounded-xxl, shadow-lg
│ ║                        ║│     group hover: no scale (detail = static)
│ ║  [Professional] [Prem] ║│  ← badge pills: bg-primary-container + bg-white/20
│ ║  Office Master Pack    ║│  ← h1, text-white
│ ║  The ultimate…         ║│  ← body-lg, text-cyan-50
│ ╚════════════════════════╝│
│ ┌──────┐┌──────┐┌──────┐ │  ← 3 sub-image thumbnails (aspect-square)
│ │[img] ││[img] ││ +12  │ │     hover: scale-105 duration-500
│ └──────┘└──────┘└──────┘ │
│                          │
│ ┌───────────────────────┐ │  ← right col info card (lg:col-span-5)
│ │ Pack Overview    ★ 4.9 │ │     bg-white, rounded-xxl, p-xl
│ │ Elevate your           │ │
│ │ cognitive workspace…   │ │
│ │                        │ │
│ │ INCLUDED TOPICS        │ │  ← label-md uppercase tracking-widest
│ │ [Analytics] [Groups]   │ │  ← topic chips: bg-surface-container-low
│ │ [Deep Work] [Comms]    │ │     border-outline-variant, rounded-xl
│ │ [Agile Design]         │ │
│ │                        │ │
│ │ ~~$49.99~~  SAVE 50%   │ │  ← line-through + tertiary-container badge
│ │ $24.99  lifetime       │ │  ← h2 text-on-surface
│ │ ┌──────────────────┐   │ │
│ │ │ 🔓 Unlock Pack   │   │ │  ← primary CTA, rounded-xxl, shadow-lg
│ │ └──────────────────┘   │ │
│ │ Secure checkout        │ │  ← caption, text-outline
│ └───────────────────────┘ │
│ ┌───────────────────────┐ │  ← glass testimonial card
│ │[avatar] "The Office    │ │     bg-white/70 backdrop-blur-xl
│ │Master Pack has…"       │ │     border border-white/50
│ │ — Sarah J., Director   │ │
│ └───────────────────────┘ │
│                          │
│  Explore More Packs      │  ← h2 + "View Gallery →"
│ ┌────┐┌────┐┌────┐┌────┐ │  ← 4-col related cards (lg:grid-cols-4)
│ │[im]││[im]││[im]││[im]│ │     each: image header (h-32) + title + topics + price
│ └────┘└────┘└────┘└────┘ │
├─────────────────────────┤
│  🏠   📷    🧠   [🛍]  👤│
└─────────────────────────┘
```

---

### SHO-03 — Premium Paywall

```
┌─────────────────────────┐
│ ✕   Kotoka    Restore   │  ← close (X) left + Restore right, sticky
├─────────────────────────┤
│ ┌═══════════════════════╗│
│ ║  [HERO IMAGE]          ║│  ← h-[353px], full-bleed, object-cover
│ ║                        ║│     gradient-to-t from-background via-40% to-transparent
│ ║   ┌──────────────┐     ║│
│ ║   │★ UPGRADE TO  │     ║│  ← badge: bg-primary-container/20, border-30%
│ ║   │  PREMIUM     │     ║│
│ ║   └──────────────┘     ║│
│ ║                        ║│
│ ║  Unlock Your Full      ║│  ← h1, text-on-surface
│ ║  Memory                ║│
│ ║  Experience Kotoka     ║│  ← body-lg, text-secondary
│ ║  without limits…       ║│
│ ╚═══════════════════════╝│
│                          │
│ ┌═══════════════════╗┌──┐│  ← bento: col-span-2 large + 1-col small
│ ║ 💾 Unlimited      ║│⭐ ││     large: bg-white rounded-xl shadow-sm
│ ║   Storage         ║│AI ││     small: bg-white rounded-xl
│ ║ Never worry about ║│   ││
│ ║ space again…      ║└──┘│
│ ╚═══════════════════╝    │
│ ┌──┐┌═══════════════════╗│
│ │🔒││ Priority Sync      ║│  ← gradient: from-primary-container to-cyan-600
│ │Vlt│║ Real-time across  ║│     text-white
│ └──┘║ all devices. 0.1s  ║│
│     ╚═══════════════════╝│
│                          │
│  Choose Your Plan        │  ← h2, text-center
│                          │
│ ┌───────────────────────┐│  ← Monthly radio (outline, inactive)
│ │  Monthly   Flexible   ││
│ │               $9.99   ││
│ └───────────────────────┘│
│ ╔═══════════════════════╗│  ← Yearly radio SELECTED
│ ║  Yearly  [SAVE 40%] ✓ ║│     border-2 border-primary-container
│ ║             $69.99    ║│     bg-surface-container-low
│ ╚═══════════════════════╝│
│                          │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┤  ← fixed bottom bar: bg-white/90 backdrop-blur-md
│  ┌─────────────────────┐ │
│  │ Start 7-Day Trial   │ │  ← bg-primary-container, rounded-xl, h3
│  └─────────────────────┘ │
│  Recurring. Cancel any.  │  ← caption, text-slate-400, text-center
└──────────────────────────┘
  No bottom nav (transactional paywall)
```

**KokoAnimation** → `koko-excited` small widget beside the "UPGRADE TO PREMIUM" badge in the hero — conveys enthusiasm for the premium tier.

---

### SNA-01 — Snap / Camera

```
┌─────────────────────────┐  ← bg-on-surface (#0b1c30), h-screen, overflow-hidden
│                         │
│ ┌──────────┐  ⚙  ┌────┐ │  ← top HUD overlay (z-20)
│ │● REC 42s │     │BATT│ │     glass-dark pill: bg-on-surface/60 blur-md
│ └──────────┘     │ 88%│ │
│ ┌────┐┌─────┐    └────┘ │
│ │ISO ││1/250│           │  ← exposure controls, glass-dark rounded-lg
│ │100 ││     │           │
│ └────┘└─────┘           │
│                         │
│   ┌─  ─  ─  ─  ─  ─  ┐ │  ← bounding box 1 (w-48 h-64, absolute)
│     ┌────────────────┐   │     corner L-brackets: focus-bracket class
│   │ │OBJECT:         │ │ │     label: bg-primary-container rounded, absolute -top-8
│     │WORKSTATION 98% │   │
│   │ └────────────────┘ │ │
│   └─  ─  ─  ─  ─  ─  ┘ │
│          ╔╌╌╌╌╌╌╌╌╌╌╗   │  ← bounding box 2 (dashed, smaller)
│          ║LIGHT:SOFT ║   │     glass-dark label below
│          ╚╌╌╌╌╌╌╌╌╌╌╝   │
│                         │
│ ┌────────┐    ┌────────┐ │  ← left: sensor strip  right: AI panel (both glass-dark)
│ │🌡 24°C │    │Neural  │ │     left: rounded-full column, p-sm
│ │💨 12km │    │Sync    │ │     right: border-l-4 border-primary-container
│ │📍 48.8N│    │────────│ │
│ └────────┘    │Tags:   │ │
│               │[Arch.] │ │
│               │[Light] │ │
│               └────────┘ │
│                         │
│   0.5x  ──●──────  2x  │  ← zoom slider: bg-white/20 track, primary-container fill
│                         │     draggable thumb: bg-white border-2 border-primary-container
│ ┌────┐   ╭───────────╮  ┌──┐│
│ │[▣] │   │  ╭─────╮  │  │🔄││  ← gallery thumb · shutter · camera-flip
│ └────┘   │  │     │  │  └──┘│     shutter: w-20 h-20 bg-white rounded-full
│          │  ╰─────╯  │       │     border-4 border-primary-container
│          ╰───────────╯       │
├─────────────────────────┤
│  🏠  [📷]   🧠    🛍   👤│  ← Snap tab active (glass nav bg-white/90)
└─────────────────────────┘
```

---

## 11. Interaction & Animation Patterns

| Pattern | Implementation |
|---|---|
| Button press | `active:scale-95` + `transition-all duration-200–300` |
| Card hover lift | `hover:shadow-md transition-shadow` |
| Card hover scale | `group-hover:scale-105 transition-transform duration-500` (images inside cards) |
| Image zoom on hover | `group-hover:scale-110 transition-transform duration-500` |
| Nav tab tap | `active:scale-90 transition-transform duration-300 ease-out` |
| Icon reveal on hover | `opacity-0 group-hover:opacity-100 transition-opacity` |
| Camera switch | `active:rotate-180 transition-transform duration-500` |
| Backdrop blur panels | `backdrop-filter: blur(12px)` |
| Ambient orbs | Static positioned, no animation by default |
| Pulse indicator | `animate-pulse` on recording dot |
| Button brightness | `hover:brightness-105` or `hover:brightness-110` |

---

## 12. Glassmorphism Recipes

### Light glass card (on light background)
```css
background: rgba(255, 255, 255, 0.7);
backdrop-filter: blur(12px);
border: 1px solid rgba(255, 255, 255, 0.4);
```

### Subtle hint glass (on hero banner)
```html
<div class="bg-white/10 backdrop-blur-md rounded-xl border border-white/20">
```

### Dark glass (camera overlay / map panel)
```css
background: rgba(11, 28, 48, 0.6);  /* on-surface color at 60% */
backdrop-filter: blur(12px);
```

### Navigation shell glass
```html
bg-white/90 backdrop-blur-md border-t border-slate-100
```

---

## 13. Ambient Background Decoration

Used on almost every screen for depth. Always `-z-10 pointer-events-none`.

```html
<!-- Top-right warm orb -->
<div class="fixed top-0 right-0 -z-10 w-xxxl h-xxxl
            bg-primary-container/5 blur-3xl rounded-full
            translate-x-1/2 -translate-y-1/2"></div>

<!-- Bottom-left cool orb -->
<div class="fixed bottom-0 left-0 -z-10 w-xxxl h-xxxl
            bg-secondary-container/10 blur-3xl rounded-full
            -translate-x-1/2 translate-y-1/2"></div>

<!-- Large centered orb (splash) -->
<div class="absolute top-1/4 left-1/4 w-[400px] h-[400px]
            bg-primary-container/10 blur-[120px] rounded-full"></div>
```

Opacity range: 5%–20% for primary, 10%–20% for secondary. Never fully opaque.

---

## 14. Material Symbols Usage

Icon library: **Material Symbols Outlined** (variable font, FILL 0–1, wght 100–700).

```html
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1" />

<style>
  .material-symbols-outlined {
    font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
  }
</style>
```

**Filled icons** (active state, hero icons):
```html
<span class="material-symbols-outlined"
      style="font-variation-settings: 'FILL' 1;">home</span>
```

---

## 15. Onboarding Rules

| Rule | Detail |
|---|---|
| Bottom nav | **Hidden** on all onboarding screens (ONB-01 through ONB-07) |
| Header | Kept for brand anchor (`Kotoka` wordmark) + back arrow |
| Step counter | Shown in header: `"Step 2 of 4"` in `text-caption font-label-md text-outline` |
| CTA position | Sticky bottom or inline centered, max-width `md:w-80` |
| Skip action | Ghost text link below primary CTA: `"I'll do this later"` |
| Linear journey | No branching UI — one primary action per screen |

---

## 16. File / Screen Naming Convention

```
{section_code}_{sequence}_{screen_name}_teal/
  code.html    ← full HTML prototype
  screen.png   ← design screenshot
```

| Code | Section |
|---|---|
| `onb` | Onboarding |
| `hom` | Home |
| `rev` | Review |
| `sho` | Shop |
| `sna` | Snap (Camera) |

---

## 17. UX Friendliness Review

The screens below have potential usability concerns. **Please review each one and share your preference.**

---

### REV-02 — Flashcard Review ⚠️ Complexity concern

**Issue:** The 4-button spaced-repetition rating system (Again · Hard · Good · Easy with intervals "1m / 2d / 4d / 7d") is borrowed from Anki-style SRS apps. Most casual users won't understand what "2d" or "4d" means or why they're rating cards with 4 options.

**Current:**
```
[Again 1m]  [Hard 2d]  [Good 4d]  [Easy 7d]
```

**Suggested alternatives:**
- **Option A — 2-button simple:** `[Still learning]` · `[Got it!]` — friendlier, hides SRS complexity
- **Option B — 3-button:** `[Again]` · `[Almost]` · `[Got it!]` — slight granularity without jargon
- **Option C — Keep 4 but hide intervals** until user has reviewed 10+ cards (progressive disclosure)

> **What do you prefer for the rating system?**

---

### HOM-01 — Home Screen ⚠️ Information density concern

**Issue:** The home screen shows all of these at once on first open: streak hero banner + progress ring + daily missions grid + spatial map (full height) + 4 stat tiles. This may feel overwhelming for new users or users returning after a break.

**Suggested alternatives:**
- **Option A — Progressive sections:** Show streak + missions first, map and stats only after scroll (current behavior is fine, just confirm this is intentional)
- **Option B — Simplified first-time view:** On first 3 opens, hide the map and stats — show only streak + today's missions
- **Option C — Keep as-is** if the density is intentional (power-user dashboard feel)

> **Is the current density intentional, or should first-time / returning users see a simpler home?**

---

### SNA-01 — Camera Screen ⚠️ Technical complexity concern

**Issue:** The camera UI exposes ISO controls, shutter speed (1/250), neural sync panel, AI object detection labels, sensor strip (temperature/wind/coordinates), and a zoom slider — all visible simultaneously. This feels like a professional camera app, not a casual memory companion.

**Suggested alternatives:**
- **Option A — Progressive disclosure:** Show only shutter + flip + gallery by default. Swipe up to reveal AI/sensor overlays
- **Option B — Two modes:** "Simple Snap" (minimal) vs "Detailed Capture" (current full UI) — toggle in settings
- **Option C — Keep full UI** if the target user is expected to be tech-savvy / enthusiast

> **Should the camera default to a minimal UI, or is the full overlay intended?**

---

### ONB-04 — Language Selection ⚠️ Minor clarity concern

**Issue:** The swap icon (⇄) between "Primary language" and "Learning language" sections may not be intuitive to all users — it's unclear whether it swaps the two selected languages or opens a different view.

**Suggested fix:** Replace swap icon with explicit label: **"Switch languages"** as a text button, or add a tooltip on first visit.

> **Is the swap mechanic obvious enough, or should it have a label?**
