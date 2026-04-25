import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// ---------------------------------------------------------------------------
// Mock data
// ---------------------------------------------------------------------------
const int _mockXp = 240; //MOCKDATA
const String _mockPrice = '฿299/month'; //MOCKDATA

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

    return Scaffold(
      backgroundColor: KColors.brand50,
      appBar: AppBar(
        backgroundColor: KColors.surfacePrimary,
        elevation: KElevation.elevation1,
        title: Text(
          l10n.shopTitle,
          style: const TextStyle(
            color: KColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: KSpacing.sp16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.monetization_on,
                  color: KColors.warning300,
                  size: 20,
                ),
                const SizedBox(width: KSpacing.sp4),
                Text(
                  '$_mockXp XP', //MOCKDATA
                  style: const TextStyle(
                    color: KColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(KSpacing.sp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PremiumCard(l10n: l10n),
            const SizedBox(height: KSpacing.sp24),
            Text(
              l10n.shopVocabPacks,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: KColors.textPrimary,
              ),
            ),
            const SizedBox(height: KSpacing.sp12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: KSpacing.sp12,
                mainAxisSpacing: KSpacing.sp12,
                childAspectRatio: 0.85,
              ),
              itemCount: _mockPacks.length, //MOCKDATA
              itemBuilder: (context, index) =>
                  _PackCard(pack: _mockPacks[index]),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _PremiumCard
// ---------------------------------------------------------------------------
class _PremiumCard extends StatelessWidget {
  const _PremiumCard({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: KColors.brand500,
      shape: RoundedRectangleBorder(borderRadius: KRadius.lg),
      elevation: KElevation.elevation3,
      child: Padding(
        padding: const EdgeInsets.all(KSpacing.sp20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '⭐ ${l10n.shopPremiumTitle}',
              style: const TextStyle(
                color: KColors.neutral0,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: KSpacing.sp8),
            Text(
              l10n.shopPremiumDesc,
              style: const TextStyle(
                color: KColors.brand100,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: KSpacing.sp8),
            Text(
              _mockPrice, //MOCKDATA
              style: const TextStyle(
                color: KColors.brand400,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: KSpacing.sp16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColors.brand500,
                  foregroundColor: KColors.neutral0,
                  shape: RoundedRectangleBorder(borderRadius: KRadius.md),
                  padding: const EdgeInsets.symmetric(
                    vertical: KSpacing.sp12,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  l10n.shopStartTrial,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
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
// _PackCard
// ---------------------------------------------------------------------------
class _PackCard extends StatelessWidget {
  const _PackCard({required this.pack});
  final _PackData pack;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Card(
      color: KColors.surfacePrimary,
      shape: RoundedRectangleBorder(borderRadius: KRadius.md),
      elevation: KElevation.elevation2,
      child: Padding(
        padding: const EdgeInsets.all(KSpacing.sp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pack.emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: KSpacing.sp8),
            Text(
              pack.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: KColors.textPrimary,
              ),
            ),
            const SizedBox(height: KSpacing.sp4),
            Text(
              '${pack.wordCount} words', //MOCKDATA
              style: const TextStyle(
                fontSize: 12,
                color: KColors.textSecondary,
              ),
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
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: KColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: KSpacing.sp8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColors.brand500,
                  foregroundColor: KColors.neutral0,
                  shape: RoundedRectangleBorder(borderRadius: KRadius.sm),
                  padding: const EdgeInsets.symmetric(
                    vertical: KSpacing.sp8,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
                child: Text(l10n.shopGetPack),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
