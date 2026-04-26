// ONB-09 — Mission screen.
// Background: KColors.brand50 (lavender).
// Heading: KColors.brand500 (teal) — NOT purple brand700.
// Subtitle: Colors.black54.
// CTA: KColors.brand400 (bright cyan accent) via KotokaButton secondary.
// No hardcoded values — all from tokens.dart.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class MissionScreen extends ConsumerWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.brand50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp24,
            vertical: KSpacing.sp16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              // Koko celebrating — centered
              Center(
                child: KokoAnimation(
                  state: KokoState.celebrating,
                  size: 180,
                  semanticsLabel: l.onbMissionTitle,
                ),
              ),

              const SizedBox(height: KSpacing.sp32),

              // Heading — brand500 (teal), NOT purple
              Text(
                l.onbMissionTitle,
                textAlign: TextAlign.center,
                style: KTypography.getStyle(KTextStyle.h1, locale).copyWith(
                  color: KColors.brand500,
                ),
              ),

              const SizedBox(height: KSpacing.sp16),

              // Subtitle — black54
              Text(
                l.onbMissionBody,
                textAlign: TextAlign.center,
                style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: KSpacing.sp24),

              // Brand400 accent dot row
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (i) {
                    return Container(
                      width: i == 1 ? KSpacing.sp24 : KSpacing.sp8,
                      height: KSpacing.sp8,
                      margin: const EdgeInsets.symmetric(
                          horizontal: KSpacing.sp4),
                      decoration: BoxDecoration(
                        color: i == 1 ? KColors.brand400 : KColors.brand400
                            .withValues(alpha: 0.3),
                        borderRadius: KRadius.full,
                      ),
                    );
                  }),
                ),
              ),

              const Spacer(),

              // CTA — brand500 primary
              KotokaButton(
                label: l.onbMissionCta,
                onPressed: () => context.go('/onboarding/summary'),
                variant: KotokaButtonVariant.primary,
              ),

              const SizedBox(height: KSpacing.sp16),
            ],
          ),
        ),
      ),
    );
  }
}
