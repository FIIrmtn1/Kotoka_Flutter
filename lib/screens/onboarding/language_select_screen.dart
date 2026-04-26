import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_emoji.dart' show KokoEmoji, KokoFlag;
import 'package:kotoka_app/core/providers/locale_provider.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/main.dart';

// ---------------------------------------------------------------------------
// Supported display languages (UI locale picker)
// ---------------------------------------------------------------------------
const List<_UILang> _kUILangs = [
  _UILang(locale: Locale('en'), flag: '🇬🇧', name: 'English'),
  _UILang(locale: Locale('th'), flag: '🇹🇭', name: 'ภาษาไทย'),
  _UILang(locale: Locale('zh'), flag: '🇨🇳', name: '中文'),
  _UILang(locale: Locale('es'), flag: '🇪🇸', name: 'Español'),
  _UILang(locale: Locale('vi'), flag: '🇻🇳', name: 'Tiếng Việt'),
  _UILang(locale: Locale('lo'), flag: '🇱🇦', name: 'ລາວ'),
];

class _UILang {
  const _UILang({required this.locale, required this.flag, required this.name});
  final Locale locale;
  final String flag;
  final String name;
}

// ---------------------------------------------------------------------------
// App-supported learnable languages (6 pairs)
// ---------------------------------------------------------------------------
const List<_Lang> _kLangs = [
  _Lang(flag: '🇹🇭', name: 'Thai',       code: 'th'),
  _Lang(flag: '🇬🇧', name: 'English',    code: 'en'),
  _Lang(flag: '🇨🇳', name: 'Mandarin',   code: 'zh'),
  _Lang(flag: '🇻🇳', name: 'Vietnamese', code: 'vi'),
  _Lang(flag: '🇱🇦', name: 'Lao',        code: 'lo'),
  _Lang(flag: '🇪🇸', name: 'Spanish',    code: 'es'),
];

class _Lang {
  const _Lang({required this.flag, required this.name, required this.code});
  final String flag;
  final String name;
  final String code;
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------
class LanguageSelectScreen extends ConsumerStatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  ConsumerState<LanguageSelectScreen> createState() =>
      _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends ConsumerState<LanguageSelectScreen> {
  _Lang? _native;
  _Lang? _target;

  bool get _canContinue =>
      _native != null &&
      _target != null &&
      _native!.code != _target!.code;

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final theme  = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: KColors.brand500),
        title: Text(
          l10n.selectLanguage,
          style: KTypography.getStyle(KTextStyle.h3, locale)
              .copyWith(color: theme.colorScheme.onSurface),
        ),
        actions: [
          // Dark mode toggle
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              color: KColors.brand500,
            ),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Display language picker ─────────────────────────────────
              _DisplayLanguageRow(l10n: l10n, locale: locale),
              const SizedBox(height: KSpacing.sp32),

              // ── Native language ─────────────────────────────────────────
              Text(
                l10n.langISpeak,
                style: KTypography.getStyle(KTextStyle.h4, locale)
                    .copyWith(color: theme.colorScheme.onSurface),
              ),
              const SizedBox(height: KSpacing.sp12),
              _LangDropdown(
                value: _native,
                hint: l10n.langISpeak,
                exclude: _target,
                onChanged: (v) => setState(() => _native = v),
              ),
              const SizedBox(height: KSpacing.sp24),

              // ── Target language ─────────────────────────────────────────
              Text(
                l10n.langILearn,
                style: KTypography.getStyle(KTextStyle.h4, locale)
                    .copyWith(color: theme.colorScheme.onSurface),
              ),
              const SizedBox(height: KSpacing.sp12),
              _LangDropdown(
                value: _target,
                hint: l10n.langILearn,
                exclude: _native,
                onChanged: (v) => setState(() => _target = v),
              ),

              const Spacer(),

              // ── Continue ────────────────────────────────────────────────
              KotokaButton(
                label: l10n.continueButton,
                onPressed: _canContinue
                    ? () => context.go('/onboarding/welcome')
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

// ---------------------------------------------------------------------------
// Display language row
// ---------------------------------------------------------------------------
class _DisplayLanguageRow extends ConsumerWidget {
  const _DisplayLanguageRow({required this.l10n, required this.locale});
  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp16, vertical: KSpacing.sp8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: KRadius.md,
        border: Border.all(color: KColors.neutral200),
        boxShadow: KElevation.shadow1,
      ),
      child: Row(
        children: [
          Icon(Icons.language_rounded, color: KColors.brand500, size: 20),
          const SizedBox(width: KSpacing.sp8),
          Text(
            l10n.langDisplayLanguage,
            style: KTypography.getStyle(KTextStyle.label, locale).copyWith(
                color: theme.colorScheme.onSurface, letterSpacing: 0),
          ),
          const Spacer(),
          DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              value: currentLocale ?? const Locale('en'),
              isDense: true,
              borderRadius: KRadius.md,
              dropdownColor: theme.cardColor,
              items: _kUILangs
                  .map((lang) => DropdownMenuItem(
                        value: lang.locale,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            KokoFlag(emoji: lang.flag, size: 18, radius: 3),
                            const SizedBox(width: 8),
                            Text(lang.name,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (loc) {
                if (loc != null) {
                  ref.read(localeProvider.notifier).setLocale(loc);
                }
              },
              selectedItemBuilder: (_) => _kUILangs
                  .map((lang) => Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            KokoFlag(emoji: lang.flag, size: 16, radius: 3),
                            const SizedBox(width: 6),
                            Text(
                              lang.name,
                              style: KTypography.getStyle(KTextStyle.label, locale)
                                  .copyWith(
                                      color: KColors.brand500, letterSpacing: 0),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _LangDropdown
// ---------------------------------------------------------------------------
class _LangDropdown extends StatelessWidget {
  const _LangDropdown({
    required this.hint,
    required this.value,
    required this.onChanged,
    this.exclude,
  });
  final String hint;
  final _Lang? value;
  final _Lang? exclude;
  final ValueChanged<_Lang?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = _kLangs
        .where((l) => exclude == null || l.code != exclude!.code)
        .toList();

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp16, vertical: KSpacing.sp4),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: KRadius.md,
        border: Border.all(
          color: value != null ? KColors.brand500 : KColors.neutral300,
          width: value != null ? 2 : 1,
        ),
        boxShadow: KElevation.shadow1,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<_Lang>(
          isExpanded: true,
          value: value,
          dropdownColor: theme.cardColor,
          hint: Text(hint,
              style: TextStyle(
                  fontSize: 15, color: theme.colorScheme.onSurface.withOpacity(0.4))),
          borderRadius: KRadius.md,
          items: items
              .map((lang) => DropdownMenuItem(
                    value: lang,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        KokoFlag(emoji: lang.flag, size: 20, radius: 3),
                        const SizedBox(width: 8),
                        Text(lang.name,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          selectedItemBuilder: (_) => items
              .map((lang) => Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        KokoFlag(emoji: lang.flag, size: 20, radius: 3),
                        const SizedBox(width: 6),
                        Text(
                          lang.name,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: KColors.brand500),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
