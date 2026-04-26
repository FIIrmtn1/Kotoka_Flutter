import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/sensory_tag_bar.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/review/review_fillblank_screen.dart';

// REV-02 — Flashcard Screen
// Mock data tagged //MOCKDATA

class ReviewFlashcardScreen extends ConsumerStatefulWidget {
  const ReviewFlashcardScreen({super.key});

  @override
  ConsumerState<ReviewFlashcardScreen> createState() =>
      _ReviewFlashcardScreenState();
}

class _ReviewFlashcardScreenState
    extends ConsumerState<ReviewFlashcardScreen> {
  bool _isFlipped = false;
  int _currentCard = 3; //MOCKDATA
  int _totalCards = 8; //MOCKDATA

  void _flip() => setState(() => _isFlipped = !_isFlipped);

  void _rate(String rating) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ReviewFillBlankScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar: progress + close
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: KSpacing.sp16,
                vertical: KSpacing.sp12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.reviewProgressOf(_currentCard, _totalCards), //MOCKDATA
                      style: KTypography.getStyle(KTextStyle.h4, locale)
                          .copyWith(color: theme.colorScheme.onSurface),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: theme.colorScheme.onSurfaceVariant),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Sensory tag bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
              child: SensoryTagBar(
                tags: [
                  SensoryTags.location('Silom Office'), //MOCKDATA
                  SensoryTags.weather('22°C'), //MOCKDATA
                ],
                mode: SensoryTagBarMode.compact,
              ),
            ),
            const SizedBox(height: KSpacing.sp24),

            // Flashcard flip
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
                child: GestureDetector(
                  onTap: _flip,
                  child: AnimatedSwitcher(
                    duration: KMotion.normal,
                    transitionBuilder: (child, animation) {
                      final rotate =
                          Tween(begin: 0.0, end: 1.0).animate(animation);
                      return AnimatedBuilder(
                        animation: rotate,
                        child: child,
                        builder: (ctx, child) => Transform(
                          transform: Matrix4.rotationY(
                              (1 - rotate.value) * 3.14159),
                          alignment: Alignment.center,
                          child: child,
                        ),
                      );
                    },
                    child: _isFlipped
                        ? _CardBack(key: const ValueKey('back'), locale: locale, l10n: l10n)
                        : _CardFront(key: const ValueKey('front'), locale: locale, l10n: l10n),
                  ),
                ),
              ),
            ),

            // Rating buttons (shown after flip)
            if (_isFlipped)
              Padding(
                padding: const EdgeInsets.all(KSpacing.sp16),
                child: Row(
                  children: [
                    _RateButton(
                      emoji: '😕',
                      label: l10n.reviewRateHard,
                      color: KColors.error500,
                      onTap: () => _rate('hard'),
                    ),
                    const SizedBox(width: KSpacing.sp8),
                    _RateButton(
                      emoji: '🙂',
                      label: l10n.reviewRateOk,
                      color: KColors.warning700,
                      onTap: () => _rate('ok'),
                    ),
                    const SizedBox(width: KSpacing.sp8),
                    _RateButton(
                      emoji: '😄',
                      label: l10n.reviewRateEasy,
                      color: KColors.success500,
                      onTap: () => _rate('easy'),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(KSpacing.sp16),
                child: Text(
                  l10n.reviewTapToFlip,
                  style: KTypography.getStyle(KTextStyle.caption, locale)
                      .copyWith(color: KColors.textDisabled),
                ),
              ),

            SizedBox(
                height:
                    MediaQuery.of(context).padding.bottom + KSpacing.sp8),
          ],
        ),
      ),
    );
  }
}

class _CardFront extends StatelessWidget {
  const _CardFront({super.key, required this.locale, required this.l10n});

  final Locale locale;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: KRadius.xl,
        boxShadow: KElevation.shadow2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'STAKEHOLDER', //MOCKDATA
            style: KTypography.getStyle(KTextStyle.targetWord, locale),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSpacing.sp16),
          IconButton(
            icon: const Icon(Icons.volume_up_outlined, color: KColors.brand500),
            iconSize: KSpacing.sp32,
            onPressed: () {}, // audio placeholder
          ),
        ],
      ),
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack({super.key, required this.locale, required this.l10n});

  final Locale locale;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(KSpacing.sp24),
      decoration: BoxDecoration(
        color: isDark ? theme.cardColor : KColors.brand50,
        borderRadius: KRadius.xl,
        boxShadow: KElevation.shadow2,
        border: Border.all(color: KColors.brand500.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'STAKEHOLDER', //MOCKDATA
            style: KTypography.getStyle(KTextStyle.targetWord, locale),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSpacing.sp12),
          Text(
            'ผู้มีส่วนได้ส่วนเสีย', //MOCKDATA
            style: KTypography.getStyle(KTextStyle.h3, locale)
                .copyWith(color: KColors.brand500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSpacing.sp16),
          const Divider(color: KColors.neutral200),
          const SizedBox(height: KSpacing.sp12),
          Text(
            '"We need to inform all stakeholders before the meeting."', //MOCKDATA
            style: KTypography.getStyle(KTextStyle.bodySmall, locale)
                .copyWith(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _RateButton extends StatelessWidget {
  const _RateButton({
    required this.emoji,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String emoji;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: KSpacing.sp64,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: KRadius.md,
            border: Border.all(color: color.withOpacity(0.4)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: KSpacing.sp4),
              Text(
                label,
                style: KTypography.getStyle(KTextStyle.label, locale)
                    .copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
