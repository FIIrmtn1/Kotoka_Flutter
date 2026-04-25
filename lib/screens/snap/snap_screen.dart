import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/sensory_tag_bar.dart';
import 'package:kotoka_app/l10n/app_localizations.dart';
import 'package:kotoka_app/screens/snap/snap_text_screen.dart';

// SNA-01 — Snap Camera Mode
// Mock data lines tagged //MOCKDATA

class SnapScreen extends ConsumerStatefulWidget {
  const SnapScreen({super.key});

  @override
  ConsumerState<SnapScreen> createState() => _SnapScreenState();
}

class _SnapScreenState extends ConsumerState<SnapScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: KColors.neutral900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: KElevation.elevation0,
        title: Text(
          l10n.snapTitle,
          style: KTypography.getStyle(KTextStyle.h3, locale)
              .copyWith(color: KColors.neutral0),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Full-screen camera viewfinder placeholder
          Positioned.fill(
            child: Container(
              color: KColors.neutral800, //MOCKDATA
              child: Center(
                child: Text(
                  l10n.snapCameraViewfinder, //MOCKDATA
                  style: KTypography.getStyle(KTextStyle.body, locale)
                      .copyWith(color: KColors.neutral400),
                ),
              ),
            ),
          ),

          // Tab switcher at top (below app bar)
          Positioned(
            top: kToolbarHeight + MediaQuery.of(context).padding.top + KSpacing.sp8,
            left: KSpacing.sp16,
            right: KSpacing.sp16,
            child: _SnapTabSwitcher(
              controller: _tabController,
              onTabChanged: (index) {
                if (index == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SnapTextScreen()),
                  );
                  _tabController.index = 0;
                }
              },
              l10n: l10n,
              locale: locale,
            ),
          ),

          // Bottom overlay: SensoryTagBar + SNAP button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: KSpacing.sp16,
                right: KSpacing.sp16,
                top: KSpacing.sp16,
                bottom: MediaQuery.of(context).padding.bottom + KSpacing.sp24,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    KColors.neutral900.withOpacity(0.85),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Sensory tag bar — mock location/weather/mood
                  SensoryTagBar(
                    tags: [
                      SensoryTags.location('Silom Office'), //MOCKDATA
                      SensoryTags.weather('28°C'), //MOCKDATA
                      SensoryTags.mood('6/10'), //MOCKDATA
                    ],
                    mode: SensoryTagBarMode.compact,
                  ),
                  const SizedBox(height: KSpacing.sp24),

                  // SNAP button — circle brand700
                  GestureDetector(
                    onTap: () {
                      // TODO: trigger camera capture
                    },
                    child: Container(
                      width: KSpacing.sp80,
                      height: KSpacing.sp80,
                      decoration: const BoxDecoration(
                        color: KColors.brand500,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: KColors.neutral0,
                        size: KSpacing.sp32,
                      ),
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

class _SnapTabSwitcher extends StatelessWidget {
  const _SnapTabSwitcher({
    required this.controller,
    required this.onTabChanged,
    required this.l10n,
    required this.locale,
  });

  final TabController controller;
  final ValueChanged<int> onTabChanged;
  final AppLocalizations l10n;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSpacing.sp48,
      decoration: BoxDecoration(
        color: KColors.neutral900.withOpacity(0.6),
        borderRadius: KRadius.full,
        border: Border.all(color: KColors.brand500.withOpacity(0.5)),
      ),
      child: TabBar(
        controller: controller,
        onTap: onTabChanged,
        indicator: BoxDecoration(
          color: KColors.brand500,
          borderRadius: KRadius.full,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: KColors.neutral0,
        unselectedLabelColor: KColors.neutral400,
        labelStyle: KTypography.getStyle(KTextStyle.button, locale),
        unselectedLabelStyle: KTypography.getStyle(KTextStyle.button, locale),
        dividerColor: Colors.transparent,
        tabs: [
          Tab(text: l10n.snapTabCamera),
          Tab(text: l10n.snapTabText),
          Tab(text: l10n.snapTabGps),
        ],
      ),
    );
  }
}
