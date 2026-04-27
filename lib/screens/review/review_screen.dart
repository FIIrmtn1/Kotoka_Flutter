// REV-01 — Review screen: 2x2 mode grid + Duolingo-style learning path.
// Play taps current node → randomly picks 1 of 4 session types.

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/core/providers/due_cards_provider.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// ---------------------------------------------------------------------------
// Session types — equally weighted random pick
// ---------------------------------------------------------------------------
enum _SessionType { flashcard, fillBlank, conversation, pronunciation }

const _sessionRoutes = {
  _SessionType.flashcard:     '/review/flashcard',
  _SessionType.fillBlank:     '/review/fillblank',
  _SessionType.conversation:  '/review/conversation',
  _SessionType.pronunciation: '/review/flashcard', //MOCKDATA — pronunciation shares flashcard route for now
};

// ---------------------------------------------------------------------------
// ReviewScreen
// ---------------------------------------------------------------------------
class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  void _launchRandom(BuildContext context) {
    final types = _SessionType.values;
    final picked = types[Random().nextInt(types.length)];
    context.push(_sessionRoutes[picked]!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final dueCount = ref.watch(dueCardsCountProvider);

    return KScaffold(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ----------------------------------------------------------------
            // Header: title + due count
            // ----------------------------------------------------------------
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    KSpacing.sp24, KSpacing.sp16, KSpacing.sp24, KSpacing.sp4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.reviewTitle,
                      style: KTypography.getStyle(KTextStyle.h2, locale)
                          .copyWith(color: KColors.neutral900),
                    ),
                    const SizedBox(height: KSpacing.sp4),
                    Text(
                      l10n.reviewWordsDue(dueCount, dueCount ~/ 2 + 1),
                      style: KTypography.getStyle(KTextStyle.body, locale)
                          .copyWith(color: KColors.brand600),
                    ),
                  ],
                ),
              ),
            ),

            // ----------------------------------------------------------------
            // 2×2 mode grid
            // ----------------------------------------------------------------
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    KSpacing.sp24, KSpacing.sp16, KSpacing.sp24, 0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: KSpacing.sp12,
                  mainAxisSpacing: KSpacing.sp12,
                  childAspectRatio: 1.4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _ModeCard(
                      icon: Icons.chat_bubble_outline_rounded,
                      title: l10n.reviewConvMode,
                      subtitle: l10n.reviewConvDesc,
                      onTap: () => context.push('/review/conversation'),
                      locale: locale,
                    ),
                    _ModeCard(
                      icon: Icons.style_outlined,
                      title: l10n.reviewFlashcardMode,
                      subtitle: l10n.reviewFlashcardDesc,
                      onTap: () => context.push('/review/flashcard'),
                      locale: locale,
                    ),
                    _ModeCard(
                      icon: Icons.edit_note_rounded,
                      title: l10n.reviewFillMode,
                      subtitle: l10n.reviewFillDesc,
                      onTap: () => context.push('/review/fillblank'),
                      locale: locale,
                    ),
                    _ModeCard(
                      icon: Icons.record_voice_over_outlined,
                      title: l10n.reviewPronounMode,
                      subtitle: l10n.reviewPronounDesc,
                      onTap: () => context.push('/review/flashcard'), //MOCKDATA
                      locale: locale,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: KSpacing.sp32)),

            // ----------------------------------------------------------------
            // Duolingo-style learning path
            // ----------------------------------------------------------------
            SliverToBoxAdapter(
              child: _LearningPath(
                onPlay: () => _launchRandom(context),
                locale: locale,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: KSpacing.sp40)),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _ModeCard
// ---------------------------------------------------------------------------
class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.locale,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: KColors.neutral0,
      borderRadius: KRadius.lg,
      child: InkWell(
        onTap: onTap,
        borderRadius: KRadius.lg,
        child: Container(
          padding: const EdgeInsets.all(KSpacing.sp12),
          decoration: BoxDecoration(
            borderRadius: KRadius.lg,
            border: Border.all(color: Colors.black12),
            boxShadow: KElevation.shadow1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: KColors.brand500.withValues(alpha: 0.12),
                  borderRadius: KRadius.md,
                ),
                child: Icon(icon, color: KColors.brand500, size: 20),
              ),
              const SizedBox(height: KSpacing.sp8),
              Text(
                title,
                style: KTypography.getStyle(KTextStyle.h4, locale)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Text(
                  subtitle,
                  style: KTypography.getStyle(KTextStyle.caption, locale)
                      .copyWith(color: KColors.textSecondary),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _LearningPath — Duolingo-style vertical path
// ---------------------------------------------------------------------------
class _LearningPath extends StatelessWidget {
  const _LearningPath({
    required this.onPlay,
    required this.locale,
  });

  final VoidCallback onPlay;
  final Locale locale;

  // Zigzag offsets: positive = right, negative = left
  static const _offsets = [40.0, -40.0, 40.0, -40.0];

  @override
  Widget build(BuildContext context) {
    final nodes = [
      _PathNodeData(type: _NodeType.completed, timeLabel: '~1d'),
      _PathNodeData(type: _NodeType.current, timeLabel: '~6m'),
      _PathNodeData(type: _NodeType.locked, timeLabel: ''),
      _PathNodeData(type: _NodeType.locked, timeLabel: ''),
      _PathNodeData(type: _NodeType.locked, timeLabel: ''),
    ];

    return Column(
      children: [
        for (int i = 0; i < nodes.length; i++) ...[
          Transform.translate(
            offset: Offset(i < _offsets.length ? _offsets[i] : 0, 0),
            child: _PathNodeWidget(
              data: nodes[i],
              onTap: nodes[i].type == _NodeType.current ? onPlay : null,
              locale: locale,
            ),
          ),
          if (i < nodes.length - 1)
            _PathConnector(
              fromOffset: i < _offsets.length ? _offsets[i] : 0,
              toOffset: i + 1 < _offsets.length ? _offsets[i + 1] : 0,
            ),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// _PathNodeData
// ---------------------------------------------------------------------------
enum _NodeType { completed, current, locked }

class _PathNodeData {
  const _PathNodeData({required this.type, required this.timeLabel});
  final _NodeType type;
  final String timeLabel;
}

// ---------------------------------------------------------------------------
// _PathNodeWidget
// ---------------------------------------------------------------------------
class _PathNodeWidget extends StatelessWidget {
  const _PathNodeWidget({
    required this.data,
    required this.locale,
    this.onTap,
  });

  final _PathNodeData data;
  final Locale locale;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isCurrent = data.type == _NodeType.current;
    final isCompleted = data.type == _NodeType.completed;
    final isLocked = data.type == _NodeType.locked;

    final double size = isCurrent ? 72 : 60;
    final Color bg = isLocked ? KColors.neutral200 : KColors.brand500;
    final Color border = isLocked ? KColors.neutral400 : Colors.transparent;

    Widget iconWidget;
    if (isCompleted) {
      iconWidget = const Icon(Icons.star_rounded,
          color: KColors.neutral0, size: 28);
    } else if (isCurrent) {
      iconWidget = const Icon(Icons.play_arrow_rounded,
          color: KColors.neutral0, size: 34);
    } else {
      iconWidget = const Icon(Icons.lock_outline_rounded,
          color: KColors.neutral600, size: 24);
    }

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          if (data.timeLabel.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: KSpacing.sp4),
              child: Text(
                data.timeLabel,
                style: KTypography.getStyle(KTextStyle.caption, locale)
                    .copyWith(color: KColors.textSecondary),
              ),
            ),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
              border: Border.all(color: border, width: 2),
              boxShadow: isCurrent ? KElevation.shadow2 : KElevation.shadow1,
            ),
            child: Center(child: iconWidget),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _PathConnector — diagonal line between two zigzag nodes
// ---------------------------------------------------------------------------
class _PathConnector extends StatelessWidget {
  const _PathConnector({
    required this.fromOffset,
    required this.toOffset,
  });

  final double fromOffset;
  final double toOffset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: CustomPaint(
        painter: _ConnectorPainter(fromOffset: fromOffset, toOffset: toOffset),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _ConnectorPainter extends CustomPainter {
  const _ConnectorPainter({
    required this.fromOffset,
    required this.toOffset,
  });

  final double fromOffset;
  final double toOffset;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black12
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final start =
        Offset(size.width / 2 + fromOffset, 0);
    final end =
        Offset(size.width / 2 + toOffset, size.height);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(_ConnectorPainter old) =>
      old.fromOffset != fromOffset || old.toOffset != toOffset;
}
