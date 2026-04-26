import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/review/review_flashcard_screen.dart';

// REV-01 — Review Session Intro Screen
// Mock data tagged //MOCKDATA

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: KElevation.elevation0,
        title: Text(
          l10n.reviewTitle,
          style: KTypography.getStyle(KTextStyle.h3, locale)
              .copyWith(color: theme.colorScheme.onSurface),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: theme.colorScheme.onSurfaceVariant),
            onPressed: () => Navigator.of(context).pop(),
            tooltip: 'Skip',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Session card
              _SessionCard(l10n: l10n, locale: locale),
              const SizedBox(height: KSpacing.sp24),

              // Progress indicator 0/8
              ClipRRect(
                borderRadius: KRadius.full,
                child: LinearProgressIndicator(
                  value: 0.0, //MOCKDATA
                  minHeight: KSpacing.sp8,
                  backgroundColor: KColors.neutral200,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(KColors.brand500),
                ),
              ),
              const SizedBox(height: KSpacing.sp8),
              Text(
                l10n.reviewProgressOf(0, 8), //MOCKDATA
                style: KTypography.getStyle(KTextStyle.caption, locale),
              ),

              const SizedBox(height: KSpacing.sp24),

              // Motivational tips card
              _ReviewTipsCard(l10n: l10n, locale: locale),

              const Spacer(),

              KotokaButton(
                label: l10n.reviewStartSession,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => const ReviewFlashcardScreen()),
                  );
                },
                variant: KotokaButtonVariant.primary,
              ),
              const SizedBox(height: KSpacing.sp12),
              KotokaButton(
                label: l10n.reviewQuickMode, //MOCKDATA
                onPressed: () {},
                variant: KotokaButtonVariant.ghost,
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

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.l10n, required this.locale});

  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: KRadius.lg,
        boxShadow: KElevation.shadow2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.reviewWordsDue(8, 10), //MOCKDATA
            style: KTypography.getStyle(KTextStyle.h4, locale)
                .copyWith(color: theme.colorScheme.onSurface),
          ),
          const SizedBox(height: KSpacing.sp16),
          const Divider(color: KColors.neutral200, height: 1),
          const SizedBox(height: KSpacing.sp12),
          _LocationRow(
              icon: Icons.location_on_outlined,
              label: 'Silom Office', //MOCKDATA
              count: 5), //MOCKDATA
          const SizedBox(height: KSpacing.sp8),
          _LocationRow(
              icon: Icons.location_on_outlined,
              label: 'Café Amazon', //MOCKDATA
              count: 3), //MOCKDATA
          const SizedBox(height: KSpacing.sp12),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: KSpacing.sp8,
              vertical: KSpacing.sp4,
            ),
            decoration: BoxDecoration(
              color: KColors.brand500.withOpacity(0.10),
              borderRadius: KRadius.full,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.mic_outlined, size: 14, color: KColors.brand500),
                const SizedBox(width: KSpacing.sp4),
                Text(
                  l10n.reviewIncludesSpeaking,
                  style: KTypography.getStyle(KTextStyle.caption, locale)
                      .copyWith(color: KColors.brand500, fontWeight: FontWeight.w600),
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
// _ReviewTipsCard — fills dead space with useful spaced-repetition context
// ---------------------------------------------------------------------------
class _ReviewTipsCard extends StatelessWidget {
  const _ReviewTipsCard({required this.l10n, required this.locale});
  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tips = [
      ('🧠', l10n.reviewTip1),
      ('⏱️', l10n.reviewTip2),
      ('📈', l10n.reviewTip3),
    ];
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: isDark ? KColorsDark.bgCard : KColors.brand50,
        borderRadius: KRadius.md,
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.reviewTipsHeading,
            style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
              color: KColors.brand500,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: KSpacing.sp12),
          ...tips.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: KSpacing.sp8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.$1, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: KSpacing.sp8),
                    Expanded(
                      child: Text(
                        t.$2,
                        style: KTypography.getStyle(KTextStyle.caption, locale)
                            .copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow({
    required this.icon,
    required this.label,
    required this.count,
  });

  final IconData icon;
  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Row(
      children: [
        Icon(icon, size: KSpacing.sp16, color: KColors.brand500),
        const SizedBox(width: KSpacing.sp8),
        Expanded(
          child: Text(
            label,
            style: KTypography.getStyle(KTextStyle.body, locale)
                .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp8,
            vertical: KSpacing.sp2,
          ),
          decoration: BoxDecoration(
            color: KColors.brand500.withOpacity(0.12),
            borderRadius: KRadius.full,
          ),
          child: Text(
            '$count',
            style: KTypography.getStyle(KTextStyle.label, locale)
                .copyWith(color: KColors.brand500),
          ),
        ),
      ],
    );
  }
}
