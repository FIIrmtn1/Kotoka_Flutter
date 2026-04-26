import 'package:flutter_riverpod/flutter_riverpod.dart';

// Stores the source→target language pair chosen during onboarding.
// Map keys: 'source' and 'target' (BCP-47 language codes).
final selectedLanguagePairProvider =
    StateProvider<Map<String, String>?>((ref) => null);

// Stores the selected proficiency level: 'beginner' | 'intermediate' | 'advanced'
final selectedLevelProvider = StateProvider<String?>((ref) => null);

// Stores the chosen daily study goal in minutes.
final dailyGoalMinutesProvider = StateProvider<int?>((ref) => null);

// Stores the display name entered during profile setup.
final displayNameProvider = StateProvider<String>((ref) => '');

// Stores the selected learning goals (multi-select chip keys).
final selectedGoalsProvider = StateProvider<List<String>>((ref) => []);

// ---------------------------------------------------------------------------
// Convenience extension methods on StateController
// ---------------------------------------------------------------------------

/// Sets the source/target language pair.
extension OnboardingLanguageX on StateController<Map<String, String>?> {
  void setLanguages({required String source, required String target}) {
    state = {'source': source, 'target': target};
  }
}

/// Toggles a goal key in the multi-select list.
extension OnboardingGoalsX on StateController<List<String>> {
  void toggleGoal(String goalKey) {
    if (state.contains(goalKey)) {
      state = state.where((g) => g != goalKey).toList();
    } else {
      state = [...state, goalKey];
    }
  }

  void setGoals(List<String> goals) => state = goals;
}
