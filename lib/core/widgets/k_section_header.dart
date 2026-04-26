import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

/// Section header row: bold title on left, optional tappable action on right.
class KSectionHeader extends StatelessWidget {
  const KSectionHeader({
    required this.title,
    this.actionLabel,
    this.onAction,
    super.key,
  });
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: KColors.neutral900,
          ),
        ),
        const Spacer(),
        if (actionLabel != null && onAction != null)
          GestureDetector(
            onTap: onAction,
            child: Row(
              children: [
                Text(
                  actionLabel!,
                  style: const TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: KColors.brand400,
                  ),
                ),
                const Icon(Icons.chevron_right, color: KColors.brand400, size: 18),
              ],
            ),
          ),
      ],
    );
  }
}
