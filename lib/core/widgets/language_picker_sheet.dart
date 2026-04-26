import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/providers/locale_provider.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_emoji.dart' show KokoFlag;
import 'package:kotoka_app/l10n/app_localizations.dart';

// ---------------------------------------------------------------------------
// Language data
// ---------------------------------------------------------------------------
class _UILang {
  const _UILang({required this.locale, required this.flag, required this.name});
  final Locale locale;
  final String flag;
  final String name;
}

const List<_UILang> _kUILangs = [
  _UILang(locale: Locale('en'), flag: '🇬🇧', name: 'English'),
  _UILang(locale: Locale('th'), flag: '🇹🇭', name: 'ภาษาไทย'),
  _UILang(locale: Locale('zh'), flag: '🇨🇳', name: '中文'),
  _UILang(locale: Locale('es'), flag: '🇪🇸', name: 'Español'),
  _UILang(locale: Locale('vi'), flag: '🇻🇳', name: 'Tiếng Việt'),
  _UILang(locale: Locale('lo'), flag: '🇱🇦', name: 'ລາວ'),
];

// ---------------------------------------------------------------------------
// LanguagePickerSheet
// ---------------------------------------------------------------------------
class LanguagePickerSheet extends ConsumerWidget {
  const LanguagePickerSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(localeProvider);
    final theme = Theme.of(context);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          const SizedBox(height: KSpacing.sp8),
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: KColors.neutral300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: KSpacing.sp16),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: KSpacing.sp16),
            child: Text(
              l10n.langDisplayLanguage,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: KColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: KSpacing.sp8),
          const Divider(height: 1),
          // Language list
          ..._kUILangs.map((lang) {
            final isSelected = (currentLocale?.languageCode ?? 'en') ==
                lang.locale.languageCode;
            return ListTile(
              leading: KokoFlag(emoji: lang.flag, size: 28, radius: 4),
              title: Text(
                lang.name,
                style: TextStyle(
                  fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: isSelected ? KColors.brand700 : KColors.textPrimary,
                ),
              ),
              trailing: isSelected
                  ? const Icon(Icons.check_rounded, color: KColors.brand500)
                  : null,
              onTap: () {
                ref.read(localeProvider.notifier).setLocale(lang.locale);
                Navigator.of(context).pop();
              },
            );
          }),
          const SizedBox(height: KSpacing.sp8),
        ],
      ),
    );
  }
}
