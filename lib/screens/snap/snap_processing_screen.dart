import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_cta_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/snap/snap_results_screen.dart';

// SNA-04 — Processing screen
// Auto-navigates to results after 2s mock delay //MOCKDATA

class SnapProcessingScreen extends ConsumerStatefulWidget {
  const SnapProcessingScreen({super.key});

  @override
  ConsumerState<SnapProcessingScreen> createState() =>
      _SnapProcessingScreenState();
}

class _SnapProcessingScreenState extends ConsumerState<SnapProcessingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () { //MOCKDATA
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SnapResultsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KStitchScaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              const KokoAnimation(
                state: KokoState.thinking,
                size: 160,
              ),
              const SizedBox(height: KSpacing.sp32),

              Text(
                l10n.snapProcessingTitle,
                style: KTypography.getStyle(KTextStyle.h2, locale)
                    .copyWith(color: KColors.neutral900),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSpacing.sp24),

              const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(KRadius.radiusFull)),
                child: LinearProgressIndicator(
                  minHeight: KSpacing.sp8,
                  backgroundColor: KColors.neutral200,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(KColors.brand400),
                ),
              ),
              const SizedBox(height: KSpacing.sp24),

              Text(
                l10n.snapProcessingSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale)
                    .copyWith(color: KColors.textSecondary),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              Center(
                child: KGhostButton(
                  label: l10n.snapProcessingCancel,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),

              const SizedBox(height: KSpacing.sp32),
            ],
          ),
        ),
      ),
    );
  }
}
