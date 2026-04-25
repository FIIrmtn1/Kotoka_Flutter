library;

import 'package:flutter/material.dart';

enum KokoAnimationState {
  idle,
  celebrating,
  thinking,
  waving,
  excited,
  encouraging,
}

const _assetMap = {
  KokoAnimationState.idle:        'Kokoanimation/koko-idle.webp',
  KokoAnimationState.celebrating: 'Kokoanimation/koko-celebrate.webp',
  KokoAnimationState.thinking:    'Kokoanimation/koko-thinking.webp',
  KokoAnimationState.waving:      'Kokoanimation/koko-wave.webp',
  KokoAnimationState.excited:     'Kokoanimation/koko-excited.webp',
  KokoAnimationState.encouraging: 'Kokoanimation/koko-encourage.webp',
};

class KokoAnimationWidget extends StatelessWidget {
  const KokoAnimationWidget({
    super.key,
    this.state = KokoAnimationState.idle,
    this.size = 120.0,
    this.semanticsLabel,
  });

  final KokoAnimationState state;
  final double size;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      image: true,
      child: Image.asset(
        _assetMap[state]!,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
