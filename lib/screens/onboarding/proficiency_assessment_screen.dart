// ONB-05 — Proficiency Assessment screen.
// 2-card path selector (Duolingo-style). No auto-advance until card tap.
// Background: KColors.brand50 (lavender). No bottom nav.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class ProficiencyAssessmentScreen extends ConsumerStatefulWidget {
  const ProficiencyAssessmentScreen({super.key});

  @override
  ConsumerState<ProficiencyAssessmentScreen> createState() =>
      _ProficiencyAssessmentScreenState();
}

class _ProficiencyAssessmentScreenState
    extends ConsumerState<ProficiencyAssessmentScreen> {
  String? _selectedPath;

  void _selectPath(String path) {
    setState(() => _selectedPath = path);
    // 200 ms delay then navigate
    Timer(const Duration(milliseconds: 200), () {
      if (mounted) context.go('/onboarding/goal-commitment');
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KScaffold(
      child: SafeArea(
        child: Column(
          children: [
            // Sticky header
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
                    l10n.assessStep,
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
                value: 0.5,
                color: KColors.brand400,
                backgroundColor: KColors.brand400.withValues(alpha: 0.15),
                minHeight: 6,
                borderRadius: KRadius.full,
              ),
            ),
            const SizedBox(height: KSpacing.sp32),

            // Title + subtitle
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: Column(
                children: [
                  Text(
                    l10n.assessTitle,
                    textAlign: TextAlign.center,
                    style: KTypography.getStyle(KTextStyle.h1, locale)
                        .copyWith(color: KColors.neutral900),
                  ),
                  const SizedBox(height: KSpacing.sp8),
                  Text(
                    l10n.assessSubtitle,
                    textAlign: TextAlign.center,
                    style: KTypography.getStyle(KTextStyle.body, locale)
                        .copyWith(color: KColors.brand600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: KSpacing.sp32),

            // Selection cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: KSpacing.sp24),
                child: Column(
                  children: [
                    // Beginner card
                    SizedBox(
                      height: 260,
                      width: 300,
                      child: _PathCard(
                        isSelected: _selectedPath == 'beginner',
                        imagePath: 'Kokoanimation/child_koko-removebg.png',
                        title: l10n.assessBeginner,
                        subtitle: l10n.assessBeginnerSub,
                        onTap: () => _selectPath('beginner'),
                        locale: locale,
                      ),
                    ),

                    const SizedBox(height: KSpacing.sp16),

                    // Experienced card
                    SizedBox(
                      height: 260,
                      width: 300,
                      child: _PathCard(
                        isSelected: _selectedPath == 'experienced',
                        imagePath: 'Kokoanimation/graduate_koko-removebg.png',
                        title: l10n.assessExperienced,
                        subtitle: l10n.assessExperiencedSub,
                        onTap: () => _selectPath('experienced'),
                        locale: locale,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Step dots
            Padding(
              padding: const EdgeInsets.only(bottom: KSpacing.sp32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StepDot(active: false),
                  const SizedBox(width: KSpacing.sp8),
                  _StepDot(active: true),
                  const SizedBox(width: KSpacing.sp8),
                  _StepDot(active: false),
                  const SizedBox(width: KSpacing.sp8),
                  _StepDot(active: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PathCard extends StatelessWidget {
  const _PathCard({
    required this.isSelected,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.locale,
  });

  final bool isSelected;
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: KMotion.fast,
        curve: KMotion.defaultCurve,
        padding: const EdgeInsets.all(KSpacing.sp20),
        decoration: BoxDecoration(
          color: isSelected
              ? KColors.brand400.withValues(alpha: 0.05)
              : KColors.neutral0,
          borderRadius: KRadius.lg,
          border: Border.all(
            color: isSelected ? KColors.brand400 : Colors.black12,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected ? KElevation.shadow2 : KElevation.shadow1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 128,
              height: 128,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  color: KColors.brand400.withValues(alpha: 0.10),
                  borderRadius: KRadius.lg,
                ),
                child: const Icon(Icons.person_outlined,
                    size: 64, color: KColors.brand400),
              ),
            ),
            const SizedBox(height: KSpacing.sp12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: KTypography.getStyle(KTextStyle.h4, locale).copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: KSpacing.sp4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: KTypography.getStyle(KTextStyle.caption, locale)
                  .copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: KMotion.fast,
      width: active ? KSpacing.sp24 : KSpacing.sp8,
      height: KSpacing.sp8,
      decoration: BoxDecoration(
        color: active ? KColors.brand400 : Colors.black26,
        borderRadius: KRadius.full,
      ),
    );
  }
}
