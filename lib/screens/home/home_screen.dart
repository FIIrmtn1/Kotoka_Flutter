// HOM-01 — Home screen redesign.
// Layout: mascot → greeting → snap CTA → stats → streak banner
//         → recent decks → weekly story → forgetting curve

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/due_cards_provider.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/router/app_router.dart';

// ---------------------------------------------------------------------------
// Mock data
// ---------------------------------------------------------------------------
class _Deck {
  const _Deck({required this.title, required this.wordCount, required this.date});
  final String title;
  final int wordCount;
  final String date;
}

const _wordsLearned = 0; //MOCKDATA
const _streakDays = 3; //MOCKDATA

List<_Deck> _getDecks(AppLocalizations l10n) => [
  _Deck(title: l10n.homeMockDeck1, wordCount: 7, date: '3/29/2026'), //MOCKDATA
  _Deck(title: l10n.homeMockDeck2, wordCount: 7, date: '3/29/2026'), //MOCKDATA
];

// ---------------------------------------------------------------------------
// HomeScreen
// ---------------------------------------------------------------------------
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
    final mockDecks = _getDecks(l10n);

    return Scaffold(
      backgroundColor: KColors.neutral0,
      body: CustomScrollView(
        slivers: [
          // ------------------------------------------------------------------
          // Mascot + greeting
          // ------------------------------------------------------------------
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    KSpacing.sp24, KSpacing.sp24, KSpacing.sp24, 0),
                child: Column(
                  children: [
                    KokoAnimation(
                      state: KokoState.idle,
                      size: 120,
                      semanticsLabel: l10n.kokoMascotSemantics,
                    ),
                    const SizedBox(height: KSpacing.sp12),
                    Text(
                      _greeting(l10n),
                      textAlign: TextAlign.center,
                      style: KTypography.getStyle(KTextStyle.h2, locale),
                    ),
                    const SizedBox(height: KSpacing.sp4),
                    Text(
                      l10n.homeSubtitle,
                      textAlign: TextAlign.center,
                      style: KTypography.getStyle(KTextStyle.body, locale)
                          .copyWith(color: KColors.brand600),
                    ),
                    const SizedBox(height: KSpacing.sp24),
                  ],
                ),
              ),
            ),
          ),

          // ------------------------------------------------------------------
          // Snap & Learn CTA
          // ------------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: Material(
                color: KColors.brand500,
                borderRadius: KRadius.xl,
                child: InkWell(
                  borderRadius: KRadius.xl,
                  onTap: () => context.go(AppRoutes.snap),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: KSpacing.sp16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt_outlined,
                            color: KColors.neutral0, size: 22),
                        const SizedBox(width: KSpacing.sp8),
                        Text(
                          '${l10n.homeSnapLearnBtn} ✨',
                          style: KTypography.getStyle(
                                  KTextStyle.button, locale)
                              .copyWith(
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
          const SliverToBoxAdapter(
              child: SizedBox(height: KSpacing.sp16)),

          // ------------------------------------------------------------------
          // Stats row: words learned + streak
          // ------------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.menu_book_rounded,
                      value: '$_wordsLearned',
                      label: l10n.homeWordsLearned,
                      locale: locale,
                    ),
                  ),
                  const SizedBox(width: KSpacing.sp12),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.local_fire_department,
                      value: '$_streakDays',
                      label: l10n.homeDaysStreak,
                      locale: locale,
                      accent: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: KSpacing.sp12)),

          // ------------------------------------------------------------------
          // Streak unlock banner
          // ------------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: _BannerCard(
                icon: Icons.local_fire_department,
                iconColor: KColors.brand400,
                title: l10n.homeAchievementBanner('$_streakDays ${l10n.homeDaysStreak}'),
                subtitle: l10n.homeAchievementCta,
                onTap: () {},
                locale: locale,
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: KSpacing.sp24)),

          // ------------------------------------------------------------------
          // Recent Decks header
          // ------------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp24),
              child: Text(
                l10n.homeRecentDecks,
                style: KTypography.getStyle(KTextStyle.h3, locale)
                    .copyWith(color: KColors.neutral900),
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: KSpacing.sp12)),

          // ------------------------------------------------------------------
          // Deck list
          // ------------------------------------------------------------------
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: KSpacing.sp24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: KSpacing.sp8),
                  child: _DeckCard(
                      deck: mockDecks[i], locale: locale, l10n: l10n),
                ),
                childCount: mockDecks.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: KSpacing.sp12)),

          // ------------------------------------------------------------------
          // Weekly Story banner
          // ------------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: _BannerCard(
                icon: Icons.auto_stories_outlined,
                iconColor: KColors.brand600,
                title: l10n.homeWeeklyStory,
                subtitle: l10n.homeReadStory,
                onTap: () {},
                locale: locale,
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: KSpacing.sp12)),

          // ------------------------------------------------------------------
          // Forgetting Curve card
          // ------------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: _ForgettingCurveCard(
                  dueCount: dueCount, locale: locale, l10n: l10n),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: KSpacing.sp40)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _StatCard
// ---------------------------------------------------------------------------
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.locale,
    this.accent = false,
  });

  final IconData icon;
  final String value;
  final String label;
  final Locale locale;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.lg,
        border: Border.all(color: Colors.black12),
        boxShadow: KElevation.shadow1,
      ),
      child: Row(
        children: [
          Icon(icon,
              color: accent ? KColors.brand400 : KColors.brand600,
              size: KSpacing.sp24),
          const SizedBox(width: KSpacing.sp8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: KTypography.getStyle(KTextStyle.h3, locale)
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                label,
                style: KTypography.getStyle(KTextStyle.caption, locale)
                    .copyWith(color: KColors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _BannerCard
// ---------------------------------------------------------------------------
class _BannerCard extends StatelessWidget {
  const _BannerCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.locale,
  });

  final IconData icon;
  final Color iconColor;
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
            border: Border.all(color: Colors.black12),
            boxShadow: KElevation.shadow1,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: KRadius.md,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: KSpacing.sp12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          KTypography.getStyle(KTextStyle.h4, locale)
                              .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      subtitle,
                      style: KTypography.getStyle(
                              KTextStyle.caption, locale)
                          .copyWith(color: KColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded,
                  color: iconColor, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _DeckCard
// ---------------------------------------------------------------------------
class _DeckCard extends StatelessWidget {
  const _DeckCard({required this.deck, required this.locale, required this.l10n});

  final _Deck deck;
  final Locale locale;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: KColors.neutral0,
      borderRadius: KRadius.lg,
      child: InkWell(
        onTap: () {},
        borderRadius: KRadius.lg,
        child: Container(
          padding: const EdgeInsets.all(KSpacing.sp16),
          decoration: BoxDecoration(
            borderRadius: KRadius.lg,
            border: Border.all(color: Colors.black12),
            boxShadow: KElevation.shadow1,
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: KColors.brand500,
                  borderRadius: KRadius.full,
                ),
              ),
              const SizedBox(width: KSpacing.sp12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deck.title,
                      style:
                          KTypography.getStyle(KTextStyle.body, locale)
                              .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${l10n.homeWordsCount(deck.wordCount)} · ${deck.date}',
                      style: KTypography.getStyle(
                              KTextStyle.caption, locale)
                          .copyWith(color: KColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: KSpacing.sp12,
                    vertical: KSpacing.sp4),
                decoration: BoxDecoration(
                  color: KColors.brand500,
                  borderRadius: KRadius.full,
                ),
                child: Text(
                  l10n.homeDeckReviewBtn,
                  style: KTypography.getStyle(KTextStyle.label, locale)
                      .copyWith(
                    color: KColors.neutral0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _ForgettingCurveCard
// ---------------------------------------------------------------------------
class _ForgettingCurveCard extends StatelessWidget {
  const _ForgettingCurveCard({
    required this.dueCount,
    required this.locale,
    required this.l10n,
  });

  final int dueCount;
  final Locale locale;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.lg,
        border: Border.all(color: Colors.black12),
        boxShadow: KElevation.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.menu_book_rounded,
                  color: KColors.brand600, size: 20),
              const SizedBox(width: KSpacing.sp8),
              Expanded(
                child: Text(
                  l10n.homeForgettingCurve,
                  style:
                      KTypography.getStyle(KTextStyle.h4, locale)
                          .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: KSpacing.sp8,
                    vertical: KSpacing.sp2),
                decoration: BoxDecoration(
                  color: KColors.error500.withValues(alpha: 0.12),
                  borderRadius: KRadius.full,
                ),
                child: Text(
                  '(!) ${l10n.homeUrgentLabel}',
                  style:
                      KTypography.getStyle(KTextStyle.label, locale)
                          .copyWith(color: KColors.error500),
                ),
              ),
            ],
          ),
          const SizedBox(height: KSpacing.sp8),
          Text(
            l10n.reviewWordsDue(dueCount, dueCount ~/ 2 + 1),
            style: KTypography.getStyle(KTextStyle.bodySmall, locale)
                .copyWith(color: KColors.textSecondary),
          ),
          const SizedBox(height: KSpacing.sp12),
          ClipRRect(
            borderRadius: KRadius.full,
            child: LinearProgressIndicator(
              value: 0.7, //MOCKDATA
              minHeight: 8,
              backgroundColor: Colors.black12,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  KColors.brand500),
            ),
          ),
          const SizedBox(height: KSpacing.sp8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Now', '1d', '3d', '7d'] //MOCKDATA
                .map((t) => Text(t,
                    style: KTypography.getStyle(
                            KTextStyle.caption, locale)
                        .copyWith(color: KColors.textSecondary)))
                .toList(),
          ),
          const SizedBox(height: KSpacing.sp8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              'NOW:$dueCount',
              '1h: $dueCount',
              '6h: $dueCount',
              '1d: $dueCount',
              '7d: ${dueCount + 2}',
            ] //MOCKDATA
                .map((t) => Text(t,
                    style: KTypography.getStyle(
                            KTextStyle.caption, locale)
                        .copyWith(
                      color: KColors.brand600,
                      fontWeight: FontWeight.w600,
                    )))
                .toList(),
          ),
        ],
      ),
    );
  }
}
