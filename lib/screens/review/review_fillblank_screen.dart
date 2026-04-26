import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/kotoka_text_field.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ReviewFillBlankScreen — fill-in-the-blank exercise.
// Green flash on correct. Red flash on wrong + show answer.
// "Hint" ghost button reveals first letter.
// =============================================================================

// Mock fill-in-the-blank items //MOCKDATA
class _FillItem {
  const _FillItem(
      {required this.sentence, required this.blank, required this.answer});
  final String sentence;
  final String blank;
  final String answer;
}

const _mockFillItems = <_FillItem>[
  _FillItem(
    sentence: 'เราไปนั่ง ____ ด้วยกันไหม?',
    blank: '____',
    answer: 'ร้านกาแฟ',
  ), //MOCKDATA
  _FillItem(
    sentence: 'คุณ ____ ที่เคาน์เตอร์',
    blank: '____',
    answer: 'ชำระเงิน',
  ), //MOCKDATA
  _FillItem(
    sentence: '____ ที่นี่ดีมาก',
    blank: '____',
    answer: 'บรรยากาศ',
  ), //MOCKDATA
]; //MOCKDATA

enum _FeedbackState { none, correct, wrong }

class ReviewFillBlankScreen extends StatefulWidget {
  const ReviewFillBlankScreen({super.key});

  @override
  State<ReviewFillBlankScreen> createState() =>
      _ReviewFillBlankScreenState();
}

class _ReviewFillBlankScreenState extends State<ReviewFillBlankScreen> {
  int _index = 0;
  final _controller = TextEditingController();
  _FeedbackState _feedback = _FeedbackState.none;
  bool _showAnswer = false;
  bool _hintUsed = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _FillItem get _current => _mockFillItems[_index];

  void _onCheck() {
    final answer = _controller.text.trim();
    if (answer.isEmpty) return;
    final correct =
        answer.toLowerCase() == _current.answer.toLowerCase();
    setState(() {
      _feedback = correct ? _FeedbackState.correct : _FeedbackState.wrong;
      if (!correct) _showAnswer = true;
    });
    if (correct) {
      Future.delayed(const Duration(milliseconds: 800), _nextCard);
    }
  }

  void _onHint() {
    if (_hintUsed) return;
    setState(() {
      _hintUsed = true;
      _controller.text = _current.answer.substring(0, 1);
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    });
  }

  void _nextCard() {
    final next = _index + 1;
    if (!mounted) return;
    if (next >= _mockFillItems.length) {
      context.pushReplacement('/review/complete');
    } else {
      setState(() {
        _index = next;
        _feedback = _FeedbackState.none;
        _showAnswer = false;
        _hintUsed = false;
        _controller.clear();
      });
    }
  }

  Color get _feedbackBg {
    switch (_feedback) {
      case _FeedbackState.correct:
        return KColors.success100;
      case _FeedbackState.wrong:
        return KColors.error100;
      case _FeedbackState.none:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: KColors.neutral700),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.reviewFillBlankTitle,
          style: KTypography.getStyle(KTextStyle.h4, locale)
              .copyWith(color: KColors.neutral900),
        ),
        centerTitle: true,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp24, vertical: KSpacing.sp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress
            Text(
              '${_index + 1} / ${_mockFillItems.length}',
              style: KTypography.getStyle(KTextStyle.label, locale)
                  .copyWith(color: KColors.textSecondary),
            ),
            const SizedBox(height: KSpacing.sp24),
            // Sentence card with feedback flash
            AnimatedContainer(
              duration: KMotion.normal,
              width: double.infinity,
              padding: const EdgeInsets.all(KSpacing.sp24),
              decoration: BoxDecoration(
                color: _feedbackBg == Colors.transparent
                    ? KColors.neutral0
                    : _feedbackBg,
                borderRadius: KRadius.lg,
                border: Border.all(
                  color: _feedback == _FeedbackState.correct
                      ? KColors.success500
                      : _feedback == _FeedbackState.wrong
                          ? KColors.error500
                          : KColors.neutral200,
                  width: 1.5,
                ),
                boxShadow: KElevation.shadow1,
              ),
              child: Text(
                _current.sentence,
                style: KTypography.getStyle(KTextStyle.h3, locale)
                    .copyWith(color: KColors.neutral900),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: KSpacing.sp32),
            // Answer field
            KotokaTextField(
              controller: _controller,
              hintText: l10n.reviewFillBlankHint,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _onCheck(),
              enabled: _feedback != _FeedbackState.correct,
            ),
            // Show answer on wrong
            if (_showAnswer) ...[
              const SizedBox(height: KSpacing.sp8),
              Row(children: [
                const Icon(Icons.info_outline_rounded,
                    size: 14, color: KColors.error500),
                const SizedBox(width: KSpacing.sp4),
                Text(
                  '${l10n.reviewFillBlankAnswer}: ${_current.answer}',
                  style: KTypography.getStyle(KTextStyle.bodySmall, locale)
                      .copyWith(color: KColors.error500),
                ),
              ]),
            ],
            const SizedBox(height: KSpacing.sp24),
            Row(
              children: [
                // Hint ghost button
                Expanded(
                  child: KotokaButton(
                    label: l10n.reviewFillBlankHintBtn,
                    variant: KotokaButtonVariant.ghost,
                    onPressed: _hintUsed ? null : _onHint,
                    leadingIcon: Icons.lightbulb_outline_rounded,
                  ),
                ),
                const SizedBox(width: KSpacing.sp12),
                // Check button
                Expanded(
                  child: _showAnswer
                      ? KotokaButton(
                          label: l10n.reviewFillBlankNext,
                          onPressed: _nextCard,
                        )
                      : KotokaButton(
                          label: l10n.reviewFillBlankCheck,
                          onPressed: _onCheck,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
