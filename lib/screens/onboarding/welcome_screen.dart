import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ONB-01 — Welcome screen
// KokoAnimation wave, "Kotoka" title in brand400, tagline, CTA → /onboarding/auth
// Three glass feature preview cards at bottom + "Sign in to account" ghost link
// =============================================================================

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KScaffold(
      child: Stack(
        children: [
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  // Koko waving character
                  KokoAnimation(
                    state: KokoState.waving,
                    size: 300,
                    semanticsLabel: l10n.kokoWavingSemantics,
                  ),
                  const SizedBox(height: KSpacing.sp32),
                  // "Kotoka" title in brand400 (bright cyan)
                  Text(
                    l10n.appName,
                    style: KTypography.getStyle(KTextStyle.h1, locale).copyWith(
                      color: KColors.brand400,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1.0,
                      fontSize: 60,
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp12),
                  // Tagline
                  Text(
                    l10n.welcomeTagline,
                    textAlign: TextAlign.center,
                    style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
                      color: KColors.textSecondary,
                    ),
                  ),
                  const Spacer(flex: 2),
                  // Primary CTA → /onboarding/auth
                  KotokaButton(
                    label: l10n.welcomeGetStarted,
                    onPressed: () => context.go('/onboarding/auth'),
                  ),
                  const SizedBox(height: KSpacing.sp12),
                  // "Sign in to account" ghost link
                  TextButton(
                    onPressed: () => context.go('/onboarding/auth'),
                    child: Text(
                      l10n.welcomeSignIn,
                      style: KTypography.getStyle(KTextStyle.body, locale)
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp16),
                  // Terms caption
                  Text(
                    l10n.welcomeTerms,
                    textAlign: TextAlign.center,
                    style: KTypography.getStyle(KTextStyle.caption, locale).copyWith(
                      color: KColors.textSecondary,
                    ),
                  ),
                  // Space for feature cards at bottom
                  const SizedBox(height: KSpacing.sp96),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.label,
    required this.locale,
  });

  final IconData icon;
  final String label;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: KRadius.lg,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.all(KSpacing.sp8),
          decoration: BoxDecoration(
            color: KColors.neutral0.withValues(alpha: 0.70),
            borderRadius: KRadius.lg,
            border: Border.all(
              color: KColors.neutral0.withValues(alpha: 0.40),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: KSpacing.sp24, color: KColors.brand500),
              const SizedBox(height: KSpacing.sp4),
              Text(
                label,
                style: KTypography.getStyle(KTextStyle.label, locale)
                    .copyWith(color: KColors.neutral900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
