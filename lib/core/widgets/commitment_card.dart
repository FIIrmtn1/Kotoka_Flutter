import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

/// Organism combining KokoStage(encouraging) + commitment copy + action buttons.
/// Replaces the old PermissionPrompt + StreakPromiseCard pair.
class CommitmentCard extends StatelessWidget {
  const CommitmentCard({
    super.key,
    required this.onAllow,
    required this.onSkip,
  });

  final VoidCallback onAllow;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Card(
      color: KColors.brand50,
      elevation: KElevation.elevation2,
      shape: RoundedRectangleBorder(borderRadius: KRadius.xl),
      child: Padding(
        padding: const EdgeInsets.all(KSpacing.sp24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const KokoAnimation(
              state: KokoState.encouraging,
              size: 120,
            ),
            const SizedBox(height: KSpacing.sp20),
            Text(
              l10n.onbCommitTitle,
              style: KTypography.getStyle(KTextStyle.h3, locale)
                  .copyWith(color: KColors.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp12),
            Text(
              l10n.onbCommitValueProp1,
              style: KTypography.getStyle(KTextStyle.body, locale)
                  .copyWith(color: KColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp4),
            Text(
              l10n.onbCommitValueProp2,
              style: KTypography.getStyle(KTextStyle.body, locale)
                  .copyWith(color: KColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp24),
            KotokaButton(
              label: l10n.onbCommitAllow,
              onPressed: onAllow,
              variant: KotokaButtonVariant.primary,
            ),
            const SizedBox(height: KSpacing.sp12),
            KotokaButton(
              label: l10n.skipBtn,
              onPressed: onSkip,
              variant: KotokaButtonVariant.ghost,
            ),
            const SizedBox(height: KSpacing.sp16),
            Text(
              l10n.onbCommitGrace,
              style: KTypography.getStyle(KTextStyle.caption, locale)
                  .copyWith(color: KColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
