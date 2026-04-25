import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/snap/snap_processing_screen.dart';

// SNA-02 — Snap Text Input Mode

class SnapTextScreen extends ConsumerStatefulWidget {
  const SnapTextScreen({super.key});

  @override
  ConsumerState<SnapTextScreen> createState() => _SnapTextScreenState();
}

class _SnapTextScreenState extends ConsumerState<SnapTextScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onGenerate() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SnapProcessingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.brand50,
      appBar: AppBar(
        backgroundColor: KColors.brand50,
        elevation: KElevation.elevation0,
        title: Text(
          l10n.snapTitle,
          style: KTypography.getStyle(KTextStyle.h3, locale)
              .copyWith(color: KColors.neutral900),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tab row indicator
              _SnapTabIndicator(l10n: l10n, locale: locale),
              const SizedBox(height: KSpacing.sp24),

              Text(
                l10n.snapTextPrompt,
                style: KTypography.getStyle(KTextStyle.h4, locale)
                    .copyWith(color: KColors.neutral900),
              ),
              const SizedBox(height: KSpacing.sp16),

              // Text field
              Container(
                decoration: BoxDecoration(
                  color: KColors.neutral0,
                  borderRadius: KRadius.md,
                  border: Border.all(color: KColors.borderDefault),
                  boxShadow: KElevation.shadow1,
                ),
                child: TextField(
                  controller: _controller,
                  maxLines: 6,
                  maxLength: 200,
                  decoration: InputDecoration(
                    hintText: l10n.snapTextHint,
                    hintStyle: KTypography.getStyle(KTextStyle.body, locale)
                        .copyWith(color: KColors.textDisabled),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(KSpacing.sp16),
                    counterStyle: KTypography.getStyle(KTextStyle.caption, locale),
                  ),
                  style: KTypography.getStyle(KTextStyle.body, locale),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(height: KSpacing.sp12),

              // Paste + mic icons
              Row(
                children: [
                  _GhostIconButton(
                    icon: Icons.content_paste_outlined,
                    onTap: () async {
                      // paste from clipboard placeholder
                    },
                  ),
                  const SizedBox(width: KSpacing.sp8),
                  _GhostIconButton(
                    icon: Icons.mic_outlined,
                    onTap: () {
                      // mic input placeholder
                    },
                  ),
                ],
              ),

              const Spacer(),

              KotokaButton(
                label: l10n.snapTextGenerate,
                onPressed: _controller.text.trim().isEmpty ? null : _onGenerate,
                variant: KotokaButtonVariant.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SnapTabIndicator extends StatelessWidget {
  const _SnapTabIndicator({required this.l10n, required this.locale});

  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TabChip(label: l10n.snapTabCamera, isActive: false, locale: locale),
        const SizedBox(width: KSpacing.sp8),
        _TabChip(label: l10n.snapTabText, isActive: true, locale: locale),
        const SizedBox(width: KSpacing.sp8),
        _TabChip(label: l10n.snapTabGps, isActive: false, locale: locale),
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.isActive,
    required this.locale,
  });

  final String label;
  final bool isActive;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp16,
        vertical: KSpacing.sp8,
      ),
      decoration: BoxDecoration(
        color: isActive ? KColors.brand500 : KColors.neutral100,
        borderRadius: KRadius.full,
      ),
      child: Text(
        label,
        style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
          color: isActive ? KColors.neutral0 : KColors.neutral600,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _GhostIconButton extends StatelessWidget {
  const _GhostIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: KSpacing.sp48,
        height: KSpacing.sp48,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: KRadius.sm,
          border: Border.all(color: KColors.borderDefault),
        ),
        child: Icon(icon, color: KColors.brand500, size: KSpacing.sp20),
      ),
    );
  }
}
