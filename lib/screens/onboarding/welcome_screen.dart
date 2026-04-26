import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_cta_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KStitchScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
        child: Column(
          children: [
            const Spacer(flex: 2),
            const KokoAnimation(state: KokoState.waving, size: 160),
            const SizedBox(height: KSpacing.sp24),
            Text(
              'Kotoka',
              style: KTypography.getStyle(KTextStyle.h1, locale)
                  .copyWith(color: KColors.brand400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp12),
            Text(
              l10n.tagline,
              style: KTypography.getStyle(KTextStyle.body, locale)
                  .copyWith(color: KColors.neutral700),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 3),
            KCtaButton(
              label: l10n.getStarted,
              onPressed: () => context.go('/onboarding/goal'),
            ),
            const SizedBox(height: KSpacing.sp16),
            Text(
              l10n.welcomeTerms,
              style: KTypography.getStyle(KTextStyle.caption, locale)
                  .copyWith(color: KColors.neutral500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp32),
          ],
        ),
      ),
    );
  }
}
