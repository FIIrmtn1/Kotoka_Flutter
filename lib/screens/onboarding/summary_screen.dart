// ONB-07 — Summary / "You're all set!" screen.
// Template: CardCenterStage
// Hero: KokoAnimation celebrating in radial-gradient bento card.
// 3 feature rows (Account Secured badge inside hero, Smart Tags, Cloud Sync).
// Primary CTA → /home. Ghost secondary link → /home.
// Bottom-right toast: "✓ Setup complete".
// No hardcoded values — all from tokens.dart.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:kotoka_app/core/router/app_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class SummaryScreen extends ConsumerWidget {
  const SummaryScreen({super.key});

  void _complete(BuildContext context, WidgetRef ref) {
    ref.read(authCompletedProvider.notifier).state = true;
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.neutral0,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: KSpacing.sp32),

                  // --------------------------------------------------------
                  // Hero bento card — radial gradient + KokoAnimation
                  // --------------------------------------------------------
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: KSpacing.sp32,
                      horizontal: KSpacing.sp24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: KRadius.xl,
                      gradient: const RadialGradient(
                        center: Alignment.center,
                        radius: 0.85,
                        colors: [
                          KColors.summaryHeroGradientCenter,
                          Colors.white,
                        ],
                      ),
                      boxShadow: KElevation.shadow2,
                    ),
                    child: Column(
                      children: [
                        Semantics(
                          label: l10n.summaryKokoSemantics,
                          child: KokoAnimation(
                            state: KokoState.celebrating,
                            size: 160,
                          ),
                        ),
                        const SizedBox(height: KSpacing.sp20),
                        // Account Secured badge — inside hero card
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: KSpacing.sp12,
                            vertical: KSpacing.sp4,
                          ),
                          decoration: BoxDecoration(
                            color: KColors.success100,
                            borderRadius: KRadius.full,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.shield_outlined,
                                size: 14,
                                color: KColors.success500,
                              ),
                              const SizedBox(width: KSpacing.sp4),
                              Text(
                                l10n.summaryAccountSecured,
                                style: KTypography.getStyle(
                                  KTextStyle.label,
                                  locale,
                                ).copyWith(color: KColors.success500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: KSpacing.sp4),
                        Text(
                          l10n.summaryAccountSecuredDesc,
                          style: KTypography.getStyle(
                            KTextStyle.caption,
                            locale,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: KSpacing.sp24),

                  // --------------------------------------------------------
                  // Title + subtitle
                  // --------------------------------------------------------
                  Text(
                    l10n.summaryTitle,
                    style: KTypography.getStyle(KTextStyle.h1, locale)
                        .copyWith(
                      color: KColors.neutral900,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: KSpacing.sp8),
                  Text(
                    l10n.summarySubtitle,
                    style: KTypography.getStyle(KTextStyle.body, locale)
                        .copyWith(color: KColors.neutral500),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: KSpacing.sp24),

                  // --------------------------------------------------------
                  // Feature cards — Smart Tags + Cloud Sync
                  // --------------------------------------------------------
                  _FeatureCard(
                    icon: Icons.star_outline,
                    title: l10n.summarySmartTags,
                    desc: l10n.summarySmartTagsDesc,
                    locale: locale,
                  ),
                  const SizedBox(height: KSpacing.sp12),
                  _FeatureCard(
                    icon: Icons.cloud_outlined,
                    title: l10n.summaryCloudSync,
                    desc: l10n.summaryCloudSyncDesc,
                    locale: locale,
                  ),

                  const SizedBox(height: KSpacing.sp32),

                  // --------------------------------------------------------
                  // Primary CTA
                  // --------------------------------------------------------
                  KotokaButton(
                    label: '${l10n.summarySnapCta} →',
                    onPressed: () => _complete(context, ref),
                    variant: KotokaButtonVariant.primary,
                  ),

                  const SizedBox(height: KSpacing.sp12),

                  // --------------------------------------------------------
                  // Ghost secondary link
                  // --------------------------------------------------------
                  TextButton(
                    onPressed: () => _complete(context, ref),
                    child: Text(
                      l10n.summaryTourLink,
                      style: KTypography.getStyle(KTextStyle.body, locale)
                          .copyWith(color: Colors.black54),
                    ),
                  ),

                  // Extra bottom padding so toast doesn't overlap CTA
                  const SizedBox(height: KSpacing.sp80),
                ],
              ),
            ),
          ),

          // ----------------------------------------------------------------
          // Bottom-right toast: "✓ Setup complete"
          // ----------------------------------------------------------------
          Positioned(
            bottom: KSpacing.sp32,
            right: KSpacing.sp24,
            child: _SetupToast(l10n: l10n, locale: locale),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _FeatureCard — small bento card with icon, title, description
// ---------------------------------------------------------------------------
class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.locale,
  });

  final IconData icon;
  final String title;
  final String desc;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.lg,
        border: Border.all(color: const Color(0xFFE5EEFF)),
        boxShadow: KElevation.shadow1,
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: KColors.brand400.withValues(alpha: 0.12),
              borderRadius: KRadius.sm,
            ),
            child: Icon(icon, size: 18, color: KColors.brand500),
          ),
          const SizedBox(width: KSpacing.sp12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: KTypography.getStyle(KTextStyle.h4, locale)
                      .copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: KSpacing.sp2),
                Text(
                  desc,
                  style:
                      KTypography.getStyle(KTextStyle.bodySmall, locale),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _SetupToast — fixed bottom-right "✓ Setup complete" widget
// ---------------------------------------------------------------------------
class _SetupToast extends StatelessWidget {
  const _SetupToast({required this.l10n, required this.locale});

  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp12,
        vertical: KSpacing.sp8,
      ),
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.sm,
        border: const Border(
          left: BorderSide(color: KColors.brand500, width: 4),
        ),
        boxShadow: KElevation.shadow2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 16,
            color: KColors.success500,
          ),
          const SizedBox(width: KSpacing.sp8),
          Text(
            l10n.summarySetupToast,
            style: KTypography.getStyle(KTextStyle.label, locale)
                .copyWith(color: KColors.success500),
          ),
        ],
      ),
    );
  }
}
