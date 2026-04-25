import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

/// A floating icon button that toggles between light and dark theme.
///
/// Usage — drop anywhere in a widget tree that has a [ProviderScope] ancestor:
/// ```dart
/// Scaffold(
///   floatingActionButton: const ThemeToggleButton(),
///   ...
/// )
/// ```
class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return FloatingActionButton(
      heroTag: 'theme_toggle',
      tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
      onPressed: () {
        ref.read(themeModeProvider.notifier).state =
            isDark ? ThemeMode.light : ThemeMode.dark;
      },
      child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
    );
  }
}
