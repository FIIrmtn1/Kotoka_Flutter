// ONB-08 — Profile Setup screen.
// Background: KColors.brand50 (lavender).
// CTA: KColors.brand500 (teal) via KotokaButton.
// Accent: KColors.brand400 (bright cyan) avatar bg + text.
// No hardcoded values — all from tokens.dart.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:kotoka_app/core/providers/onboarding_providers.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/core/widgets/kotoka_text_field.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: ref.read(displayNameProvider),
    );
    _nameController.addListener(_onNameChanged);
  }

  void _onNameChanged() {
    ref.read(displayNameProvider.notifier).state = _nameController.text.trim();
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.removeListener(_onNameChanged);
    _nameController.dispose();
    super.dispose();
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts[0].isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final name = _nameController.text.trim();
    final canContinue = name.isNotEmpty;

    return Scaffold(
      backgroundColor: KColors.neutral0,
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
                    const SizedBox(height: KSpacing.sp24),

                    // Title
                    Text(
                      l.profileSetupTitle,
                      style: KTypography.getStyle(KTextStyle.h2, locale)
                          .copyWith(color: KColors.brand500),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: KSpacing.sp32),

                    // Avatar circle with initials
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: KColors.brand400.withValues(alpha: 0.20),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: KColors.brand400,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            name.isEmpty ? '?' : _initials(name),
                            style: KTypography.getStyle(KTextStyle.h2, locale)
                                .copyWith(
                              color: KColors.brand400,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: KSpacing.sp8),

                    Center(
                      child: Text(
                        l.profileAvatarHint,
                        style:
                            KTypography.getStyle(KTextStyle.caption, locale),
                      ),
                    ),

                    const SizedBox(height: KSpacing.sp32),

                    // White card wrapping the text field
                    Container(
                      decoration: BoxDecoration(
                        color: KColors.neutral0,
                        borderRadius: KRadius.lg,
                        boxShadow: KElevation.shadow2,
                      ),
                      padding: const EdgeInsets.all(KSpacing.sp20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.profileNameLabel,
                            style: KTypography.getStyle(
                                    KTextStyle.label, locale)
                                .copyWith(color: KColors.brand600),
                          ),
                          const SizedBox(height: KSpacing.sp8),
                          KotokaTextField(
                            controller: _nameController,
                            hintText: l.profileNameHint,
                            prefixIcon: Icons.person_outline_rounded,
                            textInputAction: TextInputAction.done,
                            autofocus: true,
                          ),
                          // Accent underline
                          const SizedBox(height: KSpacing.sp12),
                          Container(
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [KColors.brand400, KColors.brand500],
                              ),
                              borderRadius: KRadius.full,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: KSpacing.sp32),
                  ],
                ),
              ),
            ),

            // Bottom CTA
            Padding(
              padding: const EdgeInsets.fromLTRB(
                KSpacing.sp24,
                KSpacing.sp8,
                KSpacing.sp24,
                KSpacing.sp24,
              ),
              child: KotokaButton(
                label: l.profileLetsGo,
                onPressed: canContinue
                    ? () => context.go('/onboarding/mission')
                    : null,
                variant: KotokaButtonVariant.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
