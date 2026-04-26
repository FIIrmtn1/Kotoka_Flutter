import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/api/rate_limiter.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// SnapProcessingScreen — Koko thinking + animated dots while Gemini processes.
// Auto-navigates to /snap/results after mock 2 s delay.
// Rate limiter: RateLimiter.gemini (14 RPM) called before API request.
// =============================================================================

class SnapProcessingScreen extends StatefulWidget {
  const SnapProcessingScreen({super.key});

  @override
  State<SnapProcessingScreen> createState() => _SnapProcessingScreenState();
}

class _SnapProcessingScreenState extends State<SnapProcessingScreen> {
  int _dotCount = 1;
  late final Timer _dotTimer;
  late final Timer _navTimer;

  @override
  void initState() {
    super.initState();
    _dotTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (mounted) setState(() => _dotCount = (_dotCount % 3) + 1);
    });
    _callGeminiAndNavigate();
  }

  Future<void> _callGeminiAndNavigate() async {
    // Enforce 14 RPM rate limit before Gemini API call
    try {
      await RateLimiter.instance.acquire(RateLimiterEndpoint.gemini);
    } on RateLimitException {
      // Rate limited — still navigate after delay in mock mode
    }

    // Mock 2 s processing delay //MOCKDATA
    _navTimer = Timer(const Duration(seconds: 2), () { //MOCKDATA
      if (mounted) context.pushReplacement('/snap/results');
    });
  }

  @override
  void dispose() {
    _dotTimer.cancel();
    _navTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final dots = '.' * _dotCount;

    return KScaffold(
      showOrbs: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const KokoAnimation(
                state: KokoState.thinking,
                size: 160,
                semanticsLabel: 'Koko thinking',
              ),
              const SizedBox(height: KSpacing.sp32),
              Text(
                '${l10n.snapProcessingTitle}$dots',
                style: KTypography.getStyle(KTextStyle.h3, locale)
                    .copyWith(color: KColors.brand500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSpacing.sp12),
              Text(
                l10n.snapProcessingSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale)
                    .copyWith(color: KColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSpacing.sp48),
              TextButton(
                onPressed: () => context.pop(),
                child: Text(
                  l10n.snapProcessingCancel,
                  style: KTypography.getStyle(KTextStyle.button, locale)
                      .copyWith(color: KColors.brand500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
