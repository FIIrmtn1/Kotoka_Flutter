import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';
import 'package:kotoka_app/core/widgets/k_ambient_orbs.dart';

// =============================================================================
// KScaffold — app-wide scaffold with KColors.brand50 background + ambient orbs.
// =============================================================================

class KScaffold extends StatelessWidget {
  const KScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.showOrbs = true,
    this.resizeToAvoidBottomInset = true,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool showOrbs;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.brand50,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        children: [
          if (showOrbs) const KAmbientOrbs(),
          child,
        ],
      ),
    );
  }
}
