import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/onboarding_providers.dart';
import 'package:kotoka_app/core/router/app_router.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_section_header.dart';
import 'package:kotoka_app/core/widgets/koko_emoji.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ONB-04 — Level Select screen
// 3 KCard options: Beginner/Intermediate/Advanced.
// Each: KokoEmoji + title + description + ProgressRing (brand400).
// Beginner/Advanced: auto-advance after 300ms. Intermediate: show CTA.
// =============================================================================

class _LevelDef {
  const _LevelDef({
    required this.key,
    required this.emoji,
    required this.title,
    required this.desc,
    required this.progress, // 0.0 – 1.0
    required this.autoAdvance,
  });
  final String key;
  final String emoji;
  final String Function(AppLocalizations) title;
  final String Function(AppLocalizations) desc;
  final double progress;
  final bool autoAdvance;
}

const List<_LevelDef> _kLevels = [
  _LevelDef(
    key: 'beginner',
    emoji: '🌱',
    title: _titleBeginner,
    desc: _descBeginner,
    progress: 0.15,
    autoAdvance: true,
  ),
  _LevelDef(
    key: 'intermediate',
    emoji: '🔥',
    title: _titleIntermediate,
    desc: _descIntermediate,
    progress: 0.55,
    autoAdvance: false,
  ),
  _LevelDef(
    key: 'advanced',
    emoji: '🚀',
    title: _titleAdvanced,
    desc: _descAdvanced,
    progress: 0.90,
    autoAdvance: true,
  ),
];

String _titleBeginner(AppLocalizations l) => l.levelBeginner;
String _titleIntermediate(AppLocalizations l) => l.levelIntermediate;
String _titleAdvanced(AppLocalizations l) => l.levelAdvanced;
String _descBeginner(AppLocalizations l) => l.levelBeginnerDesc;
String _descIntermediate(AppLocalizations l) => l.levelIntermediateDesc;
String _descAdvanced(AppLocalizations l) => l.levelAdvancedDesc;

class LevelSelectScreen extends ConsumerStatefulWidget {
  const LevelSelectScreen({super.key});

  @override
  ConsumerState<LevelSelectScreen> createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends ConsumerState<LevelSelectScreen> {
  String? _selectedKey;
  Timer? _autoTimer;

  @override
  void dispose() {
    _autoTimer?.cancel();
    super.dispose();
  }

  void _selectLevel(_LevelDef level) {
    _autoTimer?.cancel();
    setState(() => _selectedKey = level.key);
    ref.read(selectedLevelProvider.notifier).state = level.key;

    if (level.autoAdvance) {
      _autoTimer = Timer(
        const Duration(milliseconds: 300),
        () {
          if (mounted) context.go(AppRoutes.onboardingSchedule);
        },
      );
    }
  }

  void _onContinue() {
    context.go(AppRoutes.onboardingSchedule);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final showCta =
        _selectedKey == 'intermediate';

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
              KSectionHeader(l10n.levelSelectTitle),
              const SizedBox(height: KSpacing.sp8),
              Text(
                l10n.levelSelectSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
                  color: KColors.textSecondary,
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
              ..._kLevels.map((level) {
                final isSelected = _selectedKey == level.key;
                return Padding(
                  padding: const EdgeInsets.only(bottom: KSpacing.sp12),
                  child: KCard(
                    selected: isSelected,
                    onTap: () => _selectLevel(level),
                    child: Row(
                      children: [
                        KokoEmoji(emoji: level.emoji, size: 32),
                        const SizedBox(width: KSpacing.sp16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                level.title(l10n),
                                style: KTypography.getStyle(
                                        KTextStyle.h4, locale)
                                    .copyWith(
                                  color: isSelected
                                      ? KColors.brand500
                                      : KColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: KSpacing.sp4),
                              Text(
                                level.desc(l10n),
                                style: KTypography.getStyle(
                                        KTextStyle.bodySmall, locale)
                                    .copyWith(
                                  color: KColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: KSpacing.sp12),
                        _ProgressRing(
                          progress: level.progress,
                          active: isSelected,
                        ),
                      ],
                    ),
                  ),
                );
              }),
              // Sample words preview
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp12,
                  vertical: KSpacing.sp12,
                ),
                decoration: BoxDecoration(
                  color: KColors.brand50,
                  borderRadius: KRadius.lg,
                ),
                child: Row(
                  children: [
                    Text(
                      l10n.levelSampleLabel,
                      style: KTypography.getStyle(KTextStyle.label, locale)
                          .copyWith(
                        color: KColors.brand600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: KSpacing.sp8),
                    Expanded(
                      child: Text(
                        l10n.levelSampleText, //MOCKDATA
                        style:
                            KTypography.getStyle(KTextStyle.bodySmall, locale),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              AnimatedOpacity(
                opacity: showCta ? 1.0 : 0.0,
                duration: KMotion.normal,
                child: showCta
                    ? KotokaButton(
                        label: l10n.continueButton,
                        onPressed: _onContinue,
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: KSpacing.sp32),
            ],
          ),
        ),
      ),
    );
  }
}

/// Circular progress ring — brand400 when active, neutral300 otherwise.
class _ProgressRing extends StatelessWidget {
  const _ProgressRing({required this.progress, required this.active});

  final double progress;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 3.5,
            backgroundColor: KColors.neutral200,
            valueColor: AlwaysStoppedAnimation<Color>(
              active ? KColors.brand400 : KColors.neutral300,
            ),
          ),
          Text(
            '${(progress * 100).round()}%',
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              color: KColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
