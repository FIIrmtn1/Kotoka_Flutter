import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/koko_animation.dart';
import 'package:kotoka_app/core/widgets/k_stitch_scaffold.dart';
import 'package:kotoka_app/core/widgets/k_cta_button.dart';
import 'package:kotoka_app/core/widgets/kotoka_text_field.dart';
import 'package:kotoka_app/core/router/app_router.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _hasName = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      final hasText = _nameController.text.trim().isNotEmpty;
      if (hasText != _hasName) setState(() => _hasName = hasText);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    final kokoState = _hasName ? KokoState.celebrating : KokoState.idle;

    return KStitchScaffold(
      stickyHeader: KOnboardingHeader(
        onBack: () => Navigator.of(context).pop(),
        stepCurrent: 7,
        stepTotal: 8,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            children: [
              const SizedBox(height: KSpacing.sp8),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  l10n.profileSetupTitle,

                  style: KTypography.getStyle(KTextStyle.h3, locale)
                      .copyWith(color: KColors.neutral900),
                ),
              ),
              const SizedBox(height: KSpacing.sp16),
              AnimatedSwitcher(
                duration: KMotion.normal,
                child: KokoAnimation(
                  key: ValueKey(kokoState),
                  state: kokoState,
                  size: 120,
                ),
              ),
              const SizedBox(height: KSpacing.sp32),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: KColors.brand400.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: KColors.brand400.withValues(alpha: 0.30),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.person_outline,
                  size: KSpacing.sp40,
                  color: KColors.brand400,
                ),
              ),
              const SizedBox(height: KSpacing.sp8),
              Text(
                l10n.profileAvatarHint,
                style: KTypography.getStyle(KTextStyle.caption, locale),
              ),
              const SizedBox(height: KSpacing.sp32),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  l10n.profileNameLabel,
                  style: KTypography.getStyle(KTextStyle.label, locale)
                      .copyWith(color: KColors.neutral700),
                ),
              ),
              const SizedBox(height: KSpacing.sp8),
              KotokaTextField(
                controller: _nameController,
                hintText: l10n.profileNameHint,
                prefixIcon: Icons.person_outline,
                textInputAction: TextInputAction.done,
                autofocus: true,
              ),
              const SizedBox(height: KSpacing.sp48),
              KCtaButton(
                label: l10n.profileLetsGo,
                onPressed: _hasName
                    ? () {
                        ref.read(authCompletedProvider.notifier).state = true;
                        context.go('/home');
                      }
                    : null,
              ),
              SizedBox(
                  height: MediaQuery.of(context).padding.bottom +
                      KSpacing.sp16),
            ],
          ),
        ),
      ),
    );
  }
}
