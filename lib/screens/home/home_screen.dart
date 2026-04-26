import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/due_cards_provider.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/vocab_card.dart';
import 'package:kotoka_app/core/widgets/sensory_tag_bar.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/router/app_router.dart';

// =============================================================================
// HomeScreen — HOM-01
// - No missions section
// - Header: greeting + KokoAnimation(idle) on right
// - Streak badge (brand400 accent)
// - Review CTA when dueCount > 0
// - Recent Vocab section with 5 VocabCards (mock)
// - CustomScrollView / SliverList
// =============================================================================

class _VocabItem {
  const _VocabItem({
    required this.word,
    required this.romanization,
    required this.translation,
    required this.tags,
    this.exampleSentence,
  });

  final String word;
  final String romanization;
  final String translation;
  final List<SensoryTag> tags;
  final String? exampleSentence;
}

// Mock vocab data — replace with Firestore query in production.
final _mockVocab = <_VocabItem>[
  _VocabItem( //MOCKDATA
    word: 'สวัสดี',
    romanization: 'sà-wàt-dii',
    translation: 'Hello / Good day',
    exampleSentence: 'สวัสดีครับ ยินดีที่ได้รู้จัก',
    tags: [SensoryTags.mood('Joy'), SensoryTags.location('Office')],
  ),
  _VocabItem( //MOCKDATA
    word: 'ขอบคุณ',
    romanization: 'khàawp-khun',
    translation: 'Thank you',
    exampleSentence: 'ขอบคุณมากครับ',
    tags: [SensoryTags.mood('Calm'), SensoryTags.time('Anytime')],
  ),
  _VocabItem( //MOCKDATA
    word: 'อร่อย',
    romanization: 'à-ròi',
    translation: 'Delicious',
    exampleSentence: 'อาหารนี้อร่อยมาก',
    tags: [SensoryTags.mood('Joy'), SensoryTags.sound('Café')],
  ),
  _VocabItem( //MOCKDATA
    word: 'เดินทาง',
    romanization: 'dern-taang',
    translation: 'To travel',
    exampleSentence: 'ฉันชอบเดินทางไปต่างจังหวัด',
    tags: [SensoryTags.energy('High'), SensoryTags.location('Airport')],
  ),
  _VocabItem( //MOCKDATA
    word: 'ตลาด',
    romanization: 'tà-làat',
    translation: 'Market / Bazaar',
    exampleSentence: 'ไปซื้อของที่ตลาดนัด',
    tags: [SensoryTags.sound('Busy'), SensoryTags.weather('Sunny')],
  ),
];

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String _greeting(AppLocalizations l10n) {
    final hour = DateTime.now().hour;
    const name = 'Nadia'; //MOCKDATA
    if (hour < 12) return l10n.homeGreetingMorning(name);
    if (hour < 17) return l10n.homeGreetingAfternoon(name);
    return l10n.homeGreetingEvening(name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final dueCount = ref.watch(dueCardsCountProvider);

    return Scaffold(
      backgroundColor: KColors.brand50,
      body: CustomScrollView(
        slivers: [
          // ----------------------------------------------------------------
          // Header: greeting text + KokoAnimation on right
          // ----------------------------------------------------------------
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  KSpacing.sp24,
                  KSpacing.sp16,
                  KSpacing.sp16,
                  KSpacing.sp8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: KSpacing.sp8),
                          Text(
                            _greeting(l10n),
                            style: KTypography.getStyle(KTextStyle.h2, locale),
                          ),
                          const SizedBox(height: KSpacing.sp4),
                          Text(
                            l10n.homeSubtitle,
                            style: KTypography.getStyle(
                              KTextStyle.bodySmall,
                              locale,
                            ).copyWith(color: KColors.brand600),
                          ),
                          const SizedBox(height: KSpacing.sp12),
                          // Streak badge — brand400 accent
                          _StreakBadge(
                            streakDays: 7, //MOCKDATA
                            l10n: l10n,
                            locale: locale,
                          ),
                        ],
                      ),
                    ),
                    KokoAnimation(
                      state: KokoState.idle,
                      size: 96,
                      semanticsLabel: l10n.kokoMascotSemantics,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ----------------------------------------------------------------
          // Review CTA — only when cards are due (full-width brand500 style)
          // ----------------------------------------------------------------
          if (dueCount > 0)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp24,
                  vertical: KSpacing.sp8,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KColors.brand500,
                    borderRadius: KRadius.lg,
                    boxShadow: KElevation.shadow2,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: KRadius.lg,
                      onTap: () => context.go(AppRoutes.review),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: KSpacing.sp24,
                          vertical: KSpacing.sp16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.auto_stories_outlined,
                              color: KColors.neutral0,
                              size: KSpacing.sp20,
                            ),
                            const SizedBox(width: KSpacing.sp8),
                            Text(
                              '${l10n.homeStartReview} ($dueCount)',
                              style: KTypography.getStyle(
                                KTextStyle.button,
                                locale,
                              ).copyWith(
                                color: KColors.neutral0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // ----------------------------------------------------------------
          // Recent Vocab section header — h3 size for prominence
          // ----------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp24,
                KSpacing.sp24,
                KSpacing.sp24,
                KSpacing.sp12,
              ),
              child: Text(
                l10n.homeRecentWords,
                style: KTypography.getStyle(KTextStyle.h3, locale)
                    .copyWith(color: KColors.brand600),
              ),
            ),
          ),

          // ----------------------------------------------------------------
          // Vocab cards — 24px gap between sections
          // ----------------------------------------------------------------
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              KSpacing.sp24,
              0,
              KSpacing.sp24,
              KSpacing.sp40,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = _mockVocab[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index < _mockVocab.length - 1
                          ? KSpacing.sp24
                          : 0,
                    ),
                    child: VocabCard(
                      word: item.word,
                      romanization: item.romanization,
                      translation: item.translation,
                      sensoryTags: item.tags,
                      exampleSentence: item.exampleSentence,
                    ),
                  );
                },
                childCount: _mockVocab.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _StreakBadge — brand400 accent pill
// ---------------------------------------------------------------------------
class _StreakBadge extends StatelessWidget {
  const _StreakBadge({
    required this.streakDays,
    required this.l10n,
    required this.locale,
  });

  final int streakDays;
  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp12,
        vertical: KSpacing.sp4,
      ),
      decoration: BoxDecoration(
        color: KColors.brand400.withValues(alpha: 0.15),
        borderRadius: KRadius.full,
        border: Border.all(
          color: KColors.brand400.withValues(alpha: 0.40),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_fire_department,
            size: KSpacing.sp16,
            color: KColors.brand400,
          ),
          const SizedBox(width: KSpacing.sp4),
          Text(
            l10n.homeStreakDays(streakDays),
            style: KTypography.getStyle(KTextStyle.label, locale)
                .copyWith(color: KColors.brand600),
          ),
        ],
      ),
    );
  }
}
