import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kokoanimation/kokoanimation.dart';
import 'package:kotoka_app/core/providers/koko_visible_provider.dart';

// =============================================================================
// KokoAnimation — wrapper around KokoAnimationWidget from kokoanimation package.
// Use KokoState enum to drive character expression.
// NO lottie, NO rive imports.
// =============================================================================

/// States the Koko character can express in the Kotoka UI.
enum KokoState {
  idle,
  celebrating,
  thinking,
  waving,
  excited,
  encouraging,
}

KokoAnimationState _mapState(KokoState state) {
  switch (state) {
    case KokoState.idle:        return KokoAnimationState.idle;
    case KokoState.celebrating: return KokoAnimationState.celebrating;
    case KokoState.thinking:    return KokoAnimationState.thinking;
    case KokoState.waving:      return KokoAnimationState.waving;
    case KokoState.excited:     return KokoAnimationState.excited;
    case KokoState.encouraging: return KokoAnimationState.encouraging;
  }
}

/// [KokoAnimation] renders the Koko character at a given [state] and [size].
///
/// Example:
/// ```dart
/// KokoAnimation(state: KokoState.idle, size: 160)
/// ```
class KokoAnimation extends ConsumerWidget {
  const KokoAnimation({
    super.key,
    required this.state,
    this.size = 120,
    this.semanticsLabel,
  });

  final KokoState state;
  final double size;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kokoVisible = ref.watch(kokoVisibleProvider);
    if (!kokoVisible) return const SizedBox.shrink();
    return KokoAnimationWidget(
      state: _mapState(state),
      size: size,
      semanticsLabel: semanticsLabel,
    );
  }
}
