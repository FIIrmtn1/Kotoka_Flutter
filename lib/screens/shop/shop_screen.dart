import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_emoji.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/core/widgets/k_section_header.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// ---------------------------------------------------------------------------
// Mock data
// ---------------------------------------------------------------------------
class _PackData {
  const _PackData({
    required this.emoji,
    required this.title,
    required this.wordCount,
    required this.xpPrice,
  });
  final String emoji;
  final String title;
  final int wordCount;
  final int xpPrice;
}

const List<_PackData> _mockPacks = [ //MOCKDATA
  _PackData(emoji: '☕', title: 'Café', wordCount: 200, xpPrice: 500), //MOCKDATA
  _PackData(emoji: '🏥', title: 'Medical', wordCount: 150, xpPrice: 500), //MOCKDATA
  _PackData(emoji: '✈️', title: 'Travel', wordCount: 180, xpPrice: 500), //MOCKDATA
  _PackData(emoji: '💼', title: 'Office', wordCount: 220, xpPrice: 500), //MOCKDATA
]; //MOCKDATA

// ---------------------------------------------------------------------------
// ShopScreen
// ---------------------------------------------------------------------------
class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return KStitchScaffold(
      body: Column(
        children: [
          _ShopHeader(title: l10n.shopTitle),
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
                  _BetaBanner(l10n: l10n),
                  const SizedBox(height: KSpacing.sp24),
                  KSectionHeader(title: l10n.shopVocabPacks),
                  const SizedBox(height: KSpacing.sp12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: KSpacing.sp12,
                      mainAxisSpacing: KSpacing.sp12,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: _mockPacks.length, //MOCKDATA
                    itemBuilder: (_, i) =>
                        _PackCard(pack: _mockPacks[i], l10n: l10n),
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
// _ShopHeader — sticky header
// ---------------------------------------------------------------------------
class _ShopHeader extends StatelessWidget {
  const _ShopHeader({required this.title});
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
          // Coin chip
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: KSpacing.sp8,
              vertical: KSpacing.sp4,
            ),
            decoration: BoxDecoration(
              color: KColors.brand50,
              border: Border.all(
                color: KColors.brand400.withValues(alpha: 0.10),
              ),
              borderRadius: BorderRadius.circular(KRadius.radiusFull),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.monetization_on, color: KColors.brand400, size: 14),
                SizedBox(width: KSpacing.sp4),
                Text(
                  '∞ XP', //MOCKDATA
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: KColors.brand400,
                  ),
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
// _BetaBanner — Beta free notice (SHO-03: all free during beta)
// ---------------------------------------------------------------------------
class _BetaBanner extends StatelessWidget {
  const _BetaBanner({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return KTintedCard(
      color: KColors.brand400,
      padding: const EdgeInsets.all(KSpacing.sp20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const KokoEmoji(emoji: '🎉', size: 20),
              const SizedBox(width: KSpacing.sp8),
              Text(
                l10n.shopBetaFreeTitle,
                style: const TextStyle(
                  fontFamily: 'IBMPlexSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: KColors.neutral900,
                ),
              ),
            ],
          ),
          const SizedBox(height: KSpacing.sp8),
          Text(
            l10n.shopBetaFreeBody,
            style: const TextStyle(
              fontSize: 14,
              color: KColors.neutral800,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _PackCard
// ---------------------------------------------------------------------------
class _PackCard extends StatelessWidget {
  const _PackCard({required this.pack, required this.l10n});
  final _PackData pack;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return KCard(
      padding: const EdgeInsets.all(KSpacing.sp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KokoEmoji(emoji: pack.emoji, size: 28),
          const SizedBox(height: KSpacing.sp8),
          Text(
            pack.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: KColors.neutral900,
            ),
          ),
          const SizedBox(height: KSpacing.sp4),
          Text(
            '${pack.wordCount} words', //MOCKDATA
            style: const TextStyle(fontSize: 12, color: KColors.neutral500),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: KColors.warning300,
                size: 14,
              ),
              const SizedBox(width: KSpacing.sp4),
              Text(
                '${pack.xpPrice} XP', //MOCKDATA
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: KColors.neutral700,
                ),
              ),
            ],
          ),
          const SizedBox(height: KSpacing.sp8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: KColors.brand400,
                foregroundColor: KColors.neutral1000,
                shape: RoundedRectangleBorder(borderRadius: KRadius.sm),
                padding:
                    const EdgeInsets.symmetric(vertical: KSpacing.sp8),
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.shopBetaUnlocked)),
                );
              },
              child: Text(l10n.shopBetaFree),
            ),
          ),
        ],
      ),
    );
  }
}
