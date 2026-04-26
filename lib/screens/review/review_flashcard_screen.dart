import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/koko_emoji.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ReviewFlashcardScreen — REV-02 flip-card SRS rating.
// Flip: GestureDetector + AnimationController, 150ms, ease-out.
// Front: target word (large, bold, brand400).
// Back: translation + example.
// After flip: 4 SRS rating buttons.
// =============================================================================

// Mock flashcard data //MOCKDATA
class _FlashCard {
  const _FlashCard(
      {required this.word,
      required this.romanization,
      required this.translation,
      required this.example});
  final String word;
  final String romanization;
  final String translation;
  final String example;
}

const _mockDeck = <_FlashCard>[
  _FlashCard(
    word: 'ร้านกาแฟ',
    romanization: 'ráan gaa-fae',
    translation: 'Coffee shop',
    example: 'เราไปนั่ง**ร้านกาแฟ**ด้วยกันไหม?', //MOCKDATA
  ),
  _FlashCard(
    word: 'บรรยากาศ',
    romanization: 'ban-yaa-gàat',
    translation: 'Atmosphere',
    example: '**บรรยากาศ**ที่นี่ดีมาก', //MOCKDATA
  ),
  _FlashCard(
    word: 'ชำระเงิน',
    romanization: 'cham-rá ngoen',
    translation: 'To pay',
    example: 'คุณ**ชำระเงิน**ที่เคาน์เตอร์', //MOCKDATA
  ),
]; //MOCKDATA

// SRS rating definition
class _SrsRating {
  const _SrsRating({
    required this.emoji,
    required this.labelKey,
    required this.bg,
    required this.border,
  });
  final String emoji;
  final String Function(AppLocalizations) labelKey;
  final Color bg;
  final Color border;
}

final _ratings = <_SrsRating>[
  _SrsRating(
    emoji: '😵',
    labelKey: (l) => l.reviewRateAgain,
    bg: KColors.error500.withValues(alpha: 0.15),
    border: KColors.error500,
  ),
  _SrsRating(
    emoji: '😕',
    labelKey: (l) => l.reviewRateHard,
    bg: KColors.warning500.withValues(alpha: 0.30),
    border: KColors.warning500,
  ),
  _SrsRating(
    emoji: '🙂',
    labelKey: (l) => l.reviewRateGood,
    bg: KColors.sky300.withValues(alpha: 0.20),
    border: KColors.sky300,
  ),
  _SrsRating(
    emoji: '😄',
    labelKey: (l) => l.reviewRateEasy,
    bg: KColors.brand400.withValues(alpha: 0.15),
    border: KColors.brand400,
  ),
];

class ReviewFlashcardScreen extends StatefulWidget {
  const ReviewFlashcardScreen({super.key});

  @override
  State<ReviewFlashcardScreen> createState() => _ReviewFlashcardScreenState();
}

class _ReviewFlashcardScreenState extends State<ReviewFlashcardScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _flipCtrl;
  late final Animation<double> _flipAnim;
  bool _isFlipped = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _flipCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150), // 150 ms as specified
    );
    _flipAnim = Tween<double>(begin: 0, end: math.pi)
        .animate(CurvedAnimation(parent: _flipCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _flipCtrl.dispose();
    super.dispose();
  }

  void _onTapCard() {
    if (_isFlipped) return;
    setState(() => _isFlipped = true);
    _flipCtrl.forward();
  }

  void _onRate(int ratingIndex) {
    // Navigate to next card or complete screen
    final nextIndex = _currentIndex + 1;
    if (nextIndex >= _mockDeck.length) {
      context.pushReplacement('/review/complete');
    } else {
      setState(() {
        _currentIndex = nextIndex;
        _isFlipped = false;
      });
      _flipCtrl.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final card = _mockDeck[_currentIndex];

    return KScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: KColors.neutral700),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.reviewProgressOf(_currentIndex + 1, _mockDeck.length),
          style: KTypography.getStyle(KTextStyle.label, locale)
              .copyWith(color: KColors.textSecondary),
        ),
        centerTitle: true,
        actions: [
          // Progress indicator
          Padding(
            padding:
                const EdgeInsets.only(right: KSpacing.sp16, top: KSpacing.sp8),
            child: _ProgressBar(
              current: _currentIndex + 1,
              total: _mockDeck.length,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
        child: Column(
          children: [
            const SizedBox(height: KSpacing.sp16),
            // Flip card
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: _onTapCard,
                child: AnimatedBuilder(
                  animation: _flipAnim,
                  builder: (context, _) {
                    final angle = _flipAnim.value;
                    final showBack = angle > math.pi / 2;
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      child: showBack
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(math.pi),
                              child: _CardBack(card: card, locale: locale),
                            )
                          : _CardFront(
                              card: card,
                              locale: locale,
                              hint: l10n.reviewTapToFlip,
                            ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: KSpacing.sp24),
            // SRS rating buttons — only after flip
            AnimatedOpacity(
              opacity: _isFlipped ? 1.0 : 0.0,
              duration: KMotion.normal,
              child: IgnorePointer(
                ignoring: !_isFlipped,
                child: Column(
                  children: [
                    Row(
                      children: List.generate(_ratings.length, (i) {
                        final r = _ratings[i];
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: i == 0 ? 0 : KSpacing.sp4,
                                right: i == _ratings.length - 1
                                    ? 0
                                    : KSpacing.sp4),
                            child: _RatingButton(
                              emoji: r.emoji,
                              label: r.labelKey(l10n),
                              bg: r.bg,
                              border: r.border,
                              onTap: () => _onRate(i),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: KSpacing.sp32),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _CardFront extends StatelessWidget {
  const _CardFront(
      {required this.card, required this.locale, required this.hint});
  final _FlashCard card;
  final Locale locale;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.xl,
        border: Border.all(
            color: KColors.brand400.withValues(alpha: 0.40), width: 1.5),
        boxShadow: KElevation.shadow2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            card.word,
            style: KTypography.getStyle(KTextStyle.targetWord, locale).copyWith(
              color: KColors.brand400,
              fontSize: KFontSize.flashcardWord,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSpacing.sp8),
          Text(
            card.romanization,
            style: KTypography.getStyle(KTextStyle.romanization, locale),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSpacing.sp32),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.touch_app_rounded,
                size: 14, color: KColors.neutral400),
            const SizedBox(width: KSpacing.sp4),
            Text(hint,
                style: const TextStyle(
                    fontSize: KFontSize.caption, color: KColors.neutral400,
                    letterSpacing: 0.3)),
          ]),
        ],
      ),
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack({required this.card, required this.locale});
  final _FlashCard card;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final baseStyle = KTypography.getStyle(KTextStyle.body, locale)
        .copyWith(color: KColors.textSecondary, fontStyle: FontStyle.italic);
    final boldStyle = baseStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: KColors.neutral800);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: KColors.brand500.withValues(alpha: 0.04),
        borderRadius: KRadius.xl,
        border: Border.all(color: KColors.brand500.withValues(alpha: 0.50),
            width: 1.5),
        boxShadow: KElevation.shadow2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(KSpacing.sp32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              card.translation,
              style: KTypography.getStyle(KTextStyle.h2, locale)
                  .copyWith(color: KColors.brand500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp24),
            const Divider(color: KColors.neutral200, height: 1),
            const SizedBox(height: KSpacing.sp24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: _parseBold(card.example, baseStyle, boldStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _parseBold(
      String text, TextStyle base, TextStyle bold) {
    final spans = <TextSpan>[];
    final re = RegExp(r'\*\*(.*?)\*\*');
    int last = 0;
    for (final m in re.allMatches(text)) {
      if (m.start > last) {
        spans.add(TextSpan(text: text.substring(last, m.start), style: base));
      }
      spans.add(TextSpan(text: m.group(1), style: bold));
      last = m.end;
    }
    if (last < text.length) {
      spans.add(TextSpan(text: text.substring(last), style: base));
    }
    return spans;
  }
}

class _RatingButton extends StatelessWidget {
  const _RatingButton({
    required this.emoji,
    required this.label,
    required this.bg,
    required this.border,
    required this.onTap,
  });
  final String emoji;
  final String label;
  final Color bg;
  final Color border;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: KSpacing.sp12, horizontal: KSpacing.sp4),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: KRadius.md,
          border: Border.all(color: border, width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            KokoEmoji(emoji: emoji, size: 22),
            const SizedBox(height: KSpacing.sp4),
            Text(
              label,
              style: const TextStyle(
                  fontSize: KFontSize.micro,
                  fontWeight: FontWeight.w600,
                  color: KColors.neutral700),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.current, required this.total});
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final frac = total == 0 ? 0.0 : current / total;
    return SizedBox(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: KRadius.full,
            child: LinearProgressIndicator(
              value: frac,
              backgroundColor: KColors.neutral200,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(KColors.brand500),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
