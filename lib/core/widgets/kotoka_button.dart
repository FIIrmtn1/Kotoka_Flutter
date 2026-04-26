import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

// =============================================================================
// KotokaButton — branded button with 3 variants.
// No hardcoded colors or sizes — all values from tokens.dart.
// =============================================================================

enum KotokaButtonVariant { primary, secondary, ghost }

/// Branded button supporting primary, secondary, and ghost variants.
///
/// - primary  : brand-700 bg, white text
/// - secondary: brand-100 bg, brand-700 text
/// - ghost    : transparent bg, brand-700 text
///
/// Optional [leadingIcon] and [isLoading] state supported.
class KotokaButton extends StatelessWidget {
  const KotokaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = KotokaButtonVariant.primary,
    this.leadingIcon,
    this.isLoading = false,
    this.isFullWidth = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final KotokaButtonVariant variant;
  final IconData? leadingIcon;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    Color bgColor;
    Color textColor;
    Color borderColor;

    switch (variant) {
      case KotokaButtonVariant.primary:
        bgColor     = isDisabled ? KColors.neutral300 : KColors.brand400;
        textColor   = isDisabled ? KColors.neutral500 : KColors.neutral1000;
        borderColor = Colors.transparent;
        break;
      case KotokaButtonVariant.secondary:
        bgColor     = isDisabled ? KColors.neutral100 : Colors.transparent;
        textColor   = isDisabled ? KColors.neutral400 : KColors.brand400;
        borderColor = isDisabled ? Colors.transparent : KColors.brand400.withValues(alpha: 0.4);
        break;
      case KotokaButtonVariant.ghost:
        bgColor     = Colors.transparent;
        textColor   = isDisabled ? KColors.neutral400 : KColors.brand400;
        borderColor = Colors.transparent;
        break;
    }

    final content = Row(
      mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: KSpacing.sp16,
            height: KSpacing.sp16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: textColor,
            ),
          ),
          const SizedBox(width: KSpacing.sp8),
        ] else if (leadingIcon != null) ...[
          Icon(leadingIcon, size: KSpacing.sp20, color: textColor),
          const SizedBox(width: KSpacing.sp8),
        ],
        Text(
          label,
          style: KTypography.getStyle(KTextStyle.button, Localizations.localeOf(context))
              .copyWith(color: textColor),
        ),
      ],
    );

    final button = Material(
      color: bgColor,
      borderRadius: KRadius.full,
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        borderRadius: KRadius.full,
        splashColor: KColors.brand400.withValues(alpha: 0.2),
        highlightColor: KColors.brand400.withValues(alpha: 0.1),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: KSpacing.sp12,
            horizontal: KSpacing.sp24,
          ),
          decoration: BoxDecoration(
            borderRadius: KRadius.full,
            border: Border.all(color: borderColor),
          ),
          child: content,
        ),
      ),
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
