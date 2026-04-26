import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/onboarding_providers.dart';
import 'package:kotoka_app/core/router/app_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_chip.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_section_header.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ONB-03 — Goal Select screen
// KChip grid (Wrap), multi-select, ≥1 to enable CTA. Saves to onboardingProvider.
// =============================================================================

class _GoalDef {
  const _GoalDef({required this.key, required this.label});
  final String key;
  final String Function(AppLocalizations) label;
}

List<_GoalDef> _goals(AppLocalizations l10n) => [
      _GoalDef(key: 'career',        label: (l) => l.goalCareer),
      _GoalDef(key: 'travel',        label: (l) => l.goalTravel),
      _GoalDef(key: 'academic',      label: (l) => l.goalAcademic),
      _GoalDef(key: 'personal',      label: (l) => l.goalPersonal),
      _GoalDef(key: 'work_meeting',  label: (l) => l.onbGoalWorkMeeting),
      _GoalDef(key: 'email_writing', label: (l) => l.onbGoalEmailWriting),
      _GoalDef(key: 'presentation',  label: (l) => l.onbGoalPresentation),
    ];

class GoalSelectScreen extends ConsumerWidget {
  const GoalSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final selected = ref.watch(selectedGoalsProvider);
    final goals = _goals(l10n);

    return KScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: KColors.brand600),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: KSpacing.sp8),
              KSectionHeader(l10n.goalSelectTitle),
              const SizedBox(height: KSpacing.sp8),
              Text(
                l10n.goalSelectSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
                  color: KColors.textSecondary,
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
              // Chip grid — brand400 accent via KChip selected state
              Wrap(
                spacing: KSpacing.sp8,
                runSpacing: KSpacing.sp12,
                children: goals.map((g) {
                  final isSelected = selected.contains(g.key);
                  return KChip(
                    label: g.label(l10n),
                    selected: isSelected,
                    onTap: () => ref
                        .read(selectedGoalsProvider.notifier)
                        .toggleGoal(g.key),
                  );
                }).toList(),
              ),
              const SizedBox(height: KSpacing.sp24),

              // Sample words preview — "What you'll learn:"
              Text(
                l10n.goalWhatYoullLearn,
                style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
                  color: KColors.brand600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: KSpacing.sp8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    'café → กาแฟ', //MOCKDATA
                    'meeting → 会议', //MOCKDATA
                    'contract → สัญญา', //MOCKDATA
                    'invoice → ใบแจ้งหนี้', //MOCKDATA
                    'deadline → plazo', //MOCKDATA
                  ].map((word) => Padding(
                    padding: const EdgeInsets.only(right: KSpacing.sp8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: KSpacing.sp16,
                        vertical: KSpacing.sp8,
                      ),
                      decoration: BoxDecoration(
                        color: KColors.neutral0,
                        borderRadius: KRadius.full,
                        border: Border.all(
                          color: KColors.brand400.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Text(
                        word,
                        style: KTypography.getStyle(KTextStyle.label, locale)
                            .copyWith(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ),

              const Spacer(),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: selected.isNotEmpty
                    ? () => context.go(AppRoutes.onboardingLevel)
                    : null,
              ),
              const SizedBox(height: KSpacing.sp32),
            ],
          ),
        ),
      ),
    );
  }
}
