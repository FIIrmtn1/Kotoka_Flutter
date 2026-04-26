---
name: Kotoka Memory System
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#3e4949'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#6f7979'
  outline-variant: '#bec9c9'
  surface-tint: '#01696c'
  primary: '#004f51'
  on-primary: '#ffffff'
  primary-container: '#00696c'
  on-primary-container: '#96e5e8'
  inverse-primary: '#85d4d6'
  secondary: '#565e74'
  on-secondary: '#ffffff'
  secondary-container: '#d7dff9'
  on-secondary-container: '#5a6278'
  tertiary: '#713700'
  on-tertiary: '#ffffff'
  tertiary-container: '#944a00'
  on-tertiary-container: '#ffceaf'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#a1f0f3'
  primary-fixed-dim: '#85d4d6'
  on-primary-fixed: '#002021'
  on-primary-fixed-variant: '#004f52'
  secondary-fixed: '#dae2fc'
  secondary-fixed-dim: '#bec6e0'
  on-secondary-fixed: '#131b2e'
  on-secondary-fixed-variant: '#3e465b'
  tertiary-fixed: '#ffdcc6'
  tertiary-fixed-dim: '#ffb785'
  on-tertiary-fixed: '#301400'
  on-tertiary-fixed-variant: '#713700'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  h1:
    fontFamily: Manrope
    fontSize: 48px
    fontWeight: '600'
    lineHeight: '1.2'
  h2:
    fontFamily: Manrope
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.25'
  h3:
    fontFamily: Manrope
    fontSize: 24px
    fontWeight: '500'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Manrope
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Manrope
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.5'
  label-md:
    fontFamily: Manrope
    fontSize: 14px
    fontWeight: '500'
    lineHeight: '1.4'
    letterSpacing: 0.02em
  caption:
    fontFamily: Manrope
    fontSize: 12px
    fontWeight: '400'
    lineHeight: '1.4'
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  xxl: 48px
  xxxl: 64px
---

## Brand & Style
Kotoka is a cognitive companion designed to bridge the gap between digital archiving and human memory. The brand personality is **nurturing, lucid, and sophisticated**, aiming to evoke a sense of mental clarity and emotional warmth. 

The design style is **Modern Glassmorphism with a focus on Tonal Clarity**. It utilizes semi-transparent layers (bg-glass), soft blurs, and a refined "bento-grid" layout to organize complex information into digestible, interactive units. The interface feels light and airy, avoiding heavy shadows in favor of subtle border definitions and vibrant, high-fidelity color containers that guide the user's focus toward daily achievements and spatial memories.

## Colors
The palette is rooted in **Cyan-Teal Fidelity**, utilizing high-saturation primary containers to denote active states and progress. 
- **Primary:** A deep teal for high-contrast actions and iconography.
- **Surface Palette:** Uses a cool-toned "ice white" (#f8f9ff) to maintain a crisp, clean environment.
- **Containers:** Utilize varying degrees of saturation (e.g., `#00c8cc` for streaks and `#dae2fd` for utility icons) to create a clear hierarchy of importance.
- **Accents:** Tertiary oranges are reserved for "Spatial Archive" markers to provide a warm counter-point to the cool primary theme.

## Typography
The system uses **Manrope** (substituted for the specific IBM Plex Sans implementation) to provide a modern, balanced, and trustworthy feel. 
- **Headlines:** Use a semi-bold weight (600) with tight tracking to create a sense of impact and urgency in the streak section.
- **Body Text:** Optimized for readability with a 1.5 - 1.6 line-height ratio, ensuring that long-form memory captions remain accessible.
- **Labels:** Uppercase tracking is applied to small metadata labels (like "12 DAY STREAK") to distinguish them from standard body prose.

## Layout & Spacing
The layout follows a **structured bento-grid model** with a maximum content width of 1280px (7xl). 
- **Margins:** Screens utilize a responsive horizontal padding of 16px (mobile) to 32px (desktop).
- **Rhythm:** A vertical rhythm of 32px (xl) is used between major sections to provide significant breathing room.
- **Internal Spacing:** Components use 24px (lg) internal padding for cards and 16px (md) for list items. 
- **Grid:** On desktop, the "Mission" section utilizes a 3-column grid where the primary mission spans 2 columns to denote priority.

## Elevation & Depth
Depth is communicated through **Tonal Stacking and Glassmorphism** rather than traditional drop shadows.
- **Level 0 (Background):** Solid `#f8f9ff`.
- **Level 1 (Cards):** White surfaces with a very fine `#bac9c9` border and a 'shadow-sm' for subtle lift.
- **Level 2 (Overlays/Nav):** Uses `bg-glass` (70% opacity white with 12px blur) to create a sense of floating, non-obstructive navigation.
- **Interactive Depth:** On hover or active state, cards transition from `shadow-sm` to `shadow-md` or scale by 95-98% to simulate physical pressing.

## Shapes
The shape language is **distinctly rounded (Level 2)** to maintain an approachable, friendly aesthetic.
- **Primary Containers:** 1.5rem (xl) corner radius for main dashboard cards and the hero streak section.
- **Buttons/Chips:** Full pill-shaping (9999px) for status indicators; 0.75rem (xl) for functional action buttons.
- **Icon Enclosures:** Small utility icons are housed in 0.75rem (xl) squared-off-round containers to differentiate them from interactive buttons.

## Components
- **Buttons:** Primary buttons are high-contrast (Teal background, White text) with a 0.75rem corner radius. Secondary buttons use an outline-only style or subtle container fills.
- **Progress Rings:** Large-scale SVG rings use a 20% opacity stroke for the track and a white stroke for the progress indicator, centered with large typography.
- **Cards:** The "Bento" cards feature a 1px border (`outline-variant`), internal 24px padding, and integrated media headers.
- **Floating Action Button (FAB):** A 56px circular button in the primary teal color, elevated with a `shadow-2xl` for maximum visibility.
- **Navigation:** A bottom-docked glass bar with centered icons and 10px uppercase labels. The active state is indicated by a background capsule tint in the primary color.
- **Map Markers:** Circular pins with icons, utilizing a "hover-to-expand" label mechanic that reveals a glassmorphic preview card.