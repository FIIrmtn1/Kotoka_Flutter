import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';

// =============================================================================
// ScheduleScreen — daily time commitment selector.
// Options: 5, 10, 15, 30 min.
// KokoAnimation reacts: thinking → celebrating when user selects.
// Shows expected words/day at selected time.
// No hardcoded colors/sizes. All strings from AppLocalizations.
// =============================================================================

const List<int> _kMinuteOptions = [5, 10, 15, 30];

/// Maps minutes to approximate words/day.
int _wordsPerDay(int minutes) {
  if (minutes <= 5)  return 3;
  if (minutes <= 10) return 7;
  if (minutes <= 15) return 12;
  return 20;
}

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int? _selectedMinutes;

  KokoState get _kokoState =>
      _selectedMinutes != null ? KokoState.celebrating : KokoState.thinking;

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.brand50,
      appBar: AppBar(
        backgroundColor: KColors.brand50,
        elevation: KElevation.elevation0,
        leading: BackButton(color: KColors.brand500),
        title: Text(
          l10n.scheduleTitle,
          style: KTypography.getStyle(KTextStyle.h3, locale)
              .copyWith(color: KColors.neutral900),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        toolbarHeight: 72,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            children: [
              // Koko reacts to selection
              AnimatedSwitcher(
                duration: KMotion.normal,
                child: KokoAnimation(
                  key: ValueKey(_kokoState),
                  state: _kokoState,
                  size: 120,
                ),
              ),
              const SizedBox(height: KSpacing.sp16),
              Text(
                l10n.scheduleSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale)
                    .copyWith(color: KColors.neutral700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSpacing.sp32),
              // Time option chips
              Wrap(
                spacing: KSpacing.sp12,
                runSpacing: KSpacing.sp12,
                alignment: WrapAlignment.center,
                children: _kMinuteOptions.map((mins) {
                  final isSelected = _selectedMinutes == mins;
                  return _TimeChip(
                    minutes: mins,
                    isSelected: isSelected,
                    label: l10n.scheduleMinutes(mins),
                    onTap: () =>
                        setState(() => _selectedMinutes = mins),
                  );
                }).toList(),
              ),
              const SizedBox(height: KSpacing.sp32),
              // Words per day estimate
              AnimatedOpacity(
                duration: KMotion.normal,
                opacity: _selectedMinutes != null ? 1.0 : 0.0,
                child: _selectedMinutes != null
                    ? Container(
                        padding: const EdgeInsets.all(KSpacing.sp16),
                        decoration: BoxDecoration(
                          color: KColors.brand100,
                          borderRadius: KRadius.md,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bolt,
                                color: KColors.brand600,
                                size: KSpacing.sp20),
                            const SizedBox(width: KSpacing.sp8),
                            Text(
                              l10n.scheduleWordsPerDay(
                                  _wordsPerDay(_selectedMinutes!)),
                              style: KTypography.getStyle(
                                      KTextStyle.body, locale)
                                  .copyWith(color: KColors.brand500),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              const Spacer(),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: _selectedMinutes != null
                    ? () => context.go('/onboarding/pdpa')
                    : null,
                variant: KotokaButtonVariant.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  const _TimeChip({
    required this.minutes,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  final int minutes;
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: KMotion.fast,
        padding: const EdgeInsets.symmetric(
          vertical: KSpacing.sp12,
          horizontal: KSpacing.sp24,
        ),
        decoration: BoxDecoration(
          color: isSelected ? KColors.brand500 : KColors.neutral0,
          borderRadius: KRadius.full,
          border: Border.all(
            color: isSelected ? KColors.brand500 : KColors.neutral300,
          ),
          boxShadow: isSelected ? KElevation.shadow2 : KElevation.shadow1,
        ),
        child: Text(
          label,
          style: KTypography.getStyle(KTextStyle.button, locale).copyWith(
            color: isSelected ? KColors.neutral0 : KColors.neutral700,
          ),
        ),
      ),
    );
  }
}
