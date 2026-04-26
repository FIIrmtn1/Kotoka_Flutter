# Kotoka Stitch Design Guide
> Extracted from all 13 screen prototypes in `stitch_kotoka_design_builder/`

---

## 1. Brand Identity

**Personality:** Nurturing · Lucid · Sophisticated  
**Style:** Modern Glassmorphism with Tonal Clarity  
**Feel:** Light, airy, clean — depth through tonal stacking, not heavy shadows

---

## 2. Color System

Kotoka uses a **Teal-Purple** brand palette. Three role families: **Primary** (teal/cyan), **Secondary** (purple), **Tertiary** (peach/pink surfaces).

---

### Primary — Teal / Cyan

| Token | Preview | Hex | Role |
|---|---|---|---|
| `primary` / `brand-500` | <span style="display:inline-block;width:20px;height:20px;background:#00c8cc;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#00c8cc` | Main brand color — nav active state, streaks, accent icons |
| `primary-highlight` / `brand-400` | <span style="display:inline-block;width:20px;height:20px;background:#0cf6fc;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#0cf6fc` | Bright cyan — glows, highlights, selected ring |
| `on-primary` | <span style="display:inline-block;width:20px;height:20px;background:#ffffff;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffffff` | Text / icons on teal backgrounds |

<span style="display:inline-block;width:64px;height:64px;background:#0cf6fc;border-radius:10px;margin:3px" title="brand-400 #0cf6fc highlight"></span><span style="display:inline-block;width:64px;height:64px;background:#00c8cc;border-radius:10px;margin:3px" title="brand-500 #00c8cc primary"></span>

---

### Secondary — Purple

| Token | Preview | Hex | Role |
|---|---|---|---|
| `secondary` / `brand-600` | <span style="display:inline-block;width:20px;height:20px;background:#8c6792;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#8c6792` | Dark purple — section headings, secondary actions, tags |
| `secondary-cta` / `brand-700` | <span style="display:inline-block;width:20px;height:20px;background:#682069;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#682069` | Deep purple — **primary CTA buttons**, key interactive elements |
| `on-secondary` | <span style="display:inline-block;width:20px;height:20px;background:#ffffff;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffffff` | Text / icons on purple backgrounds |

<span style="display:inline-block;width:64px;height:64px;background:#682069;border-radius:10px;margin:3px" title="brand-700 #682069 CTA / deep purple"></span><span style="display:inline-block;width:64px;height:64px;background:#8c6792;border-radius:10px;margin:3px" title="brand-600 #8c6792 secondary"></span>

---

### Tertiary — Peach / Pink Surfaces

| Token | Preview | Hex | Role |
|---|---|---|---|
| `tertiary` / `brand-100` | <span style="display:inline-block;width:20px;height:20px;background:#ffe1df;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffe1df` | Light peach — card surfaces, modal backgrounds |
| `tertiary-pink` | <span style="display:inline-block;width:20px;height:20px;background:#ffb6cb;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffb6cb` | Pink — accent containers, soft badges, hover tints |

<span style="display:inline-block;width:64px;height:64px;background:#ffe1df;border-radius:10px;margin:3px;border:1px solid #e0c8c5" title="brand-100 #ffe1df tertiary surface"></span><span style="display:inline-block;width:64px;height:64px;background:#ffb6cb;border-radius:10px;margin:3px;border:1px solid #e0a0b8" title="#ffb6cb pink accent"></span>

---

### Background / Surface Stack

| Token | Preview | Hex | Role |
|---|---|---|---|
| `background` / `brand-50` | <span style="display:inline-block;width:20px;height:20px;background:#e8e1f0;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#e8e1f0` | Page background — Very Light Lavender |
| `surface` / `white` | <span style="display:inline-block;width:20px;height:20px;background:#ffffff;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffffff` | Card / panel surface |
| `surface-peach` | <span style="display:inline-block;width:20px;height:20px;background:#ffe1df;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffe1df` | Warm surface variant (same as tertiary) |

<span style="display:inline-block;width:64px;height:64px;background:#e8e1f0;border-radius:10px;margin:3px;border:1px solid #ccc" title="brand-50 #e8e1f0 background"></span><span style="display:inline-block;width:64px;height:64px;background:#ffffff;border-radius:10px;margin:3px;border:1px solid #ccc" title="#ffffff surface/white"></span><span style="display:inline-block;width:64px;height:64px;background:#ffe1df;border-radius:10px;margin:3px;border:1px solid #e0c8c5" title="#ffe1df surface-peach"></span>

---

### Semantic Colors

| Token | Preview | Hex | Role |
|---|---|---|---|
| `error` | <span style="display:inline-block;width:20px;height:20px;background:#d8566a;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#d8566a` | Error / destructive — Red/Pink (non-alarming tone) |
| `warning` | <span style="display:inline-block;width:20px;height:20px;background:#ffdfa2;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffdfa2` | Warning — Pale Yellow/Tan |
| `on-surface` / black | <span style="display:inline-block;width:20px;height:20px;background:#000000;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#000000` | Primary body text |
| `on-primary` / white | <span style="display:inline-block;width:20px;height:20px;background:#ffffff;border-radius:4px;border:1px solid #ccc;vertical-align:middle"></span> | `#ffffff` | Text on colored backgrounds |

<span style="display:inline-block;width:64px;height:64px;background:#d8566a;border-radius:10px;margin:3px" title="#d8566a error"></span><span style="display:inline-block;width:64px;height:64px;background:#ffdfa2;border-radius:10px;margin:3px;border:1px solid #e0d080" title="#ffdfa2 warning"></span><span style="display:inline-block;width:64px;height:64px;background:#000000;border-radius:10px;margin:3px" title="#000000 on-surface"></span><span style="display:inline-block;width:64px;height:64px;background:#ffffff;border-radius:10px;margin:3px;border:1px solid #ccc" title="#ffffff white"></span>

---

### Full Palette at a Glance

<span style="display:inline-block;width:48px;height:48px;background:#0cf6fc;border-radius:8px;margin:2px" title="#0cf6fc highlight"></span><span style="display:inline-block;width:48px;height:48px;background:#00c8cc;border-radius:8px;margin:2px" title="#00c8cc primary"></span><span style="display:inline-block;width:48px;height:48px;background:#8c6792;border-radius:8px;margin:2px" title="#8c6792 secondary"></span><span style="display:inline-block;width:48px;height:48px;background:#682069;border-radius:8px;margin:2px" title="#682069 CTA deep purple"></span><span style="display:inline-block;width:48px;height:48px;background:#e8e1f0;border-radius:8px;margin:2px;border:1px solid #ccc" title="#e8e1f0 background lavender"></span><span style="display:inline-block;width:48px;height:48px;background:#ffe1df;border-radius:8px;margin:2px;border:1px solid #e0c8c5" title="#ffe1df surface peach"></span><span style="display:inline-block;width:48px;height:48px;background:#ffb6cb;border-radius:8px;margin:2px;border:1px solid #e0a0b8" title="#ffb6cb pink accent"></span><span style="display:inline-block;width:48px;height:48px;background:#ffdfa2;border-radius:8px;margin:2px;border:1px solid #e0c880" title="#ffdfa2 warning"></span><span style="display:inline-block;width:48px;height:48px;background:#d8566a;border-radius:8px;margin:2px" title="#d8566a error"></span><span style="display:inline-block;width:48px;height:48px;background:#000000;border-radius:8px;margin:2px" title="#000000 black text"></span><span style="display:inline-block;width:48px;height:48px;background:#ffffff;border-radius:8px;margin:2px;border:1px solid #ccc" title="#ffffff white"></span>

---

### Usage Rules

| Situation | Color to use |
|---|---|
| Primary CTA button background | `#682069` (Deep Purple / brand-700) |
| Active nav tab, streak badge, accent icon | `#00c8cc` (Teal / brand-500) |
| Highlight glow, selected ring, bright accent | `#0cf6fc` (Bright Cyan / brand-400) |
| Section heading, secondary button | `#8c6792` (Dark Purple / brand-600) |
| Page background | `#e8e1f0` (Very Light Lavender / brand-50) |
| Card / modal surface | `#ffffff` or `#ffe1df` (peach warm variant) |
| Pink hover tint / soft badge | `#ffb6cb` |
| Error / destructive | `#d8566a` |
| Warning / caution | `#ffdfa2` |
| Body text | `#000000` |
| Text on any colored button | `#ffffff` |
| **NEVER** | Bright cyan `#0cf6fc` text on teal `#00c8cc` bg — contrast too low |

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

### 8.1 Buttons

**Primary CTA:**
```html
<button class="w-full py-md px-xl bg-primary-container text-on-primary
               font-label-md text-label-md rounded-xl shadow-lg
               hover:brightness-105 active:scale-95 transition-all duration-300">
```

**Primary CTA (pill variant):**
```html
<button class="py-md px-xxl bg-primary-container text-on-primary
               font-label-md rounded-full shadow-lg
               hover:brightness-110 active:scale-95 transition-all">
```

**Secondary / Ghost:**
```html
<button class="w-full py-md bg-transparent text-primary
               font-label-md rounded-xl hover:bg-primary-container/5">
```

**Outlined:**
```html
<button class="border border-primary text-primary w-full py-md
               rounded-xl font-label-md hover:bg-primary-container/10">
```

### 8.2 Cards

**Standard card:**
```html
<div class="bg-white border border-outline-variant rounded-xl p-lg shadow-sm
            hover:shadow-md transition-shadow">
```

**Active/selected card:**
```html
<div class="bg-surface-container-low border-2 border-primary-container
            rounded-xl p-lg shadow-lg ring-4 ring-primary-container/10">
```

**Glass card:**
```html
<div class="bg-white/70 backdrop-blur-xl p-md rounded-xl
            border border-white/40 shadow-xl">
```

**Bento info card (tinted):**
```html
<div class="bg-surface-container-low border border-outline-variant
            rounded-xl p-md flex gap-md items-start">
```

### 8.3 Goal / Filter Chips (Tags)

**Active:**
```html
<button class="flex items-center gap-sm px-lg py-md rounded-xl
               bg-primary-container text-on-primary-container
               font-label-md shadow-md">
```

**Inactive:**
```html
<button class="flex items-center gap-sm px-lg py-md rounded-xl
               bg-surface-container-low text-on-surface-variant
               hover:bg-surface-container-high border border-transparent
               hover:border-primary/20 font-label-md transition-all">
```

**Category filter (pill):**
```html
<button class="flex-shrink-0 bg-primary-container text-white
               px-lg py-sm rounded-full font-label-md"> <!-- active -->
<button class="flex-shrink-0 bg-surface-container text-on-surface-variant
               px-lg py-sm rounded-full font-label-md
               hover:bg-surface-container-high"> <!-- inactive -->
```

### 8.4 Toggle Switch (CSS-only)

```html
<label class="relative inline-flex items-center cursor-pointer">
  <input type="checkbox" class="sr-only peer" checked />
  <div class="w-11 h-6 bg-secondary-container rounded-full peer
              peer-checked:bg-primary-container
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
  <div class="p-lg bg-white border border-outline-variant rounded-xl
              transition-all peer-checked:border-primary peer-checked:ring-1
              peer-checked:ring-primary shadow-sm hover:shadow-md">
    <!-- content -->
  </div>
</label>
```

### 8.6 Progress Bar

```html
<div class="h-2 w-full bg-surface-container-highest rounded-full overflow-hidden">
  <div class="h-full bg-primary-container w-[35%] rounded-full"></div>
</div>
```

### 8.7 Progress Ring (SVG)

```html
<svg class="w-full h-full -rotate-90">
  <circle cx="50%" cy="50%" r="45%" fill="transparent"
          stroke="rgba(255,255,255,0.2)" stroke-width="8"/>
  <circle cx="50%" cy="50%" r="45%" fill="transparent"
          stroke="currentColor" stroke-dasharray="283"
          stroke-dashoffset="40" stroke-width="8"
          class="text-white"/>
</svg>
```
Center overlay: `absolute flex flex-col items-center` with `font-h3` number and `font-caption` label.

### 8.8 Floating Action Button (FAB)

```html
<button class="fixed bottom-24 right-6 w-14 h-14 bg-primary text-white
               rounded-full shadow-2xl flex items-center justify-center
               transition-transform active:scale-90 z-40 hover:bg-primary/90">
  <span class="material-symbols-outlined text-[28px]">add</span>
</button>
```

### 8.9 Step Progress Indicator

**Dot style (bottom):**
```html
<div class="fixed bottom-lg left-1/2 -translate-x-1/2 flex items-center gap-sm
            bg-white px-lg py-sm rounded-full shadow-lg border border-outline-variant z-40">
  <div class="w-2 h-2 rounded-full bg-outline-variant"></div>
  <div class="w-6 h-2 rounded-full bg-primary-container"></div> <!-- active = wider -->
  <div class="w-2 h-2 rounded-full bg-outline-variant"></div>
  <div class="w-2 h-2 rounded-full bg-outline-variant"></div>
</div>
```

**Bar style (header):**
```html
<div class="flex gap-xs">
  <div class="h-1.5 w-8 rounded-full bg-primary"></div> <!-- completed -->
  <div class="h-1.5 w-8 rounded-full bg-outline-variant"></div> <!-- pending -->
</div>
```

### 8.10 Icon Containers

```html
<!-- Small square -->
<div class="p-sm bg-surface-container rounded-lg">
  <span class="material-symbols-outlined text-primary">photo_camera</span>
</div>

<!-- Medium rounded -->
<div class="w-12 h-12 bg-secondary-container text-on-secondary-container
            rounded-xl flex items-center justify-center">
  <span class="material-symbols-outlined">photo_camera</span>
</div>

<!-- Tinted for feature cards -->
<div class="w-12 h-12 bg-cyan-100 rounded-xl flex items-center justify-center text-cyan-600">
  <span class="material-symbols-outlined text-3xl">business_center</span>
</div>
```

### 8.11 Toasts / Notification Chips

```html
<div class="fixed bottom-lg right-lg bg-white rounded-lg px-md py-sm
            flex items-center gap-sm border-l-4 border-primary shadow-xl">
  <span class="material-symbols-outlined text-primary"
        style="font-variation-settings: 'FILL' 1;">check_circle</span>
  <span class="font-label-md text-label-md text-on-surface">Setup Complete</span>
</div>
```

---

## 9. Navigation Shell

### Bottom Navigation Bar

Fixed, glass-morphic. Present on all post-onboarding screens. Suppressed during linear onboarding flows.

```html
<nav class="fixed bottom-0 left-0 w-full z-50 flex justify-around items-center
            px-2 py-3 mb-safe
            bg-white/90 backdrop-blur-md
            border-t border-slate-100 shadow-lg">
```

**5 tabs:** Home · Snap · Review · Shop · Me

**Active tab:**
```html
<a class="flex flex-col items-center text-cyan-600
          bg-cyan-50 rounded-xl px-3 py-1
          transition-transform active:scale-90">
  <span class="material-symbols-outlined"
        style="font-variation-settings: 'FILL' 1;">home</span>
  <span class="text-[10px] font-medium uppercase tracking-wider">Home</span>
</a>
```

**Inactive tab:**
```html
<a class="flex flex-col items-center text-slate-400 px-3 py-1
          transition-transform active:scale-90 hover:text-cyan-500">
  <span class="material-symbols-outlined">photo_camera</span>
  <span class="text-[10px] font-medium uppercase tracking-wider">Snap</span>
</a>
```

Note: Active indicator is a `bg-cyan-50 rounded-xl` capsule behind the icon+label, not an underline dot.

### Top App Bar (Sticky Header)

```html
<header class="sticky top-0 z-50 flex justify-between items-center px-4 py-2
               w-full bg-white shadow-sm border-b border-slate-100">
```

- Brand wordmark: `text-2xl font-bold text-cyan-500 tracking-tight`
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
│     [Hero image]        │  ← rounded-t-[48px], object-cover
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

### ONB-05 — Proficiency (CEFR)

```
┌─────────────────────────┐
│ ◀  Kotoka    Step 2 of 4│
├─────────────────────────┤
│                         │
│  Tailor your journey    │  ← h2, text-on-surface
│  Select your current    │  ← body-lg, text-secondary
│  proficiency level…     │
│                         │
│  ┌──────────┐┌──────────┐│  ← 3-col on lg, 2-col on md, 1-col mobile
│  │ A1       ││ A2       ││     cards stagger: lg:mt-md on A2, B2
│  │ Beginner ││ Elem.    ││
│  └──────────┘└──────────┘│
│  ┌──────────┐┌──────────┐│
│  │ B1       ││ B2 Upper ││
│  │ Interm.  ││ Interm.  ││
│  └──────────┘└──────────┘│
│  ┌══════════════════════╗│
│  ║ ★ C1  Advanced    ✓ ║│  ← ACTIVE: border-2, ring-4, bg-surface-container-low
│  ║    Current Selection ║│     badge: bg-primary-container text-white
│  ╚══════════════════════╝│
│  ┌──────────────────────┐│
│  │ C2  Proficient       ││
│  └──────────────────────┘│
│                          │
│  ┌──────────────────────┐│
│  │       Continue       ││  ← pill CTA
│  └──────────────────────┘│
│  Not sure? Take a test   │  ← ghost, text-primary
│                          │
│     ○  ━━  ○  ○          │  ← step dots (fixed bottom, rounded-full)
└──────────────────────────┘
  Aside (xl only, fixed right):
  ┌──────────────┐
  │ [img]        │  ← bento info card (white)
  │ Level change │
  │ won't lose   │
  │ progress.    │
  └──────────────┘
  ┌──────────────┐
  │ Pro Tip      │  ← bg-primary-container text-white
  │ Most pros    │
  │ start at B2  │
  └──────────────┘
```

**KokoAnimation** → `koko-thinking` in the xl aside card — Koko looks pensive while user evaluates their level.

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
