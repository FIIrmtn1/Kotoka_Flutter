import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/due_cards_provider.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ReviewScreen — session intro. Shows due count + estimated time.
// Estimated time: dueCount * 30 seconds //MOCKDATA
// =============================================================================

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final dueCount = ref.watch(dueCardsCountProvider);
    // Estimated time in minutes (30 s per card) //MOCKDATA
    final estimatedMinutes = ((dueCount * 30) / 60).ceil(); //MOCKDATA

    return KScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.reviewTitle,
          style: KTypography.getStyle(KTextStyle.h4, locale)
              .copyWith(color: KColors.neutral900),
        ),
        centerTitle: false,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp24, vertical: KSpacing.sp8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Session card
            KCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: KColors.brand500.withValues(alpha: 0.12),
                          borderRadius: KRadius.md,
                        ),
                        child: const Icon(Icons.layers_rounded,
                            color: KColors.brand500, size: 26),
                      ),
                      const SizedBox(width: KSpacing.sp16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.reviewTitle,
                              style: KTypography.getStyle(KTextStyle.h4, locale)
                                  .copyWith(color: KColors.neutral900),
                            ),
                            const SizedBox(height: KSpacing.sp4),
                            Text(
                              l10n.reviewWordsDue(dueCount, estimatedMinutes),
                              style: KTypography.getStyle(
                                      KTextStyle.bodySmall, locale)
                                  .copyWith(color: KColors.brand500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: KSpacing.sp16),
                  // Speaking practice chip
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: KSpacing.sp12, vertical: KSpacing.sp4),
                    decoration: BoxDecoration(
                      color: KColors.sky100,
                      borderRadius: KRadius.full,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.mic_rounded,
                            size: 14, color: KColors.info500),
                        const SizedBox(width: KSpacing.sp4),
                        Text(
                          l10n.reviewIncludesSpeaking,
                          style: KTypography.getStyle(KTextStyle.label, locale)
                              .copyWith(color: KColors.info500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: KSpacing.sp24),

            // Tips card
            KCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.reviewTipsHeading,
                    style: KTypography.getStyle(KTextStyle.h4, locale)
                        .copyWith(color: KColors.brand600),
                  ),
                  const SizedBox(height: KSpacing.sp12),
                  _TipRow(text: l10n.reviewTip1),
                  const SizedBox(height: KSpacing.sp8),
                  _TipRow(text: l10n.reviewTip2),
                  const SizedBox(height: KSpacing.sp8),
                  _TipRow(text: l10n.reviewTip3),
                ],
              ),
            ),
            const SizedBox(height: KSpacing.sp8),

            // Mode selection cards
            _ModeCard(
              icon: Icons.style_outlined,
              title: l10n.reviewFlashcardMode,
              subtitle: l10n.reviewFlashcardDesc,
              onTap: () => context.push('/review/flashcard'),
              locale: locale,
            ),
            const SizedBox(height: KSpacing.sp8),
            _ModeCard(
              icon: Icons.edit_outlined,
              title: l10n.reviewFillMode,
              subtitle: l10n.reviewFillDesc,
              onTap: () => context.push('/review/fillblank'),
              locale: locale,
            ),
            const SizedBox(height: KSpacing.sp8),
            _ModeCard(
              icon: Icons.chat_bubble_outline,
              title: l10n.reviewConvMode,
              subtitle: l10n.reviewConvDesc,
              onTap: () => context.push('/review/conversation'),
              locale: locale,
            ),
            const SizedBox(height: KSpacing.sp24),
          ],
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.locale,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: KColors.neutral0,
      borderRadius: KRadius.lg,
      child: InkWell(
        onTap: onTap,
        borderRadius: KRadius.lg,
        child: Container(
          padding: const EdgeInsets.all(KSpacing.sp16),
          decoration: BoxDecoration(
            borderRadius: KRadius.lg,
            boxShadow: KElevation.shadow1,
          ),
          child: Row(
            children: [
              Container(
                width: KSpacing.sp40,
                height: KSpacing.sp40,
                decoration: BoxDecoration(
                  color: KColors.brand500.withValues(alpha: 0.12),
                  borderRadius: KRadius.md,
                ),
                child: Icon(icon, color: KColors.brand500, size: KSpacing.sp20),
              ),
              const SizedBox(width: KSpacing.sp12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: KTypography.getStyle(KTextStyle.h4, locale)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: KSpacing.sp2),
                    Text(
                      subtitle,
                      style: KTypography.getStyle(KTextStyle.caption, locale)
                          .copyWith(color: KColors.textSecondary),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: KColors.brand500, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  const _TipRow({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: CircleAvatar(
            radius: 3,
            backgroundColor: KColors.brand400,
          ),
        ),
        const SizedBox(width: KSpacing.sp8),
        Expanded(
          child: Text(
            text,
            style: KTypography.getStyle(KTextStyle.bodySmall, context
                    .findAncestorWidgetOfExactType<Localizations>() != null
                ? locale
                : const Locale('en'))
                .copyWith(color: KColors.textSecondary),
          ),
        ),
      ],
    );
  }
}
