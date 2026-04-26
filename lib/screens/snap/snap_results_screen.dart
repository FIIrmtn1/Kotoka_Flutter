import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_cta_button.dart';
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

    return KStitchScaffold(
      body: Column(
        children: [
          // Header bar
          _ResultsHeader(
            title: l10n.snapResultsWordsFound(12), //MOCKDATA
            onBack: () => Navigator.of(context).pop(),
          ),
          // Body
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
              child: Column(
                children: [
                  const SizedBox(height: KSpacing.sp8),
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
                            padding:
                                const EdgeInsets.only(bottom: KSpacing.sp12),
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
                                color: KColors.neutral0,
                                borderRadius: KRadius.lg,
                                border: Border.all(
                                    color: KColors.brand400
                                        .withValues(alpha: 0.20)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.expand_more,
                                      color: KColors.brand400),
                                  const SizedBox(width: KSpacing.sp8),
                                  Text(
                                    l10n.snapResultsMoreWords(
                                        _mockHiddenCount), //MOCKDATA
                                    style: KTypography.getStyle(
                                            KTextStyle.button, locale)
                                        .copyWith(color: KColors.brand400),
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
                      bottom: MediaQuery.of(context).padding.bottom +
                          KSpacing.sp16,
                    ),
                    child: Column(
                      children: [
                        KCtaButton(
                          label: l10n.snapResultsSaveAll,
                          onPressed: () {},
                        ),
                        const SizedBox(height: KSpacing.sp12),
                        KGhostButton(
                          label: l10n.snapResultsReviewNow,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const ReviewScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultsHeader extends StatelessWidget {
  const _ResultsHeader({required this.title, required this.onBack});

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.pageBg,
      padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp4, vertical: KSpacing.sp4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: KColors.neutral900),
            onPressed: onBack,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: KColors.brand400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: KSpacing.sp16),
            child: Icon(Icons.check_circle_outline, color: KColors.success500),
          ),
        ],
      ),
    );
  }
}
