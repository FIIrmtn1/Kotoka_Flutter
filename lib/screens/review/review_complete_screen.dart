import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// REV-06 — Session Complete Screen
// Mock data tagged //MOCKDATA

class ReviewCompleteScreen extends ConsumerWidget {
  const ReviewCompleteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              const KokoAnimation(
                state: KokoState.celebrating,
                size: 160,
              ),
              const SizedBox(height: KSpacing.sp24),

              Text(
                l10n.reviewCompleteTitle,
                style: KTypography.getStyle(KTextStyle.h1, locale)
                    .copyWith(color: KColors.brand500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSpacing.sp32),

              // Score result card
              _ScoreResultCard(l10n: l10n, locale: locale),
              const SizedBox(height: KSpacing.sp24),

              // Strongest / needs work
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(KSpacing.sp16),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: KRadius.md,
                  border: Border.all(color: KColors.borderDefault),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ResultRow(
                      icon: Icons.star_outline,
                      color: KColors.success500,
                      label: 'Strongest: stakeholder', //MOCKDATA
                      locale: locale,
                    ),
                    const SizedBox(height: KSpacing.sp8),
                    _ResultRow(
                      icon: Icons.build_circle_outlined,
                      color: KColors.warning700,
                      label: 'Needs work: agenda', //MOCKDATA
                      locale: locale,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              KotokaButton(
                label: l10n.reviewCompleteBackHome,
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                variant: KotokaButtonVariant.primary,
              ),
              const SizedBox(height: KSpacing.sp12),
              KotokaButton(
                label: l10n.reviewCompleteSnapAnother,
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  // Nav to /snap handled by shell router
                },
                variant: KotokaButtonVariant.secondary,
              ),

              SizedBox(
                  height: MediaQuery.of(context).padding.bottom +
                      KSpacing.sp16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreResultCard extends StatelessWidget {
  const _ScoreResultCard({required this.l10n, required this.locale});

  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(KSpacing.sp24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [KColors.brand500, KColors.brand600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: KRadius.lg,
        boxShadow: KElevation.shadow2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ScoreStat(
            value: '7/8', //MOCKDATA
            label: 'correct',
            locale: locale,
          ),
          _ScoreStat(
            value: '+85 XP', //MOCKDATA
            label: 'earned',
            locale: locale,
          ),
          _ScoreStat(
            value: '🔥 13', //MOCKDATA
            label: 'day streak',
            locale: locale,
          ),
        ],
      ),
    );
  }
}

class _ScoreStat extends StatelessWidget {
  const _ScoreStat({
    required this.value,
    required this.label,
    required this.locale,
  });

  final String value;
  final String label;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: KTypography.getStyle(KTextStyle.h3, locale)
              .copyWith(color: KColors.neutral0, fontWeight: FontWeight.w700),
        ),
        Text(
          label,
          style: KTypography.getStyle(KTextStyle.caption, locale)
              .copyWith(color: KColors.brand200),
        ),
      ],
    );
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow({
    required this.icon,
    required this.color,
    required this.label,
    required this.locale,
  });

  final IconData icon;
  final Color color;
  final String label;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: KSpacing.sp16, color: color),
        const SizedBox(width: KSpacing.sp8),
        Text(
          label,
          style: KTypography.getStyle(KTextStyle.body, locale)
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
    );
  }
}
