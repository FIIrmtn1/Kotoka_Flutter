import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

// =============================================================================
// KAmbientOrbs — decorative blurred background orbs.
// Pointer-events disabled (IgnorePointer). No hardcoded hex.
// =============================================================================

class KAmbientOrbs extends StatelessWidget {
  const KAmbientOrbs({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          // Top-right orb — brand400 at 7% opacity, 200px, blur 40
          Positioned(
            top: -40,
            right: -40,
            child: _Orb(
              size: 200,
              color: KColors.brand400.withValues(alpha: 0.07),
              blurRadius: 40,
            ),
          ),
          // Bottom-left orb — sky100 at 10% opacity, 180px, blur 40
          Positioned(
            bottom: -30,
            left: -30,
            child: _Orb(
              size: 180,
              color: KColors.sky100.withValues(alpha: 0.10),
              blurRadius: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({
    required this.size,
    required this.color,
    required this.blurRadius,
  });

  final double size;
  final Color color;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
