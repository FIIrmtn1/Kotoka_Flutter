import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/commitment_card.dart';

/// ONB-05 — Commitment screen (merged Notification + Streak Promise).
/// Both allow and skip advance to /onboarding/mission.
class CommitmentScreen extends StatelessWidget {
  const CommitmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.brand50,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: KSpacing.sp24,
              vertical: KSpacing.sp32,
            ),
            child: CommitmentCard(
              onAllow: () => context.go('/onboarding/mission'),
              onSkip: () => context.go('/onboarding/mission'),
            ),
          ),
        ),
      ),
    );
  }
}
