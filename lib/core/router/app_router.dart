/// App router — go_router with auth guard, shell route + bottom nav.
///
/// Routes:
///   /onboarding   — public, redirects to /home if authenticated
///   /home         — auth-guarded
///   /snap         — auth-guarded
///   /review       — auth-guarded
///   /shop         — auth-guarded
///   /profile      — auth-guarded
///
/// Bottom nav tabs: Home, Snap, Review, Shop, Profile
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:kotoka_app/core/widgets/bottom_tab_bar.dart';
import 'package:kotoka_app/screens/home/home_screen.dart';
import 'package:kotoka_app/screens/onboarding/welcome_screen.dart';
import 'package:kotoka_app/screens/onboarding/auth_screen.dart';
import 'package:kotoka_app/screens/onboarding/language_select_screen.dart';
import 'package:kotoka_app/screens/onboarding/goal_select_screen.dart';
import 'package:kotoka_app/screens/onboarding/proficiency_assessment_screen.dart';
import 'package:kotoka_app/screens/onboarding/goal_commitment_screen.dart';
import 'package:kotoka_app/screens/onboarding/level_select_screen.dart';
import 'package:kotoka_app/screens/onboarding/schedule_screen.dart';
import 'package:kotoka_app/screens/onboarding/commitment_screen.dart';
import 'package:kotoka_app/screens/onboarding/pdpa_consent_screen.dart';
import 'package:kotoka_app/screens/onboarding/profile_setup_screen.dart';
import 'package:kotoka_app/screens/onboarding/mission_screen.dart';
import 'package:kotoka_app/screens/onboarding/summary_screen.dart';
import 'package:kotoka_app/screens/snap/snap_screen.dart';
import 'package:kotoka_app/screens/snap/snap_text_screen.dart';
import 'package:kotoka_app/screens/snap/snap_processing_screen.dart';
import 'package:kotoka_app/screens/snap/snap_results_screen.dart';
import 'package:kotoka_app/screens/review/review_screen.dart';
import 'package:kotoka_app/screens/review/review_flashcard_screen.dart';
import 'package:kotoka_app/screens/review/review_fillblank_screen.dart';
import 'package:kotoka_app/screens/review/review_conversation_screen.dart';
import 'package:kotoka_app/screens/review/review_complete_screen.dart';
import 'package:kotoka_app/screens/shop/shop_screen.dart';
import 'package:kotoka_app/screens/profile/profile_screen.dart';

part 'app_router.g.dart';

// ---------------------------------------------------------------------------
// Route paths
// ---------------------------------------------------------------------------
abstract class AppRoutes {
  static const String onboarding            = '/onboarding';
  static const String onboardingLanguage    = '/onboarding/language';
  static const String onboardingWelcome     = '/onboarding/welcome';
  static const String onboardingGoal        = '/onboarding/goal';
  static const String onboardingLevel       = '/onboarding/level';
  static const String onboardingSchedule    = '/onboarding/schedule';
  static const String onboardingCommitment  = '/onboarding/commitment';
  static const String onboardingAuth        = '/onboarding/auth';
  static const String onboardingPdpa        = '/onboarding/pdpa';
  static const String onboardingAssessment  = '/onboarding/assessment';
  static const String onboardingGoalCommitment = '/onboarding/goal-commitment';
  static const String onboardingProfile     = '/onboarding/profile';
  static const String onboardingMission     = '/onboarding/mission';
  static const String home    = '/home';
  static const String snap    = '/snap';
  static const String snapText       = '/snap/text';
  static const String snapProcessing = '/snap/processing';
  static const String snapResults    = '/snap/results';
  static const String review  = '/review';
  static const String reviewFlashcard    = '/review/flashcard';
  static const String reviewFillBlank    = '/review/fillblank';
  static const String reviewConversation = '/review/conversation';
  static const String reviewComplete     = '/review/complete';
  static const String shop    = '/shop';
  static const String profile = '/profile';
}

// ---------------------------------------------------------------------------
// ScaffoldWithNavBar — shell route host
// ---------------------------------------------------------------------------
class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: KBottomTabBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Auth state provider (stub — replaced by real Firebase auth stream)
// ---------------------------------------------------------------------------
/// Flip to true when the user completes onboarding or signs in.
final authCompletedProvider = StateProvider<bool>((ref) => false); //MOCKDATA

/// Returns true when there is an authenticated user.
@riverpod
bool isAuthenticated(IsAuthenticatedRef ref) {
  return ref.watch(authCompletedProvider); //MOCKDATA
}

// ---------------------------------------------------------------------------
// Router provider
// ---------------------------------------------------------------------------
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authenticated = ref.watch(isAuthenticatedProvider);

  return GoRouter(
    initialLocation: AppRoutes.onboarding,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final inOnboarding =
          state.matchedLocation.startsWith(AppRoutes.onboarding);

      if (!authenticated && !inOnboarding) {
        return AppRoutes.onboarding;
      }
      if (authenticated && inOnboarding) {
        return AppRoutes.home;
      }
      return null;
    },
    routes: [
      // ------------------------------------------------------------------
      // Onboarding flow (public) — 5 screens: language→welcome→goal→level→commitment→mission
      // ------------------------------------------------------------------
      GoRoute(
        path: AppRoutes.onboarding,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: WelcomeScreen(),
        ),
        routes: [
          GoRoute(
            path: 'auth',
            pageBuilder: (context, state) => const MaterialPage(
              child: AuthScreen(),
            ),
          ),
          GoRoute(
            path: 'language',
            pageBuilder: (context, state) => const MaterialPage(
              child: LanguageSelectScreen(),
            ),
          ),
          GoRoute(
            path: 'assessment',
            pageBuilder: (context, state) => const MaterialPage(
              child: ProficiencyAssessmentScreen(),
            ),
          ),
          GoRoute(
            path: 'goal-commitment',
            pageBuilder: (context, state) => const MaterialPage(
              child: GoalCommitmentScreen(),
            ),
          ),
          GoRoute(
            path: 'welcome',
            pageBuilder: (context, state) => const MaterialPage(
              child: WelcomeScreen(),
            ),
          ),
          GoRoute(
            path: 'goal',
            pageBuilder: (context, state) => const MaterialPage(
              child: GoalSelectScreen(),
            ),
          ),
          GoRoute(
            path: 'level',
            pageBuilder: (context, state) => const MaterialPage(
              child: LevelSelectScreen(),
            ),
          ),
          GoRoute(
            path: 'schedule',
            pageBuilder: (context, state) => const MaterialPage(
              child: ScheduleScreen(),
            ),
          ),
          GoRoute(
            path: 'commitment',
            pageBuilder: (context, state) => const MaterialPage(
              child: CommitmentScreen(),
            ),
          ),
          GoRoute(
            path: 'pdpa',
            pageBuilder: (context, state) => const MaterialPage(
              child: PdpaConsentScreen(),
            ),
          ),
          GoRoute(
            path: 'profile',
            pageBuilder: (context, state) => const MaterialPage(
              child: ProfileSetupScreen(),
            ),
          ),
          GoRoute(
            path: 'mission',
            pageBuilder: (context, state) => const MaterialPage(
              child: MissionScreen(),
            ),
          ),
          GoRoute(
            path: 'summary',
            pageBuilder: (context, state) => const MaterialPage(
              child: SummaryScreen(),
            ),
          ),
        ],
      ),

      // ------------------------------------------------------------------
      // Authenticated shell — bottom nav
      // ------------------------------------------------------------------
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          // Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const HomeScreen(),
                ),
              ),
            ],
          ),
          // Snap
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.snap,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const SnapScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'text',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: SnapTextScreen(),
                    ),
                  ),
                  GoRoute(
                    path: 'processing',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: SnapProcessingScreen(),
                    ),
                  ),
                  GoRoute(
                    path: 'results',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: SnapResultsScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Review
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.review,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ReviewScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'flashcard',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: ReviewFlashcardScreen(),
                    ),
                  ),
                  GoRoute(
                    path: 'fillblank',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: ReviewFillBlankScreen(),
                    ),
                  ),
                  GoRoute(
                    path: 'conversation',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: ReviewConversationScreen(),
                    ),
                  ),
                  GoRoute(
                    path: 'complete',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: ReviewCompleteScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Shop
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.shop,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ShopScreen(),
                ),
              ),
            ],
          ),
          // Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ProfileScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
