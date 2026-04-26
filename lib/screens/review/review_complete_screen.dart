import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ReviewCompleteScreen — session completion.
// KokoAnimation celebrate. Stats KCard. "Back to Home" CTA.
// Stats are mock data. //MOCKDATA
// =============================================================================

class ReviewCompleteScreen extends StatelessWidget {
  const ReviewCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    // Mock session stats //MOCKDATA
    const cardsReviewed = 12; //MOCKDATA
    const accuracy = 83; //MOCKDATA
    const xpEarned = 60; //MOCKDATA

    return KScaffold(
      showOrbs: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp24, vertical: KSpacing.sp16),
        child: Column(
          children: [
            const Spacer(),
            // Koko celebrate animation
            const KokoAnimation(
              state: KokoState.celebrating,
              size: 180,
              semanticsLabel: 'Koko celebrating',
            ),
            const SizedBox(height: KSpacing.sp24),
            // "Session Complete!" heading
            Text(
              l10n.reviewCompleteTitle,
              style: KTypography.getStyle(KTextStyle.h1, locale)
                  .copyWith(color: KColors.brand500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp8),
            Text(
              l10n.reviewCompleteSubtitle,
              style: KTypography.getStyle(KTextStyle.body, locale)
                  .copyWith(color: KColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp32),
            // Stats card
            KCard(
              child: Row(
                children: [
                  _StatTile(
                    value: '$cardsReviewed',
                    label: l10n.reviewCompleteStatCards,
                    icon: Icons.layers_rounded,
                  ),
                  _VerticalDivider(),
                  _StatTile(
                    value: '$accuracy%',
                    label: l10n.reviewCompleteStatAccuracy,
                    icon: Icons.track_changes_rounded,
                  ),
                  _VerticalDivider(),
                  _StatTile(
                    value: '+$xpEarned',
                    label: l10n.reviewCompleteStatXp,
                    icon: Icons.bolt_rounded,
                  ),
                ],
              ),
            ),
            const Spacer(),
            // CTAs
            KotokaButton(
              label: l10n.reviewCompleteBackHome,
              onPressed: () => context.go('/home'),
            ),
            const SizedBox(height: KSpacing.sp12),
            KotokaButton(
              label: l10n.reviewCompleteSnapAnother,
              variant: KotokaButtonVariant.secondary,
              onPressed: () => context.go('/snap'),
            ),
            const SizedBox(height: KSpacing.sp24),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.value,
    required this.label,
    required this.icon,
  });
  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: KColors.brand500, size: 22),
          const SizedBox(height: KSpacing.sp4),
          Text(
            value,
            style: KTypography.getStyle(KTextStyle.h3, locale)
                .copyWith(color: KColors.brand500),
          ),
          const SizedBox(height: KSpacing.sp2),
          Text(
            label,
            style: KTypography.getStyle(KTextStyle.caption, locale)
                .copyWith(color: KColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 56,
      color: KColors.neutral200,
    );
  }
}
