// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Kotoka';

  @override
  String get tagline => 'Learn vocabulary from your real life';

  @override
  String get getStarted => 'Get Started';

  @override
  String get selectLanguage => 'Choose your language';

  @override
  String get selectGoal => 'What\'s your goal?';

  @override
  String get selectLevel => 'What\'s your level?';

  @override
  String get selectSchedule => 'Set your daily schedule';

  @override
  String get pdpaTitle => 'Privacy & Permissions';

  @override
  String get pdpaConsent =>
      'By continuing you agree to our Privacy Policy and consent to the data uses described below.';

  @override
  String get profileSetup => 'Set up your profile';

  @override
  String get letsGo => 'Let\'s Go!';

  @override
  String get goalCareer => 'Career';

  @override
  String get goalTravel => 'Travel';

  @override
  String get goalAcademic => 'Academic';

  @override
  String get goalPersonal => 'Personal Growth';

  @override
  String get goalCareerDesc =>
      'Vocabulary for the workplace and professional contexts';

  @override
  String get goalTravelDesc => 'Words and phrases for exploring the world';

  @override
  String get goalAcademicDesc => 'Terminology for study, research and exams';

  @override
  String get goalPersonalDesc => 'Everyday language for connecting with others';

  @override
  String get levelBeginner => 'Beginner';

  @override
  String get levelIntermediate => 'Intermediate';

  @override
  String get levelAdvanced => 'Advanced';

  @override
  String get levelBeginnerDesc => 'I know fewer than 500 words';

  @override
  String get levelIntermediateDesc => 'I can hold basic conversations';

  @override
  String get levelAdvancedDesc => 'I\'m comfortable but want to grow';

  @override
  String get scheduleTitle => 'How much time can you spare each day?';

  @override
  String get schedule5min => '5 minutes';

  @override
  String get schedule10min => '10 minutes';

  @override
  String get schedule15min => '15 minutes';

  @override
  String get schedule30min => '30 minutes';

  @override
  String wordsPerDay(int count) {
    return '$count words / day';
  }

  @override
  String get pdpaCamera => 'Camera';

  @override
  String get pdpaCameraReason =>
      'Snap photos to identify and learn vocabulary in context';

  @override
  String get pdpaGPS => 'Location';

  @override
  String get pdpaGPSReason => 'Tailor words to places you visit';

  @override
  String get pdpaVoice => 'Microphone';

  @override
  String get pdpaVoiceReason => 'Practice pronunciation with voice recognition';

  @override
  String get pdpaRequired => 'Required';

  @override
  String homeGreetingMorning(String name) {
    return 'Good morning, $name!';
  }

  @override
  String homeGreetingAfternoon(String name) {
    return 'Good afternoon, $name!';
  }

  @override
  String homeGreetingEvening(String name) {
    return 'Good evening, $name!';
  }

  @override
  String homeStreak(int days) {
    return '$days day streak';
  }

  @override
  String get homeMissions => 'Today\'s Missions';

  @override
  String get homeStartReview => 'Start Review';

  @override
  String get homeRecentWords => 'Recently Learned';

  @override
  String get continueBtn => 'Continue';

  @override
  String get backBtn => 'Back';

  @override
  String get skipBtn => 'Skip';

  @override
  String get doneBtn => 'Done';

  @override
  String get loadingText => 'Loading…';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get retryBtn => 'Retry';

  @override
  String get navHome => 'Home';

  @override
  String get navSnap => 'Snap';

  @override
  String get navReview => 'Review';

  @override
  String get navShop => 'Shop';

  @override
  String get navProfile => 'Profile';

  @override
  String get langThai => 'Thai';

  @override
  String get langEnglish => 'English';

  @override
  String get langMandarin => 'Mandarin';

  @override
  String get langSpanish => 'Spanish';

  @override
  String get langVietnamese => 'Vietnamese';

  @override
  String get langLao => 'Lao';

  @override
  String get welcomeTagline =>
      'Learn words that matter — anchored to your world.';

  @override
  String get welcomeGetStarted => 'Get Started';

  @override
  String get welcomeTerms =>
      'By continuing you agree to our Terms of Service and Privacy Policy.';

  @override
  String get continueButton => 'Continue';

  @override
  String get languageSelectTitle => 'Choose Language';

  @override
  String get languageSelectSubtitle =>
      'Which language pair do you want to learn?';

  @override
  String get goalSelectTitle => 'Your Goal';

  @override
  String get goalSelectSubtitle => 'What brings you to Kotoka?';

  @override
  String get levelSelectTitle => 'Your Level';

  @override
  String get levelSelectSubtitle => 'How much do you already know?';

  @override
  String get scheduleSubtitle => 'How many minutes can you spend each day?';

  @override
  String scheduleMinutes(int count) {
    return '$count min';
  }

  @override
  String scheduleWordsPerDay(int count) {
    return '~$count new words per day';
  }

  @override
  String get pdpaExplanation =>
      'Kotoka uses your camera, location, and microphone to build personalised vocabulary from your real world. Your data is encrypted and never sold. This is required under Thailand\'s Personal Data Protection Act (PDPA).';

  @override
  String get pdpaRequiredAll =>
      'All three permissions are required to continue.';

  @override
  String get pdpaLocation => 'GPS Location';

  @override
  String get pdpaMicrophone => 'Voice & Microphone';

  @override
  String get pdpaLocationReason =>
      'Used to detect the places you visit and suggest relevant vocabulary for each location.';

  @override
  String get pdpaMicrophoneReason =>
      'Used for voice exercises and pronunciation feedback during review sessions.';

  @override
  String get pdpaWhatWeUse => 'What we use this for';

  @override
  String get profileSetupTitle => 'Your Profile';

  @override
  String get profileNameLabel => 'Display Name';

  @override
  String get profileNameHint => 'Enter your name';

  @override
  String get profileAvatarHint => 'Tap to change photo';

  @override
  String get profileLetsGo => 'Let\'s Go';

  @override
  String homeGreeting(String name) {
    return 'Good morning, $name';
  }

  @override
  String homeStreakDays(int count) {
    return '$count-day streak';
  }

  @override
  String get homeStreakLabel => 'Keep it going!';

  @override
  String get homeTodaysMission => 'Today\'s Mission';

  @override
  String get homeMissionReview => 'Review 10 words';

  @override
  String get homeMissionNewWords => 'Learn 5 new words';

  @override
  String homeMissionProgress(int current, int total) {
    return '$current of $total done';
  }

  @override
  String get onbWelcomeFocusToggle => 'Focus Mode (hide Koko)';

  @override
  String get onbWelcomeFocusToggleHint => 'Minimal UI for professional use.';

  @override
  String get onbGoalWorkMeeting => 'Work Meeting';

  @override
  String get onbGoalEmailWriting => 'Email Writing';

  @override
  String get onbGoalPresentation => 'Presentation';

  @override
  String get onbCommitTitle => 'Stay on track';

  @override
  String get onbCommitValueProp1 => 'Daily reminder at your chosen time.';

  @override
  String get onbCommitValueProp2 =>
      'Streak nudge so you never break the chain.';

  @override
  String get onbCommitAllow => 'Allow notifications';

  @override
  String get onbCommitGrace => 'Miss a day? You get 1 free pass per week.';

  @override
  String get onbMissionTitle => 'Your first mission awaits';

  @override
  String get onbMissionBody =>
      'Snap a word from your world. Koko will help you remember it forever.';

  @override
  String get homeTooltipSensoryTag =>
      'Tags show how a word feels — sound, sight, action. Tap to explore.';

  @override
  String get a11yFocusToggleOn => 'Focus mode on: Koko hidden';

  @override
  String get a11yFocusToggleOff => 'Focus mode off: Koko visible';

  @override
  String get snapTitle => 'Snap';

  @override
  String get snapTabCamera => 'Camera';

  @override
  String get snapTabText => 'Text';

  @override
  String get snapTabGps => 'GPS';

  @override
  String get snapCameraViewfinder => 'Camera viewfinder';

  @override
  String get snapTextPrompt => 'Type or paste words you want to learn:';

  @override
  String get snapTextHint => 'Enter text here…';

  @override
  String get snapTextGenerate => 'Generate words';

  @override
  String get snapProcessingTitle => 'Reading your photo…';

  @override
  String get snapProcessingSubtitle =>
      'Gemini is finding the words that matter in this place.';

  @override
  String get snapProcessingCancel => 'Cancel';

  @override
  String snapResultsWordsFound(int count) {
    return '$count words found';
  }

  @override
  String snapResultsMoreWords(int count) {
    return '+ $count more';
  }

  @override
  String get snapResultsSaveAll => 'Save all to my words';

  @override
  String get snapResultsReviewNow => 'Review now (quick 3-min)';

  @override
  String get reviewTitle => 'Today\'s review';

  @override
  String reviewWordsDue(int count, int minutes) {
    return '$count words due · ~$minutes minutes';
  }

  @override
  String get reviewStartSession => 'Start session';

  @override
  String get reviewQuickMode => 'Quick mode: 3 words, 2 min';

  @override
  String reviewProgressOf(int current, int total) {
    return '$current of $total';
  }

  @override
  String get reviewTapToFlip => 'Tap to flip';

  @override
  String get reviewRateHard => 'Hard';

  @override
  String get reviewRateOk => 'OK';

  @override
  String get reviewRateEasy => 'Easy';

  @override
  String get reviewFillBlankTitle => 'Fill in the blank';

  @override
  String get reviewConversationPrompt => 'Your response:';

  @override
  String get reviewCompleteTitle => 'Session Complete!';

  @override
  String get reviewCompleteBackHome => 'Back to home';

  @override
  String get reviewCompleteSnapAnother => 'Snap another place';

  @override
  String get shopTitle => 'Shop';

  @override
  String get shopPremiumTitle => 'Kotoka Premium';

  @override
  String get shopPremiumDesc => 'Unlimited snaps, offline packs, Koko priority';

  @override
  String get shopStartTrial => 'Start free trial';

  @override
  String get shopVocabPacks => 'Vocab Packs';

  @override
  String get shopGetPack => 'Get';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileMemoryMap => 'My Memory Map';

  @override
  String get profileStatsWeek => 'Stats this week';

  @override
  String get profileLanguagePairs => 'Language pairs';

  @override
  String get profileAddPair => '+ Add another language pair';

  @override
  String get profileMapEmpty => 'Your learning locations will appear here';

  @override
  String get profileStatWords => 'Words learned';

  @override
  String get profileStatSessions => 'Sessions';

  @override
  String get profileStatAccuracy => 'Accuracy';

  @override
  String get homeSnapLearnBtn => 'Snap & Learn';

  @override
  String get homeSubtitle => 'Let\'s learn something today!';

  @override
  String get homeWordsLearned => 'Words Learned';

  @override
  String get homeDaysStreak => 'Day Streak';

  @override
  String homeWordsCount(int count) {
    return '$count words';
  }

  @override
  String get homeRecentDecks => 'Recent Decks';

  @override
  String get homeDeckReviewBtn => 'Review';

  @override
  String get homeWeeklyStory => 'Weekly Story';

  @override
  String get homeForgettingCurve => 'Forgetting Curve';

  @override
  String get homeUrgentLabel => 'Urgent';

  @override
  String homeAchievementBanner(String title) {
    return '$title Unlocked!';
  }

  @override
  String get homeAchievementCta => 'Take CEFR retest →';

  @override
  String get homeReadStory => 'Read Story →';

  @override
  String get langDisplayLanguage => 'Display language';

  @override
  String get langCustomPair => 'Custom pair';

  @override
  String get langISpeak => 'I speak…';

  @override
  String get langILearn => 'I want to learn…';

  @override
  String get langSelectPair => 'Select this pair';
}
