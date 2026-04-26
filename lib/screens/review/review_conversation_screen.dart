import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_card.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/review/review_complete_screen.dart';

// REV-04 — Koko Conversation Screen
// Mock data tagged //MOCKDATA

const _mockKokoPrompt =
    'Your manager just walked in. How do you tell her the proposal is ready?'; //MOCKDATA
const _mockWordChips = ['proposal', 'ready', 'send', 'update']; //MOCKDATA

class ReviewConversationScreen extends ConsumerStatefulWidget {
  const ReviewConversationScreen({super.key});

  @override
  ConsumerState<ReviewConversationScreen> createState() =>
      _ReviewConversationScreenState();
}

class _ReviewConversationScreenState
    extends ConsumerState<ReviewConversationScreen> {
  final _controller = TextEditingController();
  // ignore: prefer_final_fields
  int _currentCard = 5; //MOCKDATA
  // ignore: prefer_final_fields
  int _totalCards = 8; //MOCKDATA

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ReviewCompleteScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KStitchScaffold(
      backgroundColor: KColors.pageBg,
      body: SafeArea(
        child: Column(
          children: [
            // Top progress bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp16, vertical: KSpacing.sp12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.reviewProgressOf(_currentCard, _totalCards), //MOCKDATA
                      style: KTypography.getStyle(KTextStyle.h4, locale)
                          .copyWith(color: KColors.neutral900),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: KColors.neutral400),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(KSpacing.sp16),
                child: Column(
                  children: [
                    // Koko animation
                    const KokoAnimation(
                      state: KokoState.encouraging,
                      size: 120,
                    ),
                    const SizedBox(height: KSpacing.sp16),

                    // Koko conversation bubble
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(KSpacing.sp16),
                      decoration: BoxDecoration(
                        color: KColors.brand400,
                        borderRadius: KRadius.lg,
                        boxShadow: [
                          BoxShadow(
                            color: KColors.brand400.withValues(alpha: 0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        _mockKokoPrompt, //MOCKDATA
                        style: KTypography.getStyle(KTextStyle.body, locale)
                            .copyWith(color: KColors.neutral1000),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: KSpacing.sp24),

                    // User response text field
                    KCard(
                      padding: EdgeInsets.zero,
                      child: TextField(
                        controller: _controller,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: l10n.reviewConversationPrompt,
                          labelStyle: KTypography.getStyle(KTextStyle.label, locale),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(KSpacing.sp16),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.mic_outlined, color: KColors.brand400),
                            onPressed: () {}, // mic placeholder
                          ),
                        ),
                        style: KTypography.getStyle(KTextStyle.body, locale),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    const SizedBox(height: KSpacing.sp16),

                    // Word chips
                    Wrap(
                      spacing: KSpacing.sp8,
                      runSpacing: KSpacing.sp8,
                      children: _mockWordChips.map((chip) { //MOCKDATA
                        return GestureDetector(
                          onTap: () {
                            _controller.text =
                                '${_controller.text}${_controller.text.isEmpty ? '' : ' '}$chip';
                            setState(() {});
                          },
                          child: Container(
                            constraints: const BoxConstraints(minHeight: KSpacing.sp48),
                            padding: const EdgeInsets.symmetric(
                              horizontal: KSpacing.sp16,
                              vertical: KSpacing.sp8,
                            ),
                            decoration: BoxDecoration(
                              color: KColors.brand400.withValues(alpha: 0.08),
                              borderRadius: KRadius.full,
                              border: Border.all(color: KColors.brand400.withValues(alpha: 0.35)),
                            ),
                            child: Text(
                              chip,
                              style: KTypography.getStyle(KTextStyle.label, locale)
                                  .copyWith(color: KColors.brand500),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: KSpacing.sp24),
                  ],
                ),
              ),
            ),

            // Submit button
            Padding(
              padding: EdgeInsets.fromLTRB(
                KSpacing.sp16,
                KSpacing.sp8,
                KSpacing.sp16,
                MediaQuery.of(context).padding.bottom + KSpacing.sp16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      _controller.text.trim().isEmpty ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KColors.brand400,
                    disabledBackgroundColor: KColors.brand400.withValues(alpha: 0.40),
                    foregroundColor: KColors.neutral1000,
                    minimumSize: const Size(double.infinity, KSpacing.sp48),
                    shape: RoundedRectangleBorder(borderRadius: KRadius.full),
                    elevation: KElevation.elevation0,
                  ),
                  child: Text(
                    'Submit',
                    style: KTypography.getStyle(KTextStyle.button, locale)
                        .copyWith(color: KColors.neutral1000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
