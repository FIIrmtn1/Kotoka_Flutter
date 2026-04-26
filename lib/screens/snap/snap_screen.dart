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
  bool _advancedOpen = false;

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

  void _onVerticalDrag(DragUpdateDetails details) {
    if (details.delta.dy < -6 && !_advancedOpen) {
      setState(() => _advancedOpen = true);
    } else if (details.delta.dy > 6 && _advancedOpen) {
      setState(() => _advancedOpen = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: KColors.neutral900,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: KElevation.elevation0,
        title: Text(
          l10n.snapTitle,
          style: const TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: KColors.neutral0,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: KSpacing.sp16),
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: KColors.neutral400,
              size: 20,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onVerticalDragUpdate: _onVerticalDrag,
        child: Stack(
          children: [
            // 1 — Full-screen camera viewfinder placeholder
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

            // 2 — Swipe hint pill (default state only)
            if (!_advancedOpen)
              Positioned(
                bottom: 120 + padding.bottom,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: KColors.neutral0.withValues(alpha: 0.30),
                      borderRadius: KRadius.full,
                    ),
                  ),
                ),
              ),

            // 3 — Animated advanced panel (tab switcher)
            if (_advancedOpen)
              Positioned(
                top: kToolbarHeight + padding.top + KSpacing.sp8,
                left: KSpacing.sp16,
                right: KSpacing.sp16,
                child: AnimatedOpacity(
                  opacity: _advancedOpen ? 1.0 : 0.0,
                  duration: KMotion.fast,
                  child: _SnapTabSwitcher(
                    controller: _tabController,
                    onTabChanged: (index) {
                      if (index == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const SnapTextScreen()),
                        );
                        _tabController.index = 0;
                      }
                    },
                    l10n: l10n,
                    locale: locale,
                  ),
                ),
              ),

            // 4 — Bottom overlay: SensoryTagBar (advanced only) + SNAP button
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                  left: KSpacing.sp16,
                  right: KSpacing.sp16,
                  top: KSpacing.sp16,
                  bottom: padding.bottom + KSpacing.sp24,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      KColors.neutral900.withValues(alpha: 0.90),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Sensory tags — advanced only
                    if (_advancedOpen) ...[
                      SensoryTagBar(
                        tags: [
                          SensoryTags.location('Silom Office'), //MOCKDATA
                          SensoryTags.weather('28°C'), //MOCKDATA
                          SensoryTags.mood('6/10'), //MOCKDATA
                        ],
                        mode: SensoryTagBarMode.compact,
                      ),
                      const SizedBox(height: KSpacing.sp16),
                    ],

                    // SNAP button
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: trigger capture
                        },
                        child: Container(
                          width: KSpacing.sp80,
                          height: KSpacing.sp80,
                          decoration: BoxDecoration(
                            color: KColors.brand500,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: KColors.brand500.withValues(alpha: 0.40),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: KColors.neutral0,
                            size: KSpacing.sp32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
        color: KColors.neutral900.withValues(alpha: 0.60),
        borderRadius: KRadius.full,
        border: Border.all(
          color: KColors.brand400.withValues(alpha: 0.40),
        ),
      ),
      child: TabBar(
        controller: controller,
        onTap: onTabChanged,
        indicator: BoxDecoration(
          color: KColors.brand400,
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
