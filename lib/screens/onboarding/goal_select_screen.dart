import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_cta_button.dart';

enum GoalSelectionGoal { travel, workMeeting, emailWriting, presentation, study, culture }

class _Goal {
  const _Goal({required this.emoji, required this.goal});
  final String emoji;
  final GoalSelectionGoal goal;
}

const List<_Goal> _kGoals = [
  _Goal(emoji: '✈️', goal: GoalSelectionGoal.travel),
  _Goal(emoji: '💼', goal: GoalSelectionGoal.workMeeting),
  _Goal(emoji: '✉️', goal: GoalSelectionGoal.emailWriting),
  _Goal(emoji: '🎤', goal: GoalSelectionGoal.presentation),
  _Goal(emoji: '📚', goal: GoalSelectionGoal.study),
  _Goal(emoji: '🌏', goal: GoalSelectionGoal.culture),
];

class GoalSelectScreen extends StatefulWidget {
  const GoalSelectScreen({super.key});

  @override
  State<GoalSelectScreen> createState() => _GoalSelectScreenState();
}

class _GoalSelectScreenState extends State<GoalSelectScreen> {
  GoalSelectionGoal? _selected;

  String _labelFor(GoalSelectionGoal goal, AppLocalizations l10n) {
    switch (goal) {
      case GoalSelectionGoal.travel:       return l10n.goalTravel;
      case GoalSelectionGoal.workMeeting:  return l10n.onbGoalWorkMeeting;
      case GoalSelectionGoal.emailWriting: return l10n.onbGoalEmailWriting;
      case GoalSelectionGoal.presentation: return l10n.onbGoalPresentation;
      case GoalSelectionGoal.study:        return l10n.goalAcademic;
      case GoalSelectionGoal.culture:      return l10n.goalPersonal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KStitchScaffold(
      stickyHeader: KOnboardingHeader(
        onBack: () => Navigator.of(context).pop(),
        stepCurrent: 2,
        stepTotal: 8,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.goalSelectTitle,
                style: KTypography.getStyle(KTextStyle.h3, locale)
                    .copyWith(color: KColors.neutral900),
              ),
              const SizedBox(height: KSpacing.sp8),
              Text(
                l10n.goalSelectSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale)
                    .copyWith(color: KColors.neutral700),
              ),
              const SizedBox(height: KSpacing.sp24),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: KSpacing.sp12,
                    mainAxisSpacing: KSpacing.sp12,
                    childAspectRatio: 2.4,
                  ),
                  itemCount: _kGoals.length,
                  itemBuilder: (context, index) {
                    final goal = _kGoals[index];
                    final isSelected = _selected == goal.goal;
                    return _GoalChip(
                      emoji: goal.emoji,
                      label: _labelFor(goal.goal, l10n),
                      isSelected: isSelected,
                      onTap: () => setState(() => _selected = goal.goal),
                    );
                  },
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
              KCtaButton(
                label: l10n.continueButton,
                onPressed: _selected != null
                    ? () => context.go('/onboarding/level')
                    : null,
              ),
              SizedBox(
                  height: MediaQuery.of(context).padding.bottom + KSpacing.sp16),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoalChip extends StatelessWidget {
  const _GoalChip({
    required this.emoji,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String emoji;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: KMotion.fast,
        padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp12,
          vertical: KSpacing.sp8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? KColors.brand400.withValues(alpha: 0.05)
              : KColors.neutral0,
          borderRadius: KRadius.md,
          border: Border.all(
            color: isSelected
                ? KColors.brand400
                : KColors.brand400.withValues(alpha: 0.20),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: KElevation.shadow1,
        ),
        child: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: KSpacing.sp8),
            Expanded(
              child: Text(
                label,
                style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
                  color: isSelected ? KColors.brand400 : KColors.neutral800,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: KColors.brand400, size: KSpacing.sp16),
          ],
        ),
      ),
    );
  }
}
