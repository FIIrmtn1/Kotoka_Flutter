import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/koko_visible_provider.dart';
import 'package:kotoka_app/core/providers/tooltip_seen_provider.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/offline_banner.dart';
import 'package:kotoka_app/core/widgets/k_progress_ring.dart';
import 'package:kotoka_app/core/widgets/k_section_header.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';

// ---------------------------------------------------------------------------
// Mock data — all lines tagged //MOCKDATA
// ---------------------------------------------------------------------------
const int _mockStreak  = 12;   //MOCKDATA
// ignore: unused_element
const int _mockCoins   = 120;  //MOCKDATA
const int _mockWords   = 1284; //MOCKDATA
const int _mockFocus   = 92;   //MOCKDATA
const int _mockCities  = 14;   //MOCKDATA
const int _mockConns   = 42;   //MOCKDATA
const double _mockDailyPct = 0.85; //MOCKDATA

class _MockMission { //MOCKDATA
  const _MockMission({required this.icon, required this.title, required this.sub, required this.done}); //MOCKDATA
  final String icon;    //MOCKDATA
  final String title;   //MOCKDATA
  final String sub;     //MOCKDATA
  final bool done;      //MOCKDATA
} //MOCKDATA

const List<_MockMission> _mockMissions = [ //MOCKDATA
  _MockMission(icon: '📷', title: 'Visual Anchor', sub: 'Snap 1 memory', done: false), //MOCKDATA
  _MockMission(icon: '🙏', title: 'Gratitude Log', sub: "Resume today's entry", done: true), //MOCKDATA
]; //MOCKDATA

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
    final l10n        = AppLocalizations.of(context)!;
    final kokoVisible = ref.watch(kokoVisibleProvider);

    return KStitchScaffold(
      floatingActionButton: _CyanFab(onTap: () => context.go('/snap')),
      body: Column(
        children: [
          // ── Sticky header ────────────────────────────────────────────────
          _HomeHeader(
            kokoVisible: kokoVisible,
            onToggleKoko: () => ref.read(kokoVisibleProvider.notifier).toggle(),
          ),
          const OfflineBanner(),

          // ── Scrollable body ──────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp16, KSpacing.sp16, KSpacing.sp16, KSpacing.sp96),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Streak hero card
                  _StreakHeroCard(
                    l10n: l10n,
                    streak: _mockStreak, //MOCKDATA
                    dailyPct: _mockDailyPct, //MOCKDATA
                    kokoVisible: kokoVisible,
                  ),
                  const SizedBox(height: KSpacing.sp24),

                  // Daily Missions
                  KSectionHeader(
                    title: l10n.homeRecentDecks,
                    actionLabel: 'View',
                    onAction: () {},
                  ),
                  const SizedBox(height: KSpacing.sp12),
                  const _MissionsBento(missions: _mockMissions), //MOCKDATA
                  const SizedBox(height: KSpacing.sp24),

                  // Spatial Archive
                  const KSectionHeader(title: 'Spatial Archive'),
                  const SizedBox(height: KSpacing.sp4),
                  const Text(
                    "Memories anchored to places you've been.",
                    style: TextStyle(
                      fontSize: 12,
                      color: KColors.neutral500,
                      fontFamily: 'IBMPlexSans',
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp12),
                  const _MapPlaceholderCard(),
                  const SizedBox(height: KSpacing.sp24),

                  // 4-tile stat row
                  const _StatTilesRow(
                    words: _mockWords,   //MOCKDATA
                    focus: _mockFocus,   //MOCKDATA
                    cities: _mockCities, //MOCKDATA
                    conns: _mockConns,   //MOCKDATA
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

// ---------------------------------------------------------------------------
// _HomeHeader
// ---------------------------------------------------------------------------
class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.kokoVisible,
    required this.onToggleKoko,
  });
  final bool kokoVisible;
  final VoidCallback onToggleKoko;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.pageBg,
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp16, vertical: KSpacing.sp12),
      child: Row(
        children: [
          const Icon(Icons.menu_rounded, color: KColors.brand400, size: 24),
          const SizedBox(width: KSpacing.sp12),
          const Expanded(
            child: Text(
              'Kotoka',
              style: TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: KColors.brand400,
                letterSpacing: -0.5,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              kokoVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: kokoVisible ? KColors.brand400 : KColors.neutral400,
              size: 20,
            ),
            onPressed: onToggleKoko,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            tooltip: kokoVisible ? 'Focus mode' : 'Show Koko',
          ),
          const SizedBox(width: KSpacing.sp12),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications_outlined, color: KColors.brand400, size: 24),
              Positioned(
                top: -2, right: -2,
                child: Container(
                  width: 8, height: 8,
                  decoration: const BoxDecoration(
                    color: KColors.error500, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _StreakHeroCard — STITCH HOM-01 hero banner
// ---------------------------------------------------------------------------
class _StreakHeroCard extends StatelessWidget {
  const _StreakHeroCard({
    required this.l10n,
    required this.streak,
    required this.dailyPct,
    required this.kokoVisible,
  });
  final AppLocalizations l10n;
  final int streak;
  final double dailyPct;
  final bool kokoVisible;

  @override
  Widget build(BuildContext context) {
    return KTintedCard(
      padding: const EdgeInsets.all(KSpacing.sp24),
      gradient: const LinearGradient(
        colors: [KColors.brand700, KColors.brand800],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Stack(
        children: [
          // Koko mascot (top-right, hidden in focus mode)
          if (kokoVisible)
            const Positioned(
              top: 0,
              right: 0,
              child: KokoAnimation(state: KokoState.idle, size: 72),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Streak badge
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: KSpacing.sp12, vertical: KSpacing.sp4),
                decoration: BoxDecoration(
                  color: KColors.brand400.withValues(alpha: 0.20),
                  borderRadius: BorderRadius.circular(KRadius.radiusFull),
                  border: Border.all(
                      color: KColors.brand400.withValues(alpha: 0.40)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('🔥', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: KSpacing.sp4),
                    Text(
                      '$streak DAY STREAK',
                      style: const TextStyle(
                        fontFamily: 'IBMPlexSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: KColors.brand400,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: KSpacing.sp16),

              // Greeting
              Text(
                l10n.homeGreeting('Kai'), //MOCKDATA
                style: const TextStyle(
                  fontFamily: 'IBMPlexSans',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: KColors.neutral0,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: KSpacing.sp4),
              Text(
                l10n.homeSubtitle,
                style: TextStyle(
                  fontFamily: 'IBMPlexSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: KColors.neutral0.withValues(alpha: 0.80),
                ),
              ),
              const SizedBox(height: KSpacing.sp20),

              // Progress ring row
              Row(
                children: [
                  KProgressRing(
                    value: dailyPct,
                    size: 80,
                    trackColor: KColors.neutral0.withValues(alpha: 0.20),
                    strokeWidth: 8.0,
                  ),
                  const SizedBox(width: KSpacing.sp16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${(dailyPct * 100).toInt()}%',
                        style: const TextStyle(
                          fontFamily: 'IBMPlexSans',
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: KColors.neutral0,
                        ),
                      ),
                      Text(
                        'Daily Goal',
                        style: TextStyle(
                          fontFamily: 'IBMPlexSans',
                          fontSize: 13,
                          color: KColors.neutral0.withValues(alpha: 0.75),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _MissionsBento — 2-col bento grid for daily missions
// ---------------------------------------------------------------------------
class _MissionsBento extends StatelessWidget {
  const _MissionsBento({required this.missions});
  final List<_MockMission> missions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (missions.isNotEmpty)
          Expanded(flex: 2, child: _MissionCard(mission: missions[0])),
        if (missions.length > 1) ...[
          const SizedBox(width: KSpacing.sp12),
          Expanded(child: _MissionCard(mission: missions[1])),
        ],
      ],
    );
  }
}

class _MissionCard extends StatelessWidget {
  const _MissionCard({required this.mission});
  final _MockMission mission;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: BorderRadius.circular(KRadius.radiusMd),
        border: Border.all(color: KColors.brand400.withValues(alpha: 0.20)),
        boxShadow: KElevation.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: KColors.brand400.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(KRadius.radiusSm),
              border: Border.all(color: KColors.brand400.withValues(alpha: 0.20)),
            ),
            child: Center(
              child: Text(mission.icon, style: const TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: KSpacing.sp12),
          Text(
            mission.title,
            style: const TextStyle(
              fontFamily: 'IBMPlexSans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: KColors.neutral900,
            ),
          ),
          const SizedBox(height: KSpacing.sp4),
          Text(
            mission.sub,
            style: const TextStyle(
              fontFamily: 'IBMPlexSans',
              fontSize: 12,
              color: KColors.neutral500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: KSpacing.sp12),
          // CTA row
          Row(
            children: [
              if (mission.done)
                const Icon(Icons.check_circle, color: KColors.brand400, size: 16)
              else
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: KSpacing.sp12, vertical: KSpacing.sp4),
                  decoration: BoxDecoration(
                    color: KColors.brand400,
                    borderRadius: BorderRadius.circular(KRadius.radiusFull),
                    boxShadow: [
                      BoxShadow(
                        color: KColors.brand400.withValues(alpha: 0.30),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Complete',
                    style: TextStyle(
                      fontFamily: 'IBMPlexSans',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: KColors.neutral1000,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _MapPlaceholderCard — Spatial Archive section
// ---------------------------------------------------------------------------
class _MapPlaceholderCard extends StatelessWidget {
  const _MapPlaceholderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        color: KColors.brand50,
        borderRadius: BorderRadius.circular(KRadius.radiusMd),
        border: Border.all(color: KColors.brand400.withValues(alpha: 0.20)),
        boxShadow: KElevation.shadow1,
      ),
      child: Stack(
        children: [
          // Map tint overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(KRadius.radiusMd),
              gradient: LinearGradient(
                colors: [
                  KColors.sky100.withValues(alpha: 0.60),
                  KColors.brand50.withValues(alpha: 0.40),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Location pins
          const Positioned(
            top: 80, left: 120,
            child: _MapPin(color: KColors.brand400),
          ),
          const Positioned(
            top: 140, right: 80,
            child: _MapPin(color: KColors.brand600),
          ),
          // Floating glass card
          Positioned(
            bottom: KSpacing.sp16,
            right: KSpacing.sp16,
            child: _MapGlassCard(),
          ),
          // Map label
          Positioned(
            top: KSpacing.sp16,
            left: KSpacing.sp16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp12, vertical: KSpacing.sp4),
              decoration: BoxDecoration(
                color: KColors.neutral0.withValues(alpha: 0.90),
                borderRadius: BorderRadius.circular(KRadius.radiusFull),
                border: Border.all(color: KColors.brand400.withValues(alpha: 0.30)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, color: KColors.brand400, size: 14),
                  SizedBox(width: 4),
                  Text(
                    'Nearby memories',
                    style: TextStyle(
                      fontFamily: 'IBMPlexSans',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: KColors.neutral900,
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

class _MapPin extends StatelessWidget {
  const _MapPin({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24, height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.40), blurRadius: 8),
        ],
      ),
      child: const Icon(Icons.place, color: KColors.neutral0, size: 14),
    );
  }
}

class _MapGlassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp12),
      decoration: BoxDecoration(
        color: KColors.neutral0.withValues(alpha: 0.90),
        borderRadius: BorderRadius.circular(KRadius.radiusMd),
        border: Border.all(color: KColors.neutral0.withValues(alpha: 0.50)),
        boxShadow: KElevation.shadow2,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.photo_camera, color: KColors.brand400, size: 16),
          SizedBox(width: KSpacing.sp8),
          Text(
            '2 nearby',
            style: TextStyle(
              fontFamily: 'IBMPlexSans',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: KColors.neutral900,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _StatTilesRow — 4 metric chips
// ---------------------------------------------------------------------------
class _StatTilesRow extends StatelessWidget {
  const _StatTilesRow({
    required this.words,
    required this.focus,
    required this.cities,
    required this.conns,
  });
  final int words;
  final int focus;
  final int cities;
  final int conns;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatTile(value: _fmt(words), label: 'Mem.'),
        const SizedBox(width: KSpacing.sp8),
        _StatTile(value: '$focus%', label: 'Focus'),
        const SizedBox(width: KSpacing.sp8),
        _StatTile(value: '$cities', label: 'Cities'),
        const SizedBox(width: KSpacing.sp8),
        _StatTile(value: '$conns', label: 'Conn.'),
      ],
    );
  }

  String _fmt(int n) => n >= 1000 ? '${(n / 1000).toStringAsFixed(1)}k' : '$n';
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp8, vertical: KSpacing.sp12),
        decoration: BoxDecoration(
          color: KColors.neutral0,
          borderRadius: BorderRadius.circular(KRadius.radiusSm),
          border: Border.all(color: KColors.brand400.withValues(alpha: 0.15)),
          boxShadow: KElevation.shadow1,
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: KColors.brand400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KSpacing.sp2),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: KColors.neutral500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _CyanFab — floating action button
// ---------------------------------------------------------------------------
class _CyanFab extends StatelessWidget {
  const _CyanFab({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: KColors.brand400,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: KColors.brand400.withValues(alpha: 0.40),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.add_rounded, color: KColors.neutral1000, size: 28),
      ),
    );
  }
}
