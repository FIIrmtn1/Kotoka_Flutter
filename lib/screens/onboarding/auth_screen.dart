// ONB-02 — Auth screen.
// Auth is STUBBED — no real Firebase. Collects intent only.
// onTap flows → /onboarding/pdpa
// Background: KColors.brand50 (lavender). No bottom nav.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_scaffold.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return KScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: KSpacing.sp24,
            vertical: KSpacing.sp16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded,
                      color: KColors.neutral700),
                  onPressed: () => context.pop(),
                ),
              ),
              const SizedBox(height: KSpacing.sp16),

              // Koko animation — centered
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: KColors.brand400.withValues(alpha: 0.10),
                    borderRadius: KRadius.full,
                  ),
                  child: const KokoAnimation(
                    state: KokoState.idle,
                    size: 64,
                  ),
                ),
              ),
              const SizedBox(height: KSpacing.sp24),

              // Title
              Text(
                l10n.authTitle,
                textAlign: TextAlign.center,
                style: KTypography.getStyle(KTextStyle.h2, locale).copyWith(
                  color: KColors.neutral900,
                ),
              ),
              const SizedBox(height: KSpacing.sp32),

              // Continue with Google
              OutlinedButton.icon(
                icon: SvgPicture.asset(
                  'assets/icons/google_icon.svg',
                  width: 20,
                  height: 20,
                ),
                label: Text(
                  l10n.authGoogle,
                  style:
                      KTypography.getStyle(KTextStyle.button, locale).copyWith(
                    color: KColors.neutral900,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: KColors.neutral0,
                  side: const BorderSide(color: KColors.brand400, width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: KRadius.xl),
                  padding: const EdgeInsets.symmetric(
                    vertical: KSpacing.sp12,
                    horizontal: KSpacing.sp24,
                  ),
                ),
                onPressed: () => context.go('/onboarding/pdpa'), //MOCKDATA
              ),
              const SizedBox(height: KSpacing.sp24),

              // "or" divider
              Row(
                children: [
                  const Expanded(child: Divider(color: KColors.borderDefault)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: KSpacing.sp12),
                    child: Text(
                      l10n.authOr,
                      style: KTypography.getStyle(KTextStyle.caption, locale)
                          .copyWith(color: Colors.black38),
                    ),
                  ),
                  const Expanded(child: Divider(color: KColors.borderDefault)),
                ],
              ),
              const SizedBox(height: KSpacing.sp24),

              // Email field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: l10n.authEmail,
                  labelStyle: KTypography.getStyle(KTextStyle.body, locale)
                      .copyWith(color: KColors.textSecondary),
                  filled: true,
                  fillColor: KColors.neutral0,
                  border: OutlineInputBorder(
                    borderRadius: KRadius.lg,
                    borderSide:
                        const BorderSide(color: KColors.borderDefault),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: KRadius.lg,
                    borderSide:
                        const BorderSide(color: KColors.borderDefault),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: KRadius.lg,
                    borderSide:
                        const BorderSide(color: KColors.brand500, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: KSpacing.sp16,
                    vertical: KSpacing.sp12,
                  ),
                ),
              ),
              const SizedBox(height: KSpacing.sp16),

              // Password field
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: l10n.authPassword,
                  labelStyle: KTypography.getStyle(KTextStyle.body, locale)
                      .copyWith(color: KColors.textSecondary),
                  filled: true,
                  fillColor: KColors.neutral0,
                  border: OutlineInputBorder(
                    borderRadius: KRadius.lg,
                    borderSide:
                        const BorderSide(color: KColors.borderDefault),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: KRadius.lg,
                    borderSide:
                        const BorderSide(color: KColors.borderDefault),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: KRadius.lg,
                    borderSide:
                        const BorderSide(color: KColors.brand500, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: KSpacing.sp16,
                    vertical: KSpacing.sp12,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: KColors.neutral500,
                      size: KSpacing.sp20,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
              ),
              const SizedBox(height: KSpacing.sp24),

              // Sign in CTA
              KotokaButton(
                label: l10n.authSignIn,
                onPressed: () => context.go('/onboarding/pdpa'), //MOCKDATA
              ),
              const SizedBox(height: KSpacing.sp16),

              // No account sign-up link
              Center(
                child: TextButton(
                  onPressed: () => context.go('/onboarding/pdpa'), //MOCKDATA
                  child: Text(
                    l10n.authNoAccount,
                    style:
                        KTypography.getStyle(KTextStyle.body, locale).copyWith(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: KSpacing.sp16),

              // Privacy · Terms caption
              Center(
                child: Text(
                  l10n.authPrivacyTerms,
                  style: KTypography.getStyle(KTextStyle.caption, locale)
                      .copyWith(color: Colors.black38),
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
            ],
          ),
        ),
      ),
    );
  }
}

