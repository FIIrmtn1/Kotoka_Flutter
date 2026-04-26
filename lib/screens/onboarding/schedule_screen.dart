import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/onboarding_providers.dart';
import 'package:kotoka_app/core/router/app_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_section_header.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ONB-05 — Schedule screen
// Radio cards for 5/10/15/20/30 min/day.
// Radio activeColor: brand400. Selected KCard: selected=true.
// Saves to dailyGoalMinutesProvider.
// =============================================================================

/// Minutes → estimated new words per day (MOCKDATA)
const Map<int, int> _kWordsMap = {
  5: 3,   //MOCKDATA
  10: 7,  //MOCKDATA
  15: 10, //MOCKDATA
  20: 14, //MOCKDATA
  30: 20, //MOCKDATA
};

const List<int> _kMinuteOptions = [5, 10, 15, 20, 30]; //MOCKDATA

class ScheduleScreen extends ConsumerStatefulWidget {
  const ScheduleScreen({super.key});

  @override
  ConsumerState<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  int? _selectedMinutes;

  void _select(int minutes) {
    setState(() => _selectedMinutes = minutes);
    ref.read(dailyGoalMinutesProvider.notifier).state = minutes;
  }

  void _onContinue() {
    if (_selectedMinutes == null) return;
    context.go(AppRoutes.onboardingCommitment);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

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
              KSectionHeader(l10n.scheduleTitle),
              const SizedBox(height: KSpacing.sp8),
              Text(
                l10n.scheduleSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
                  color: KColors.textSecondary,
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
              ..._kMinuteOptions.map((minutes) {
                final isSelected = _selectedMinutes == minutes;
                final wordsEstimate = _kWordsMap[minutes] ?? 0;
                return Padding(
                  padding: const EdgeInsets.only(bottom: KSpacing.sp12),
                  child: KCard(
                    selected: isSelected,
                    onTap: () => _select(minutes),
                    padding: const EdgeInsets.symmetric(
                      horizontal: KSpacing.sp16,
                      vertical: KSpacing.sp4,
                    ),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: minutes,
                          groupValue: _selectedMinutes,
                          onChanged: (v) => _select(v!),
                          activeColor: KColors.brand400,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        const SizedBox(width: KSpacing.sp8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.scheduleMinutes(minutes),
                                style: KTypography.getStyle(
                                        KTextStyle.h4, locale)
                                    .copyWith(
                                  color: isSelected
                                      ? KColors.brand500
                                      : KColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                l10n.scheduleWordsPerDay(wordsEstimate),
                                style: KTypography.getStyle(
                                        KTextStyle.caption, locale)
                                    .copyWith(
                                  color: isSelected
                                      ? KColors.brand400
                                      : KColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_circle_rounded,
                            color: KColors.brand400,
                            size: 22,
                          ),
                      ],
                    ),
                  ),
                );
              }),
              const Spacer(),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: _selectedMinutes != null ? _onContinue : null,
              ),
              const SizedBox(height: KSpacing.sp32),
            ],
          ),
        ),
      ),
    );
  }
}
