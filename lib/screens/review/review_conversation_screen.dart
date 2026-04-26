import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kotoka_app/core/api/rate_limiter.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ReviewConversationScreen — chat-style AI conversation exercise.
// AI messages: left-aligned, sky100 bg, **bold** parsed → RichText.
// User messages: right-aligned, brand400/10 bg.
// Rate limiter: 14 RPM enforced before each AI turn.
// =============================================================================

class _ChatMessage {
  const _ChatMessage({required this.text, required this.isUser});
  final String text;
  final bool isUser;
}

// Mock conversation seed //MOCKDATA
const _mockSeed = <_ChatMessage>[
  _ChatMessage(
    text: 'สวัสดี! วันนี้เราจะฝึกใช้คำว่า **ร้านกาแฟ** กัน.\n\nลองแต่งประโยคด้วยคำนี้ให้หน่อย!',
    isUser: false,
  ), //MOCKDATA
  _ChatMessage(
    text: 'ฉันไปนั่ง ร้านกาแฟ ทุกเช้า',
    isUser: true,
  ), //MOCKDATA
  _ChatMessage(
    text: 'เยี่ยมมาก! ประโยคของคุณถูกต้องแล้ว 🎉\n\nลองใช้ **บรรยากาศ** ในประโยคถัดไปได้เลย',
    isUser: false,
  ), //MOCKDATA
]; //MOCKDATA

// Bold parser for Gemini output
List<InlineSpan> _parseBold(
    String text, TextStyle base, TextStyle bold) {
  final spans = <InlineSpan>[];
  final re = RegExp(r'\*\*(.*?)\*\*');
  int last = 0;
  for (final m in re.allMatches(text)) {
    if (m.start > last) {
      spans.add(TextSpan(text: text.substring(last, m.start), style: base));
    }
    spans.add(TextSpan(text: m.group(1), style: bold));
    last = m.end;
  }
  if (last < text.length) {
    spans.add(TextSpan(text: text.substring(last), style: base));
  }
  return spans;
}

class ReviewConversationScreen extends StatefulWidget {
  const ReviewConversationScreen({super.key});

  @override
  State<ReviewConversationScreen> createState() =>
      _ReviewConversationScreenState();
}

class _ReviewConversationScreenState
    extends State<ReviewConversationScreen> {
  final _messages = List<_ChatMessage>.from(_mockSeed);
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _sending = false;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: KMotion.normal,
          curve: KMotion.enterCurve,
        );
      }
    });
  }

  Future<void> _onSend() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _sending) return;

    // Enforce 14 RPM rate limit
    try {
      await RateLimiter.instance.acquire(RateLimiterEndpoint.gemini);
    } on RateLimitException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Rate limit — retry in ${e.retryAfterMs ~/ 1000}s'),
          backgroundColor: KColors.error500,
        ));
      }
      return;
    }

    setState(() {
      _messages.add(_ChatMessage(text: text, isUser: true));
      _controller.clear();
      _sending = true;
    });
    _scrollToBottom();

    // Mock AI reply after short delay //MOCKDATA
    await Future.delayed(const Duration(milliseconds: 900)); //MOCKDATA
    if (mounted) {
      setState(() {
        _messages.add(const _ChatMessage( //MOCKDATA
          text: 'ดีมาก! **บรรยากาศ** แปลว่า atmosphere.\nลองใช้ในประโยคที่ยาวขึ้นได้เลย!', //MOCKDATA
          isUser: false,
        ));
        _sending = false;
      });
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: KColors.neutral700),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.reviewConversationTitle,
          style: KTypography.getStyle(KTextStyle.h4, locale)
              .copyWith(color: KColors.neutral900),
        ),
        centerTitle: true,
      ),
      child: Column(
        children: [
          // Message list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp16, vertical: KSpacing.sp8),
              itemCount: _messages.length + (_sending ? 1 : 0),
              itemBuilder: (context, i) {
                if (_sending && i == _messages.length) {
                  // Typing indicator
                  return const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: KSpacing.sp4),
                      child: _TypingIndicator(),
                    ),
                  );
                }
                return _MessageBubble(
                  message: _messages[i],
                  locale: locale,
                );
              },
            ),
          ),
          // Input row
          Container(
            padding: const EdgeInsets.fromLTRB(
              KSpacing.sp16,
              KSpacing.sp8,
              KSpacing.sp8,
              KSpacing.sp16,
            ),
            decoration: BoxDecoration(
              color: KColors.neutral0,
              border: const Border(
                  top: BorderSide(color: KColors.neutral200, width: 1)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: KColors.brand100,
                      borderRadius: KRadius.full,
                      border: Border.all(
                          color: KColors.brand400.withValues(alpha: 0.30)),
                    ),
                    child: TextField(
                      controller: _controller,
                      style:
                          KTypography.getStyle(KTextStyle.body, locale)
                              .copyWith(color: KColors.neutral900),
                      decoration: InputDecoration(
                        hintText: l10n.reviewConversationPrompt,
                        hintStyle:
                            KTypography.getStyle(KTextStyle.body, locale)
                                .copyWith(color: KColors.neutral500),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: KSpacing.sp16,
                          vertical: KSpacing.sp12,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _onSend(),
                    ),
                  ),
                ),
                const SizedBox(width: KSpacing.sp8),
                // Send button
                GestureDetector(
                  onTap: _onSend,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: KColors.brand500,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: KColors.brand500.withValues(alpha: 0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.send_rounded,
                        color: KColors.neutral0, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message, required this.locale});
  final _ChatMessage message;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final baseStyle = KTypography.getStyle(KTextStyle.body, locale)
        .copyWith(
            color: isUser ? KColors.neutral900 : KColors.neutral800);
    final boldStyle = baseStyle.copyWith(fontWeight: FontWeight.w700);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: KSpacing.sp4),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp16, vertical: KSpacing.sp12),
        decoration: BoxDecoration(
          color: isUser
              ? KColors.brand400.withValues(alpha: 0.10)
              : KColors.sky100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isUser ? KRadius.radiusLg : KRadius.radiusSm),
            topRight: Radius.circular(isUser ? KRadius.radiusSm : KRadius.radiusLg),
            bottomLeft: const Radius.circular(KRadius.radiusLg),
            bottomRight: const Radius.circular(KRadius.radiusLg),
          ),
          border: Border.all(
            color: isUser
                ? KColors.brand400.withValues(alpha: 0.20)
                : KColors.sky300.withValues(alpha: 0.40),
          ),
        ),
        child: RichText(
          text: TextSpan(
            children: _parseBold(message.text, baseStyle, boldStyle),
          ),
        ),
      ),
    );
  }
}

class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator();

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp16, vertical: KSpacing.sp12),
      decoration: BoxDecoration(
        color: KColors.sky100,
        borderRadius: KRadius.lg,
        border: Border.all(color: KColors.sky300.withValues(alpha: 0.40)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (i) {
          return AnimatedBuilder(
            animation: _ctrl,
            builder: (_, __) {
              final offset = ((_ctrl.value - i * 0.2) % 1.0).clamp(0.0, 1.0);
              final opacity = (_parabolicSin(offset * 3.14159)).clamp(0.3, 1.0);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: KColors.brand500.withValues(alpha: opacity),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  double _parabolicSin(double x) {
    // Parabolic arch approximation peaking at pi/2 — avoids dart:math import
    if (x <= 0) return 0;
    if (x >= 3.14159) return 0;
    return 4 * x * (3.14159 - x) / (3.14159 * 3.14159);
  }
}
