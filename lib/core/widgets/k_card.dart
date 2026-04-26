import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

// =============================================================================
// KCard — white card with brand400 border, selection animation.
// Selected: brand400/5 bg, brand400 border 2px, 180ms animation.
// =============================================================================

class KCard extends StatelessWidget {
  const KCard({
    super.key,
    required this.child,
    this.padding,
    this.selected = false,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: KMotion.defaultCurve,
      decoration: BoxDecoration(
        color: selected
            ? KColors.brand400.withValues(alpha: 0.05)
            : KColors.neutral0,
        borderRadius: KRadius.md,
        border: Border.all(
          color: selected
              ? KColors.brand400
              : KColors.brand400.withValues(alpha: 0.20),
          width: selected ? 2.0 : 1.0,
        ),
        boxShadow: selected ? null : KElevation.shadow1,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: KRadius.md,
        child: InkWell(
          onTap: onTap,
          borderRadius: KRadius.md,
          splashColor: KColors.brand400.withValues(alpha: 0.08),
          highlightColor: KColors.brand400.withValues(alpha: 0.04),
          child: Padding(
            padding: padding ??
                const EdgeInsets.all(KSpacing.sp16),
            child: child,
          ),
        ),
      ),
    );
  }
}
