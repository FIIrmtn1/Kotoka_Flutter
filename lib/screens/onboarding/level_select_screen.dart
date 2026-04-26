import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/onboarding_providers.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_progress_ring.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_cta_button.dart';

class _Level {
  const _Level({required this.key, required this.progress});
  final String key;
  final double progress;
}

const List<_Level> _kLevels = [
  _Level(key: 'beginner',     progress: 0.25),
  _Level(key: 'intermediate', progress: 0.60),
  _Level(key: 'advanced',     progress: 0.90),
];

class LevelSelectScreen extends ConsumerStatefulWidget {
  const LevelSelectScreen({super.key});

  @override
  ConsumerState<LevelSelectScreen> createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends ConsumerState<LevelSelectScreen> {
  String? _selectedKey;

  String _titleFor(String key, AppLocalizations l10n) {
    switch (key) {
      case 'beginner':     return l10n.levelBeginner;
      case 'intermediate': return l10n.levelIntermediate;
      case 'advanced':     return l10n.levelAdvanced;
      default:             return key;
    }
  }

  String _descFor(String key, AppLocalizations l10n) {
    switch (key) {
      case 'beginner':     return l10n.levelBeginnerDesc;
      case 'intermediate': return l10n.levelIntermediateDesc;
      case 'advanced':     return l10n.levelAdvancedDesc;
      default:             return '';
    }
  }

  String _emojiFor(String key) {
    switch (key) {
      case 'beginner':     return '👶';
      case 'intermediate': return '📘';
      case 'advanced':     return '🎓';
      default:             return '';
    }
  }

  void _selectLevel(String key) {
    setState(() => _selectedKey = key);
    ref.read(selectedLevelProvider.notifier).state = key;
    if (key == 'beginner' || key == 'advanced') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go('/onboarding/commitment');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KStitchScaffold(
      stickyHeader: KOnboardingHeader(
        onBack: () => Navigator.of(context).pop(),
        stepCurrent: 3,
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
                l10n.levelSelectTitle,
                style: KTypography.getStyle(KTextStyle.h3, locale)
                    .copyWith(color: KColors.neutral900),
              ),
              const SizedBox(height: KSpacing.sp8),
              Text(
                l10n.levelSelectSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale)
                    .copyWith(color: KColors.neutral700),
              ),
              const SizedBox(height: KSpacing.sp24),
              Expanded(
                child: ListView.separated(
                  itemCount: _kLevels.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: KSpacing.sp12),
                  itemBuilder: (context, index) {
                    final level = _kLevels[index];
                    final isSelected = _selectedKey == level.key;
                    return _LevelCard(
                      emoji: _emojiFor(level.key),
                      title: _titleFor(level.key, l10n),
                      description: _descFor(level.key, l10n),
                      progress: level.progress,
                      isSelected: isSelected,
                      onTap: () => _selectLevel(level.key),
                    );
                  },
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
              KCtaButton(
                label: l10n.continueButton,
                onPressed: _selectedKey == 'intermediate'
                    ? () => context.go('/onboarding/commitment')
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

class _LevelCard extends StatelessWidget {
  const _LevelCard({
    required this.emoji,
    required this.title,
    required this.description,
    required this.progress,
    required this.isSelected,
    required this.onTap,
  });

  final String emoji;
  final String title;
  final String description;
  final double progress;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: KMotion.fast,
        padding: const EdgeInsets.all(KSpacing.sp16),
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
            Stack(
              alignment: Alignment.center,
              children: [
                KProgressRing(
                  value: progress,
                  size: 52,
                  fillColor: KColors.brand400,
                ),
                Text(emoji, style: const TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(width: KSpacing.sp16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: KTypography.getStyle(KTextStyle.h4, locale)
                        .copyWith(
                            color: isSelected
                                ? KColors.brand400
                                : KColors.neutral900),
                  ),
                  const SizedBox(height: KSpacing.sp4),
                  Text(
                    description,
                    style: KTypography.getStyle(KTextStyle.caption, locale),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle,
                  color: KColors.brand400, size: KSpacing.sp24),
          ],
        ),
      ),
    );
  }
}
