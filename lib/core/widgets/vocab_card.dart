import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/sensory_tag_bar.dart';

// SensoryTagBar is required on every VocabCard (Design Law 2).
class VocabCard extends StatelessWidget {
  const VocabCard({
    super.key,
    required this.word,
    required this.romanization,
    required this.translation,
    required this.sensoryTags,
    this.exampleSentence,
  });

  final String word;
  final String romanization;
  final String translation;
  final List<SensoryTag> sensoryTags;
  final String? exampleSentence;

  /// Derives mood tint color from sensory tags.
  /// Looks for a tag with a mood icon and maps to token.
  Color _moodTint() {
    for (final tag in sensoryTags) {
      if (tag.icon == Icons.sentiment_satisfied_outlined) {
        final label = tag.label.toLowerCase();
        if (label.contains('calm') || label.contains('relax')) return KColors.moodCalm;
        if (label.contains('energy') || label.contains('focus')) return KColors.moodFocus;
        if (label.contains('joy') || label.contains('happy')) return KColors.moodJoy;
        if (label.contains('cool')) return KColors.moodCool;
        return KColors.moodEnergy;
      }
    }
    return KColors.moodCalm;
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final tint = _moodTint();

    return Container(
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.lg,
        boxShadow: KElevation.shadow2,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Mood tint overlay at 20% opacity
          Positioned.fill(
            child: Container(
              color: tint.withOpacity(0.20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(KSpacing.sp24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Target word
                Text(
                  word,
                  style: KTypography.getStyle(KTextStyle.targetWord, locale),
                ),
                const SizedBox(height: KSpacing.sp4),
                // Romanization
                Text(
                  romanization,
                  style: KTypography.getStyle(KTextStyle.romanization, locale),
                ),
                // Example sentence (optional)
                if (exampleSentence != null) ...[
                  const SizedBox(height: KSpacing.sp8),
                  const Divider(
                      color: KColors.neutral300, thickness: 1, height: 1),
                  const SizedBox(height: KSpacing.sp8),
                  Text(
                    '"${exampleSentence!}"',
                    style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: KColors.neutral500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: KSpacing.sp12),
                // Divider
                Divider(
                  color: KColors.neutral200,
                  height: 1,
                  thickness: 1,
                ),
                const SizedBox(height: KSpacing.sp12),
                // Translation
                Text(
                  translation,
                  style: KTypography.getStyle(KTextStyle.body, locale)
                      .copyWith(color: KColors.neutral700),
                ),
                const SizedBox(height: KSpacing.sp16),
                // Sensory tag bar — ALWAYS present (Design Law 2)
                SensoryTagBar(
                  tags: sensoryTags,
                  mode: SensoryTagBarMode.compact,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
