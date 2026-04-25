import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

// =============================================================================
// ProgressRing — circular progress indicator with percentage text in center.
// Uses CustomPainter. No hardcoded colors — defaults from tokens.dart.
// =============================================================================

class ProgressRing extends StatelessWidget {
  const ProgressRing({
    super.key,
    required this.progress,
    this.size = 56,
    this.color,
    this.trackColor,
    this.strokeWidth = 4,
    this.showLabel = true,
  });

  /// Progress value between 0.0 and 1.0.
  final double progress;

  /// Diameter of the ring in logical pixels. Defaults to 56.
  final double size;

  /// Arc color. Defaults to [KColors.brand500].
  final Color? color;

  /// Track (background arc) color. Defaults to [KColors.neutral200].
  final Color? trackColor;

  /// Stroke width. Defaults to 4.
  final double strokeWidth;

  /// Whether to show the percentage label in the center.
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final arcColor   = color ?? KColors.brand500;
    final track      = trackColor ?? KColors.neutral200;
    final clampedP   = progress.clamp(0.0, 1.0);
    final percent    = (clampedP * 100).round();

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RingPainter(
          progress: clampedP,
          arcColor: arcColor,
          trackColor: track,
          strokeWidth: strokeWidth,
        ),
        child: showLabel
            ? Center(
                child: Text(
                  '$percent%',
                  style: KTypography.getStyle(KTextStyle.label, locale)
                      .copyWith(color: arcColor),
                ),
              )
            : null,
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.progress,
    required this.arcColor,
    required this.trackColor,
    required this.strokeWidth,
  });

  final double progress;
  final Color arcColor;
  final Color trackColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect   = Rect.fromCircle(center: center, radius: radius);

    // Track arc (full circle)
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    // Progress arc
    if (progress > 0) {
      final progressPaint = Paint()
        ..color = arcColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        rect,
        -math.pi / 2,          // start at 12 o'clock
        2 * math.pi * progress, // sweep angle
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.arcColor != arcColor ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.strokeWidth != strokeWidth;
}
