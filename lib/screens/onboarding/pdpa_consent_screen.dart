// ONB-03 — PDPA Consent screen (redesigned).
// Toggle switches instead of expandable cards.
// Background: KColors.brand50 (lavender).
// CTA: KColors.brand500 (teal) via KotokaButton.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class PdpaConsentScreen extends ConsumerStatefulWidget {
  const PdpaConsentScreen({super.key});

  @override
  ConsumerState<PdpaConsentScreen> createState() => _PdpaConsentScreenState();
}

class _PdpaConsentScreenState extends ConsumerState<PdpaConsentScreen> {
  bool _cameraOn = true;    // required, starts ON
  bool _locationOn = false; // starts OFF
  bool _micOn = true;       // starts ON
  bool _notifOn = true;     // starts ON

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.brand50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: KSpacing.sp24,
                  vertical: KSpacing.sp16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: KSpacing.sp16),

                    // Shield icon container
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: KColors.brand400.withValues(alpha: 0.10),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shield_outlined,
                          size: 40,
                          color: KColors.brand500,
                        ),
                      ),
                    ),
                    const SizedBox(height: KSpacing.sp20),

                    // Title
                    Text(
                      l.pdpaNewTitle,
                      textAlign: TextAlign.center,
                      style: KTypography.getStyle(KTextStyle.h2, locale)
                          .copyWith(color: KColors.neutral900),
                    ),
                    const SizedBox(height: KSpacing.sp8),

                    // Subtitle
                    Text(
                      l.pdpaNewSubtitle,
                      textAlign: TextAlign.center,
                      style: KTypography.getStyle(KTextStyle.body, locale)
                          .copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: KSpacing.sp24),

                    // Permission toggle rows
                    _ToggleRow(
                      icon: Icons.camera_alt_outlined,
                      title: l.pdpaCamera,
                      subtitle: l.pdpaCameraDesc,
                      value: _cameraOn,
                      onChanged: (v) => setState(() => _cameraOn = v),
                      locale: locale,
                    ),
                    const SizedBox(height: KSpacing.sp12),
                    _ToggleRow(
                      icon: Icons.location_on_outlined,
                      title: l.pdpaLocationLabel,
                      subtitle: l.pdpaLocationDesc,
                      value: _locationOn,
                      onChanged: (v) => setState(() => _locationOn = v),
                      locale: locale,
                    ),
                    const SizedBox(height: KSpacing.sp12),
                    _ToggleRow(
                      icon: Icons.mic_outlined,
                      title: l.pdpaMicrophoneLabel,
                      subtitle: l.pdpaMicrophoneDesc,
                      value: _micOn,
                      onChanged: (v) => setState(() => _micOn = v),
                      locale: locale,
                    ),
                    const SizedBox(height: KSpacing.sp12),
                    _ToggleRow(
                      icon: Icons.notifications_outlined,
                      title: l.permissionNotifications,
                      subtitle: l.pdpaNotificationsDesc,
                      value: _notifOn,
                      onChanged: (v) => setState(() => _notifOn = v),
                      locale: locale,
                    ),
                    const SizedBox(height: KSpacing.sp24),
                  ],
                ),
              ),
            ),

            // Bottom CTAs
            Padding(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp24,
                KSpacing.sp8,
                KSpacing.sp24,
                KSpacing.sp8,
              ),
              child: KotokaButton(
                label: l.pdpaAllow,
                onPressed: () => context.go('/onboarding/language'),
                variant: KotokaButtonVariant.primary,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => context.go('/onboarding/language'),
                child: Text(
                  l.pdpaMaybeLater,
                  style: KTypography.getStyle(
                          KTextStyle.body, locale)
                      .copyWith(color: Colors.black54),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: KSpacing.sp24),
              child: Center(
                child: Text(
                  l.pdpaSettings,
                  style: KTypography.getStyle(KTextStyle.caption, locale)
                      .copyWith(color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.locale,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KSpacing.sp16),
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.lg,
        boxShadow: KElevation.shadow1,
      ),
      child: Row(
        children: [
          // Icon container
          Container(
            width: KSpacing.sp40,
            height: KSpacing.sp40,
            decoration: BoxDecoration(
              color: KColors.brand400.withValues(alpha: 0.12),
              borderRadius: KRadius.md,
            ),
            child: Icon(icon, color: KColors.brand500, size: KSpacing.sp20),
          ),
          const SizedBox(width: KSpacing.sp12),
          // Title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: KTypography.getStyle(KTextStyle.h4, locale),
                ),
                const SizedBox(height: KSpacing.sp2),
                Text(
                  subtitle,
                  style: KTypography.getStyle(KTextStyle.bodySmall, locale)
                      .copyWith(color: KColors.textSecondary),
                ),
              ],
            ),
          ),
          // Toggle switch
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: KColors.brand500,
          ),
        ],
      ),
    );
  }
}
