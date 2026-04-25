import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/kotoka_button.dart';

// =============================================================================
// PdpaConsentScreen — Thai PDPA compliant consent.
// 3 checkboxes: Camera & Photos, GPS Location, Voice/Microphone.
// All 3 required — continue disabled until all checked.
// Expandable "what we use this for" per permission.
// No hardcoded colors/sizes. All strings from AppLocalizations.
// =============================================================================

class _Permission {
  const _Permission({required this.key, required this.icon});
  final String key;
  final IconData icon;
}

const List<_Permission> _kPermissions = [
  _Permission(key: 'camera',    icon: Icons.camera_alt_outlined),
  _Permission(key: 'location',  icon: Icons.location_on_outlined),
  _Permission(key: 'microphone',icon: Icons.mic_outlined),
];

class PdpaConsentScreen extends StatefulWidget {
  const PdpaConsentScreen({super.key});

  @override
  State<PdpaConsentScreen> createState() => _PdpaConsentScreenState();
}

class _PdpaConsentScreenState extends State<PdpaConsentScreen> {
  final Map<String, bool> _checked = {
    'camera':     false,
    'location':   false,
    'microphone': false,
  };
  final Set<String> _expanded = {};

  bool get _allChecked => _checked.values.every((v) => v);

  void _toggle(String key) =>
      setState(() => _checked[key] = !(_checked[key] ?? false));

  void _toggleExpand(String key) => setState(() {
        if (_expanded.contains(key)) {
          _expanded.remove(key);
        } else {
          _expanded.add(key);
        }
      });

  String _titleFor(String key, AppLocalizations l10n) {
    switch (key) {
      case 'camera':     return l10n.pdpaCamera;
      case 'location':   return l10n.pdpaLocation;
      case 'microphone': return l10n.pdpaMicrophone;
      default:           return key;
    }
  }

  String _reasonFor(String key, AppLocalizations l10n) {
    switch (key) {
      case 'camera':     return l10n.pdpaCameraReason;
      case 'location':   return l10n.pdpaLocationReason;
      case 'microphone': return l10n.pdpaMicrophoneReason;
      default:           return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.brand50,
      appBar: AppBar(
        backgroundColor: KColors.brand50,
        elevation: KElevation.elevation0,
        leading: BackButton(color: KColors.brand500),
        title: Text(
          l10n.pdpaTitle,
          style: KTypography.getStyle(KTextStyle.h3, locale)
              .copyWith(color: KColors.neutral900),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSpacing.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PDPA explanation
              Container(
                padding: const EdgeInsets.all(KSpacing.sp16),
                decoration: BoxDecoration(
                  color: KColors.brand100,
                  borderRadius: KRadius.md,
                ),
                child: Text(
                  l10n.pdpaExplanation,
                  style: KTypography.getStyle(KTextStyle.body, locale)
                      .copyWith(color: KColors.neutral700),
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
              Text(
                l10n.pdpaRequiredAll,
                style: KTypography.getStyle(KTextStyle.label, locale)
                    .copyWith(color: KColors.neutral700),
              ),
              const SizedBox(height: KSpacing.sp12),
              // Permission checkboxes
              Expanded(
                child: ListView(
                  children: _kPermissions.map((perm) {
                    final isChecked  = _checked[perm.key] ?? false;
                    final isExpanded = _expanded.contains(perm.key);
                    return _PermissionTile(
                      icon: perm.icon,
                      title: _titleFor(perm.key, l10n),
                      reason: _reasonFor(perm.key, l10n),
                      isChecked: isChecked,
                      isExpanded: isExpanded,
                      expandLabel: l10n.pdpaWhatWeUse,
                      onToggle: () => _toggle(perm.key),
                      onExpand: () => _toggleExpand(perm.key),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: KSpacing.sp24),
              KotokaButton(
                label: l10n.continueButton,
                onPressed: _allChecked
                    ? () => context.go('/onboarding/profile')
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

class _PermissionTile extends StatelessWidget {
  const _PermissionTile({
    required this.icon,
    required this.title,
    required this.reason,
    required this.isChecked,
    required this.isExpanded,
    required this.expandLabel,
    required this.onToggle,
    required this.onExpand,
  });

  final IconData icon;
  final String title;
  final String reason;
  final bool isChecked;
  final bool isExpanded;
  final String expandLabel;
  final VoidCallback onToggle;
  final VoidCallback onExpand;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Container(
      margin: const EdgeInsets.only(bottom: KSpacing.sp12),
      decoration: BoxDecoration(
        color: KColors.neutral0,
        borderRadius: KRadius.md,
        border: Border.all(
          color: isChecked ? KColors.brand400 : KColors.neutral200,
        ),
        boxShadow: KElevation.shadow1,
      ),
      child: Column(
        children: [
          // Main row
          InkWell(
            onTap: onToggle,
            borderRadius: KRadius.md,
            child: Padding(
              padding: const EdgeInsets.all(KSpacing.sp16),
              child: Row(
                children: [
                  Container(
                    width: KSpacing.sp40,
                    height: KSpacing.sp40,
                    decoration: BoxDecoration(
                      color: isChecked
                          ? KColors.brand100
                          : KColors.neutral100,
                      borderRadius: KRadius.sm,
                    ),
                    child: Icon(
                      icon,
                      color: isChecked
                          ? KColors.brand600
                          : KColors.neutral500,
                      size: KSpacing.sp20,
                    ),
                  ),
                  const SizedBox(width: KSpacing.sp12),
                  Expanded(
                    child: Text(
                      title,
                      style: KTypography.getStyle(KTextStyle.body, locale)
                          .copyWith(color: KColors.neutral900),
                    ),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (_) => onToggle(),
                    activeColor: KColors.brand600,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(KRadius.radiusXs),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expandable reason
          InkWell(
            onTap: onExpand,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(KRadius.radiusMd),
              bottomRight: Radius.circular(KRadius.radiusMd),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: KSpacing.sp16,
                vertical: KSpacing.sp8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        expandLabel,
                        style:
                            KTypography.getStyle(KTextStyle.label, locale)
                                .copyWith(color: KColors.brand600),
                      ),
                      const SizedBox(width: KSpacing.sp4),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: KColors.brand600,
                        size: KSpacing.sp16,
                      ),
                    ],
                  ),
                  AnimatedCrossFade(
                    duration: KMotion.normal,
                    crossFadeState: isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Padding(
                      padding: const EdgeInsets.only(top: KSpacing.sp8),
                      child: Text(
                        reason,
                        style: KTypography.getStyle(
                                KTextStyle.caption, locale)
                            .copyWith(color: KColors.neutral600),
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
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
