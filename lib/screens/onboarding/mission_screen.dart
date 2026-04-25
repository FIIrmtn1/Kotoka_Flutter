import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/router/app_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

/// ONB-06 — First Mission Intro screen (was ONB-07 in phase1_1).
class MissionScreen extends ConsumerWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.brand50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const KokoAnimation(state: KokoState.celebrating, size: 160),
              const SizedBox(height: KSpacing.sp32),
              Text(
                l10n.onbMissionTitle, //MOCKDATA
                style: KTypography.getStyle(KTextStyle.h2, locale)
                    .copyWith(color: KColors.brand500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSpacing.sp12),
              Text(
                l10n.onbMissionBody, //MOCKDATA
                style: KTypography.getStyle(KTextStyle.body, locale)
                    .copyWith(color: KColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
              KotokaButton(
                label: l10n.letsGo,
                onPressed: () {
                  ref.read(authCompletedProvider.notifier).state = true; //MOCKDATA
                  context.go('/home');
                },
                variant: KotokaButtonVariant.primary,
              ),
              const SizedBox(height: KSpacing.sp32),
            ],
          ),
        ),
      ),
    );
  }
}
