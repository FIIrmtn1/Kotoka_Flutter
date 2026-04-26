import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

// =============================================================================
// KSectionHeader — section heading in brand600, FontWeight.w600.
// =============================================================================

class KSectionHeader extends StatelessWidget {
  const KSectionHeader(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Text(
      text,
      style: KTypography.getStyle(KTextStyle.h4, locale).copyWith(
        color: KColors.brand600,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
