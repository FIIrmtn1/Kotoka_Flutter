import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

/// Ambient background blur orbs — placed behind screen content.
/// Usage: wrap your Scaffold body in a Stack with KAmbientOrbs as first child,
/// or use KStitchScaffold which includes this automatically.
class KAmbientOrbs extends StatelessWidget {
  const KAmbientOrbs({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-right warm orb
        Positioned(
          top: -80,
          right: -80,
          child: IgnorePointer(
            child: _Orb(
              size: 300,
              color: KColors.brand50.withValues(alpha: 0.60),
            ),
          ),
        ),
        // Bottom-left cool orb
        Positioned(
          bottom: -80,
          left: -80,
          child: IgnorePointer(
            child: _Orb(
              size: 280,
              color: KColors.sky100.withValues(alpha: 0.50),
            ),
          ),
        ),
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
