import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/sensory_tag_bar.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/review/review_fillblank_screen.dart';

// REV-02 — Flashcard Screen (STITCH redesign)
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
  // ignore: prefer_final_fields
  int _currentCard = 3;  //MOCKDATA
  // ignore: prefer_final_fields
  int _totalCards  = 8;  //MOCKDATA

  void _flip() => setState(() => _isFlipped = !_isFlipped);

  void _rate(String rating) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ReviewFillBlankScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final pct    = _currentCard / _totalCards;

    return KStitchScaffold(
      body: Column(
        children: [
          // ── Header: progress bar + card count + timer ────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(
                KSpacing.sp16, KSpacing.sp12, KSpacing.sp16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.reviewProgressOf(_currentCard, _totalCards), //MOCKDATA
                        style: const TextStyle(
                          fontFamily: 'IBMPlexSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: KColors.neutral900,
                        ),
                      ),
                    ),
                    // Timer chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: KSpacing.sp12, vertical: KSpacing.sp4),
                      decoration: BoxDecoration(
                        color: KColors.neutral100,
                        borderRadius: BorderRadius.circular(KRadius.radiusMd),
                        border: Border.all(color: KColors.brand400.withValues(alpha: 0.20)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.timer_outlined,
                              size: 14, color: KColors.neutral500),
                          SizedBox(width: 4),
                          Text(
                            '12m', //MOCKDATA
                            style: TextStyle(
                              fontFamily: 'IBMPlexSans',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: KColors.neutral500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: KSpacing.sp8),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.close,
                          color: KColors.neutral500, size: 22),
                    ),
                  ],
                ),
                const SizedBox(height: KSpacing.sp8),
                // Progress bar
                Stack(
                  children: [
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: KColors.neutral200,
                        borderRadius: BorderRadius.circular(KRadius.radiusFull),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: pct,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: KColors.brand400,
                          borderRadius:
                              BorderRadius.circular(KRadius.radiusFull),
                          boxShadow: [
                            BoxShadow(
                              color: KColors.brand400.withValues(alpha: 0.50),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: KSpacing.sp4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Card $_currentCard of $_totalCards', //MOCKDATA
                      style: const TextStyle(
                        fontFamily: 'IBMPlexSans',
                        fontSize: 12,
                        color: KColors.neutral500,
                      ),
                    ),
                    Text(
                      '${(pct * 100).toInt()}%',
                      style: const TextStyle(
                        fontFamily: 'IBMPlexSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: KColors.brand400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: KSpacing.sp8),

          // ── Sensory tag bar ───────────────────────────────────────────────
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
            child: SensoryTagBar(
              tags: [
                SensoryTags.location('Silom Office'), //MOCKDATA
                SensoryTags.weather('22°C'),          //MOCKDATA
              ],
              mode: SensoryTagBarMode.compact,
            ),
          ),
          const SizedBox(height: KSpacing.sp16),

          // ── Flashcard ─────────────────────────────────────────────────────
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
                      ? _CardBack(
                          key: const ValueKey('back'),
                          locale: locale,
                          l10n: l10n)
                      : _CardFront(
                          key: const ValueKey('front'),
                          locale: locale,
                          l10n: l10n),
                ),
              ),
            ),
          ),

          const SizedBox(height: KSpacing.sp16),

          // ── Rating buttons / tap hint ─────────────────────────────────────
          if (_isFlipped)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  KSpacing.sp16, 0, KSpacing.sp16, 0),
              child: Row(
                children: [
                  _AnkiButton(
                    emoji: '😵',
                    label: l10n.reviewRateAgain,
                    interval: '1m',
                    color: KColors.error500,
                    onTap: () => _rate('again'),
                  ),
                  const SizedBox(width: KSpacing.sp8),
                  _AnkiButton(
                    emoji: '😕',
                    label: l10n.reviewRateHard,
                    interval: '2d',
                    color: KColors.warning700,
                    onTap: () => _rate('hard'),
                  ),
                  const SizedBox(width: KSpacing.sp8),
                  _AnkiButton(
                    emoji: '🙂',
                    label: l10n.reviewRateGood,
                    interval: '4d',
                    color: KColors.success500,
                    onTap: () => _rate('good'),
                  ),
                  const SizedBox(width: KSpacing.sp8),
                  _AnkiButton(
                    emoji: '😄',
                    label: l10n.reviewRateEasy,
                    interval: '7d',
                    color: KColors.brand500,
                    onTap: () => _rate('easy'),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: KSpacing.sp12),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: KColors.brand400.withValues(alpha: 0.30),
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(KRadius.radiusMd),
                ),
                child: Text(
                  l10n.reviewTapToFlip,
                  style: const TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 13,
                    color: KColors.brand400,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

          SizedBox(
              height: MediaQuery.of(context).padding.bottom + KSpacing.sp16),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _CardFront — question face with koko-thinking overlay
// ---------------------------------------------------------------------------
class _CardFront extends StatelessWidget {
  const _CardFront({super.key, required this.locale, required this.l10n});
  final Locale locale;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: KCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Part-of-speech badge
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: KSpacing.sp12, vertical: KSpacing.sp4),
                  decoration: BoxDecoration(
                    color: KColors.sky100,
                    borderRadius: BorderRadius.circular(KRadius.radiusFull),
                  ),
                  child: const Text(
                    'NOUN', //MOCKDATA
                    style: TextStyle(
                      fontFamily: 'IBMPlexSans',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: KColors.neutral700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: KSpacing.sp24),
                Text(
                  'STAKEHOLDER', //MOCKDATA
                  style: KTypography.getStyle(KTextStyle.targetWord, locale),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: KSpacing.sp8),
                const Text(
                  'steɪk·hoʊl·dər', //MOCKDATA
                  style: TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 14,
                    color: KColors.neutral500,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: KSpacing.sp20),
                IconButton(
                  icon: const Icon(Icons.volume_up_outlined,
                      color: KColors.brand500),
                  iconSize: KSpacing.sp32,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        // Koko thinking — top-left overlay
        const Positioned(
          top: KSpacing.sp12,
          left: KSpacing.sp12,
          child: KokoAnimation(state: KokoState.thinking, size: 48),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// _CardBack — answer face
// ---------------------------------------------------------------------------
class _CardBack extends StatelessWidget {
  const _CardBack({super.key, required this.locale, required this.l10n});
  final Locale locale;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: KSelectedCard(
        padding: const EdgeInsets.all(KSpacing.sp24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _AnkiButton — 4-option SRS rating with interval label
// ---------------------------------------------------------------------------
class _AnkiButton extends StatefulWidget {
  const _AnkiButton({
    required this.emoji,
    required this.label,
    required this.interval,
    required this.color,
    required this.onTap,
  });
  final String emoji;
  final String label;
  final String interval;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_AnkiButton> createState() => _AnkiButtonState();
}

class _AnkiButtonState extends State<_AnkiButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.95 : 1.0,
          duration: KMotion.fast,
          child: Container(
            height: 68,
            decoration: BoxDecoration(
              color: widget.color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(KRadius.radiusMd),
              border: Border.all(
                  color: widget.color.withValues(alpha: 0.40)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.emoji,
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 2),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: widget.color,
                  ),
                ),
                Text(
                  widget.interval,
                  style: const TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 10,
                    color: KColors.neutral400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
