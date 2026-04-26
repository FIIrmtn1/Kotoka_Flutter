import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

/// Primary CTA button — brand700 fill, white text, 52px height.
class KCtaButton extends StatefulWidget {
  const KCtaButton({
    required this.label,
    required this.onPressed,
    this.fullWidth = true,
    super.key,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool fullWidth;

  @override
  State<KCtaButton> createState() => _KCtaButtonState();
}

class _KCtaButtonState extends State<KCtaButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTapDown: widget.onPressed != null ? (_) => setState(() => _pressed = true) : null,
      onTapUp: widget.onPressed != null
          ? (_) {
              setState(() => _pressed = false);
              widget.onPressed!();
            }
          : null,
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: KMotion.fast,
        child: Container(
          height: 52,
          width: widget.fullWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
          decoration: BoxDecoration(
            color: widget.onPressed != null ? KColors.brand700 : KColors.neutral300,
            borderRadius: BorderRadius.circular(KRadius.radiusMd),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: KColors.neutral0,
              ),
            ),
          ),
        ),
      ),
    );
    return button;
  }
}

/// Cyan pill button — brand400 fill, neutral900 text, full-radius corners, 48px height.
class KCyanPillButton extends StatefulWidget {
  const KCyanPillButton({
    required this.label,
    required this.onPressed,
    super.key,
  });
  final String label;
  final VoidCallback? onPressed;

  @override
  State<KCyanPillButton> createState() => _KCyanPillButtonState();
}

class _KCyanPillButtonState extends State<KCyanPillButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onPressed != null ? (_) => setState(() => _pressed = true) : null,
      onTapUp: widget.onPressed != null
          ? (_) {
              setState(() => _pressed = false);
              widget.onPressed!();
            }
          : null,
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: KMotion.fast,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
          decoration: BoxDecoration(
            color: KColors.brand400,
            borderRadius: BorderRadius.circular(KRadius.radiusFull),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: KColors.neutral900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Ghost / outlined button — transparent fill, brand400 border + text.
class KGhostButton extends StatefulWidget {
  const KGhostButton({
    required this.label,
    required this.onPressed,
    super.key,
  });
  final String label;
  final VoidCallback? onPressed;

  @override
  State<KGhostButton> createState() => _KGhostButtonState();
}

class _KGhostButtonState extends State<KGhostButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onPressed != null ? (_) => setState(() => _pressed = true) : null,
      onTapUp: widget.onPressed != null
          ? (_) {
              setState(() => _pressed = false);
              widget.onPressed!();
            }
          : null,
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: KMotion.fast,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(KRadius.radiusMd),
            border: Border.all(color: KColors.brand400),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: KColors.brand400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
