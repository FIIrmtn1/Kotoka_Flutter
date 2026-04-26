import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/sensory_tag_bar.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/review/review_conversation_screen.dart';

// REV-03 — Fill in the Blank Screen
// Mock data tagged //MOCKDATA

const _mockSentence = 'Please send the _____ to all team members before the meeting.'; //MOCKDATA
const _mockOptions = ['agenda', 'brief', 'proposal', 'follow-up']; //MOCKDATA
const _mockCorrectIndex = 0; //MOCKDATA

class ReviewFillBlankScreen extends ConsumerStatefulWidget {
  const ReviewFillBlankScreen({super.key});

  @override
  ConsumerState<ReviewFillBlankScreen> createState() =>
      _ReviewFillBlankScreenState();
}

class _ReviewFillBlankScreenState
    extends ConsumerState<ReviewFillBlankScreen> {
  int? _selectedIndex;
  int _currentCard = 4; //MOCKDATA
  int _totalCards = 8; //MOCKDATA

  void _onTap(int index) {
    if (_selectedIndex != null) return;
    setState(() => _selectedIndex = index);
    Future.delayed(KMotion.slow, () {
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ReviewConversationScreen()),
      );
    });
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
            // Top progress bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp16, vertical: KSpacing.sp12),
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
            const SizedBox(height: KSpacing.sp32),

            // Exercise title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: Text(
                l10n.reviewFillBlankTitle,
                style: KTypography.getStyle(KTextStyle.h4, locale)
                    .copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(height: KSpacing.sp16),

            // Sentence card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(KSpacing.sp24),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: KRadius.lg,
                  boxShadow: KElevation.shadow2,
                ),
                child: Text(
                  _mockSentence, //MOCKDATA
                  style: KTypography.getStyle(KTextStyle.body, locale)
                      .copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: KSpacing.sp32),

            // Option chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
              child: Wrap(
                spacing: KSpacing.sp12,
                runSpacing: KSpacing.sp12,
                children: List.generate(
                  _mockOptions.length,
                  (i) => _OptionChip(
                    label: _mockOptions[i], //MOCKDATA
                    state: _selectedIndex == null
                        ? _ChipState.idle
                        : i == _mockCorrectIndex
                            ? _ChipState.correct
                            : i == _selectedIndex
                                ? _ChipState.wrong
                                : _ChipState.idle,
                    onTap: () => _onTap(i),
                    locale: locale,
                  ),
                ),
              ),
            ),

            const Spacer(),
            SizedBox(
                height: MediaQuery.of(context).padding.bottom + KSpacing.sp16),
          ],
        ),
      ),
    );
  }
}

enum _ChipState { idle, correct, wrong }

class _OptionChip extends StatelessWidget {
  const _OptionChip({
    required this.label,
    required this.state,
    required this.onTap,
    required this.locale,
  });

  final String label;
  final _ChipState state;
  final VoidCallback onTap;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color border;
    Color text;
    switch (state) {
      case _ChipState.correct:
        bg = KColors.success100;
        border = KColors.success500;
        text = KColors.success700;
        break;
      case _ChipState.wrong:
        bg = KColors.error100;
        border = KColors.error500;
        text = KColors.error700;
        break;
      case _ChipState.idle:
        bg = Theme.of(context).cardColor;
        border = KColors.borderDefault;
        text = Theme.of(context).colorScheme.onSurface;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: KSpacing.sp80, minHeight: KSpacing.sp48),
        padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp20,
          vertical: KSpacing.sp12,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: KRadius.full,
          border: Border.all(color: border),
        ),
        child: Text(
          label,
          style: KTypography.getStyle(KTextStyle.button, locale)
              .copyWith(color: text),
        ),
      ),
    );
  }
}
