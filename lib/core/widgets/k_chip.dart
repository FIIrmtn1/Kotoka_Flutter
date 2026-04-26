import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

// =============================================================================
// KChip — selectable pill chip.
// Selected: brand400/12 bg, brand400 border 2px, brand500 text bold.
// Unselected: white bg, brand400/25 border.
// =============================================================================

class KChip extends StatelessWidget {
  const KChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: KMotion.defaultCurve,
        padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp16,
          vertical: KSpacing.sp8,
        ),
        decoration: BoxDecoration(
          color: selected
              ? KColors.brand400.withValues(alpha: 0.12)
              : KColors.neutral0,
          borderRadius: KRadius.full,
          border: Border.all(
            color: selected
                ? KColors.brand400
                : KColors.brand400.withValues(alpha: 0.25),
            width: selected ? 2.0 : 1.0,
          ),
        ),
        child: Text(
          label,
          style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
            color: selected ? KColors.brand500 : KColors.textSecondary,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
