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
// ONB-02 — Language Select screen
// "I speak" + "I want to learn" dropdowns with KokoFlag, 6 languages.
// CTA disabled until both selected and different. Saves to onboardingProvider.
// =============================================================================

/// Language option definition
class _LangOption {
  const _LangOption({
    required this.code,
    required this.flag,
    required this.labelKey,
  });
  final String code;
  final String flag; // flag emoji — rendered via KokoFlag
  final String Function(AppLocalizations) labelKey;
}

const List<_LangOption> _kLanguages = [
  _LangOption(code: 'th', flag: '🇹🇭', labelKey: _langThai),
  _LangOption(code: 'en', flag: '🇬🇧', labelKey: _langEnglish),
  _LangOption(code: 'zh', flag: '🇨🇳', labelKey: _langMandarin),
  _LangOption(code: 'es', flag: '🇪🇸', labelKey: _langSpanish),
  _LangOption(code: 'vi', flag: '🇻🇳', labelKey: _langVietnamese),
  _LangOption(code: 'lo', flag: '🇱🇦', labelKey: _langLao),
];

String _langThai(AppLocalizations l) => l.langThai;
String _langEnglish(AppLocalizations l) => l.langEnglish;
String _langMandarin(AppLocalizations l) => l.langMandarin;
String _langSpanish(AppLocalizations l) => l.langSpanish;
String _langVietnamese(AppLocalizations l) => l.langVietnamese;
String _langLao(AppLocalizations l) => l.langLao;

class LanguageSelectScreen extends ConsumerStatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  ConsumerState<LanguageSelectScreen> createState() =>
      _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends ConsumerState<LanguageSelectScreen> {
  String? _sourceCode;
  String? _targetCode;

  bool get _canContinue =>
      _sourceCode != null &&
      _targetCode != null &&
      _sourceCode != _targetCode;

  void _onContinue() {
    if (!_canContinue) return;
    ref.read(selectedLanguagePairProvider.notifier).setLanguages(
          source: _sourceCode!,
          target: _targetCode!,
        );
    context.go(AppRoutes.onboardingAssessment);
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required ValueChanged<String?> onChanged,
    required AppLocalizations l10n,
  }) {
    final locale = Localizations.localeOf(context);
    final isSelected = value != null;
    return KCard(
      selected: isSelected,
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp16,
        vertical: KSpacing.sp4,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: Text(
            hint,
            style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
              color: KColors.textDisabled,
            ),
          ),
          icon: const Icon(Icons.expand_more_rounded, color: KColors.brand400),
          dropdownColor: KColors.neutral0,
          borderRadius: KRadius.md,
          items: _kLanguages.map((lang) {
            return DropdownMenuItem<String>(
              value: lang.code,
              child: Row(
                children: [
                  KokoFlag(emoji: lang.flag, size: 24, radius: 4),
                  const SizedBox(width: KSpacing.sp12),
                  Text(
                    lang.labelKey(l10n),
                    style: KTypography.getStyle(KTextStyle.body, locale),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
          selectedItemBuilder: (context) => _kLanguages.map((lang) {
            return Row(
              children: [
                KokoFlag(emoji: lang.flag, size: 24, radius: 4),
                const SizedBox(width: KSpacing.sp12),
                Text(
                  lang.labelKey(l10n),
                  style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
                    color: KColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

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
              KSectionHeader(l10n.languageSelectTitle),
              const SizedBox(height: KSpacing.sp8),
              Text(
                l10n.languageSelectSubtitle,
                style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
                  color: KColors.textSecondary,
                ),
              ),
              const SizedBox(height: KSpacing.sp32),
              // "I speak" dropdown
              Text(
                l10n.langISpeak,
                style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: KSpacing.sp8),
              _buildDropdown(
                hint: l10n.langISpeak,
                value: _sourceCode,
                l10n: l10n,
                onChanged: (v) => setState(() => _sourceCode = v),
              ),
              const SizedBox(height: KSpacing.sp24),
              // "I want to learn" dropdown
              Text(
                l10n.langILearn,
                style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: KSpacing.sp8),
              _buildDropdown(
                hint: l10n.langILearn,
                value: _targetCode,
                l10n: l10n,
                onChanged: (v) => setState(() => _targetCode = v),
              ),
              const Spacer(),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: _canContinue ? _onContinue : null,
              ),
              const SizedBox(height: KSpacing.sp32),
            ],
          ),
        ),
      ),
    );
  }
}
