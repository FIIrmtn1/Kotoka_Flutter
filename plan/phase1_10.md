# Phase 1: Full UI/UX Build — Kotoka App

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build every screen and component for Kotoka v1 in Flutter, matching DESIGN.md exactly, supporting 6 languages, using KokoAnimation exclusively.

**Architecture:** Riverpod state + go_router navigation + design token system. Screens rebuild from scratch following teal-cyan theme. No hardcoded values anywhere.

**Tech Stack:** Flutter, Riverpod, go_router, KokoAnimation, Twemoji (local assets), SQLCipher, Firebase Auth, Firestore emulator (Docker), Redis cache (Docker)

**Design Tokens Source:** `lib/core/theme/tokens.dart`  
**i18n Source:** `lib/l10n/` (ARB files, 6 locales: en, th, zh, es, vi, lo)

---

## DESIGN RULES (enforce every task)

- Background all screens: `KColors.brand50` (#e8e1f0)
- CTA buttons: `KColors.brand500` (#00c8cc) + white text
- Nav active / accents: `KColors.brand400` (#0cf6fc)
- Purple `KColors.brand700` (#682069): decorative only, NEVER buttons
- Every screen ≥1 prominent `#0cf6fc` element
- KokoAnimation: import `package:kokoanimation/kokoanimation.dart`
- Emoji: `KokoEmoji` widget, flags: `KokoFlag` widget
- Mock data: `//MOCKDATA` comment on same line
- Gemini output: `**bold**` markers in display widgets
- Rate limits: `lib/core/api/rate_limiter.dart` (60 rpm default, Gemini 14 rpm)
- WCAG AA contrast ≥4.5:1 on all text

---

## FILE MAP

### New/Rebuilt Screens
```
lib/screens/onboarding/welcome_screen.dart
lib/screens/onboarding/language_select_screen.dart
lib/screens/onboarding/goal_select_screen.dart
lib/screens/onboarding/level_select_screen.dart
lib/screens/onboarding/schedule_screen.dart
lib/screens/onboarding/commitment_screen.dart
lib/screens/onboarding/pdpa_consent_screen.dart
lib/screens/onboarding/profile_setup_screen.dart
lib/screens/onboarding/mission_screen.dart
lib/screens/onboarding/summary_screen.dart
lib/screens/home/home_screen.dart
lib/screens/snap/snap_screen.dart
lib/screens/snap/snap_text_screen.dart
lib/screens/snap/snap_processing_screen.dart
lib/screens/snap/snap_results_screen.dart
lib/screens/review/review_screen.dart
lib/screens/review/review_flashcard_screen.dart
lib/screens/review/review_fillblank_screen.dart
lib/screens/review/review_conversation_screen.dart
lib/screens/review/review_complete_screen.dart
lib/screens/shop/shop_screen.dart
lib/screens/profile/profile_screen.dart
```

### Rebuilt Widgets
```
lib/core/widgets/k_scaffold.dart          (page scaffold: bg + ambient orbs)
lib/core/widgets/k_ambient_orbs.dart      (decorative bg orbs)
lib/core/widgets/k_card.dart              (white card, brand400 border)
lib/core/widgets/k_section_header.dart    (brand600 heading)
lib/core/widgets/k_chip.dart              (selectable chips, brand400 active)
lib/core/widgets/k_radio_card.dart        (radio selection card)
lib/core/widgets/k_flag_dropdown.dart     (language dropdown w/ KokoFlag)
```

### Existing (verify/update)
```
lib/core/widgets/kotoka_button.dart       (CTA + ghost + outlined)
lib/core/widgets/bottom_tab_bar.dart      (5 tabs, badge, theme-aware)
lib/core/widgets/progress_ring.dart       (brand400 fill)
lib/core/widgets/koko_animation.dart      (webp KokoAnimation wrapper)
lib/core/widgets/koko_emoji.dart          (Twemoji PNG)
lib/core/widgets/language_picker_sheet.dart
lib/core/theme/tokens.dart
lib/core/api/rate_limiter.dart
lib/core/router/app_router.dart
```

---

## TASK 1: Core Widget — KScaffold + KAmbientOrbs

**Files:**
- Create: `lib/core/widgets/k_scaffold.dart`
- Create: `lib/core/widgets/k_ambient_orbs.dart`

- [ ] Create `KAmbientOrbs` widget — two blurred orbs, `-z-10`, pointer-events none:

```dart
// lib/core/widgets/k_ambient_orbs.dart
import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class KAmbientOrbs extends StatelessWidget {
  const KAmbientOrbs({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: -80, right: -80,
        child: _orb(200, KColors.brand400.withOpacity(0.07)),
      ),
      Positioned(
        bottom: -60, left: -60,
        child: _orb(180, KColors.sky100.withOpacity(0.10)),
      ),
    ]);
  }

  Widget _orb(double size, Color color) => Container(
    width: size, height: size,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
      child: const SizedBox.shrink(),
    ),
  );
}
```

- [ ] Create `KScaffold` — wraps every screen with brand50 bg + orbs:

```dart
// lib/core/widgets/k_scaffold.dart
import 'package:flutter/material.dart';
import '../theme/tokens.dart';
import 'k_ambient_orbs.dart';

class KScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool showOrbs;

  const KScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.showOrbs = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.brand50,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(children: [
        if (showOrbs) const KAmbientOrbs(),
        child,
      ]),
    );
  }
}
```

- [ ] Commit: `git commit -m "feat: add KScaffold + KAmbientOrbs base widgets"`

---

## TASK 2: Core Widget — KCard + KSectionHeader + KChip

**Files:**
- Create: `lib/core/widgets/k_card.dart`
- Create: `lib/core/widgets/k_section_header.dart`
- Create: `lib/core/widgets/k_chip.dart`

- [ ] KCard:

```dart
// lib/core/widgets/k_card.dart
import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class KCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool selected;
  final VoidCallback? onTap;

  const KCard({
    super.key,
    required this.child,
    this.padding,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: padding ?? const EdgeInsets.all(KSpacing.md),
        decoration: BoxDecoration(
          color: selected
              ? KColors.brand400.withOpacity(0.05)
              : KColors.neutral0,
          border: Border.all(
            color: selected
                ? KColors.brand400
                : KColors.brand400.withOpacity(0.20),
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(KRadius.md),
          boxShadow: [KElevation.shadow1],
        ),
        child: child,
      ),
    );
  }
}
```

- [ ] KSectionHeader:

```dart
// lib/core/widgets/k_section_header.dart
import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class KSectionHeader extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const KSectionHeader(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (style ?? Theme.of(context).textTheme.titleMedium)?.copyWith(
        color: KColors.brand600,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.02,
      ),
    );
  }
}
```

- [ ] KChip:

```dart
// lib/core/widgets/k_chip.dart
import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class KChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const KChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.md, vertical: KSpacing.sm),
        decoration: BoxDecoration(
          color: selected
              ? KColors.brand400.withOpacity(0.12)
              : KColors.neutral0,
          border: Border.all(
            color: selected ? KColors.brand400 : KColors.brand400.withOpacity(0.25),
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(KRadius.full),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? KColors.brand500 : Colors.black87,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
```

- [ ] Commit: `git commit -m "feat: add KCard, KSectionHeader, KChip widgets"`

---

## TASK 3: Verify KotokaButton + BottomTabBar

**Files:**
- Modify: `lib/core/widgets/kotoka_button.dart`
- Modify: `lib/core/widgets/bottom_tab_bar.dart`

- [ ] Verify `KotokaButton` has primary (brand500 teal), ghost (transparent+brand500 border), outlined variants. Ensure no hardcoded hex — all from `KColors.*`
- [ ] Verify `BottomTabBar` uses `theme.colorScheme.surface` for bg, `theme.colorScheme.outline` for border, `brand400` for active icon/label, `theme.colorScheme.onSurfaceVariant` for inactive. Badge shows due-card count from `dueCardsProvider`.
- [ ] Commit: `git commit -m "fix: ensure button+navbar use theme tokens only"`

---

## TASK 4: ONB-01 Welcome Screen

**Files:**
- Create: `lib/screens/onboarding/welcome_screen.dart`

- [ ] Implement:

```dart
// lib/screens/onboarding/welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/k_scaffold.dart';
import '../../core/widgets/kotoka_button.dart';
import '../../core/widgets/koko_animation.dart';
import '../../core/theme/tokens.dart';
import '../../l10n/app_localizations.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return KScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              KokoAnimation(
                asset: KokoAssets.wave,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: KSpacing.lg),
              Text(
                'Kotoka',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: KColors.brand400,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: KSpacing.sm),
              Text(
                l10n.welcomeTagline, // "Snap your world, speak any languages."
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              KotokaButton(
                label: l10n.getStarted,
                onPressed: () => context.go('/onboarding/language'),
              ),
              const SizedBox(height: KSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] Add ARB keys: `welcomeTagline`, `getStarted` to all 6 locale files
- [ ] Commit: `git commit -m "feat: ONB-01 welcome screen"`

---

## TASK 5: ONB-02 Language Select Screen

**Files:**
- Create: `lib/screens/onboarding/language_select_screen.dart`

- [ ] Two dropdowns: "I speak" + "I want to learn". Use `KokoFlag` for each language. Brand400 border on selected. 6 languages: th, en, zh, es, vi, lo.

```dart
// lib/screens/onboarding/language_select_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/onboarding_providers.dart';
import '../../core/widgets/k_scaffold.dart';
import '../../core/widgets/k_card.dart';
import '../../core/widgets/k_section_header.dart';
import '../../core/widgets/koko_emoji.dart';
import '../../core/widgets/kotoka_button.dart';
import '../../core/theme/tokens.dart';
import '../../l10n/app_localizations.dart';

const _languages = [
  {'code': 'th', 'name': 'Thai', 'flag': 'TH'},
  {'code': 'en', 'name': 'English', 'flag': 'GB'},
  {'code': 'zh', 'name': 'Mandarin', 'flag': 'CN'},
  {'code': 'es', 'name': 'Spanish', 'flag': 'ES'},
  {'code': 'vi', 'name': 'Vietnamese', 'flag': 'VN'},
  {'code': 'lo', 'name': 'Lao', 'flag': 'LA'},
]; //MOCKDATA

class LanguageSelectScreen extends ConsumerStatefulWidget {
  const LanguageSelectScreen({super.key});
  @override
  ConsumerState<LanguageSelectScreen> createState() =>
      _LanguageSelectScreenState();
}

class _LanguageSelectScreenState
    extends ConsumerState<LanguageSelectScreen> {
  String? _nativeLang;
  String? _targetLang;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: KSpacing.xl),
              KSectionHeader(l10n.chooseLanguages),
              const SizedBox(height: KSpacing.lg),
              _LangDropdown(
                label: l10n.iSpeak,
                value: _nativeLang,
                onChanged: (v) => setState(() => _nativeLang = v),
              ),
              const SizedBox(height: KSpacing.md),
              _LangDropdown(
                label: l10n.iWantToLearn,
                value: _targetLang,
                onChanged: (v) => setState(() => _targetLang = v),
              ),
              const Spacer(),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: (_nativeLang != null && _targetLang != null &&
                        _nativeLang != _targetLang)
                    ? () {
                        ref
                            .read(onboardingProvider.notifier)
                            .setLanguages(_nativeLang!, _targetLang!);
                        context.go('/onboarding/goal');
                      }
                    : null,
              ),
              const SizedBox(height: KSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

class _LangDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final ValueChanged<String?> onChanged;

  const _LangDropdown({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500,
                color: Colors.black54)),
        const SizedBox(height: KSpacing.xs),
        KCard(
          padding: const EdgeInsets.symmetric(
              horizontal: KSpacing.md, vertical: KSpacing.sm),
          selected: value != null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text('Select language',
                  style: TextStyle(color: Colors.black38)),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: KColors.brand400),
              onChanged: onChanged,
              items: _languages
                  .map((lang) => DropdownMenuItem(
                        value: lang['code'],
                        child: Row(children: [
                          KokoFlag(countryCode: lang['flag']!, size: 24),
                          const SizedBox(width: KSpacing.sm),
                          Text(lang['name']!),
                        ]),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
```

- [ ] Add ARB keys: `chooseLanguages`, `iSpeak`, `iWantToLearn`, `continueButton`
- [ ] Commit: `git commit -m "feat: ONB-02 language select screen"`

---

## TASK 6: ONB-03 Goal Select Screen

**Files:**
- Create: `lib/screens/onboarding/goal_select_screen.dart`

- [ ] Chip grid, multi-select, brand400 active. Goals: travel, work, study, culture, family, personal growth.

```dart
// lib/screens/onboarding/goal_select_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/onboarding_providers.dart';
import '../../core/widgets/k_scaffold.dart';
import '../../core/widgets/k_chip.dart';
import '../../core/widgets/k_section_header.dart';
import '../../core/widgets/kotoka_button.dart';
import '../../core/theme/tokens.dart';
import '../../l10n/app_localizations.dart';

class GoalSelectScreen extends ConsumerStatefulWidget {
  const GoalSelectScreen({super.key});
  @override
  ConsumerState<GoalSelectScreen> createState() => _GoalSelectScreenState();
}

class _GoalSelectScreenState extends ConsumerState<GoalSelectScreen> {
  final Set<String> _selected = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final goals = [
      l10n.goalTravel,
      l10n.goalWork,
      l10n.goalStudy,
      l10n.goalCulture,
      l10n.goalFamily,
      l10n.goalPersonal,
    ];
    return KScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: KSpacing.xl),
              KSectionHeader(l10n.whyAreYouLearning),
              const SizedBox(height: KSpacing.sm),
              Text(l10n.selectAllThatApply,
                  style: const TextStyle(
                      color: Colors.black54, fontSize: 14)),
              const SizedBox(height: KSpacing.lg),
              Wrap(
                spacing: KSpacing.sm,
                runSpacing: KSpacing.sm,
                children: goals
                    .map((g) => KChip(
                          label: g,
                          selected: _selected.contains(g),
                          onTap: () => setState(() => _selected.contains(g)
                              ? _selected.remove(g)
                              : _selected.add(g)),
                        ))
                    .toList(),
              ),
              const Spacer(),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: _selected.isNotEmpty
                    ? () {
                        ref
                            .read(onboardingProvider.notifier)
                            .setGoals(_selected.toList());
                        context.go('/onboarding/level');
                      }
                    : null,
              ),
              const SizedBox(height: KSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] Add ARB keys: `whyAreYouLearning`, `selectAllThatApply`, `goalTravel`, `goalWork`, `goalStudy`, `goalCulture`, `goalFamily`, `goalPersonal`
- [ ] Commit: `git commit -m "feat: ONB-03 goal select screen"`

---

## TASK 7: ONB-04 Level Select Screen

**Files:**
- Create: `lib/screens/onboarding/level_select_screen.dart`

- [ ] 3 cards: Beginner / Intermediate / Advanced. Each card has emoji + ProgressRing (brand400). Beginner/Advanced auto-advance. Intermediate = manual CTA.

```dart
// lib/screens/onboarding/level_select_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/onboarding_providers.dart';
import '../../core/widgets/k_scaffold.dart';
import '../../core/widgets/k_card.dart';
import '../../core/widgets/k_section_header.dart';
import '../../core/widgets/kotoka_button.dart';
import '../../core/widgets/koko_emoji.dart';
import '../../core/widgets/progress_ring.dart';
import '../../core/theme/tokens.dart';
import '../../l10n/app_localizations.dart';

const _levels = [
  {'key': 'beginner', 'emoji': '🌱', 'progress': 0.15},
  {'key': 'intermediate', 'emoji': '🚀', 'progress': 0.55},
  {'key': 'advanced', 'emoji': '🎓', 'progress': 0.90},
]; //MOCKDATA

class LevelSelectScreen extends ConsumerStatefulWidget {
  const LevelSelectScreen({super.key});
  @override
  ConsumerState<LevelSelectScreen> createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends ConsumerState<LevelSelectScreen> {
  String? _selected;

  void _pick(BuildContext context, WidgetRef ref, String level) {
    ref.read(onboardingProvider.notifier).setLevel(level);
    if (level == 'beginner' || level == 'advanced') {
      Future.delayed(const Duration(milliseconds: 300),
          () => context.go('/onboarding/schedule'));
    } else {
      setState(() => _selected = level);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.lg),
          child: Column(
            children: [
              const SizedBox(height: KSpacing.xl),
              KSectionHeader(l10n.whatIsYourLevel),
              const SizedBox(height: KSpacing.lg),
              ..._levels.map((lv) => Padding(
                    padding: const EdgeInsets.only(bottom: KSpacing.md),
                    child: KCard(
                      selected: _selected == lv['key'],
                      onTap: () => _pick(context, ref, lv['key'] as String),
                      child: Row(children: [
                        KokoEmoji(emoji: lv['emoji'] as String, size: 32),
                        const SizedBox(width: KSpacing.md),
                        Expanded(
                          child: Text(
                            l10n.levelLabel(lv['key'] as String),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        ProgressRing(
                          progress: lv['progress'] as double,
                          size: 40,
                          strokeWidth: 4,
                        ),
                      ]),
                    ),
                  )),
              const Spacer(),
              if (_selected == 'intermediate')
                KotokaButton(
                  label: l10n.continueButton,
                  onPressed: () => context.go('/onboarding/schedule'),
                ),
              if (_selected == 'intermediate')
                const SizedBox(height: KSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] Add ARB keys: `whatIsYourLevel`, `levelLabel` (parameterized)
- [ ] Commit: `git commit -m "feat: ONB-04 level select with auto-advance"`

---

## TASK 8: ONB-05 Schedule + ONB-06 Notifications

**Files:**
- Create: `lib/screens/onboarding/schedule_screen.dart`
- Create: `lib/screens/onboarding/commitment_screen.dart`

- [ ] Schedule: radio cards for daily time (5min / 10min / 15min / 20min / 30min). Brand400 border on selected.

```dart
// lib/screens/onboarding/schedule_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/onboarding_providers.dart';
import '../../core/widgets/k_scaffold.dart';
import '../../core/widgets/k_card.dart';
import '../../core/widgets/k_section_header.dart';
import '../../core/widgets/kotoka_button.dart';
import '../../core/theme/tokens.dart';
import '../../l10n/app_localizations.dart';

const _schedules = [5, 10, 15, 20, 30]; //MOCKDATA

class ScheduleScreen extends ConsumerStatefulWidget {
  const ScheduleScreen({super.key});
  @override
  ConsumerState<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  int? _minutes;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: KSpacing.xl),
              KSectionHeader(l10n.dailyGoal),
              const SizedBox(height: KSpacing.lg),
              ..._schedules.map((m) => Padding(
                    padding: const EdgeInsets.only(bottom: KSpacing.sm),
                    child: KCard(
                      selected: _minutes == m,
                      onTap: () => setState(() => _minutes = m),
                      child: Row(children: [
                        Radio<int>(
                          value: m,
                          groupValue: _minutes,
                          activeColor: KColors.brand400,
                          onChanged: (v) => setState(() => _minutes = v),
                        ),
                        Text('$m ${l10n.minutesPerDay}',
                            style: const TextStyle(fontSize: 15)),
                      ]),
                    ),
                  )),
              const Spacer(),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: _minutes != null
                    ? () {
                        ref
                            .read(onboardingProvider.notifier)
                            .setDailyMinutes(_minutes!);
                        context.go('/onboarding/notifications');
                      }
                    : null,
              ),
              const SizedBox(height: KSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] Commitment screen: card layout, brand400 CTA, "Stay on track" messaging, request notification permission.
- [ ] Add ARB keys: `dailyGoal`, `minutesPerDay`, `stayOnTrack`, `enableNotifications`
- [ ] Commit: `git commit -m "feat: ONB-05 schedule + ONB-06 notifications screens"`

---

## TASK 9: ONB-07 PDPA Consent Screen

**Files:**
- Create: `lib/screens/onboarding/pdpa_consent_screen.dart`

- [ ] All permission cards expanded by default. Three permissions: Camera, Location, Notifications. Each shows reason text. Brand400 CTA.

```dart
// lib/screens/onboarding/pdpa_consent_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/k_scaffold.dart';
import '../../core/widgets/k_card.dart';
import '../../core/widgets/k_section_header.dart';
import '../../core/widgets/kotoka_button.dart';
import '../../core/theme/tokens.dart';
import '../../l10n/app_localizations.dart';

class PdpaConsentScreen extends StatelessWidget {
  const PdpaConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final permissions = [
      {
        'icon': Icons.camera_alt_outlined,
        'title': l10n.permissionCamera,
        'reason': l10n.permissionCameraReason,
      },
      {
        'icon': Icons.location_on_outlined,
        'title': l10n.permissionLocation,
        'reason': l10n.permissionLocationReason,
      },
      {
        'icon': Icons.notifications_outlined,
        'title': l10n.permissionNotifications,
        'reason': l10n.permissionNotificationsReason,
      },
    ];
    return KScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: KSpacing.xl),
              KSectionHeader(l10n.privacyTitle),
              const SizedBox(height: KSpacing.sm),
              Text(l10n.privacySubtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 14)),
              const SizedBox(height: KSpacing.lg),
              ...permissions.map((p) => Padding(
                    padding: const EdgeInsets.only(bottom: KSpacing.md),
                    child: KCard(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40, height: 40,
                            decoration: BoxDecoration(
                              color: KColors.brand400.withOpacity(0.12),
                              borderRadius:
                                  BorderRadius.circular(KRadius.sm),
                            ),
                            child: Icon(p['icon'] as IconData,
                                color: KColors.brand400, size: 20),
                          ),
                          const SizedBox(width: KSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p['title'] as String,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15)),
                                const SizedBox(height: KSpacing.xs),
                                Text(p['reason'] as String,
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              const Spacer(),
              KotokaButton(
                label: l10n.agreeAndContinue,
                onPressed: () => context.go('/onboarding/profile'),
              ),
              const SizedBox(height: KSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] Add ARB keys: `privacyTitle`, `privacySubtitle`, `permissionCamera`, `permissionCameraReason`, `permissionLocation`, `permissionLocationReason`, `permissionNotifications`, `permissionNotificationsReason`, `agreeAndContinue`
- [ ] Commit: `git commit -m "feat: ONB-07 PDPA consent screen"`

---

## TASK 10: ONB-08 Profile Setup + ONB-09 Mission + ONB-10 Summary

**Files:**
- Create: `lib/screens/onboarding/profile_setup_screen.dart`
- Create: `lib/screens/onboarding/mission_screen.dart`
- Create: `lib/screens/onboarding/summary_screen.dart`

- [ ] Profile Setup: white card, display name text field (`KotokaTextField`), avatar picker (initials fallback), brand400 CTA.
- [ ] Mission Intro: `KokoAnimation(asset: KokoAssets.celebrate)`, brand500 heading "First mission awaits!", brand400 CTA.
- [ ] Summary: "You're all set!", `KokoAnimation(asset: KokoAssets.celebrate)`, white card listing selected language pair + level + daily goal. Brand400 CTA → home.
- [ ] Add ARB keys: `profileSetupTitle`, `displayNameLabel`, `missionTitle`, `missionSubtitle`, `summaryTitle`, `summaryReady`, `letsGo`
- [ ] Commit: `git commit -m "feat: ONB-08/09/10 profile, mission, summary screens"`

---

## TASK 11: Home Screen

**Files:**
- Create: `lib/screens/home/home_screen.dart`

- [ ] No missions section (HOM-01). Review badge on nav tab (HOM-01b). Sections: streak row, vocab cards today, quick-start review button. Brand400 accents throughout.

```dart
// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/due_cards_provider.dart';
import '../../core/widgets/k_scaffold.dart';
import '../../core/widgets/k_section_header.dart';
import '../../core/widgets/kotoka_button.dart';
import '../../core/widgets/koko_animation.dart';
import '../../core/widgets/streak_commit_row.dart';
import '../../core/widgets/vocab_card.dart';
import '../../core/theme/tokens.dart';
import '../../l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dueCount = ref.watch(dueCardsProvider);
    return KScaffold(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(KSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.homeGreeting,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        KokoAnimation(
                          asset: KokoAssets.idle,
                          width: 56, height: 56,
                        ),
                      ],
                    ),
                    const SizedBox(height: KSpacing.md),
                    const StreakCommitRow(),
                    const SizedBox(height: KSpacing.lg),
                    if (dueCount > 0) ...[
                      KSectionHeader(l10n.reviewDue),
                      const SizedBox(height: KSpacing.sm),
                      KotokaButton(
                        label: l10n.startReview(dueCount),
                        onPressed: () => context.go('/review'),
                      ),
                      const SizedBox(height: KSpacing.lg),
                    ],
                    KSectionHeader(l10n.recentVocab),
                    const SizedBox(height: KSpacing.sm),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.lg),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, i) => Padding(
                    padding: const EdgeInsets.only(bottom: KSpacing.sm),
                    child: VocabCard(index: i), //MOCKDATA
                  ),
                  childCount: 5, //MOCKDATA
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

- [ ] Add ARB keys: `homeGreeting`, `reviewDue`, `startReview`, `recentVocab`
- [ ] Commit: `git commit -m "feat: home screen with streak + due cards"`

---

## TASK 12: Snap Screens

**Files:**
- Create: `lib/screens/snap/snap_screen.dart`
- Create: `lib/screens/snap/snap_text_screen.dart`
- Create: `lib/screens/snap/snap_processing_screen.dart`
- Create: `lib/screens/snap/snap_results_screen.dart`

- [ ] **snap_screen.dart**: Dark bg `#0b1c30`. Minimal viewfinder. `•••` toggle reveals advanced controls (flash, grid). Camera capture → processing. Text mode tab.
- [ ] **snap_text_screen.dart**: `KotokaTextField` for manual word entry. Brand400 focus border. Submit → processing.
- [ ] **snap_processing_screen.dart**: `KokoAnimation(asset: KokoAssets.thinking)`, animated dots, "Analyzing...". Rate limit: 14 RPM Gemini.
- [ ] **snap_results_screen.dart**: Grid of extracted vocab cards. Each word: term + translation + example. `**bold**` Gemini output. Add-to-deck button (brand500).
- [ ] Ensure rate_limiter.dart enforces 14 RPM for Gemini endpoint.
- [ ] Add ARB keys: `snapHint`, `snapTextMode`, `snapAnalyzing`, `snapResults`, `addToDeck`
- [ ] Commit: `git commit -m "feat: snap flow (camera + text + processing + results)"`

---

## TASK 13: Review Screens

**Files:**
- Create: `lib/screens/review/review_screen.dart`
- Create: `lib/screens/review/review_flashcard_screen.dart`
- Create: `lib/screens/review/review_fillblank_screen.dart`
- Create: `lib/screens/review/review_conversation_screen.dart`
- Create: `lib/screens/review/review_complete_screen.dart`

- [ ] **review_screen.dart**: Session start. Shows due count, estimated time. Brand400 CTA.
- [ ] **review_flashcard_screen.dart**: Card flip animation (150ms ease-out). Front: target word. Back: translation + example. 4 SRS buttons (REV-02):
  - 😵 `l10n.ratingMissed` → brand: error500
  - 😕 `l10n.ratingAlmost` → brand: warning500
  - 🙂 `l10n.ratingGotIt` → brand: sky300
  - 😄 `l10n.ratingEasy` → brand: brand400
- [ ] **review_fillblank_screen.dart**: Sentence with blank. `KotokaTextField`. Submit + hint button.
- [ ] **review_conversation_screen.dart**: AI conversation practice. Gemini 2.5 Flash. **Bold** formatting on AI responses. 14 RPM rate limit.
- [ ] **review_complete_screen.dart**: `KokoAnimation(asset: KokoAssets.celebrate)`. Stats: cards reviewed, accuracy %, XP earned. Brand400 CTA home.
- [ ] Add ARB keys: all SRS rating labels, session stats labels
- [ ] Commit: `git commit -m "feat: review flow (flashcard + fill-blank + conversation + complete)"`

---

## TASK 14: Shop Screen

**Files:**
- Create: `lib/screens/shop/shop_screen.dart`

- [ ] Beta free access (SHO-03). No premium pricing shown. "Free in beta" badge on all packs. Beta banner at top. Vocab pack cards with KCard. Brand400 accents.
- [ ] Add ARB keys: `shopTitle`, `freeBeta`, `betaBanner`, `addPackFree`
- [ ] Commit: `git commit -m "feat: shop screen with beta free access"`

---

## TASK 15: Profile Screen

**Files:**
- Create: `lib/screens/profile/profile_screen.dart`

- [ ] Sections: user stats (words, sessions, accuracy), language pair management (change at any time via `localeProvider`), memory map placeholder, settings.
- [ ] Language change → updates `localeProvider` immediately, persists to local storage.
- [ ] Stats mock data tagged //MOCKDATA.
- [ ] Add ARB keys: `profileTitle`, `wordsLearned`, `totalSessions`, `accuracy`, `languagePair`, `changeLanguage`
- [ ] Commit: `git commit -m "feat: profile screen with language switcher + stats"`

---

## TASK 16: Router + Navigation

**Files:**
- Modify: `lib/core/router/app_router.dart`

- [ ] Ensure all routes exist:
  - `/onboarding/welcome`
  - `/onboarding/language`
  - `/onboarding/goal`
  - `/onboarding/level`
  - `/onboarding/schedule`
  - `/onboarding/notifications`
  - `/onboarding/pdpa`
  - `/onboarding/profile`
  - `/onboarding/mission`
  - `/onboarding/summary`
  - `/home`
  - `/snap`, `/snap/text`, `/snap/processing`, `/snap/results`
  - `/review`, `/review/flashcard`, `/review/fillblank`, `/review/conversation`, `/review/complete`
  - `/shop`
  - `/profile`
- [ ] No bottom nav on onboarding routes
- [ ] Bottom nav on all main routes (Home/Snap/Review/Shop/Profile)
- [ ] Commit: `git commit -m "feat: complete router with all routes"`

---

## TASK 17: i18n — All 6 Locales

**Files:**
- Modify: `lib/l10n/app_en.arb` (and th, zh, es, vi, lo)

- [ ] Add all ARB keys from Tasks 4–15 to all 6 locale files.
- [ ] Every screen must compile with 0 missing locale keys.
- [ ] Run: `flutter gen-l10n` and verify no errors.
- [ ] Commit: `git commit -m "feat: i18n complete for all 6 locales"`

---

## TASK 18: Docker Dev Environment

**Files:**
- Verify: `docker-compose.yml` exists at project root

- [ ] Confirm `docker-compose up` starts:
  - Firestore emulator on port 8080
  - Redis cache on port 6379
- [ ] Verify `lib/core/api/api_client.dart` uses emulator in debug mode
- [ ] Commit: `git commit -m "chore: verify docker dev environment"`

---

## TASK 19: Rate Limiter Verification

**Files:**
- Modify: `lib/core/api/rate_limiter.dart`

- [ ] Default: 60 req/min per user for all endpoints
- [ ] Gemini endpoints: 14 RPM hard cap
- [ ] Applied to: snap (Gemini), review conversation (Gemini), all Cloud Run endpoints
- [ ] Commit: `git commit -m "feat: rate limiter applied to all endpoints"`

---

## TASK 20: Final Build Verification

- [ ] Run `flutter analyze` — 0 errors, 0 warnings
- [ ] Run `flutter build apk --debug`
- [ ] Install on Android emulator via Android MCP
- [ ] Screenshot every screen via `mcp__android__screenshot`
- [ ] Verify: brand50 bg on all screens, brand400 accents present, no hardcoded colors
- [ ] Verify: KokoAnimation loads on ONB-01, ONB-09, ONB-10, Home
- [ ] Verify: 6-language dropdown works in profile
- [ ] Verify: review badge shows due count on nav
- [ ] Commit: `git commit -m "chore: phase1 build verified on emulator"`
