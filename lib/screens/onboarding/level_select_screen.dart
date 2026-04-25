import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/progress_ring.dart';

// =============================================================================
// LevelSelectScreen — Beginner / Intermediate / Advanced.
// Progress bar visualization per level.
// No hardcoded colors/sizes. All strings from AppLocalizations.
// =============================================================================

class _Level {
  const _Level({
    required this.key,
    required this.progress,
  });
  final String key;
  final double progress;
}

const List<_Level> _kLevels = [
  _Level(key: 'beginner',     progress: 0.25),
  _Level(key: 'intermediate', progress: 0.60),
  _Level(key: 'advanced',     progress: 0.90),
];

class LevelSelectScreen extends StatefulWidget {
  const LevelSelectScreen({super.key});

  @override
  State<LevelSelectScreen> createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends State<LevelSelectScreen> {
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
          l10n.levelSelectTitle,
          style: KTypography.getStyle(KTextStyle.h3, locale)
              .copyWith(color: KColors.neutral900),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      title: _titleFor(level.key, l10n),
                      description: _descFor(level.key, l10n),
                      progress: level.progress,
                      isSelected: isSelected,
                      onTap: () =>
                          setState(() => _selectedKey = level.key),
                    );
                  },
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: _selectedKey != null
                    ? () => context.go('/onboarding/commitment')
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

class _LevelCard extends StatelessWidget {
  const _LevelCard({
    required this.title,
    required this.description,
    required this.progress,
    required this.isSelected,
    required this.onTap,
  });

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
          color: isSelected ? KColors.brand100 : KColors.neutral0,
          borderRadius: KRadius.md,
          border: Border.all(
            color: isSelected ? KColors.brand500 : KColors.neutral200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected ? KElevation.shadow2 : KElevation.shadow1,
        ),
        child: Row(
          children: [
            ProgressRing(
              progress: progress,
              size: 52,
              color: isSelected ? KColors.brand500 : KColors.brand400,
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
                                ? KColors.brand500
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
              Icon(Icons.check_circle,
                  color: KColors.brand500, size: KSpacing.sp24),
          ],
        ),
      ),
    );
  }
}
