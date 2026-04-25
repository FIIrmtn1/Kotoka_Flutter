# Graph Report - Main_resources  (2026-04-26)

## Corpus Check
- 6 files · ~110,335 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 182 nodes · 214 edges · 17 communities detected
- Extraction: 87% EXTRACTED · 13% INFERRED · 0% AMBIGUOUS · INFERRED: 28 edges (avg confidence: 0.9)
- Token cost: 0 input · 0 output

## God Nodes (most connected - your core abstractions)
1. `KOTOKA Lagrangian Density (ℒ_KOTOKA)` - 11 edges
2. `Business Model Canvas (9 Blocks)` - 10 edges
3. `Kotoka Developer Master Prompt v2.0` - 9 edges
4. `Component Library (34 Components)` - 7 edges
5. `Structured Word Object (Core + Pedagogical + Personal + Usage + Learning State + Relationship tags)` - 7 edges
6. `Value Propositions (Three Pillars)` - 6 edges
7. `Revenue Streams` - 6 edges
8. `Key Resources` - 6 edges
9. `Activation Failure (Root Cause Analysis)` - 6 edges
10. `Key Data Models (Word, UserWord, SensesTag, Session, ConsentRecord)` - 6 edges

## Surprising Connections (you probably didn't know these)
- `MemoryMapView Organism` --semantically_similar_to--> `Memory Map Logic (Pin colors, Revisit Trigger, Offline)`  [INFERRED] [semantically similar]
  Main_resources/DESIGN.md → Main_resources/kotoka-master-prompt.md
- `Pillar 2: Sensory Memory Binding` --semantically_similar_to--> `Sensory Tag Engine (Gemini Prompt Layer)`  [INFERRED] [semantically similar]
  Main_resources/BMC.md → Main_resources/kotoka-master-prompt.md
- `No-Guilt Design Principle` --semantically_similar_to--> `Law 1: No Guilt (No alarming error states)`  [INFERRED] [semantically similar]
  Main_resources/BMC.md → Main_resources/DESIGN.md
- `PDPA Compliance Framework` --semantically_similar_to--> `ConsentRecord Data Model (PDPA)`  [INFERRED] [semantically similar]
  Main_resources/BMC.md → Main_resources/kotoka-master-prompt.md
- `Snap Input Pipeline` --semantically_similar_to--> `Three Input Modes (Photo, Text, Location)`  [INFERRED] [semantically similar]
  Main_resources/BMC.md → Main_resources/kotoka-master-prompt.md

## Hyperedges (group relationships)
- **Sensory Context → Gemini Prompt → Personalised Vocabulary Generation Flow** — prompt_sensory_tag_engine, prompt_gemini_prompt_assembly, bmc_pillar_personal_content [EXTRACTED 0.95]
- **Location-Triggered Sensory Reinstatement Retention Loop** — bmc_location_triggered_review, prompt_memory_map_logic, prompt_context_dependent_memory [INFERRED 0.90]
- **Design Token System Governs All Components and Screens** — design_design_token_system, design_component_library, design_three_design_laws [EXTRACTED 0.92]
- **KOTOKA Theoretical Foundation: Action Functional with Four Interaction Terms** — kotoka_signature_lagrangian, kotoka_signature_esct, kotoka_signature_leg_curvature, kotoka_signature_galois_closure, kotoka_signature_transfer_cohomology [EXTRACTED 1.00]
- **SRS Scoring Pipeline: Decay Risk → Ease Factor → Interval → Schedule** — arch_decay_risk, arch_ease_factor, arch_srs_interval, arch_bayesian_knowledge_tracing, arch_half_life_regression [EXTRACTED 1.00]
- **Sensory Capture → Memory Map Pin → Location-Triggered Review Loop** — prd_snap_pipeline, prd_sensory_encoding, prd_memory_map, prd_location_triggered_review [EXTRACTED 1.00]

## Communities

### Community 0 - "Dynamic Learning & Math Foundations"
Cohesion: 0.09
Nodes (25): Dynamic Corpus — Living With the User (6 principles), Location Saturation σ(ℓ) with Depth Tiers (5 tiers), Benamou–Brenier Characterization v=∇φ (optimal curriculum is gradient flow), Context Sheaf ℱ of Vocabulary (contravariant functor on context space C), Continuity Constraint ⟨φ, ∂_tρ + ∇·(ρv)⟩, Euler–Lagrange Equations (continuity, Benamou–Brenier, HJB), Variational Free Energy 𝓕[ρ] (KL divergence + log-likelihood), Galois Closure Drive λ₃⟨ρ,𝟙_{Gap}⟩ (+17 more)

### Community 1 - "User Engagement & Retention"
Cohesion: 0.09
Nodes (23): Customer Relationships, Engagement Mechanisms (Streak, Memory Map, Challenges), Koko AI Companion, Memory Map (Geolocation Heatmap), No-Guilt Design Principle, PDPA Compliance Framework, PDPA Regulatory Risk & Compliance Cost, Brand Identity (+15 more)

### Community 2 - "Core Architecture Pipeline"
Cohesion: 0.12
Nodes (20): KOTOKA Core Concept (sensory-anchored personal vocabulary), Input Layer (Text / Photo / Location — manual & auto), LLM Vocabulary Corpus Augmentation Engine (Gemini 2.5 Flash), Onboarding Data (Tier 1 must-have + Tier 2 optional fields), KOTOKA Action Functional (δS_KOTOKA = 0), Rationale: Why Minimize a Cost Functional (3-step argument), Activation Failure Gap (root cause: no personal relevance, context mismatch, no sensory binding), Cloud Run API Layer (Fastify endpoints: /analyze-image, /srs-schedule, /koko-reply, etc.) (+12 more)

### Community 3 - "Business Model & Partnerships"
Cohesion: 0.13
Nodes (16): Business Model Canvas (9 Blocks), Channels, Cost Structure, Google Ecosystem Partnership (Tier 1), Google Play Store (Primary Distribution), Google $2,000 Startup Credit, Key Activities, Key Partnerships (+8 more)

### Community 4 - "UI Components & Design System"
Cohesion: 0.12
Nodes (16): BottomTabBar Organism (5 tabs), Component Library (34 Components), ConversationBubble Component, Design Philosophy (Two Responsibilities), FillBlankInput Component, FlashcardFlip Component, Law 3: 30 Seconds is a Session (≤3 taps), Law 2: Context is King (SensoryTagBar mandatory) (+8 more)

### Community 5 - "SRS & Knowledge Scoring"
Cohesion: 0.19
Nodes (14): Bayesian Knowledge Tracing P(K_w|observations) (BKT framework), Decay Risk DR(w) = 1 − e^(−Δt/τ(w,u)) (retention probability), Ease Factor EF(w) — Modified SM-2 Update Formula, Emotional Relevance Score E(w) = ω₁·Src + ω₂·Loc + ω₃·Int + ω₄·Freq, Familiarity Stages (New→Seen→Recognized→Recalled→Mastered), Half-Life Regression HLR Personalized Forgetting Model (Settles & Meeder 2016), Item Response Theory Difficulty Calibration (2PL model θ_u, a_w, b_w), Practical Urgency Score U(w) (deadline logistic + routine urgency) (+6 more)

### Community 6 - "Monetization & Customer Segments"
Cohesion: 0.15
Nodes (13): B2B Corporate Learning License ฿599/seat/month, Customer Segments, KotoCoin In-App Economy, Persona: Pam (Marketing Manager, Silom), Persona: Ton (Engineering Student, Chulalongkorn), Premium Subscription ฿99/month, Primary Segment: Working Adults 22–35, PromptPay Payment Integration (+5 more)

### Community 7 - "API Layer & Data Models"
Cohesion: 0.15
Nodes (13): Cloud Run API Layer (Fastify/Node.js — 7 routes), ConsentRecord Data Model (PDPA), Kotoka Core Loop (Input → Sensory Tag → Gemini → Session → SRS), Key Data Models (Word, UserWord, SensesTag, Session, ConsentRecord), Gemini System Prompt Assembly (/sensory-prompt endpoint), Mixed Session (Flashcard, Fill-blank, Conversation, Pronunciation), SensesTag Data Model (6-channel encoding context), Sensory Tag Collection Pipeline (+5 more)

### Community 8 - "Personal Relevance & Location Triggers"
Cohesion: 0.22
Nodes (11): Activation Failure Gap (Core Problem), Location-Triggered Review (FCM + Geohash), Pillar 3: Anti-Super App Competitive Moat, Pillar 1: Personal Content Sourcing, Pillar 2: Sensory Memory Binding, Value Propositions (Three Pillars), Activation Failure (Root Cause Analysis), Context-Dependent Memory Theory (Godden & Baddeley, 1975) (+3 more)

### Community 9 - "Design Tokens & Multi-Language"
Cohesion: 0.22
Nodes (10): 6 Language Support (TH, EN, ZH, ES, VI, LO — 30 pairs), Color System (Teal-Purple Theme), Design Token System, Mood Tint Overlays (20% opacity card backgrounds), Motion & Animation Tokens, Rationale: Font Selection for Multilingual Warmth, Spacing System (4px base unit), Typography System (IBM Plex Sans, Sarabun, Noto Sans SC, Noto Sans Lao) (+2 more)

### Community 10 - "Firebase & AI Infrastructure"
Cohesion: 0.25
Nodes (8): Firebase/Firestore/FCM Stack, Gemini AI API, Key Resources, Koko SRS Algorithm (δS_KOTOKA=0), React Native + Expo (Tech Stack), SRS Algorithm IP (δS_KOTOKA=0 Variational Functional), User Data Asset (Word Corpus, Sensory Tags, Location Patterns), Mathematical Foundation (Variational Action Functional, Euler-Lagrange)

### Community 11 - "PRD Phase 1 Design Spec"
Cohesion: 0.33
Nodes (7): Component Library (34 components: atoms, molecules, organisms, templates), Design Token System (Teal-Purple color palette, typography, spacing, motion), KokoAnimation Component (Lottie-based mascot, 7 states, screen mappings), Onboarding Screen Specifications (ONB-01 to ONB-07, 7 screens), Phase 1 — Design System & Full UI/UX Specification (43 screens, 34 components), SensoryTagBar Component (location, weather, mood, sound type tags), VocabCard Component (target word, SensoryTagBar, audio, native text, location pin)

### Community 12 - "Thai Market Context"
Cohesion: 1.0
Nodes (2): Rationale: Why Thailand, Why Now, Thai Digital Market Context 2026

### Community 13 - "Onboarding Flow"
Cohesion: 1.0
Nodes (1): Onboarding Screen Specifications

### Community 14 - "Accessibility"
Cohesion: 1.0
Nodes (1): Accessibility Specification

### Community 15 - "Persona Pam"
Cohesion: 1.0
Nodes (1): Primary Persona Pam (Thai→English, career goal, 10-15 min/day)

### Community 16 - "Persona Nong"
Cohesion: 1.0
Nodes (1): Secondary Persona Nong (Thai→Mandarin, logistics/supplier communication)

## Knowledge Gaps
- **62 isolated node(s):** `Pillar 1: Personal Content Sourcing`, `Pillar 3: Anti-Super App Competitive Moat`, `Google Play Store (Primary Distribution)`, `TikTok Organic Strategy`, `KotoCoin In-App Economy` (+57 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Thai Market Context`** (2 nodes): `Rationale: Why Thailand, Why Now`, `Thai Digital Market Context 2026`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Onboarding Flow`** (1 nodes): `Onboarding Screen Specifications`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Accessibility`** (1 nodes): `Accessibility Specification`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Persona Pam`** (1 nodes): `Primary Persona Pam (Thai→English, career goal, 10-15 min/day)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Persona Nong`** (1 nodes): `Secondary Persona Nong (Thai→Mandarin, logistics/supplier communication)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Business Model Canvas (9 Blocks)` connect `Business Model & Partnerships` to `Personal Relevance & Location Triggers`, `User Engagement & Retention`, `Firebase & AI Infrastructure`, `Monetization & Customer Segments`?**
  _High betweenness centrality (0.182) - this node is a cross-community bridge._
- **Why does `Kotoka Developer Master Prompt v2.0` connect `User Engagement & Retention` to `Personal Relevance & Location Triggers`, `Design Tokens & Multi-Language`, `Business Model & Partnerships`, `API Layer & Data Models`?**
  _High betweenness centrality (0.161) - this node is a cross-community bridge._
- **Why does `Kotoka App` connect `Business Model & Partnerships` to `User Engagement & Retention`?**
  _High betweenness centrality (0.081) - this node is a cross-community bridge._
- **What connects `Pillar 1: Personal Content Sourcing`, `Pillar 3: Anti-Super App Competitive Moat`, `Google Play Store (Primary Distribution)` to the rest of the system?**
  _62 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Dynamic Learning & Math Foundations` be split into smaller, more focused modules?**
  _Cohesion score 0.09 - nodes in this community are weakly interconnected._
- **Should `User Engagement & Retention` be split into smaller, more focused modules?**
  _Cohesion score 0.09 - nodes in this community are weakly interconnected._
- **Should `Core Architecture Pipeline` be split into smaller, more focused modules?**
  _Cohesion score 0.12 - nodes in this community are weakly interconnected._