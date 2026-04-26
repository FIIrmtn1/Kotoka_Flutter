import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/providers/due_cards_provider.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class KBottomTabBar extends ConsumerWidget {
  const KBottomTabBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dueCount = ref.watch(dueCardsCountProvider);

    final items = <_TabItem>[
      _TabItem(label: l10n.navHome,    icon: Icons.home_outlined,         activeIcon: Icons.home),
      _TabItem(label: l10n.navSnap,    icon: Icons.camera_alt_outlined,   activeIcon: Icons.camera_alt),
      _TabItem(label: l10n.navReview,  icon: Icons.auto_stories_outlined, activeIcon: Icons.auto_stories),
      _TabItem(label: l10n.navShop,    icon: Icons.storefront_outlined,   activeIcon: Icons.storefront),
      _TabItem(label: l10n.navProfile, icon: Icons.person_outline,        activeIcon: Icons.person),
    ];

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.90),
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.20),
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: KSpacing.sp64,
              child: Row(
                children: List.generate(items.length, (index) {
                  final badgeCount = index == 2 ? dueCount : 0;
                  return _TabButton(
                    item: items[index],
                    isActive: currentIndex == index,
                    badgeCount: badgeCount,
                    onTap: () => onTap(index),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.item,
    required this.isActive,
    required this.onTap,
    this.badgeCount = 0,
  });

  final _TabItem item;
  final bool isActive;
  final VoidCallback onTap;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? KColors.brand400 : Theme.of(context).colorScheme.onSurfaceVariant;

    return Expanded(
      child: Semantics(
        label: item.label,
        selected: isActive,
        button: true,
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            height: KSpacing.sp64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: KMotion.fast,
                  padding: const EdgeInsets.symmetric(
                    horizontal: KSpacing.sp12,
                    vertical: KSpacing.sp4,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? KColors.brand400.withValues(alpha: 0.10)
                        : Colors.transparent,
                    borderRadius: KRadius.xl,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        isActive ? item.activeIcon : item.icon,
                        color: color,
                        size: KSpacing.sp24,
                      ),
                      if (badgeCount > 0)
                        Positioned(
                          top: -4,
                          right: -8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: KColors.error500,
                              borderRadius: KRadius.full,
                            ),
                            child: Text(
                              '$badgeCount',
                              style: const TextStyle(
                                color: KColors.neutral0,
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: KSpacing.sp2),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                    color: color,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabItem {
  const _TabItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}
