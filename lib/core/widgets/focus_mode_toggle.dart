import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/providers/koko_visible_provider.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

/// Labeled Switch atom that toggles Koko character visibility app-wide.
/// Emits to [kokoVisibleProvider]. Design tokens only — no hardcoded values.
class FocusModeToggle extends ConsumerWidget {
  const FocusModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final kokoVisible = ref.watch(kokoVisibleProvider);

    return Semantics(
      label: kokoVisible
          ? l10n.a11yFocusToggleOn
          : l10n.a11yFocusToggleOff,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.onbWelcomeFocusToggle,
                  style: KTypography.getStyle(KTextStyle.body, locale)
                      .copyWith(color: KColors.textPrimary),
                ),
                const SizedBox(height: KSpacing.sp2),
                Text(
                  l10n.onbWelcomeFocusToggleHint,
                  style: KTypography.getStyle(KTextStyle.caption, locale)
                      .copyWith(color: KColors.textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(width: KSpacing.sp12),
          Switch(
            value: !kokoVisible,
            onChanged: (value) {
              ref.read(kokoVisibleProvider.notifier).set(!value);
            },
            activeColor: KColors.brand500,
            activeTrackColor: KColors.brand500,
            inactiveThumbColor: KColors.neutral400,
            inactiveTrackColor: KColors.neutral200,
          ),
        ],
      ),
    );
  }
}
