import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/language_picker_sheet.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/core/widgets/k_section_header.dart';
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

    return KStitchScaffold(
      body: Column(
        children: [
          _ProfileTopBar(title: l10n.profileTitle),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp16,
                KSpacing.sp16,
                KSpacing.sp16,
                KSpacing.sp96,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _ProfileHeaderCard(),
                  const SizedBox(height: KSpacing.sp24),
                  KSectionHeader(title: l10n.profileMemoryMap),
                  const SizedBox(height: KSpacing.sp12),
                  _MemoryMapPlaceholder(l10n: l10n),
                  const SizedBox(height: KSpacing.sp24),
                  KSectionHeader(title: l10n.profileStatsWeek),
                  const SizedBox(height: KSpacing.sp12),
                  _StatsRow(l10n: l10n),
                  const SizedBox(height: KSpacing.sp24),
                  KSectionHeader(title: l10n.profileLanguagePairs),
                  const SizedBox(height: KSpacing.sp12),
                  const _LanguagePairBadge(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      l10n.profileAddPair,
                      style: const TextStyle(
                        color: KColors.brand400,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp24),
                  KSectionHeader(title: l10n.langDisplayLanguage),
                  const SizedBox(height: KSpacing.sp12),
                  KCard(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: const Icon(
                        Icons.language_outlined,
                        color: KColors.brand400,
                      ),
                      title: Text(
                        l10n.langDisplayLanguage,
                        style: const TextStyle(
                          color: KColors.neutral900,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: KColors.neutral400,
                      ),
                      onTap: () => showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(KRadius.radiusXl),
                          ),
                        ),
                        builder: (_) => const LanguagePickerSheet(),
                      ),
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp32),
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
// _ProfileTopBar
// ---------------------------------------------------------------------------
class _ProfileTopBar extends StatelessWidget {
  const _ProfileTopBar({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.pageBg,
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp16,
        vertical: KSpacing.sp12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: KColors.neutral900,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: KColors.neutral500),
            onPressed: () {},
          ),
        ],
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
    return KCard(
      padding: const EdgeInsets.all(KSpacing.sp16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: KColors.brand400,
            child: Text(
              _mockName[0], //MOCKDATA
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: KColors.neutral1000,
              ),
            ),
          ),
          const SizedBox(width: KSpacing.sp16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _mockName, //MOCKDATA
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: KColors.neutral900,
                  ),
                ),
                SizedBox(height: KSpacing.sp2),
                Text(
                  _mockLanguagePair, //MOCKDATA
                  style: TextStyle(fontSize: 13, color: KColors.neutral500),
                ),
                SizedBox(height: KSpacing.sp2),
                Text(
                  _mockLevel, //MOCKDATA
                  style: TextStyle(
                    fontSize: 13,
                    color: KColors.brand600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: KSpacing.sp8),
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: KColors.error500,
                      size: 16,
                    ),
                    SizedBox(width: KSpacing.sp4),
                    Text(
                      '$_mockStreakDays days', //MOCKDATA
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: KColors.neutral900,
                      ),
                    ),
                    SizedBox(width: KSpacing.sp12),
                    Icon(
                      Icons.menu_book_outlined,
                      color: KColors.brand400,
                      size: 16,
                    ),
                    SizedBox(width: KSpacing.sp4),
                    Text(
                      '$_mockWordsLearned words', //MOCKDATA
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: KColors.neutral900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
    return KCard(
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp24,
        vertical: KSpacing.sp24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.map_outlined, color: KColors.brand400, size: 48),
          const SizedBox(height: KSpacing.sp12),
          Text(
            l10n.profileMapEmpty,
            style: const TextStyle(
              color: KColors.neutral900,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSpacing.sp8),
          Text(
            l10n.profileMapEmptyDesc,
            style: const TextStyle(color: KColors.neutral500, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSpacing.sp16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: KColors.brand400,
                foregroundColor: KColors.neutral1000,
                shape: RoundedRectangleBorder(borderRadius: KRadius.full),
                padding: const EdgeInsets.symmetric(vertical: KSpacing.sp12),
              ),
              child: Text(
                l10n.profileMapEmptyCta,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
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
    return KCard(
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
              color: KColors.brand400,
            ),
          ),
          const SizedBox(height: KSpacing.sp4),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: KColors.neutral500),
            textAlign: TextAlign.center,
          ),
        ],
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
        color: KColors.brand400.withValues(alpha: 0.08),
        borderRadius: KRadius.full,
        border: Border.all(color: KColors.brand400.withValues(alpha: 0.50)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.language, color: KColors.brand400, size: 16),
          SizedBox(width: KSpacing.sp8),
          Text(
            _mockActivePair, //MOCKDATA
            style: TextStyle(
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
