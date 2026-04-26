import 'package:flutter_riverpod/flutter_riverpod.dart';

// Stores the source→target language pair chosen during onboarding.
final selectedLanguagePairProvider =
    StateProvider<Map<String, String>?>((ref) => null);

// Stores the selected proficiency level: 'beginner' | 'intermediate' | 'advanced'
final selectedLevelProvider = StateProvider<String?>((ref) => null);

// Stores the chosen daily study goal in minutes.
final dailyGoalMinutesProvider = StateProvider<int?>((ref) => null);
