// ONB-06 — Goal Commitment screen.
// Combined Goal selection + Time commitment.
// Background: KColors.brand50 (lavender). No bottom nav.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class GoalCommitmentScreen extends ConsumerStatefulWidget {
  const GoalCommitmentScreen({super.key});

  @override
  ConsumerState<GoalCommitmentScreen> createState() =>
      _GoalCommitmentScreenState();
}

class _GoalCommitmentScreenState extends ConsumerState<GoalCommitmentScreen> {
  final Set<String> _selectedGoals = {};
  String _selectedTime = 'breezy';

  static const List<String> _goals = [ //MOCKDATA
    'Career',
    'Travel',
    'Academic',
    'Personal Growth',
    'Work Meeting',
    'Email Writing',
    'Presentation',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KScaffold(
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp16, vertical: KSpacing.sp8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded,
                        color: KColors.neutral700),
                    onPressed: () => context.pop(),
                  ),
                  Expanded(
                    child: Text(
                      'Kotoka',
                      textAlign: TextAlign.center,
                      style: KTypography.getStyle(KTextStyle.h4, locale)
                          .copyWith(color: KColors.brand400),
                    ),
                  ),
                  Text(
                    'Step 3 of 4',
                    style: KTypography.getStyle(KTextStyle.caption, locale)
                        .copyWith(color: KColors.textSecondary),
                  ),
                  const SizedBox(width: KSpacing.sp8),
                ],
              ),
            ),

            // Progress bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: LinearProgressIndicator(
                value: 0.75,
                color: KColors.brand400,
                backgroundColor: KColors.brand400.withValues(alpha: 0.15),
                minHeight: 6,
                borderRadius: KRadius.full,
              ),
            ),

            // Scrollable body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp24,
                  vertical: KSpacing.sp16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: KSpacing.sp16),

                    // Section title
                    Text(
                      l10n.goalFocusTitle,
                      style: KTypography.getStyle(KTextStyle.h1, locale)
                          .copyWith(color: KColors.neutral900),
                    ),
                    const SizedBox(height: KSpacing.sp8),
                    Text(
                      l10n.goalFocusSubtitle,
                      style: KTypography.getStyle(KTextStyle.body, locale)
                          .copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: KSpacing.sp24),

                    // Goals section header
                    Row(
                      children: [
                        Text(
                          l10n.goalSelectGoals,
                          style: KTypography.getStyle(KTextStyle.h4, locale)
                              .copyWith(color: KColors.brand600),
                        ),
                        const SizedBox(width: KSpacing.sp8),
                        _PillBadge(label: l10n.goalStep1, locale: locale),
                      ],
                    ),
                    const SizedBox(height: KSpacing.sp12),

                    // Goal chips
                    Wrap(
                      spacing: KSpacing.sp8,
                      runSpacing: KSpacing.sp8,
                      children: _goals.map((goal) {
                        final selected = _selectedGoals.contains(goal);
                        return GestureDetector(
                          onTap: () => setState(() {
                            if (selected) {
                              _selectedGoals.remove(goal);
                            } else {
                              _selectedGoals.add(goal);
                            }
                          }),
                          child: AnimatedContainer(
                            duration: KMotion.fast,
                            padding: const EdgeInsets.symmetric(
                              horizontal: KSpacing.sp16,
                              vertical: KSpacing.sp8,
                            ),
                            decoration: BoxDecoration(
                              color: selected
                                  ? KColors.brand400.withValues(alpha: 0.15)
                                  : KColors.neutral0,
                              borderRadius: KRadius.full,
                              border: Border.all(
                                color: selected
                                    ? KColors.brand400
                                    : Colors.black12,
                              ),
                            ),
                            child: Text(
                              goal,
                              style: KTypography.getStyle(
                                      KTextStyle.label, locale)
                                  .copyWith(
                                color: selected
                                    ? KColors.neutral900
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: KSpacing.sp24),

                    // Commitment section header + Koko
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  l10n.goalCommitment,
                                  style: KTypography.getStyle(
                                          KTextStyle.h4, locale)
                                      .copyWith(color: KColors.brand600),
                                ),
                                const SizedBox(width: KSpacing.sp8),
                                _PillBadge(
                                    label: l10n.goalStep2, locale: locale),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        KokoAnimation(
                          state: KokoState.encouraging,
                          size: 48,
                        ),
                      ],
                    ),
                    const SizedBox(height: KSpacing.sp12),

                    // Time commitment cards
                    _CommitCard(
                      icon: Icons.air_outlined,
                      title: l10n.goalBreezy,
                      time: l10n.goalBreezyTime,
                      value: 'breezy',
                      selected: _selectedTime == 'breezy',
                      onTap: () =>
                          setState(() => _selectedTime = 'breezy'),
                      locale: locale,
                    ),
                    const SizedBox(height: KSpacing.sp8),
                    _CommitCard(
                      icon: Icons.timer_outlined,
                      title: l10n.goalSteady,
                      time: l10n.goalSteadyTime,
                      value: 'steady',
                      selected: _selectedTime == 'steady',
                      onTap: () =>
                          setState(() => _selectedTime = 'steady'),
                      locale: locale,
                    ),
                    const SizedBox(height: KSpacing.sp8),
                    _CommitCard(
                      icon: Icons.fitness_center_outlined,
                      title: l10n.goalDeepDive,
                      time: l10n.goalDeepDiveTime,
                      value: 'deepdive',
                      selected: _selectedTime == 'deepdive',
                      onTap: () =>
                          setState(() => _selectedTime = 'deepdive'),
                      locale: locale,
                    ),
                    const SizedBox(height: KSpacing.sp32),

                    // Confirm CTA
                    KotokaButton(
                      label: l10n.goalConfirm,
                      onPressed: _selectedGoals.isNotEmpty
                          ? () => context.go('/onboarding/summary')
                          : null,
                    ),
                    const SizedBox(height: KSpacing.sp12),

                    // Caption
                    Center(
                      child: Text(
                        l10n.goalChangeSettings,
                        style:
                            KTypography.getStyle(KTextStyle.caption, locale)
                                .copyWith(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: KSpacing.sp32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PillBadge extends StatelessWidget {
  const _PillBadge({required this.label, required this.locale});
  final String label;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp8, vertical: KSpacing.sp2),
      decoration: BoxDecoration(
        color: KColors.brand400.withValues(alpha: 0.12),
        borderRadius: KRadius.full,
      ),
      child: Text(
        label,
        style: KTypography.getStyle(KTextStyle.label, locale)
            .copyWith(color: KColors.brand600),
      ),
    );
  }
}

class _CommitCard extends StatelessWidget {
  const _CommitCard({
    required this.icon,
    required this.title,
    required this.time,
    required this.value,
    required this.selected,
    required this.onTap,
    required this.locale,
  });

  final IconData icon;
  final String title;
  final String time;
  final String value;
  final bool selected;
  final VoidCallback onTap;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: KMotion.fast,
        padding: const EdgeInsets.all(KSpacing.sp16),
        decoration: BoxDecoration(
          color: selected
              ? KColors.brand400.withValues(alpha: 0.05)
              : KColors.neutral0,
          borderRadius: KRadius.lg,
          border: Border.all(
            color: selected ? KColors.brand400 : Colors.black12,
            width: selected ? 2.0 : 1.0,
          ),
          boxShadow: KElevation.shadow1,
        ),
        child: Row(
          children: [
            Container(
              width: KSpacing.sp40,
              height: KSpacing.sp40,
              decoration: BoxDecoration(
                color: KColors.brand500.withValues(alpha: 0.12),
                borderRadius: KRadius.md,
              ),
              child: Icon(icon, color: KColors.brand500, size: KSpacing.sp20),
            ),
            const SizedBox(width: KSpacing.sp12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: KTypography.getStyle(KTextStyle.h4, locale)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    time,
                    style:
                        KTypography.getStyle(KTextStyle.caption, locale)
                            .copyWith(color: KColors.textSecondary),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: selected ? value : null,
              onChanged: (_) => onTap(),
              activeColor: KColors.brand400,
            ),
          ],
        ),
      ),
    );
  }
}

