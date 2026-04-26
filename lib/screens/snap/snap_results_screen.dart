import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/sensory_tag_bar.dart';
import 'package:kotoka_app/core/widgets/vocab_card.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/review/review_screen.dart';

// SNA-05 — Snap Results Screen
// Mock data tagged //MOCKDATA

const _mockVisibleWords = [ //MOCKDATA
  _MockWord('STAKEHOLDER', 'ผู้มีส่วนได้ส่วนเสีย', 'stakeholder'), //MOCKDATA
  _MockWord('DEADLINE', 'กำหนดเวลา', 'deadline'), //MOCKDATA
  _MockWord('PROPOSAL', 'ข้อเสนอ', 'proposal'), //MOCKDATA
]; //MOCKDATA

const int _mockHiddenCount = 9; //MOCKDATA

class _MockWord {
  const _MockWord(this.word, this.translation, this.romanization);
  final String word;
  final String translation;
  final String romanization;
}

class SnapResultsScreen extends ConsumerStatefulWidget {
  const SnapResultsScreen({super.key});

  @override
  ConsumerState<SnapResultsScreen> createState() => _SnapResultsScreenState();
}

class _SnapResultsScreenState extends ConsumerState<SnapResultsScreen> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: KElevation.elevation0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.snapResultsWordsFound(12), //MOCKDATA
              style: KTypography.getStyle(KTextStyle.h4, locale)
                  .copyWith(color: theme.colorScheme.onSurface),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: KSpacing.sp16),
            child: Icon(Icons.check_circle_outline, color: KColors.success500),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
          child: Column(
            children: [
              const SizedBox(height: KSpacing.sp8),
              // Sensory tag bar
              SensoryTagBar(
                tags: [
                  SensoryTags.location('Silom Office'), //MOCKDATA
                  SensoryTags.weather('22°C'), //MOCKDATA
                  SensoryTags.mood('6/10'), //MOCKDATA
                ],
                mode: SensoryTagBarMode.compact,
              ),
              const SizedBox(height: KSpacing.sp16),

              // Word list
              Expanded(
                child: ListView(
                  children: [
                    ..._mockVisibleWords.map(
                      (w) => Padding(
                        padding: const EdgeInsets.only(bottom: KSpacing.sp12),
                        child: VocabCard(
                          word: w.word,
                          romanization: w.romanization,
                          translation: w.translation,
                          sensoryTags: [
                            SensoryTags.location('Silom Office'), //MOCKDATA
                          ],
                        ),
                      ),
                    ),

                    // Expandable "more" row
                    if (!_expanded)
                      GestureDetector(
                        onTap: () => setState(() => _expanded = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: KSpacing.sp12,
                            horizontal: KSpacing.sp16,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: KRadius.md,
                            border: Border.all(color: KColors.borderDefault),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.expand_more,
                                  color: KColors.brand500),
                              const SizedBox(width: KSpacing.sp8),
                              Text(
                                l10n.snapResultsMoreWords(_mockHiddenCount), //MOCKDATA
                                style: KTypography.getStyle(
                                        KTextStyle.button, locale)
                                    .copyWith(color: KColors.brand500),
                              ),
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(height: KSpacing.sp16),
                  ],
                ),
              ),

              // CTAs
              Padding(
                padding: EdgeInsets.only(
                  bottom:
                      MediaQuery.of(context).padding.bottom + KSpacing.sp16,
                ),
                child: Column(
                  children: [
                    KotokaButton(
                      label: l10n.snapResultsSaveAll,
                      onPressed: () {},
                      variant: KotokaButtonVariant.primary,
                    ),
                    const SizedBox(height: KSpacing.sp12),
                    KotokaButton(
                      label: l10n.snapResultsReviewNow,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const ReviewScreen()),
                        );
                      },
                      variant: KotokaButtonVariant.secondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
