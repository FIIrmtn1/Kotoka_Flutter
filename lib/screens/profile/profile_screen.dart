import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// ---------------------------------------------------------------------------
// Mock data
// ---------------------------------------------------------------------------
const String _mockName = 'Pam'; //MOCKDATA
const String _mockLanguagePair = 'Thai → English'; //MOCKDATA
const String _mockLevel = 'B1 Intermediate'; //MOCKDATA
const int _mockStreakDays = 13; //MOCKDATA
const int _mockWordsLearned = 847; //MOCKDATA
const int _mockWordsThisWeek = 24; //MOCKDATA
const int _mockSessionsThisWeek = 7; //MOCKDATA
const int _mockAccuracyPct = 83; //MOCKDATA
const String _mockActivePair = 'TH → EN (active)'; //MOCKDATA

// ---------------------------------------------------------------------------
// ProfileScreen
// ---------------------------------------------------------------------------
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: KColors.brand50,
      appBar: AppBar(
        backgroundColor: KColors.surfacePrimary,
        elevation: KElevation.elevation1,
        title: Text(
          l10n.profileTitle,
          style: const TextStyle(
            color: KColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: KColors.textSecondary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(KSpacing.sp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ProfileHeaderCard(),
            const SizedBox(height: KSpacing.sp24),
            Text(
              l10n.profileMemoryMap,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: KColors.textPrimary,
              ),
            ),
            const SizedBox(height: KSpacing.sp12),
            _MemoryMapPlaceholder(l10n: l10n),
            const SizedBox(height: KSpacing.sp24),
            Text(
              l10n.profileStatsWeek,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: KColors.textPrimary,
              ),
            ),
            const SizedBox(height: KSpacing.sp12),
            _StatsRow(l10n: l10n),
            const SizedBox(height: KSpacing.sp24),
            Text(
              l10n.profileLanguagePairs,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: KColors.textPrimary,
              ),
            ),
            const SizedBox(height: KSpacing.sp12),
            const _LanguagePairBadge(),
            TextButton(
              onPressed: () {},
              child: Text(
                l10n.profileAddPair,
                style: const TextStyle(
                  color: KColors.brand500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _ProfileHeaderCard
// ---------------------------------------------------------------------------
class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: KColors.surfacePrimary,
      shape: RoundedRectangleBorder(borderRadius: KRadius.lg),
      elevation: KElevation.elevation2,
      child: Padding(
        padding: const EdgeInsets.all(KSpacing.sp16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: KColors.brand300, //MOCKDATA
              child: Text(
                _mockName[0], //MOCKDATA
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: KColors.neutral0,
                ),
              ),
            ),
            const SizedBox(width: KSpacing.sp16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _mockName, //MOCKDATA
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: KColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp2),
                  Text(
                    _mockLanguagePair, //MOCKDATA
                    style: const TextStyle(
                      fontSize: 13,
                      color: KColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp2),
                  Text(
                    _mockLevel, //MOCKDATA
                    style: const TextStyle(
                      fontSize: 13,
                      color: KColors.brand600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp8),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: KColors.error500,
                        size: 16,
                      ),
                      const SizedBox(width: KSpacing.sp4),
                      Text(
                        '$_mockStreakDays days', //MOCKDATA
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: KColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: KSpacing.sp12),
                      const Icon(
                        Icons.menu_book_outlined,
                        color: KColors.brand500,
                        size: 16,
                      ),
                      const SizedBox(width: KSpacing.sp4),
                      Text(
                        '$_mockWordsLearned words', //MOCKDATA
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: KColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _MemoryMapPlaceholder
// ---------------------------------------------------------------------------
class _MemoryMapPlaceholder extends StatelessWidget {
  const _MemoryMapPlaceholder({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: KColors.brand50,
        borderRadius: KRadius.md,
        border: Border.all(color: KColors.borderDefault),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.map_outlined,
              color: KColors.brand500,
              size: 48,
            ),
            const SizedBox(height: KSpacing.sp12),
            Text(
              l10n.profileMapEmpty, //MOCKDATA
              style: const TextStyle(
                color: KColors.textSecondary,
                fontSize: 14,
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
// _StatsRow
// ---------------------------------------------------------------------------
class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatTile(
            value: '$_mockWordsThisWeek', //MOCKDATA
            label: l10n.profileStatWords,
          ),
        ),
        const SizedBox(width: KSpacing.sp8),
        Expanded(
          child: _StatTile(
            value: '$_mockSessionsThisWeek', //MOCKDATA
            label: l10n.profileStatSessions,
          ),
        ),
        const SizedBox(width: KSpacing.sp8),
        Expanded(
          child: _StatTile(
            value: '$_mockAccuracyPct%', //MOCKDATA
            label: l10n.profileStatAccuracy,
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: KColors.surfacePrimary,
      shape: RoundedRectangleBorder(borderRadius: KRadius.md),
      elevation: KElevation.elevation1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: KSpacing.sp16,
          horizontal: KSpacing.sp8,
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: KColors.brand500,
              ),
            ),
            const SizedBox(height: KSpacing.sp4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: KColors.textSecondary,
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
// _LanguagePairBadge
// ---------------------------------------------------------------------------
class _LanguagePairBadge extends StatelessWidget {
  const _LanguagePairBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp12,
        vertical: KSpacing.sp8,
      ),
      decoration: BoxDecoration(
        color: KColors.brand100,
        borderRadius: KRadius.full,
        border: Border.all(color: KColors.brand500),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.language, color: KColors.brand500, size: 16),
          const SizedBox(width: KSpacing.sp8),
          Text(
            _mockActivePair, //MOCKDATA
            style: const TextStyle(
              color: KColors.brand500,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
