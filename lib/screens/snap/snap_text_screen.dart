import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// SnapTextScreen — text input mode for snap.
// KScaffold (brand50 bg). KotokaTextField with brand400 focus border.
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

    return KScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: KColors.neutral900),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.snapTabText,
          style: KTypography.getStyle(KTextStyle.h4, locale)
              .copyWith(color: KColors.neutral900),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp24,
          vertical: KSpacing.sp16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.snapTextPrompt,
              style: KTypography.getStyle(KTextStyle.body, locale)
                  .copyWith(color: KColors.textSecondary),
            ),
            const SizedBox(height: KSpacing.sp12),
            // Multi-line text field
            Container(
              decoration: BoxDecoration(
                color: KColors.brand100,
                borderRadius: KRadius.md,
                border: Border.all(
                  color: KColors.brand400.withValues(alpha: 0.40),
                ),
              ),
              child: TextField(
                controller: _controller,
                maxLines: 8,
                minLines: 5,
                autofocus: true,
                style: KTypography.getStyle(KTextStyle.body, locale)
                    .copyWith(color: KColors.neutral900),
                decoration: InputDecoration(
                  hintText: l10n.snapTextHint,
                  hintStyle: KTypography.getStyle(KTextStyle.body, locale)
                      .copyWith(color: KColors.neutral500),
                  contentPadding: const EdgeInsets.all(KSpacing.sp16),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: KSpacing.sp24),
            KotokaButton(
              label: l10n.snapTextGenerate,
              onPressed: _onAnalyze,
            ),
          ],
        ),
      ),
    );
  }
}
