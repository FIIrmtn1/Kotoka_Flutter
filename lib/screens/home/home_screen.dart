import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/koko_visible_provider.dart';
import 'package:kotoka_app/core/providers/tooltip_seen_provider.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/offline_banner.dart';
import 'package:kotoka_app/main.dart';

// ---------------------------------------------------------------------------
// Mock data — all lines tagged //MOCKDATA
// ---------------------------------------------------------------------------
const int _mockLives    = 5;    //MOCKDATA
const int _mockStreak   = 7;    //MOCKDATA
const int _mockCoins    = 120;  //MOCKDATA
const int _mockWords    = 248;  //MOCKDATA

class _MockDeck { //MOCKDATA
  const _MockDeck({required this.name, required this.wordCount, required this.progress}); //MOCKDATA
  final String name;       //MOCKDATA
  final int wordCount;     //MOCKDATA
  final double progress;   //MOCKDATA
} //MOCKDATA

const List<_MockDeck> _mockDecks = [ //MOCKDATA
  _MockDeck(name: 'Office Thai',      wordCount: 24, progress: 0.60), //MOCKDATA
  _MockDeck(name: 'Travel English',   wordCount: 18, progress: 0.35), //MOCKDATA
]; //MOCKDATA

// Forgetting curve: retention fraction per day (Mon→Sun)
const List<double> _mockRetention = [0.82, 0.65, 0.45, 0.78, 0.30, 0.91, 0.58]; //MOCKDATA
const List<String> _mockDayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];        //MOCKDATA

// ---------------------------------------------------------------------------
// HomeScreen
// ---------------------------------------------------------------------------
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowTooltip());
  }

  void _maybeShowTooltip() {
    if (!mounted) return;
    final seen = ref.read(tooltipSeenProvider);
    if (seen) return;
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ref.read(tooltipSeenProvider.notifier).markSeen();
          },
          child: Text(
            l10n.homeTooltipSensoryTag,
            style: KTypography.getStyle(KTextStyle.bodySmall, locale)
                .copyWith(color: KColors.neutral0),
          ),
        ),
        backgroundColor: KColors.brand500,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 6),
        shape: RoundedRectangleBorder(borderRadius: KRadius.md),
      ),
    );
    ref.read(tooltipSeenProvider.notifier).markSeen();
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final kokoVisible = ref.watch(kokoVisibleProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ── App Bar ──────────────────────────────────────────────────────
            SliverAppBar(
              elevation: KElevation.elevation0,
              floating: true,
              snap: true,
              titleSpacing: KSpacing.sp16,
              title: Row(
                children: [
                  Text(
                    'Kotoka',
                    style: KTypography.getStyle(KTextStyle.h3, locale)
                        .copyWith(color: KColors.brand500),
                  ),
                  const Spacer(),
                  _AppBarChip(icon: '❤️', value: '$_mockLives'),   //MOCKDATA
                  const SizedBox(width: KSpacing.sp8),
                  _AppBarChip(icon: '🔥', value: '$_mockStreak'),  //MOCKDATA
                  const SizedBox(width: KSpacing.sp8),
                  _AppBarChip(icon: '🪙', value: '$_mockCoins'),   //MOCKDATA
                  const SizedBox(width: KSpacing.sp4),
                  Consumer(
                    builder: (context, ref, _) {
                      final kokoVisible = ref.watch(kokoVisibleProvider);
                      return IconButton(
                        icon: Icon(
                          kokoVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: kokoVisible ? KColors.brand500 : KColors.neutral400,
                          size: 20,
                        ),
                        onPressed: () => ref.read(kokoVisibleProvider.notifier).toggle(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        tooltip: kokoVisible ? 'Focus mode' : 'Show Koko',
                      );
                    },
                  ),
                  const SizedBox(width: KSpacing.sp4),
                  Consumer(
                    builder: (context, ref, _) {
                      final isDark = Theme.of(context).brightness == Brightness.dark;
                      return IconButton(
                        icon: Icon(
                          isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                          color: KColors.brand500,
                          size: 20,
                        ),
                        onPressed: () {
                          ref.read(themeModeProvider.notifier).state =
                              isDark ? ThemeMode.light : ThemeMode.dark;
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      );
                    },
                  ),
                ],
              ),
            ),

            // ── Offline Banner ───────────────────────────────────────────────
            const SliverToBoxAdapter(child: OfflineBanner()),

            // ── Body ─────────────────────────────────────────────────────────
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: KSpacing.sp8),

                  // Koko mascot (hidden in focus mode)
                  if (kokoVisible) ...[
                    const Center(
                      child: KokoAnimation(state: KokoState.celebrating, size: 120),
                    ),
                    const SizedBox(height: KSpacing.sp12),
                  ],

                  // Greeting
                  Text(
                    l10n.homeGreeting('Kai'), //MOCKDATA
                    style: KTypography.getStyle(KTextStyle.h2, locale)
                        .copyWith(color: Theme.of(context).colorScheme.onSurface),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: KSpacing.sp4),

                  // Subtitle
                  Text(
                    l10n.homeSubtitle,
                    style: KTypography.getStyle(KTextStyle.body, locale)
                        .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: KSpacing.sp24),

                  // Snap & Learn CTA
                  KotokaButton(
                    label: l10n.homeSnapLearnBtn,
                    onPressed: () => context.go('/snap'),
                    variant: KotokaButtonVariant.primary,
                  ),
                  const SizedBox(height: KSpacing.sp20),

                  // Stat cards row
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          value: '$_mockWords', //MOCKDATA
                          label: l10n.homeWordsLearned,
                          icon: '📚',
                        ),
                      ),
                      const SizedBox(width: KSpacing.sp12),
                      Expanded(
                        child: _StatCard(
                          value: '$_mockStreak', //MOCKDATA
                          label: l10n.homeDaysStreak,
                          icon: '🔥',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: KSpacing.sp16),

                  // Achievement banner (hidden in focus mode)
                  if (kokoVisible) ...[
                    _AchievementBanner(l10n: l10n, locale: locale),
                    const SizedBox(height: KSpacing.sp24),
                  ],

                  // Recent Decks
                  _SectionHeader(title: l10n.homeRecentDecks, locale: locale),
                  const SizedBox(height: KSpacing.sp12),
                  ..._mockDecks.map(
                    (deck) => Padding(
                      padding: const EdgeInsets.only(bottom: KSpacing.sp8),
                      child: _DeckCard(deck: deck, l10n: l10n, locale: locale),
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp24),

                  // Weekly Story
                  _WeeklyStoryCard(l10n: l10n, locale: locale),
                  const SizedBox(height: KSpacing.sp24),

                  // Forgetting Curve
                  _SectionHeader(title: l10n.homeForgettingCurve, locale: locale),
                  const SizedBox(height: KSpacing.sp12),
                  _ForgettingCurveChart(
                    retention: _mockRetention,
                    dayLabels: _mockDayLabels,
                    urgentLabel: l10n.homeUrgentLabel,
                    locale: locale,
                  ),
                  const SizedBox(height: KSpacing.sp40),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _AppBarChip — small stat pill in the top bar
// ---------------------------------------------------------------------------
class _AppBarChip extends StatelessWidget {
  const _AppBarChip({required this.icon, required this.value});
  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp8, vertical: KSpacing.sp4),
      decoration: BoxDecoration(
        color: isDark ? KColorsDark.bgCard : KColors.neutral100,
        borderRadius: KRadius.full,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: KSpacing.sp4),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _StatCard — single metric tile
// ---------------------------------------------------------------------------
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.value,
    required this.label,
    required this.icon,
  });
  final String value;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: KRadius.md,
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: KElevation.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: KSpacing.sp8),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: KSpacing.sp2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _AchievementBanner
// ---------------------------------------------------------------------------
class _AchievementBanner extends StatelessWidget {
  const _AchievementBanner({required this.l10n, required this.locale});
  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp16, vertical: KSpacing.sp12),
      decoration: BoxDecoration(
        color: isDark ? KColorsDark.bgCard : const Color(0xFFE6FAF8),
        borderRadius: KRadius.md,
        border: Border.all(color: KColors.brand500, width: 1.5),
      ),
      child: Row(
        children: [
          const Text('🏆', style: TextStyle(fontSize: 22)),
          const SizedBox(width: KSpacing.sp12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.homeAchievementBanner('3-Day Streak'), //MOCKDATA
                  style: KTypography.getStyle(KTextStyle.label, locale)
                      .copyWith(
                          color: KColors.brand500,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0),
                ),
                const SizedBox(height: KSpacing.sp2),
                Text(
                  l10n.homeAchievementCta,
                  style: KTypography.getStyle(KTextStyle.caption, locale)
                      .copyWith(color: isDark ? KColors.neutral400 : KColors.neutral700),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: KColors.brand500, size: KSpacing.sp20),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _SectionHeader
// ---------------------------------------------------------------------------
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.locale});
  final String title;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: KTypography.getStyle(KTextStyle.h4, locale)
          .copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}

// ---------------------------------------------------------------------------
// _DeckCard — recent deck with progress and Review button
// ---------------------------------------------------------------------------
class _DeckCard extends StatelessWidget {
  const _DeckCard({
    required this.deck,
    required this.l10n,
    required this.locale,
  });
  final _MockDeck deck;
  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: KRadius.md,
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: KElevation.shadow1,
      ),
      child: Row(
        children: [
          // Deck icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: KColors.brand500.withOpacity(0.12),
              borderRadius: KRadius.sm,
            ),
            child: const Center(
              child: Text('📖', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(width: KSpacing.sp12),
          // Name + progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deck.name,
                  style: KTypography.getStyle(KTextStyle.h4, locale)
                      .copyWith(color: theme.colorScheme.onSurface, fontSize: 14),
                ),
                const SizedBox(height: KSpacing.sp4),
                ClipRRect(
                  borderRadius: KRadius.full,
                  child: LinearProgressIndicator(
                    value: deck.progress,
                    minHeight: 5,
                    backgroundColor: KColors.neutral200,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(KColors.brand500),
                  ),
                ),
                const SizedBox(height: KSpacing.sp4),
                Text(
                  '${deck.wordCount} words', //MOCKDATA
                  style: KTypography.getStyle(KTextStyle.caption, locale),
                ),
              ],
            ),
          ),
          const SizedBox(width: KSpacing.sp12),
          // Review button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: KColors.brand500,
              side: const BorderSide(color: KColors.brand500),
              shape: RoundedRectangleBorder(borderRadius: KRadius.sm),
              padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp12, vertical: KSpacing.sp4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              l10n.homeDeckReviewBtn,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _WeeklyStoryCard
// ---------------------------------------------------------------------------
class _WeeklyStoryCard extends StatelessWidget {
  const _WeeklyStoryCard({required this.l10n, required this.locale});
  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: isDark ? KColorsDark.bgCard : KColors.brand50,
        borderRadius: KRadius.md,
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('📖', style: TextStyle(fontSize: 18)),
              const SizedBox(width: KSpacing.sp8),
              Text(
                l10n.homeWeeklyStory,
                style: KTypography.getStyle(KTextStyle.h4, locale)
                    .copyWith(color: theme.colorScheme.onSurface),
              ),
            ],
          ),
          const SizedBox(height: KSpacing.sp8),
          Text(
            'A morning at the market — 12 new words inside.', //MOCKDATA
            style: KTypography.getStyle(KTextStyle.body, locale)
                .copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: KSpacing.sp12),
          GestureDetector(
            onTap: () {},
            child: Text(
              l10n.homeReadStory,
              style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
                color: KColors.brand500,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _ForgettingCurveChart — bar chart showing daily retention
// ---------------------------------------------------------------------------
class _ForgettingCurveChart extends StatelessWidget {
  const _ForgettingCurveChart({
    required this.retention,
    required this.dayLabels,
    required this.urgentLabel,
    required this.locale,
  });
  final List<double> retention;
  final List<String> dayLabels;
  final String urgentLabel;
  final Locale locale;

  Color _barColor(double r) {
    if (r >= 0.70) return KColors.brand500;
    if (r >= 0.45) return KColors.warning300;
    return KColors.error500;
  }

  @override
  Widget build(BuildContext context) {
    const maxBarHeight = 72.0;

    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: KRadius.md,
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: KElevation.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Legend row
          Row(
            children: [
              _LegendDot(color: KColors.brand500, label: '≥ 70%'),
              const SizedBox(width: KSpacing.sp12),
              _LegendDot(color: KColors.warning300, label: '45–70%'),
              const SizedBox(width: KSpacing.sp12),
              _LegendDot(
                  color: KColors.error500, label: urgentLabel),
            ],
          ),
          const SizedBox(height: KSpacing.sp16),
          // Bars
          SizedBox(
            height: maxBarHeight + 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(retention.length, (i) {
                final r = retention[i];
                final barH = (r * maxBarHeight).clamp(8.0, maxBarHeight);
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedContainer(
                          duration: KMotion.normal,
                          height: barH,
                          decoration: BoxDecoration(
                            color: _barColor(r),
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4)),
                          ),
                        ),
                        const SizedBox(height: KSpacing.sp4),
                        Text(
                          dayLabels[i],
                          style: const TextStyle(
                              fontSize: 11,
                              color: KColors.neutral500,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label,
            style: const TextStyle(fontSize: 11, color: KColors.neutral600)),
      ],
    );
  }
}
