import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// SnapScreen — SNA-01 camera/text capture entry point.
// Dark background: KColors.snapBgDark — design exception, no KScaffold.
// =============================================================================

const _kSnapDarkBg = KColors.snapBgDark;

final _advancedVisibleProvider = StateProvider<bool>((ref) => false);
final _snapTabProvider = StateProvider<int>((ref) => 0);
final _flashOnProvider = StateProvider<bool>((ref) => false);
final _gridOnProvider = StateProvider<bool>((ref) => false);

class SnapScreen extends ConsumerStatefulWidget {
  const SnapScreen({super.key});

  @override
  ConsumerState<SnapScreen> createState() => _SnapScreenState();
}

class _SnapScreenState extends ConsumerState<SnapScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _captureAnim;

  @override
  void initState() {
    super.initState();
    _captureAnim = AnimationController(
      vsync: this,
      duration: KMotion.fast,
      lowerBound: 0.88,
      upperBound: 1.0,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _captureAnim.dispose();
    super.dispose();
  }

  Future<void> _onCapture() async {
    await _captureAnim.reverse();
    await _captureAnim.forward();
    if (mounted) context.push('/snap/processing');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final advancedVisible = ref.watch(_advancedVisibleProvider);
    final selectedTab = ref.watch(_snapTabProvider);
    final flashOn = ref.watch(_flashOnProvider);
    final gridOn = ref.watch(_gridOnProvider);

    return Scaffold(
      backgroundColor: _kSnapDarkBg,
      body: SafeArea(
        child: Stack(
          children: [
            // Camera viewfinder
            Positioned.fill(
              child: _CameraViewfinder(
                showGrid: gridOn,
                label: l10n.snapCameraViewfinder,
              ),
            ),

            // Top-right "•••" button + advanced panel
            Positioned(
              top: KSpacing.sp16,
              right: KSpacing.sp16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => ref
                        .read(_advancedVisibleProvider.notifier)
                        .state = !advancedVisible,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: KColors.neutral0.withValues(alpha: 0.15),
                        borderRadius: KRadius.full,
                        border: Border.all(
                          color: KColors.neutral0.withValues(alpha: 0.30),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '•••',
                          style: TextStyle(
                            color: KColors.neutral0,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (advancedVisible) ...[
                    const SizedBox(height: KSpacing.sp8),
                    _AdvancedPanel(
                      flashOn: flashOn,
                      gridOn: gridOn,
                      flashLabel: l10n.snapFlash,
                      gridLabel: l10n.snapGrid,
                      onFlashToggle: () => ref
                          .read(_flashOnProvider.notifier)
                          .state = !flashOn,
                      onGridToggle: () => ref
                          .read(_gridOnProvider.notifier)
                          .state = !gridOn,
                    ),
                  ],
                ],
              ),
            ),

            // Bottom: capture button + tab bar
            Positioned(
              left: 0,
              right: 0,
              bottom: KSpacing.sp32,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (selectedTab == 0) ...[
                    Center(
                      child: ScaleTransition(
                        scale: _captureAnim,
                        child: _CaptureButton(onTap: _onCapture),
                      ),
                    ),
                    const SizedBox(height: KSpacing.sp24),
                  ],
                  Center(
                    child: _SnapTabBar(
                      selectedIndex: selectedTab,
                      cameraLabel: l10n.snapTabCamera,
                      textLabel: l10n.snapTabText,
                      onTabChanged: (i) {
                        ref.read(_snapTabProvider.notifier).state = i;
                        if (i == 1) context.push('/snap/text');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _CameraViewfinder extends StatelessWidget {
  const _CameraViewfinder({required this.showGrid, required this.label});
  final bool showGrid;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [KColors.snapBgDark, KColors.snapBgMid, KColors.snapBgDark],
            ),
          ),
        ),
        Positioned(top: 80, left: 40, right: 40, bottom: 160,
          child: CustomPaint(painter: _BracketsPainter()),
        ),
        if (showGrid)
          Positioned.fill(child: CustomPaint(painter: _GridPainter())),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.camera_enhance_outlined,
                  color: Colors.white38, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BracketsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const len = 24.0;
    final p = Paint()
      ..color = KColors.brand400
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    // TL
    canvas.drawLine(Offset(0, len), Offset.zero, p);
    canvas.drawLine(Offset.zero, Offset(len, 0), p);
    // TR
    canvas.drawLine(Offset(size.width - len, 0), Offset(size.width, 0), p);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, len), p);
    // BL
    canvas.drawLine(Offset(0, size.height - len), Offset(0, size.height), p);
    canvas.drawLine(Offset(0, size.height), Offset(len, size.height), p);
    // BR
    canvas.drawLine(Offset(size.width - len, size.height),
        Offset(size.width, size.height), p);
    canvas.drawLine(Offset(size.width, size.height - len),
        Offset(size.width, size.height), p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = KColors.neutral0.withValues(alpha: 0.12)
      ..strokeWidth = 0.8;
    final tw = size.width / 3;
    final th = size.height / 3;
    for (int i = 1; i <= 2; i++) {
      canvas.drawLine(Offset(tw * i, 0), Offset(tw * i, size.height), p);
      canvas.drawLine(Offset(0, th * i), Offset(size.width, th * i), p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _CaptureButton extends StatelessWidget {
  const _CaptureButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: KColors.brand500,
          border: Border.all(color: KColors.brand400, width: 3),
          boxShadow: [
            BoxShadow(
              color: KColors.brand500.withValues(alpha: 0.50),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(Icons.camera_alt_rounded,
            color: KColors.neutral0, size: 30),
      ),
    );
  }
}

class _SnapTabBar extends StatelessWidget {
  const _SnapTabBar({
    required this.selectedIndex,
    required this.cameraLabel,
    required this.textLabel,
    required this.onTabChanged,
  });
  final int selectedIndex;
  final String cameraLabel;
  final String textLabel;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: KColors.neutral0.withValues(alpha: 0.12),
        borderRadius: KRadius.full,
        border: Border.all(color: KColors.neutral0.withValues(alpha: 0.20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TabChip(
            icon: Icons.camera_alt_rounded,
            label: cameraLabel,
            selected: selectedIndex == 0,
            onTap: () => onTabChanged(0),
          ),
          _TabChip(
            icon: Icons.text_fields_rounded,
            label: textLabel,
            selected: selectedIndex == 1,
            onTap: () => onTabChanged(1),
          ),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = selected
        ? KColors.neutral0
        : KColors.neutral0.withValues(alpha: 0.60);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: KMotion.fast,
        padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp20, vertical: KSpacing.sp8),
        decoration: BoxDecoration(
          color: selected ? KColors.brand500 : Colors.transparent,
          borderRadius: KRadius.full,
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 16, color: fg),
          const SizedBox(width: KSpacing.sp4),
          Text(label,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      selected ? FontWeight.w600 : FontWeight.w400,
                  color: fg)),
        ]),
      ),
    );
  }
}

class _AdvancedPanel extends StatelessWidget {
  const _AdvancedPanel({
    required this.flashOn,
    required this.gridOn,
    required this.flashLabel,
    required this.gridLabel,
    required this.onFlashToggle,
    required this.onGridToggle,
  });
  final bool flashOn;
  final bool gridOn;
  final String flashLabel;
  final String gridLabel;
  final VoidCallback onFlashToggle;
  final VoidCallback onGridToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp12),
      decoration: BoxDecoration(
        color: KColors.neutral0.withValues(alpha: 0.15),
        borderRadius: KRadius.md,
        border: Border.all(color: KColors.neutral0.withValues(alpha: 0.20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _Toggle(
            icon: flashOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
            label: flashLabel,
            active: flashOn,
            onTap: onFlashToggle,
          ),
          const SizedBox(height: KSpacing.sp8),
          _Toggle(
            icon: Icons.grid_on_rounded,
            label: gridLabel,
            active: gridOn,
            onTap: onGridToggle,
          ),
        ],
      ),
    );
  }
}

class _Toggle extends StatelessWidget {
  const _Toggle({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = active
        ? KColors.brand400
        : KColors.neutral0.withValues(alpha: 0.70);
    return GestureDetector(
      onTap: onTap,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(label,
            style: TextStyle(
                color: c, fontSize: 12, fontWeight: FontWeight.w500)),
        const SizedBox(width: KSpacing.sp8),
        Icon(icon, size: 20, color: c),
      ]),
    );
  }
}
