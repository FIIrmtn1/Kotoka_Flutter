import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/focus_mode_toggle.dart';

// =============================================================================
// WelcomeScreen — onboarding entry point.
// Background: KColors.brand100
// KokoAnimation idle, 160px centered.
// App name + tagline + Get Started CTA + terms caption.
// No hardcoded colors/sizes. All strings from AppLocalizations.
// =============================================================================

class WelcomeScreen extends StatelessWidget { // ONB-02
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.brand100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Koko character — wave state, 160px
              const KokoAnimation(state: KokoState.waving, size: 160),
              const SizedBox(height: KSpacing.sp16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: KSpacing.sp8),
                child: FocusModeToggle(),
              ),
              const SizedBox(height: KSpacing.sp16),
              // App name
              Text(
                'Kotoka',
                style: KTypography.getStyle(KTextStyle.h1, locale)
                    .copyWith(color: KColors.brand500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSpacing.sp12),
              // Tagline
              Text(
                l10n.tagline,
                style: KTypography.getStyle(KTextStyle.body, locale)
                    .copyWith(color: KColors.neutral700),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
              // Primary CTA
              KotokaButton(
                label: l10n.getStarted,
                onPressed: () => context.go('/onboarding/goal'),
                variant: KotokaButtonVariant.primary,
              ),
              const SizedBox(height: KSpacing.sp16),
              // Terms caption
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
      ),
    );
  }
}
