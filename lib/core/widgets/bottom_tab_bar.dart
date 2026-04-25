import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class KBottomTabBar extends StatelessWidget {
  const KBottomTabBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final items = <_TabItem>[
      _TabItem(
        label: l10n.navHome,
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
      ),
      _TabItem(
        label: l10n.navSnap,
        icon: Icons.camera_alt_outlined,
        activeIcon: Icons.camera_alt,
      ),
      _TabItem(
        label: l10n.navReview,
        icon: Icons.auto_stories_outlined,
        activeIcon: Icons.auto_stories,
      ),
      _TabItem(
        label: l10n.navShop,
        icon: Icons.storefront_outlined,
        activeIcon: Icons.storefront,
      ),
      _TabItem(
        label: l10n.navProfile,
        icon: Icons.person_outline,
        activeIcon: Icons.person,
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: KColors.surfacePrimary,
        border: Border(
          top: BorderSide(color: KColors.borderDefault, width: 1),
        ),
        boxShadow: KElevation.shadow2,
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: KSpacing.sp64,
          child: Row(
            children: List.generate(items.length, (index) {
              return _TabButton(
                item: items[index],
                isActive: currentIndex == index,
                onTap: () => onTap(index),
              );
            }),
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
  });

  final _TabItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? KColors.brand500 : KColors.neutral500;

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
                if (isActive)
                  Container(
                    width: KSpacing.sp32,
                    height: KSpacing.sp4,
                    decoration: BoxDecoration(
                      color: KColors.brand500,
                      borderRadius: KRadius.full,
                    ),
                  )
                else
                  SizedBox(height: KSpacing.sp4),
                SizedBox(height: KSpacing.sp4),
                Icon(
                  isActive ? item.activeIcon : item.icon,
                  color: color,
                  size: KSpacing.sp24,
                ),
                SizedBox(height: KSpacing.sp4),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight:
                        isActive ? FontWeight.w600 : FontWeight.w400,
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
