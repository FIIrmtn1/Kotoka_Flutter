import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ShopScreen — SHO-03
// - Beta banner at very top (brand400/10 bg, brand600 text)
// - No premium pricing
// - Grid of vocab pack cards with "Get Free" button
// - "Free in beta" badge on every pack
// =============================================================================

class _PackData {
  const _PackData({
    required this.name,
    required this.description,
    required this.langPair,
    required this.icon,
  });

  final String name;
  final String description;
  final String langPair;
  final IconData icon;
}

// Mock vocab packs — replace with Firestore query in production.
const _mockPacks = <_PackData>[
  _PackData( //MOCKDATA
    name: 'Workplace Thai',
    description: 'Essential vocab for meetings, emails, and office life',
    langPair: 'EN → TH',
    icon: Icons.business_center_outlined,
  ),
  _PackData( //MOCKDATA
    name: 'Street Food Lover',
    description: 'Order food like a local at any market or stall',
    langPair: 'EN → TH',
    icon: Icons.restaurant_menu_outlined,
  ),
  _PackData( //MOCKDATA
    name: 'Travel Essentials',
    description: 'Navigate transport, hotels, and tourist sites',
    langPair: 'EN → ZH',
    icon: Icons.flight_outlined,
  ),
  _PackData( //MOCKDATA
    name: 'Daily Mandarin',
    description: 'Greetings, shopping, and everyday conversation',
    langPair: 'EN → ZH',
    icon: Icons.chat_bubble_outline,
  ),
  _PackData( //MOCKDATA
    name: 'Business Spanish',
    description: 'Professional phrases for meetings and negotiations',
    langPair: 'EN → ES',
    icon: Icons.handshake_outlined,
  ),
  _PackData( //MOCKDATA
    name: 'Vietnamese Basics',
    description: 'Core vocabulary for beginners visiting Vietnam',
    langPair: 'EN → VI',
    icon: Icons.emoji_nature_outlined,
  ),
];

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.brand50,
      body: CustomScrollView(
        slivers: [
          // ----------------------------------------------------------------
          // App bar
          // ----------------------------------------------------------------
          SliverAppBar(
            backgroundColor: KColors.brand50,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            floating: true,
            title: Text(
              l10n.shopTitle,
              style: KTypography.getStyle(KTextStyle.h3, locale),
            ),
          ),

          // ----------------------------------------------------------------
          // Beta banner — SHO-03: brand400/10 bg, brand600 text
          // ----------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp16,
                0,
                KSpacing.sp16,
                KSpacing.sp8,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp16,
                  vertical: KSpacing.sp12,
                ),
                decoration: BoxDecoration(
                  color: KColors.brand400.withValues(alpha: 0.10),
                  borderRadius: KRadius.md,
                  border: Border.all(
                    color: KColors.brand400.withValues(alpha: 0.30),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.rocket_launch_outlined,
                      size: KSpacing.sp20,
                      color: KColors.brand400,
                    ),
                    const SizedBox(width: KSpacing.sp8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.shopBetaFreeTitle,
                            style: KTypography.getStyle(
                              KTextStyle.label,
                              locale,
                            ).copyWith(
                              color: KColors.brand600,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: KSpacing.sp2),
                          Text(
                            l10n.shopBetaFreeBody,
                            style: KTypography.getStyle(
                              KTextStyle.caption,
                              locale,
                            ).copyWith(color: KColors.brand600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ----------------------------------------------------------------
          // Vocab Packs section header
          // ----------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp16,
                KSpacing.sp8,
                KSpacing.sp16,
                KSpacing.sp12,
              ),
              child: Text(
                l10n.shopVocabPacks,
                style: KTypography.getStyle(KTextStyle.h4, locale)
                    .copyWith(color: KColors.brand600),
              ),
            ),
          ),

          // ----------------------------------------------------------------
          // Pack cards grid
          // ----------------------------------------------------------------
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              KSpacing.sp16,
              0,
              KSpacing.sp16,
              KSpacing.sp40,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: KSpacing.sp12,
                mainAxisSpacing: KSpacing.sp12,
                childAspectRatio: 0.78,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _PackCard(
                  pack: _mockPacks[index],
                  l10n: l10n,
                  locale: locale,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.shopBetaUnlocked),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: KColors.brand500,
                      ),
                    );
                  },
                ),
                childCount: _mockPacks.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _PackCard — individual vocab pack card
// ---------------------------------------------------------------------------
class _PackCard extends StatelessWidget {
  const _PackCard({
    required this.pack,
    required this.l10n,
    required this.locale,
    required this.onTap,
  });

  final _PackData pack;
  final AppLocalizations l10n;
  final Locale locale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.lg,
        boxShadow: KElevation.shadow2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(KSpacing.sp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pack icon
            Container(
              width: KSpacing.sp40,
              height: KSpacing.sp40,
              decoration: BoxDecoration(
                color: KColors.brand500.withValues(alpha: 0.10),
                borderRadius: KRadius.md,
              ),
              child: Icon(
                pack.icon,
                size: KSpacing.sp24,
                color: KColors.brand500,
              ),
            ),
            const SizedBox(height: KSpacing.sp8),

            // "Free in beta" badge — brand400/10 bg, brand400 text
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: KSpacing.sp8,
                vertical: KSpacing.sp2,
              ),
              decoration: BoxDecoration(
                color: KColors.brand400.withValues(alpha: 0.10),
                borderRadius: KRadius.sm,
              ),
              child: Text(
                l10n.shopBetaFree,
                style: KTypography.getStyle(KTextStyle.caption, locale)
                    .copyWith(
                  color: KColors.brand400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: KSpacing.sp8),

            // Pack name
            Text(
              pack.name,
              style: KTypography.getStyle(KTextStyle.h4, locale),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: KSpacing.sp4),

            // Description
            Expanded(
              child: Text(
                pack.description,
                style: KTypography.getStyle(KTextStyle.caption, locale),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Language pair chip
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: KSpacing.sp8,
                vertical: KSpacing.sp2,
              ),
              decoration: BoxDecoration(
                color: KColors.sky100,
                borderRadius: KRadius.sm,
              ),
              child: Text(
                pack.langPair,
                style: KTypography.getStyle(KTextStyle.caption, locale)
                    .copyWith(color: KColors.info500),
              ),
            ),
            const SizedBox(height: KSpacing.sp8),

            // Get Free button — brand500 CTA
            KotokaButton(
              label: l10n.shopGetFreePack,
              onPressed: onTap,
              variant: KotokaButtonVariant.primary,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
