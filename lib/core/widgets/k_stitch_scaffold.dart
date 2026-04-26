import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_ambient_orbs.dart';

/// STITCH-compliant scaffold with ambient orbs and optional sticky header.
///
/// Does NOT own ScaffoldMessenger — callers continue to use
/// ScaffoldMessenger.of(context) directly (avoids snackbar coupling).
///
/// Signature:
///   KStitchScaffold({
///     required Widget body,
///     Widget? stickyHeader,
///     bool showOrbs = true,
///     Widget? bottomNavigationBar,
///     Widget? floatingActionButton,
///     Color? backgroundColor,
///     Key? key,
///   })
class KStitchScaffold extends StatelessWidget {
  const KStitchScaffold({
    required this.body,
    this.stickyHeader,
    this.showOrbs = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    super.key,
  });

  final Widget body;
  final Widget? stickyHeader;
  final bool showOrbs;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? KColors.pageBg,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          if (showOrbs) const Positioned.fill(child: KAmbientOrbs()),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                if (stickyHeader != null) stickyHeader!,
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Standard onboarding header with brand wordmark, optional back arrow,
/// and optional step progress bar.
class KOnboardingHeader extends StatelessWidget {
  const KOnboardingHeader({
    this.onBack,
    this.stepCurrent,
    this.stepTotal,
    super.key,
  });

  final VoidCallback? onBack;
  final int? stepCurrent;
  final int? stepTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.pageBg,
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp16,
        vertical: KSpacing.sp8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (onBack != null)
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: KColors.brand400,
                  onPressed: onBack,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                )
              else
                const SizedBox(width: 40),
              const Expanded(
                child: Text(
                  'Kotoka',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: KColors.brand400,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              if (stepCurrent != null && stepTotal != null)
                Text(
                  'Step $stepCurrent of $stepTotal',
                  style: const TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: KColors.textSecondary,
                  ),
                )
              else
                const SizedBox(width: 40),
            ],
          ),
          if (stepCurrent != null && stepTotal != null) ...[
            const SizedBox(height: KSpacing.sp8),
            _StepProgressBar(current: stepCurrent!, total: stepTotal!),
          ],
        ],
      ),
    );
  }
}

class _StepProgressBar extends StatelessWidget {
  const _StepProgressBar({required this.current, required this.total});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        final filled = i < current;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: i < total - 1 ? KSpacing.sp4 : 0),
            height: 6,
            decoration: BoxDecoration(
              color: filled
                  ? KColors.brand400
                  : KColors.neutral200,
              borderRadius: BorderRadius.circular(KRadius.radiusFull),
              boxShadow: filled
                  ? [
                      BoxShadow(
                        color: KColors.brand400.withValues(alpha: 0.40),
                        blurRadius: 4,
                      ),
                    ]
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
