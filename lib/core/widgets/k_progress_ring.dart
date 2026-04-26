import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

/// Circular progress ring backed by a CustomPainter.
/// [value] is 0.0–1.0. Child is centered inside via Stack.
class KProgressRing extends StatelessWidget {
  const KProgressRing({
    required this.value,
    required this.size,
    this.trackColor,
    this.fillColor,
    this.strokeWidth = 6.0,
    this.child,
    super.key,
  });
  final double value;
  final double size;
  final Color? trackColor;
  final Color? fillColor;
  final double strokeWidth;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RingPainter(
          value: value,
          trackColor: trackColor ?? KColors.neutral200,
          fillColor: fillColor ?? KColors.brand400,
          strokeWidth: strokeWidth,
        ),
        child: child != null ? Center(child: child) : null,
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.value,
    required this.trackColor,
    required this.fillColor,
    required this.strokeWidth,
  });
  final double value;
  final Color trackColor;
  final Color fillColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.45;

    canvas.drawCircle(
      Offset(cx, cy),
      r,
      Paint()
        ..color = trackColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke,
    );

    final rect = Rect.fromCircle(center: Offset(cx, cy), radius: r);
    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * value,
      false,
      Paint()
        ..color = fillColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.value != value ||
      old.trackColor != trackColor ||
      old.fillColor != fillColor ||
      old.strokeWidth != strokeWidth;
}
