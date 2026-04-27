import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// SnapTextScreen — text input mode for snap.
// White background. Image placeholder + text field. Camera/Text toggle bottom.
// =============================================================================

class SnapTextScreen extends StatefulWidget {
  const SnapTextScreen({super.key});

  @override
  State<SnapTextScreen> createState() => _SnapTextScreenState();
}

class _SnapTextScreenState extends State<SnapTextScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAnalyze() {
    if (_controller.text.trim().isEmpty) return;
    context.push('/snap/processing');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.neutral0,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: KSpacing.sp16),

            // Text input — fills available space
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    KSpacing.sp24, KSpacing.sp8, KSpacing.sp24, KSpacing.sp12),
                child: Container(
                  decoration: BoxDecoration(
                    color: KColors.neutral50,
                    borderRadius: KRadius.md,
                    border: Border.all(color: KColors.borderDefault),
                  ),
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    autofocus: false,
                    style: KTypography.getStyle(KTextStyle.body, locale)
                        .copyWith(color: KColors.neutral900),
                    decoration: InputDecoration(
                      hintText: l10n.snapTextHint,
                      hintStyle:
                          KTypography.getStyle(KTextStyle.body, locale)
                              .copyWith(color: KColors.neutral400),
                      contentPadding: const EdgeInsets.all(KSpacing.sp16),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            // Generate button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  KotokaButton(
                    label: l10n.snapTextGenerate,
                    onPressed: _onAnalyze,
                  ),
                  const SizedBox(height: KSpacing.sp20),
                ],
              ),
            ),

            // Camera / Text toggle
            Padding(
              padding:
                  const EdgeInsets.only(bottom: KSpacing.sp24),
              child: Center(child: _SnapTabBar(
                cameraLabel: l10n.snapTabCamera,
                textLabel: l10n.snapTabText,
                onCameraTap: () {
                  FocusScope.of(context).unfocus();
                  context.pop();
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tab bar — Text tab selected (dark pill, matches camera mode)
// ---------------------------------------------------------------------------
class _SnapTabBar extends StatelessWidget {
  const _SnapTabBar({
    required this.cameraLabel,
    required this.textLabel,
    required this.onCameraTap,
  });
  final String cameraLabel;
  final String textLabel;
  final VoidCallback onCameraTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: KColors.neutral900.withValues(alpha: 0.10),
        borderRadius: KRadius.full,
        border: Border.all(
            color: KColors.neutral900.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TabChip(
            icon: Icons.camera_alt_rounded,
            label: cameraLabel,
            selected: false,
            onTap: onCameraTap,
          ),
          _TabChip(
            icon: Icons.text_fields_rounded,
            label: textLabel,
            selected: true,
            onTap: () {},
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
        : KColors.neutral700;
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
