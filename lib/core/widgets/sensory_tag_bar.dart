import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

// =============================================================================
// SensoryTagBar — horizontal scrollable row of sensory context chips.
// Non-optional on VocabCard per Design Law 2.
// No hardcoded colors or sizes — all values from tokens.dart.
// =============================================================================

/// A single sensory tag data object.
class SensoryTag {
  const SensoryTag({
    required this.icon,
    required this.label,
    this.color = KColors.brand300,
  });

  final IconData icon;
  final String label;
  final Color color;
}

/// Display mode for SensoryTagBar.
enum SensoryTagBarMode {
  /// Full mode — larger chips with label text. Used in detail views.
  full,
  /// Compact mode — smaller chips, icon + short label. Used in review cards.
  compact,
}

/// Horizontal scrollable row of [SensoryTag] chips.
///
/// Always rendered; never optional on flashcards (Design Law 2).
class SensoryTagBar extends StatelessWidget {
  const SensoryTagBar({
    super.key,
    required this.tags,
    this.mode = SensoryTagBarMode.compact,
  });

  final List<SensoryTag> tags;
  final SensoryTagBarMode mode;

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (int i = 0; i < tags.length; i++) ...[
            _SensoryChip(tag: tags[i], mode: mode),
            if (i < tags.length - 1)
              const SizedBox(width: KSpacing.sp8),
          ],
        ],
      ),
    );
  }
}

class _SensoryChip extends StatelessWidget {
  const _SensoryChip({required this.tag, required this.mode});

  final SensoryTag tag;
  final SensoryTagBarMode mode;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isCompact = mode == SensoryTagBarMode.compact;
    final iconSize = isCompact ? KSpacing.sp12 : KSpacing.sp16;
    final vPad = isCompact ? KSpacing.sp4 : KSpacing.sp8;
    final hPad = isCompact ? KSpacing.sp8 : KSpacing.sp12;

    return Container(
      padding: EdgeInsets.symmetric(vertical: vPad, horizontal: hPad),
      decoration: BoxDecoration(
        color: tag.color.withOpacity(0.18),
        borderRadius: KRadius.sm,
        border: Border.all(color: tag.color.withOpacity(0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(tag.icon, size: iconSize, color: tag.color),
          const SizedBox(width: KSpacing.sp4),
          Text(
            tag.label,
            style: KTypography.getStyle(KTextStyle.caption, locale)
                .copyWith(color: KColors.neutral700),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Pre-built tag factories for the 6 canonical sensory categories.
// ---------------------------------------------------------------------------
abstract final class SensoryTags {
  static SensoryTag location(String placeName) => SensoryTag(
        icon: Icons.location_on_outlined,
        label: placeName,
        color: KColors.brand500,
      );

  static SensoryTag weather(String condition) => SensoryTag(
        icon: Icons.wb_sunny_outlined,
        label: condition,
        color: KColors.warning500,
      );

  static SensoryTag mood(String moodLabel) => SensoryTag(
        icon: Icons.sentiment_satisfied_outlined,
        label: moodLabel,
        color: KColors.success500,
      );

  static SensoryTag energy(String energyLabel) => SensoryTag(
        icon: Icons.bolt_outlined,
        label: energyLabel,
        color: KColors.warning500,
      );

  static SensoryTag sound(String soundLabel) => SensoryTag(
        icon: Icons.music_note_outlined,
        label: soundLabel,
        color: KColors.brand400,
      );

  static SensoryTag time(String timeLabel) => SensoryTag(
        icon: Icons.access_time_outlined,
        label: timeLabel,
        color: KColors.neutral500,
      );
}
