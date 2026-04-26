import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/onboarding_providers.dart';
import 'package:kotoka_app/core/router/app_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class SummaryScreen extends ConsumerWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    final level = ref.watch(selectedLevelProvider);
    final goalMinutes = ref.watch(dailyGoalMinutesProvider);
    final langPair = ref.watch(selectedLanguagePairProvider);

    return Scaffold(
      backgroundColor: KColors.neutral0,
      body: Stack(
        children: [
          Positioned(
            top: -80,
            right: -80,
            child: IgnorePointer(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: KColors.brand400.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            left: -60,
            child: IgnorePointer(
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  color: KColors.brand100.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  const KokoAnimation(state: KokoState.celebrating, size: 160),
                  const SizedBox(height: KSpacing.sp24),
                  Text(
                    l10n.onbSummaryTitle,
                    style: KTypography.getStyle(KTextStyle.h2, locale)
                        .copyWith(color: KColors.brand400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: KSpacing.sp8),
                  Text(
                    l10n.onbSummaryBody,
                    style: KTypography.getStyle(KTextStyle.body, locale)
                        .copyWith(color: KColors.neutral700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: KSpacing.sp24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(KSpacing.sp20),
                    decoration: BoxDecoration(
                      color: KColors.neutral0,
                      borderRadius: KRadius.lg,
                      border: Border.all(
                          color: KColors.brand400.withValues(alpha: 0.20)),
                      boxShadow: KElevation.shadow2,
                    ),
                    child: Column(
                      children: [
                        _SummaryRow(
                          label: l10n.onbSummaryLanguagePair,
                          value: langPair != null
                              ? '${langPair['source'] ?? ''} → ${langPair['target'] ?? ''}'
                              : '—',
                          icon: Icons.translate,
                        ),
                        const Divider(height: KSpacing.sp24),
                        _SummaryRow(
                          label: l10n.onbSummaryLevel,
                          value: level != null ? _levelLabel(level, l10n) : '—',
                          icon: Icons.school_outlined,
                        ),
                        const Divider(height: KSpacing.sp24),
                        _SummaryRow(
                          label: l10n.onbSummaryDailyGoal,
                          value: goalMinutes != null
                              ? '$goalMinutes min/day'
                              : '—',
                          icon: Icons.timer_outlined,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3),
                  KotokaButton(
                    label: l10n.onbSummaryStart,
                    onPressed: () {
                      ref.read(authCompletedProvider.notifier).state = true;
                      context.go('/home');
                    },
                    variant: KotokaButtonVariant.primary,
                  ),
                  const SizedBox(height: KSpacing.sp32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _levelLabel(String key, AppLocalizations l10n) {
    switch (key) {
      case 'beginner':     return l10n.levelBeginner;
      case 'intermediate': return l10n.levelIntermediate;
      case 'advanced':     return l10n.levelAdvanced;
      default:             return key;
    }
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: KColors.brand400, size: KSpacing.sp20),
        const SizedBox(width: KSpacing.sp12),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: KColors.neutral600,
              fontSize: 13,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: KColors.neutral900,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
