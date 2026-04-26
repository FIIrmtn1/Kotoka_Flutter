import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// SnapResultsScreen — vocab items extracted by Gemini.
// Gemini output: bold markers parsed via _parseGeminiBold helper.
// Mock: 5 vocab items. //MOCKDATA
// =============================================================================

// ---------------------------------------------------------------------------
// Mock vocab model
// ---------------------------------------------------------------------------
class _VocabItem {
  const _VocabItem({
    required this.word,
    required this.translation,
    required this.example,
  });
  final String word;
  final String translation;
  final String example;
}

// 5 mock vocab items extracted from a café scene //MOCKDATA
const _mockItems = <_VocabItem>[
  _VocabItem(
    word: 'ร้านกาแฟ',
    translation: 'Coffee shop',
    example: '**ร้านกาแฟ**นี้เปิดตั้งแต่เช้า — This **coffee shop** opens early.', //MOCKDATA
  ),
  _VocabItem(
    word: 'ลาเต้',
    translation: 'Latte',
    example: 'ฉันสั่ง**ลาเต้**ทุกเช้า — I order a **latte** every morning.', //MOCKDATA
  ),
  _VocabItem(
    word: 'ชำระเงิน',
    translation: 'To pay',
    example: 'คุณ**ชำระเงิน**ที่เคาน์เตอร์ — You **pay** at the counter.', //MOCKDATA
  ),
  _VocabItem(
    word: 'ใบเสร็จ',
    translation: 'Receipt',
    example: 'ขอ**ใบเสร็จ**ด้วยนะ — Can I have the **receipt**?', //MOCKDATA
  ),
  _VocabItem(
    word: 'บรรยากาศ',
    translation: 'Atmosphere',
    example: '**บรรยากาศ**ที่นี่ดีมาก — The **atmosphere** here is wonderful.', //MOCKDATA
  ),
];

// ---------------------------------------------------------------------------
// Bold-text parser for Gemini output (** ... **)
// ---------------------------------------------------------------------------
List<TextSpan> _parseGeminiBold(
    String text, TextStyle baseStyle, TextStyle boldStyle) {
  final spans = <TextSpan>[];
  final regex = RegExp(r'\*\*(.*?)\*\*');
  int last = 0;
  for (final match in regex.allMatches(text)) {
    if (match.start > last) {
      spans.add(TextSpan(
          text: text.substring(last, match.start), style: baseStyle));
    }
    spans.add(TextSpan(text: match.group(1), style: boldStyle));
    last = match.end;
  }
  if (last < text.length) {
    spans.add(TextSpan(text: text.substring(last), style: baseStyle));
  }
  return spans;
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------
class SnapResultsScreen extends StatefulWidget {
  const SnapResultsScreen({super.key});

  @override
  State<SnapResultsScreen> createState() => _SnapResultsScreenState();
}

class _SnapResultsScreenState extends State<SnapResultsScreen> {
  final Set<int> _added = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final baseStyle = KTypography.getStyle(KTextStyle.bodySmall, locale)
        .copyWith(color: KColors.textSecondary);
    final boldStyle = baseStyle.copyWith(
        fontWeight: FontWeight.w700, color: KColors.neutral800);

    return KScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: KColors.neutral900),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.snapTitle,
              style: KTypography.getStyle(KTextStyle.h4, locale)
                  .copyWith(color: KColors.neutral900),
            ),
            Text(
              l10n.snapResultsWordsFound(_mockItems.length),
              style: KTypography.getStyle(KTextStyle.caption, locale)
                  .copyWith(color: KColors.brand500),
            ),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp16,
                KSpacing.sp8,
                KSpacing.sp16,
                KSpacing.sp16,
              ),
              itemCount: _mockItems.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: KSpacing.sp12),
              itemBuilder: (context, i) {
                final item = _mockItems[i];
                final isAdded = _added.contains(i);
                return KCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Target word — bold, brand400
                            Text(
                              item.word,
                              style: KTypography.getStyle(
                                      KTextStyle.targetWord, locale)
                                  .copyWith(
                                      color: KColors.brand400,
                                      fontSize: 22),
                            ),
                            const SizedBox(height: KSpacing.sp4),
                            // Translation
                            Text(
                              item.translation,
                              style: KTypography.getStyle(
                                      KTextStyle.body, locale)
                                  .copyWith(color: KColors.neutral700),
                            ),
                            const SizedBox(height: KSpacing.sp8),
                            // Example sentence — Gemini output with bold parsing
                            RichText(
                              text: TextSpan(
                                children: _parseGeminiBold(
                                    item.example, baseStyle, boldStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: KSpacing.sp8),
                      // Individual "+" add button
                      GestureDetector(
                        onTap: () =>
                            setState(() => isAdded
                                ? _added.remove(i)
                                : _added.add(i)),
                        child: AnimatedContainer(
                          duration: KMotion.fast,
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isAdded
                                ? KColors.brand500
                                : KColors.brand500.withValues(alpha: 0.12),
                            border: Border.all(
                              color: KColors.brand500.withValues(
                                  alpha: isAdded ? 1.0 : 0.4),
                            ),
                          ),
                          child: Icon(
                            isAdded ? Icons.check_rounded : Icons.add_rounded,
                            size: 18,
                            color: isAdded
                                ? KColors.neutral0
                                : KColors.brand500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Bottom CTAs
          Padding(
            padding: const EdgeInsets.fromLTRB(
              KSpacing.sp16,
              0,
              KSpacing.sp16,
              KSpacing.sp24,
            ),
            child: Column(
              children: [
                KotokaButton(
                  label: l10n.snapResultsSaveAll,
                  onPressed: () => context.go('/home'),
                ),
                const SizedBox(height: KSpacing.sp12),
                KotokaButton(
                  label: l10n.snapResultsReviewNow,
                  variant: KotokaButtonVariant.secondary,
                  onPressed: () => context.push('/review/flashcard'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
