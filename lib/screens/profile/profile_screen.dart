import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/providers/locale_provider.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

// =============================================================================
// ProfileScreen
// - User avatar (initials circle, brand400/20 bg)
// - Stats row: Words Learned / Sessions / Accuracy (mock)
// - Language section with KokoFlag + "Change Language" -> LanguagePickerSheet
// - Settings section: App version, Sign out
// =============================================================================

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    const displayName = 'Nadia S.'; //MOCKDATA
    const initials = 'NS'; //MOCKDATA
    const wordsLearned = 247; //MOCKDATA
    const sessions = 34; //MOCKDATA
    const accuracy = '82%'; //MOCKDATA
    const appVersion = '0.9.1-beta'; //MOCKDATA

    return Scaffold(
      backgroundColor: KColors.neutral0,
      body: CustomScrollView(
        slivers: [
          // ----------------------------------------------------------------
          // App bar
          // ----------------------------------------------------------------
          SliverAppBar(
            backgroundColor: KColors.neutral0,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            floating: true,
            title: Text(
              l10n.profileTitle,
              style: KTypography.getStyle(KTextStyle.h3, locale),
            ),
          ),

          // ----------------------------------------------------------------
          // Avatar + name
          // ----------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp24,
                KSpacing.sp8,
                KSpacing.sp24,
                KSpacing.sp24,
              ),
              child: Column(
                children: [
                  // Avatar circle — brand400/20 bg
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: KColors.brand400.withValues(alpha: 0.20),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: KColors.brand400.withValues(alpha: 0.50),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        initials,
                        style: KTypography.getStyle(KTextStyle.h2, locale)
                            .copyWith(color: KColors.brand600),
                      ),
                    ),
                  ),
                  const SizedBox(height: KSpacing.sp12),
                  Text(
                    displayName,
                    style: KTypography.getStyle(KTextStyle.h3, locale),
                  ),
                ],
              ),
            ),
          ),

          // ----------------------------------------------------------------
          // Stats row
          // ----------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp24,
                0,
                KSpacing.sp24,
                KSpacing.sp24,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: KSpacing.sp16,
                ),
                decoration: BoxDecoration(
                  color: KColors.neutral0,
                  borderRadius: KRadius.lg,
                  boxShadow: KElevation.shadow2,
                ),
                child: Row(
                  children: [
                    _StatCell(
                      value: '$wordsLearned', //MOCKDATA
                      label: l10n.profileStatWords,
                      locale: locale,
                    ),
                    _VertDivider(),
                    _StatCell(
                      value: '$sessions', //MOCKDATA
                      label: l10n.profileStatSessions,
                      locale: locale,
                    ),
                    _VertDivider(),
                    _StatCell(
                      value: accuracy, //MOCKDATA
                      label: l10n.profileStatAccuracy,
                      locale: locale,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ----------------------------------------------------------------
          // Language section
          // ----------------------------------------------------------------
          SliverToBoxAdapter(
            child: _SectionGroup(
              header: l10n.profileLanguagePairs,
              locale: locale,
              children: [
                _LanguageRow(l10n: l10n, locale: locale),
              ],
            ),
          ),

          // ----------------------------------------------------------------
          // Settings section
          // ----------------------------------------------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: KSpacing.sp40),
              child: _SectionGroup(
                header: l10n.profileSettingsSection,
                locale: locale,
                children: [
                  // Display language row
                  _DisplayLanguageRow(l10n: l10n, locale: locale),
                  const Divider(height: 1, color: KColors.borderDefault,
                      indent: KSpacing.sp16, endIndent: KSpacing.sp16),
                  // Daily reminders toggle
                  _SettingsToggleRow(
                    label: l10n.profileNotifications,
                    locale: locale,
                  ),
                  const Divider(height: 1, color: KColors.borderDefault,
                      indent: KSpacing.sp16, endIndent: KSpacing.sp16),
                  // Send Feedback row
                  _SettingsTapRow(
                    icon: Icons.feedback_outlined,
                    label: l10n.profileSendFeedback,
                    locale: locale,
                    onTap: () {}, // TODO: open feedback form
                  ),
                  const Divider(height: 1, color: KColors.borderDefault,
                      indent: KSpacing.sp16, endIndent: KSpacing.sp16),
                  // App version row
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: KSpacing.sp16,
                      vertical: KSpacing.sp12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.profileAppVersion,
                          style: KTypography.getStyle(KTextStyle.body, locale),
                        ),
                        Text(
                          appVersion,
                          style: KTypography.getStyle(
                            KTextStyle.bodySmall,
                            locale,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: KColors.borderDefault,
                    indent: KSpacing.sp16,
                    endIndent: KSpacing.sp16,
                  ),
                  // Sign out
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      KSpacing.sp16,
                      KSpacing.sp12,
                      KSpacing.sp16,
                      KSpacing.sp4,
                    ),
                    child: KotokaButton(
                      label: l10n.profileSignOut,
                      onPressed: () {
                        // TODO: wire up Firebase sign-out
                      },
                      variant: KotokaButtonVariant.ghost,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _StatCell — single stat number + label
// ---------------------------------------------------------------------------
class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.value,
    required this.label,
    required this.locale,
  });

  final String value;
  final String label;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: KTypography.getStyle(KTextStyle.h3, locale)
                .copyWith(color: KColors.brand500),
          ),
          const SizedBox(height: KSpacing.sp4),
          Text(
            label,
            style: KTypography.getStyle(KTextStyle.caption, locale),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _VertDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: KSpacing.sp40,
      color: KColors.borderDefault,
    );
  }
}

// ---------------------------------------------------------------------------
// _SectionGroup — card container with header + children
// ---------------------------------------------------------------------------
class _SectionGroup extends StatelessWidget {
  const _SectionGroup({
    required this.header,
    required this.locale,
    required this.children,
  });

  final String header;
  final Locale locale;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        KSpacing.sp24,
        0,
        KSpacing.sp24,
        KSpacing.sp16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: KSpacing.sp8),
            child: Text(
              header,
              style: KTypography.getStyle(KTextStyle.h4, locale)
                  .copyWith(color: KColors.brand600),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: KColors.neutral0,
              borderRadius: KRadius.lg,
              boxShadow: KElevation.shadow2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _LanguageRow — shows current pair + Change Language button
// Tapping opens LanguagePickerSheet and updates localeProvider
// ---------------------------------------------------------------------------
class _LanguageRow extends ConsumerWidget {
  const _LanguageRow({required this.l10n, required this.locale});

  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(KSpacing.sp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current language pair with flag icons
          Row(
            children: [
              _FlagChip(countryCode: 'gb', label: 'EN', locale: locale),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: KSpacing.sp8),
                child: Icon(
                  Icons.arrow_forward,
                  size: KSpacing.sp16,
                  color: KColors.textSecondary,
                ),
              ),
              _FlagChip(countryCode: 'th', label: 'TH', locale: locale),
            ],
          ),
          const SizedBox(height: KSpacing.sp12),
          // Change Language CTA
          KotokaButton(
            label: l10n.profileChangeLanguage,
            onPressed: () => _showLanguagePicker(context, ref),
            variant: KotokaButtonVariant.secondary,
            leadingIcon: Icons.language_outlined,
          ),
        ],
      ),
    );
  }

  void _showLanguagePicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _LanguagePickerSheet(
        onLocaleSelected: (selectedLocale) {
          ref.read(localeProvider.notifier).setLocale(selectedLocale);
          Navigator.of(context).pop();
        },
        locale: locale,
        l10n: l10n,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _FlagChip — flag + language code pill
// ---------------------------------------------------------------------------
class _FlagChip extends StatelessWidget {
  const _FlagChip({
    required this.countryCode,
    required this.label,
    required this.locale,
  });

  final String countryCode;
  final String label;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    // Uses ClipRRect for rounded flag as per KokoFlag contract.
    // Twemoji PNG from local assets/twemoji/ bundle.
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KSpacing.sp8,
        vertical: KSpacing.sp4,
      ),
      decoration: BoxDecoration(
        color: KColors.sky100,
        borderRadius: KRadius.sm,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(KRadius.radiusXs),
            child: Image.asset(
              'assets/twemoji/flag_$countryCode.png',
              width: KSpacing.sp16,
              height: KSpacing.sp16,
              errorBuilder: (_, __, ___) => const SizedBox(
                width: KSpacing.sp16,
                height: KSpacing.sp16,
                child: Icon(
                  Icons.flag_outlined,
                  size: KSpacing.sp12,
                  color: KColors.textSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(width: KSpacing.sp4),
          Text(
            label,
            style: KTypography.getStyle(KTextStyle.label, locale)
                .copyWith(color: KColors.info500),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _LanguagePickerSheet — modal bottom sheet for locale selection
// Language change updates localeProvider immediately and persists via prefs.
// ---------------------------------------------------------------------------
class _LanguagePickerSheet extends StatelessWidget {
  const _LanguagePickerSheet({
    required this.onLocaleSelected,
    required this.locale,
    required this.l10n,
  });

  final ValueChanged<Locale> onLocaleSelected;
  final Locale locale;
  final AppLocalizations l10n;

  static const _languages = <(String, String, String)>[
    ('en', 'English', 'gb'),
    ('th', 'ภาษาไทย', 'th'),
    ('zh', '普通话', 'cn'),
    ('es', 'Español', 'es'),
    ('vi', 'Tiếng Việt', 'vn'),
    ('lo', 'ພາສາລາວ', 'la'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: KColors.neutral0,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(KRadius.radiusXl),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            KSpacing.sp24,
            KSpacing.sp16,
            KSpacing.sp24,
            KSpacing.sp24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: KSpacing.sp40,
                  height: KSpacing.sp4,
                  decoration: BoxDecoration(
                    color: KColors.neutral300,
                    borderRadius: KRadius.full,
                  ),
                ),
              ),
              const SizedBox(height: KSpacing.sp16),
              Text(
                l10n.langDisplayLanguage,
                style: KTypography.getStyle(KTextStyle.h4, locale),
              ),
              const SizedBox(height: KSpacing.sp12),
              ..._languages.map(
                (lang) => _LangOption(
                  code: lang.$1,
                  label: lang.$2,
                  countryCode: lang.$3,
                  currentLocale: locale,
                  onTap: () => onLocaleSelected(Locale(lang.$1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LangOption extends StatelessWidget {
  const _LangOption({
    required this.code,
    required this.label,
    required this.countryCode,
    required this.currentLocale,
    required this.onTap,
  });

  final String code;
  final String label;
  final String countryCode;
  final Locale currentLocale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = currentLocale.languageCode == code;
    final locale = Localizations.localeOf(context);

    return InkWell(
      onTap: onTap,
      borderRadius: KRadius.md,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: KSpacing.sp12,
          horizontal: KSpacing.sp4,
        ),
        child: Row(
          children: [
            // Flag
            ClipRRect(
              borderRadius: BorderRadius.circular(KRadius.radiusXs),
              child: Image.asset(
                'assets/twemoji/flag_$countryCode.png',
                width: KSpacing.sp24,
                height: KSpacing.sp24,
                errorBuilder: (_, __, ___) => const SizedBox(
                  width: KSpacing.sp24,
                  height: KSpacing.sp24,
                  child: Icon(Icons.flag_outlined, size: KSpacing.sp16),
                ),
              ),
            ),
            const SizedBox(width: KSpacing.sp12),
            Expanded(
              child: Text(
                label,
                style: KTypography.getStyle(KTextStyle.body, locale).copyWith(
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.w400,
                  color:
                      isSelected ? KColors.brand500 : KColors.textPrimary,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: KColors.brand500,
                size: KSpacing.sp20,
              ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _DisplayLanguageRow — tappable row in Settings to change app display language
// ---------------------------------------------------------------------------
class _DisplayLanguageRow extends ConsumerWidget {
  const _DisplayLanguageRow({required this.l10n, required this.locale});
  final AppLocalizations l10n;
  final Locale locale;

  static const _langNames = {
    'en': 'English',
    'th': 'ภาษาไทย',
    'zh': '普通话',
    'es': 'Español',
    'vi': 'Tiếng Việt',
    'lo': 'ພາສາລາວ',
  };

  static const _flagCodes = {
    'en': 'gb', 'th': 'th', 'zh': 'cn',
    'es': 'es', 'vi': 'vn', 'lo': 'la',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCode = locale.languageCode;
    final flagCode = _flagCodes[currentCode] ?? 'gb';
    final langName = _langNames[currentCode] ?? 'English';

    return InkWell(
      onTap: () => _showPicker(context, ref),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp16, vertical: KSpacing.sp12),
        child: Row(
          children: [
            Icon(Icons.language_outlined, size: 20, color: KColors.brand600),
            const SizedBox(width: KSpacing.sp12),
            Expanded(
              child: Text(l10n.langDisplayLanguage,
                  style: KTypography.getStyle(KTextStyle.body, locale)),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(
                'assets/twemoji/flag_$flagCode.png',
                width: 18,
                height: 18,
                errorBuilder: (_, __, ___) => const SizedBox(width: 18),
              ),
            ),
            const SizedBox(width: KSpacing.sp4),
            Text(langName,
                style: KTypography.getStyle(KTextStyle.caption, locale)
                    .copyWith(color: KColors.textSecondary)),
            const SizedBox(width: KSpacing.sp4),
            const Icon(Icons.chevron_right_rounded,
                size: 18, color: KColors.neutral400),
          ],
        ),
      ),
    );
  }

  void _showPicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _LanguagePickerSheet(
        onLocaleSelected: (selected) {
          ref.read(localeProvider.notifier).setLocale(selected);
          Navigator.of(context).pop();
        },
        locale: locale,
        l10n: l10n,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _SettingsToggleRow — toggle row for boolean settings (e.g. notifications)
// ---------------------------------------------------------------------------
class _SettingsToggleRow extends StatefulWidget {
  const _SettingsToggleRow({required this.label, required this.locale});
  final String label;
  final Locale locale;

  @override
  State<_SettingsToggleRow> createState() => _SettingsToggleRowState();
}

class _SettingsToggleRowState extends State<_SettingsToggleRow> {
  bool _enabled = true; //MOCKDATA

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: KSpacing.sp16, vertical: KSpacing.sp4),
      child: Row(
        children: [
          Icon(Icons.notifications_outlined,
              size: 20, color: KColors.brand600),
          const SizedBox(width: KSpacing.sp12),
          Expanded(
            child: Text(widget.label,
                style: KTypography.getStyle(KTextStyle.body, widget.locale)),
          ),
          Switch(
            value: _enabled,
            onChanged: (v) => setState(() => _enabled = v), //MOCKDATA
            activeColor: KColors.brand500,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _SettingsTapRow — tappable row for navigation settings (e.g. feedback)
// ---------------------------------------------------------------------------
class _SettingsTapRow extends StatelessWidget {
  const _SettingsTapRow({
    required this.icon,
    required this.label,
    required this.locale,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final Locale locale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp16, vertical: KSpacing.sp12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: KColors.brand600),
            const SizedBox(width: KSpacing.sp12),
            Expanded(
              child: Text(label,
                  style: KTypography.getStyle(KTextStyle.body, locale)),
            ),
            const Icon(Icons.chevron_right_rounded,
                size: 18, color: KColors.neutral400),
          ],
        ),
      ),
    );
  }
}
