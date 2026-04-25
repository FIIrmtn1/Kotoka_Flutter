import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// StreakCommitRow — commit CTA + grace period copy below.
// Used inside CommitmentCard (ONB-05).
class StreakCommitRow extends StatelessWidget {
  const StreakCommitRow({
    super.key,
    required this.onAllow,
    this.onNotNow,
  });

  final VoidCallback onAllow;
  final VoidCallback? onNotNow;

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KotokaButton(
          label: l10n.onbCommitAllow,
          onPressed: onAllow,
          variant: KotokaButtonVariant.primary,
        ),
        if (onNotNow != null) ...[
          const SizedBox(height: KSpacing.sp8),
          KotokaButton(
            label: l10n.skipBtn,
            onPressed: onNotNow,
            variant: KotokaButtonVariant.ghost,
          ),
        ],
        const SizedBox(height: KSpacing.sp8),
        Text(
          l10n.onbCommitGrace,
          style: KTypography.getStyle(KTextStyle.caption, locale),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
