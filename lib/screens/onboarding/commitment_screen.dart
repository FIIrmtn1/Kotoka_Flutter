// ONB-06 — Commitment / Notifications screen.
// Background: KColors.brand50 (lavender).
// CTA: KColors.brand500 (teal) via KotokaButton.
// Accent: KColors.brand400 (bright cyan).
// No hardcoded values — all from tokens.dart.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class CommitmentScreen extends ConsumerWidget {
  const CommitmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.neutral0,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp24,
            vertical: KSpacing.sp16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: KSpacing.sp32),

              // Koko waving animation
              Center(
                child: KokoAnimation(
                  state: KokoState.waving,
                  size: 140,
                  semanticsLabel: l.onbCommitTitle,
                ),
              ),

              const SizedBox(height: KSpacing.sp32),

              // Title
              Text(
                l.onbCommitTitle,
                textAlign: TextAlign.center,
                style: KTypography.getStyle(KTextStyle.h2, locale).copyWith(
                  color: KColors.brand500,
                ),
              ),

              const SizedBox(height: KSpacing.sp24),

              // Benefits card
              Container(
                decoration: BoxDecoration(
                  color: KColors.neutral0,
                  borderRadius: KRadius.lg,
                  boxShadow: KElevation.shadow2,
                ),
                padding: const EdgeInsets.all(KSpacing.sp20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BenefitRow(
                      icon: Icons.notifications_active_rounded,
                      text: l.onbCommitValueProp1,
                    ),
                    const SizedBox(height: KSpacing.sp16),
                    _BenefitRow(
                      icon: Icons.local_fire_department_rounded,
                      text: l.onbCommitValueProp2,
                    ),
                    const SizedBox(height: KSpacing.sp16),
                    // Accent bar
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [KColors.brand400, KColors.brand500],
                        ),
                        borderRadius: KRadius.full,
                      ),
                    ),
                    const SizedBox(height: KSpacing.sp12),
                    Text(
                      l.onbCommitGrace,
                      style: KTypography.getStyle(KTextStyle.bodySmall, locale)
                          .copyWith(color: KColors.textSecondary),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // CTA button — brand500 primary
              KotokaButton(
                label: l.onbCommitAllow,
                onPressed: () => context.go('/onboarding/pdpa'),
                variant: KotokaButtonVariant.primary,
                leadingIcon: Icons.notifications_rounded,
              ),

              const SizedBox(height: KSpacing.sp12),

              // Ghost skip
              KotokaButton(
                label: l.skipBtn,
                onPressed: () => context.go('/onboarding/pdpa'),
                variant: KotokaButtonVariant.ghost,
              ),

              const SizedBox(height: KSpacing.sp16),
            ],
          ),
        ),
      ),
    );
  }
}

class _BenefitRow extends StatelessWidget {
  const _BenefitRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: KSpacing.sp40,
          height: KSpacing.sp40,
          decoration: BoxDecoration(
            color: KColors.brand400.withValues(alpha: 0.12),
            borderRadius: KRadius.md,
          ),
          child: Icon(icon, color: KColors.brand400, size: KSpacing.sp20),
        ),
        const SizedBox(width: KSpacing.sp12),
        Expanded(
          child: Text(
            text,
            style: KTypography.getStyle(KTextStyle.body, locale),
          ),
        ),
      ],
    );
  }
}
