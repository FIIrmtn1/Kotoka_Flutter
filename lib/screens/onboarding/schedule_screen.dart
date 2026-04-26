import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_cta_button.dart';

const List<int> _kMinuteOptions = [5, 10, 15, 30];

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

    return KStitchScaffold(
      stickyHeader: KOnboardingHeader(
        onBack: () => Navigator.of(context).pop(),
        stepCurrent: 5,
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
                l10n.scheduleTitle,
                style: KTypography.getStyle(KTextStyle.h3, locale)
                    .copyWith(color: KColors.neutral900),
              ),
              const SizedBox(height: KSpacing.sp16),
              Center(
                child: AnimatedSwitcher(
                  duration: KMotion.normal,
                  child: KokoAnimation(
                    key: ValueKey(_kokoState),
                    state: _kokoState,
                    size: 120,
                  ),
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
                    onTap: () => setState(() => _selectedMinutes = mins),
                  );
                }).toList(),
              ),
              const SizedBox(height: KSpacing.sp32),
              AnimatedOpacity(
                duration: KMotion.normal,
                opacity: _selectedMinutes != null ? 1.0 : 0.0,
                child: _selectedMinutes != null
                    ? Container(
                        padding: const EdgeInsets.all(KSpacing.sp16),
                        decoration: BoxDecoration(
                          color: KColors.brand400.withValues(alpha: 0.05),
                          borderRadius:
                              BorderRadius.circular(KRadius.radiusMd),
                          border: Border.all(
                              color: KColors.brand400.withValues(alpha: 0.20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.bolt,
                                color: KColors.brand400,
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
              KCtaButton(
                label: l10n.continueButton,
                onPressed: _selectedMinutes != null
                    ? () => context.go('/onboarding/pdpa')
                    : null,
              ),
              SizedBox(
                  height: MediaQuery.of(context).padding.bottom +
                      KSpacing.sp16),
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
          color: isSelected
              ? KColors.brand400.withValues(alpha: 0.05)
              : KColors.neutral0,
          borderRadius: KRadius.full,
          border: Border.all(
            color: isSelected
                ? KColors.brand400
                : KColors.brand400.withValues(alpha: 0.20),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: KElevation.shadow1,
        ),
        child: Text(
          label,
          style: KTypography.getStyle(KTextStyle.button, locale).copyWith(
            color: isSelected ? KColors.brand400 : KColors.neutral700,
          ),
        ),
      ),
    );
  }
}
