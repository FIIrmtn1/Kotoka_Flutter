import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

/// Standard surface card — white bg, xl corners, shadow2, brand400 20% border.
class KCard extends StatelessWidget {
  const KCard({required this.child, this.padding, super.key});
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: BorderRadius.circular(KRadius.radiusXl),
        border: Border.all(color: KColors.brand400.withValues(alpha: 0.20)),
        boxShadow: KElevation.shadow2,
      ),
      child: child,
    );
  }
}

/// Glassmorphism card — white 80% opacity + BackdropFilter blur, brand400 20% border.
class KGlassCard extends StatelessWidget {
  const KGlassCard({required this.child, this.padding, super.key});
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(KRadius.radiusXl),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: KColors.neutral0.withValues(alpha: 0.80),
            borderRadius: BorderRadius.circular(KRadius.radiusXl),
            border: Border.all(color: KColors.brand400.withValues(alpha: 0.20)),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Selected-state card — brand50 bg, brand400 30% border (2px), shadow2 + brand400 10% glow.
class KSelectedCard extends StatelessWidget {
  const KSelectedCard({required this.child, this.padding, super.key});
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: KColors.brand50,
        borderRadius: BorderRadius.circular(KRadius.radiusXl),
        border: Border.all(
          color: KColors.brand400.withValues(alpha: 0.30),
          width: 2,
        ),
        boxShadow: [
          ...KElevation.shadow2,
          BoxShadow(
            color: KColors.brand400.withValues(alpha: 0.10),
            blurRadius: 20,
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Tinted card — accepts gradient OR color; used for streak hero, etc.
class KTintedCard extends StatelessWidget {
  const KTintedCard({
    required this.child,
    this.gradient,
    this.color,
    this.padding,
    this.borderRadius,
    super.key,
  });
  final Widget child;
  final Gradient? gradient;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(KRadius.radiusMd);
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? color : null,
        borderRadius: radius,
      ),
      child: child,
    );
  }
}
