import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_lo.dart';
import 'app_localizations_th.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('lo'),
    Locale('th'),
    Locale('vi'),
    Locale('zh')
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'Kotoka'**
  String get appName;

  /// App tagline shown on onboarding splash
  ///
  /// In en, this message translates to:
  /// **'Snap your world, speak any languages'**
  String get tagline;

  /// Primary CTA button on splash screen
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Prompt on language selection screen
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get selectLanguage;

  /// Prompt on goal selection screen
  ///
  /// In en, this message translates to:
  /// **'What\'s your goal?'**
  String get selectGoal;

  /// Prompt on level selection screen
  ///
  /// In en, this message translates to:
  /// **'What\'s your level?'**
  String get selectLevel;

  /// Prompt on schedule selection screen
  ///
  /// In en, this message translates to:
  /// **'Set your daily schedule'**
  String get selectSchedule;

  /// Title of the PDPA / permissions screen
  ///
  /// In en, this message translates to:
  /// **'Privacy & Permissions'**
  String get pdpaTitle;

  /// PDPA consent paragraph
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to our Privacy Policy and consent to the data uses described below.'**
  String get pdpaConsent;

  /// Title on profile setup screen
  ///
  /// In en, this message translates to:
  /// **'Set up your profile'**
  String get profileSetup;

  /// Final onboarding completion button
  ///
  /// In en, this message translates to:
  /// **'Let\'s Go!'**
  String get letsGo;

  /// Career learning goal label
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get goalCareer;

  /// Travel learning goal label
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get goalTravel;

  /// Academic learning goal label
  ///
  /// In en, this message translates to:
  /// **'Academic'**
  String get goalAcademic;

  /// Personal growth learning goal label
  ///
  /// In en, this message translates to:
  /// **'Personal Growth'**
  String get goalPersonal;

  /// Description for the career goal
  ///
  /// In en, this message translates to:
  /// **'Vocabulary for the workplace and professional contexts'**
  String get goalCareerDesc;

  /// Description for the travel goal
  ///
  /// In en, this message translates to:
  /// **'Words and phrases for exploring the world'**
  String get goalTravelDesc;

  /// Description for the academic goal
  ///
  /// In en, this message translates to:
  /// **'Terminology for study, research and exams'**
  String get goalAcademicDesc;

  /// Description for the personal growth goal
  ///
  /// In en, this message translates to:
  /// **'Everyday language for connecting with others'**
  String get goalPersonalDesc;

  /// Beginner proficiency level label
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get levelBeginner;

  /// Intermediate proficiency level label
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get levelIntermediate;

  /// Advanced proficiency level label
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get levelAdvanced;

  /// Description for beginner level
  ///
  /// In en, this message translates to:
  /// **'I know fewer than 500 words'**
  String get levelBeginnerDesc;

  /// Description for intermediate level
  ///
  /// In en, this message translates to:
  /// **'I can hold basic conversations'**
  String get levelIntermediateDesc;

  /// Description for advanced level
  ///
  /// In en, this message translates to:
  /// **'I\'m comfortable but want to grow'**
  String get levelAdvancedDesc;

  /// Title for the daily schedule selection
  ///
  /// In en, this message translates to:
  /// **'How much time can you spare each day?'**
  String get scheduleTitle;

  /// 5-minute daily schedule option
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get schedule5min;

  /// 10-minute daily schedule option
  ///
  /// In en, this message translates to:
  /// **'10 minutes'**
  String get schedule10min;

  /// 15-minute daily schedule option
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get schedule15min;

  /// 30-minute daily schedule option
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get schedule30min;

  /// Words learned per day indicator
  ///
  /// In en, this message translates to:
  /// **'{count} words / day'**
  String wordsPerDay(int count);

  /// Camera permission label
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get pdpaCamera;

  /// Reason for camera permission
  ///
  /// In en, this message translates to:
  /// **'to snap & learn new words from the world around you'**
  String get pdpaCameraReason;

  /// GPS permission label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get pdpaGPS;

  /// Reason for GPS permission
  ///
  /// In en, this message translates to:
  /// **'Tailor words to places you visit'**
  String get pdpaGPSReason;

  /// Microphone permission label
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get pdpaVoice;

  /// Reason for microphone permission
  ///
  /// In en, this message translates to:
  /// **'Practice pronunciation with voice recognition'**
  String get pdpaVoiceReason;

  /// Tag shown next to required permissions
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get pdpaRequired;

  /// Morning greeting on home screen
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name}!'**
  String homeGreetingMorning(String name);

  /// Afternoon greeting on home screen
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {name}!'**
  String homeGreetingAfternoon(String name);

  /// Evening greeting on home screen
  ///
  /// In en, this message translates to:
  /// **'Good evening, {name}!'**
  String homeGreetingEvening(String name);

  /// Current learning streak
  ///
  /// In en, this message translates to:
  /// **'{days} day streak'**
  String homeStreak(int days);

  /// Section title for daily missions
  ///
  /// In en, this message translates to:
  /// **'Today\'s Missions'**
  String get homeMissions;

  /// Button to begin a review session
  ///
  /// In en, this message translates to:
  /// **'Start Review'**
  String get homeStartReview;

  /// Section title for recently learned words
  ///
  /// In en, this message translates to:
  /// **'Recently Learned'**
  String get homeRecentWords;

  /// Generic continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// Generic back button
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backBtn;

  /// Generic skip button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipBtn;

  /// Generic done button
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneBtn;

  /// Generic loading indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get loadingText;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// Generic retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryBtn;

  /// Bottom nav Home tab label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom nav Snap tab label
  ///
  /// In en, this message translates to:
  /// **'Snap'**
  String get navSnap;

  /// Bottom nav Review tab label
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get navReview;

  /// Bottom nav Shop tab label
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get navShop;

  /// Bottom nav Profile tab label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// Thai language option
  ///
  /// In en, this message translates to:
  /// **'Thai'**
  String get langThai;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// Mandarin language option
  ///
  /// In en, this message translates to:
  /// **'Mandarin'**
  String get langMandarin;

  /// Spanish language option
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get langSpanish;

  /// Vietnamese language option
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get langVietnamese;

  /// Lao language option
  ///
  /// In en, this message translates to:
  /// **'Lao'**
  String get langLao;

  /// Tagline on welcome screen
  ///
  /// In en, this message translates to:
  /// **'Learn words that matter — anchored to your world.'**
  String get welcomeTagline;

  /// Primary CTA on welcome screen
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get welcomeGetStarted;

  /// Terms caption on welcome screen
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to our Terms of Service and Privacy Policy.'**
  String get welcomeTerms;

  /// Generic continue button label
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Title for language select screen
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get languageSelectTitle;

  /// Subtitle for language select screen
  ///
  /// In en, this message translates to:
  /// **'Which language pair do you want to learn?'**
  String get languageSelectSubtitle;

  /// Title for goal select screen
  ///
  /// In en, this message translates to:
  /// **'Your Goal'**
  String get goalSelectTitle;

  /// Subtitle for goal select screen
  ///
  /// In en, this message translates to:
  /// **'What brings you to Kotoka?'**
  String get goalSelectSubtitle;

  /// Title for level select screen
  ///
  /// In en, this message translates to:
  /// **'Your Level'**
  String get levelSelectTitle;

  /// Subtitle for level select screen
  ///
  /// In en, this message translates to:
  /// **'How much do you already know?'**
  String get levelSelectSubtitle;

  /// Subtitle for schedule screen
  ///
  /// In en, this message translates to:
  /// **'How many minutes can you spend each day?'**
  String get scheduleSubtitle;

  /// Minutes chip label
  ///
  /// In en, this message translates to:
  /// **'{count} min'**
  String scheduleMinutes(int count);

  /// Estimated words per day
  ///
  /// In en, this message translates to:
  /// **'~{count} new words per day'**
  String scheduleWordsPerDay(int count);

  /// PDPA explanation paragraph on consent screen
  ///
  /// In en, this message translates to:
  /// **'Kotoka uses your camera, location, and microphone to build personalised vocabulary from your real world. Your data is encrypted and never sold. This is required under Thailand\'s Personal Data Protection Act (PDPA).'**
  String get pdpaExplanation;

  /// Note that all 3 permissions are required
  ///
  /// In en, this message translates to:
  /// **'All three permissions are required to continue.'**
  String get pdpaRequiredAll;

  /// GPS location permission label
  ///
  /// In en, this message translates to:
  /// **'GPS Location'**
  String get pdpaLocation;

  /// Microphone permission label
  ///
  /// In en, this message translates to:
  /// **'Voice & Microphone'**
  String get pdpaMicrophone;

  /// Reason for location permission
  ///
  /// In en, this message translates to:
  /// **'Used to detect the places you visit and suggest relevant vocabulary for each location.'**
  String get pdpaLocationReason;

  /// Reason for microphone permission
  ///
  /// In en, this message translates to:
  /// **'so Kotoka can hear your pronunciation and guide you'**
  String get pdpaMicrophoneReason;

  /// Expandable label for permission detail
  ///
  /// In en, this message translates to:
  /// **'What we use this for'**
  String get pdpaWhatWeUse;

  /// Title for profile setup screen
  ///
  /// In en, this message translates to:
  /// **'Your Profile'**
  String get profileSetupTitle;

  /// Label for display name field
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get profileNameLabel;

  /// Hint for display name field
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get profileNameHint;

  /// Avatar placeholder caption
  ///
  /// In en, this message translates to:
  /// **'Tap to change photo'**
  String get profileAvatarHint;

  /// Final CTA on profile setup screen
  ///
  /// In en, this message translates to:
  /// **'Let\'s Go'**
  String get profileLetsGo;

  /// Home screen greeting
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name}'**
  String homeGreeting(String name);

  /// Streak day count
  ///
  /// In en, this message translates to:
  /// **'{count}-day streak'**
  String homeStreakDays(int count);

  /// Streak encouragement caption
  ///
  /// In en, this message translates to:
  /// **'Keep it going!'**
  String get homeStreakLabel;

  /// Mission card section label
  ///
  /// In en, this message translates to:
  /// **'Today\'s Mission'**
  String get homeTodaysMission;

  /// Review mission title
  ///
  /// In en, this message translates to:
  /// **'Review 10 words'**
  String get homeMissionReview;

  /// New words mission title
  ///
  /// In en, this message translates to:
  /// **'Learn 5 new words'**
  String get homeMissionNewWords;

  /// Mission progress label
  ///
  /// In en, this message translates to:
  /// **'{current} of {total} done'**
  String homeMissionProgress(int current, int total);

  /// Label for focus mode toggle on welcome screen
  ///
  /// In en, this message translates to:
  /// **'Focus Mode (hide Koko)'**
  String get onbWelcomeFocusToggle;

  /// Hint for focus mode toggle
  ///
  /// In en, this message translates to:
  /// **'Minimal UI for professional use.'**
  String get onbWelcomeFocusToggleHint;

  /// Work Meeting goal chip label
  ///
  /// In en, this message translates to:
  /// **'Work Meeting'**
  String get onbGoalWorkMeeting;

  /// Email Writing goal chip label
  ///
  /// In en, this message translates to:
  /// **'Email Writing'**
  String get onbGoalEmailWriting;

  /// Presentation goal chip label
  ///
  /// In en, this message translates to:
  /// **'Presentation'**
  String get onbGoalPresentation;

  /// Title on commitment screen
  ///
  /// In en, this message translates to:
  /// **'Stay on track'**
  String get onbCommitTitle;

  /// First value proposition on commitment screen
  ///
  /// In en, this message translates to:
  /// **'Daily reminder at your chosen time.'**
  String get onbCommitValueProp1;

  /// Second value proposition on commitment screen
  ///
  /// In en, this message translates to:
  /// **'Streak nudge so you never break the chain.'**
  String get onbCommitValueProp2;

  /// Allow notifications CTA on commitment screen
  ///
  /// In en, this message translates to:
  /// **'Allow notifications'**
  String get onbCommitAllow;

  /// Grace period copy below streak commit CTA
  ///
  /// In en, this message translates to:
  /// **'Miss a day? You get 1 free pass per week.'**
  String get onbCommitGrace;

  /// ONB-06 mission intro headline
  ///
  /// In en, this message translates to:
  /// **'Your first mission awaits'**
  String get onbMissionTitle;

  /// ONB-06 mission intro body copy
  ///
  /// In en, this message translates to:
  /// **'Snap a word from your world. Koko will help you remember it forever.'**
  String get onbMissionBody;

  /// ONB-07 summary screen headline
  ///
  /// In en, this message translates to:
  /// **'You\'re all set!'**
  String get onbSummaryTitle;

  /// ONB-07 summary screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Here\'s your learning setup:'**
  String get onbSummaryBody;

  /// ONB-07 summary row label for language pair
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get onbSummaryLanguagePair;

  /// ONB-07 summary row label for proficiency level
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get onbSummaryLevel;

  /// ONB-07 summary row label for daily study goal
  ///
  /// In en, this message translates to:
  /// **'Daily goal'**
  String get onbSummaryDailyGoal;

  /// ONB-07 summary screen CTA button
  ///
  /// In en, this message translates to:
  /// **'Start learning'**
  String get onbSummaryStart;

  /// First-use tooltip for sensory tag bar on home screen
  ///
  /// In en, this message translates to:
  /// **'Tags show how a word feels — sound, sight, action. Tap to explore.'**
  String get homeTooltipSensoryTag;

  /// Accessibility label when focus mode is active
  ///
  /// In en, this message translates to:
  /// **'Focus mode on: Koko hidden'**
  String get a11yFocusToggleOn;

  /// Accessibility label when focus mode is inactive
  ///
  /// In en, this message translates to:
  /// **'Focus mode off: Koko visible'**
  String get a11yFocusToggleOff;

  /// Snap screen app bar title
  ///
  /// In en, this message translates to:
  /// **'Snap'**
  String get snapTitle;

  /// Snap tab: camera mode
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get snapTabCamera;

  /// Snap tab: text input mode
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get snapTabText;

  /// Snap tab: GPS mode
  ///
  /// In en, this message translates to:
  /// **'GPS'**
  String get snapTabGps;

  /// Instructive hint inside camera viewfinder
  ///
  /// In en, this message translates to:
  /// **'Point at text · menus · signs'**
  String get snapCameraViewfinder;

  /// Prompt above text input in snap text mode
  ///
  /// In en, this message translates to:
  /// **'Type or paste words you want to learn:'**
  String get snapTextPrompt;

  /// Hint inside the text field on snap text screen
  ///
  /// In en, this message translates to:
  /// **'Enter text here…'**
  String get snapTextHint;

  /// CTA button to generate vocab from typed text
  ///
  /// In en, this message translates to:
  /// **'Generate words'**
  String get snapTextGenerate;

  /// Title shown while Gemini processes the snap
  ///
  /// In en, this message translates to:
  /// **'Reading your photo…'**
  String get snapProcessingTitle;

  /// Subtitle on processing screen
  ///
  /// In en, this message translates to:
  /// **'Gemini is finding the words that matter in this place.'**
  String get snapProcessingSubtitle;

  /// Cancel button on processing screen
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get snapProcessingCancel;

  /// AppBar subtitle showing how many words were extracted
  ///
  /// In en, this message translates to:
  /// **'{count} words found'**
  String snapResultsWordsFound(int count);

  /// Expandable row showing hidden word count
  ///
  /// In en, this message translates to:
  /// **'+ {count} more'**
  String snapResultsMoreWords(int count);

  /// Primary CTA on snap results screen
  ///
  /// In en, this message translates to:
  /// **'Save all to my words'**
  String get snapResultsSaveAll;

  /// Secondary CTA on snap results screen
  ///
  /// In en, this message translates to:
  /// **'Review now (quick 3-min)'**
  String get snapResultsReviewNow;

  /// App bar title on review session intro screen
  ///
  /// In en, this message translates to:
  /// **'Today\'s review'**
  String get reviewTitle;

  /// Session card subtitle showing words due and estimated time
  ///
  /// In en, this message translates to:
  /// **'{count} words due · ~{minutes} minutes'**
  String reviewWordsDue(int count, int minutes);

  /// Primary CTA to begin a review session
  ///
  /// In en, this message translates to:
  /// **'Start session'**
  String get reviewStartSession;

  /// Quick mode text button on session intro
  ///
  /// In en, this message translates to:
  /// **'Quick mode: 3 words, 2 min'**
  String get reviewQuickMode;

  /// Progress indicator showing card position in session
  ///
  /// In en, this message translates to:
  /// **'{current} of {total}'**
  String reviewProgressOf(int current, int total);

  /// Hint label on flashcard front
  ///
  /// In en, this message translates to:
  /// **'Tap to flip'**
  String get reviewTapToFlip;

  /// Again rating button label
  ///
  /// In en, this message translates to:
  /// **'Missed it'**
  String get reviewRateAgain;

  /// Hard rating button label
  ///
  /// In en, this message translates to:
  /// **'Almost'**
  String get reviewRateHard;

  /// Good rating button label
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
  String get reviewRateGood;

  /// Easy rating button label
  ///
  /// In en, this message translates to:
  /// **'Too easy'**
  String get reviewRateEasy;

  /// Title for fill-in-the-blank exercise
  ///
  /// In en, this message translates to:
  /// **'Fill in the blank'**
  String get reviewFillBlankTitle;

  /// Label above response text field in conversation exercise
  ///
  /// In en, this message translates to:
  /// **'Your response:'**
  String get reviewConversationPrompt;

  /// Title on review complete screen
  ///
  /// In en, this message translates to:
  /// **'Session Complete!'**
  String get reviewCompleteTitle;

  /// Primary CTA on review complete screen
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get reviewCompleteBackHome;

  /// Secondary CTA on review complete screen
  ///
  /// In en, this message translates to:
  /// **'Snap another place'**
  String get reviewCompleteSnapAnother;

  /// Shop screen app bar title
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shopTitle;

  /// Premium subscription card title
  ///
  /// In en, this message translates to:
  /// **'Kotoka Premium'**
  String get shopPremiumTitle;

  /// Premium subscription card description
  ///
  /// In en, this message translates to:
  /// **'Unlimited snaps, offline packs, Koko priority'**
  String get shopPremiumDesc;

  /// CTA button on premium card
  ///
  /// In en, this message translates to:
  /// **'Start free trial'**
  String get shopStartTrial;

  /// Section heading for vocab packs grid
  ///
  /// In en, this message translates to:
  /// **'Vocab Packs'**
  String get shopVocabPacks;

  /// Button label on each pack card
  ///
  /// In en, this message translates to:
  /// **'Get'**
  String get shopGetPack;

  /// Beta banner title on premium card
  ///
  /// In en, this message translates to:
  /// **'Beta — Free Access'**
  String get shopBetaFreeTitle;

  /// Beta banner body text on premium card
  ///
  /// In en, this message translates to:
  /// **'All packs and Premium features are free during beta.'**
  String get shopBetaFreeBody;

  /// Button label on pack cards during beta
  ///
  /// In en, this message translates to:
  /// **'Free in beta'**
  String get shopBetaFree;

  /// Snackbar shown when user taps a pack card during beta
  ///
  /// In en, this message translates to:
  /// **'Unlocked — already yours during beta'**
  String get shopBetaUnlocked;

  /// Profile screen app bar title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// Section heading for memory map
  ///
  /// In en, this message translates to:
  /// **'My Memory Map'**
  String get profileMemoryMap;

  /// Section heading for weekly stats
  ///
  /// In en, this message translates to:
  /// **'Stats this week'**
  String get profileStatsWeek;

  /// Section heading for language pairs
  ///
  /// In en, this message translates to:
  /// **'Language pairs'**
  String get profileLanguagePairs;

  /// Button to add a new language pair
  ///
  /// In en, this message translates to:
  /// **'+ Add another language pair'**
  String get profileAddPair;

  /// Placeholder text in memory map container
  ///
  /// In en, this message translates to:
  /// **'Your learning locations will appear here'**
  String get profileMapEmpty;

  /// Stat tile label for words learned this week
  ///
  /// In en, this message translates to:
  /// **'Words learned'**
  String get profileStatWords;

  /// Stat tile label for sessions this week
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get profileStatSessions;

  /// Stat tile label for accuracy this week
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get profileStatAccuracy;

  /// Snap & Learn CTA button on home screen
  ///
  /// In en, this message translates to:
  /// **'Snap & Learn'**
  String get homeSnapLearnBtn;

  /// Home screen subtitle below greeting
  ///
  /// In en, this message translates to:
  /// **'Let\'s learn something today!'**
  String get homeSubtitle;

  /// Words learned stat label
  ///
  /// In en, this message translates to:
  /// **'Words Learned'**
  String get homeWordsLearned;

  /// Streak days stat label
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get homeDaysStreak;

  /// Words count on stat card
  ///
  /// In en, this message translates to:
  /// **'{count} words'**
  String homeWordsCount(int count);

  /// Section title for recent decks
  ///
  /// In en, this message translates to:
  /// **'Recent Decks'**
  String get homeRecentDecks;

  /// Review button on deck card
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get homeDeckReviewBtn;

  /// Section title for weekly story
  ///
  /// In en, this message translates to:
  /// **'Weekly Story'**
  String get homeWeeklyStory;

  /// Section title for forgetting curve chart
  ///
  /// In en, this message translates to:
  /// **'Forgetting Curve'**
  String get homeForgettingCurve;

  /// Urgent label on forgetting curve chart
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get homeUrgentLabel;

  /// Achievement unlocked banner text
  ///
  /// In en, this message translates to:
  /// **'{title} Unlocked!'**
  String homeAchievementBanner(String title);

  /// CTA on achievement banner
  ///
  /// In en, this message translates to:
  /// **'Take CEFR retest →'**
  String get homeAchievementCta;

  /// Read story CTA on weekly story card
  ///
  /// In en, this message translates to:
  /// **'Read Story →'**
  String get homeReadStory;

  /// Label for UI language dropdown
  ///
  /// In en, this message translates to:
  /// **'Display language'**
  String get langDisplayLanguage;

  /// Card to open custom language pair picker
  ///
  /// In en, this message translates to:
  /// **'Custom pair'**
  String get langCustomPair;

  /// Source language dropdown hint
  ///
  /// In en, this message translates to:
  /// **'I speak…'**
  String get langISpeak;

  /// Target language dropdown hint
  ///
  /// In en, this message translates to:
  /// **'I want to learn…'**
  String get langILearn;

  /// Confirm custom pair button
  ///
  /// In en, this message translates to:
  /// **'Select this pair'**
  String get langSelectPair;

  /// Heading for review tips card
  ///
  /// In en, this message translates to:
  /// **'Today\'s tips'**
  String get reviewTipsHeading;

  /// Spaced repetition tip 1
  ///
  /// In en, this message translates to:
  /// **'Reviewing today locks in words before you forget them.'**
  String get reviewTip1;

  /// Daily habit tip 2
  ///
  /// In en, this message translates to:
  /// **'Short sessions (10 min) beat long ones — done daily.'**
  String get reviewTip2;

  /// Motivation tip 3
  ///
  /// In en, this message translates to:
  /// **'Your accuracy improves each time you review.'**
  String get reviewTip3;

  /// Explanation text under memory map empty state
  ///
  /// In en, this message translates to:
  /// **'Snap words at cafés, offices, and places you visit — they\'ll appear here.'**
  String get profileMapEmptyDesc;

  /// CTA button in memory map empty state
  ///
  /// In en, this message translates to:
  /// **'Take your first Snap →'**
  String get profileMapEmptyCta;

  /// Chip shown on review session card to surface audio practice
  ///
  /// In en, this message translates to:
  /// **'Includes speaking practice'**
  String get reviewIncludesSpeaking;

  /// Primary CTA on PDPA consent screen
  ///
  /// In en, this message translates to:
  /// **'Agree & Continue'**
  String get pdpaAgreeAndContinue;

  /// CTA on ONB-09 mission intro screen
  ///
  /// In en, this message translates to:
  /// **'Let\'s go!'**
  String get onbMissionCta;

  /// Flash toggle label in snap advanced panel
  ///
  /// In en, this message translates to:
  /// **'Flash'**
  String get snapFlash;

  /// Grid toggle label in snap advanced panel
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get snapGrid;

  /// Accessibility semantics label for Koko waving animation
  ///
  /// In en, this message translates to:
  /// **'Koko waving hello'**
  String get kokoWavingSemantics;

  /// Accessibility semantics label for Koko mascot on home screen
  ///
  /// In en, this message translates to:
  /// **'Koko mascot'**
  String get kokoMascotSemantics;

  /// Notifications permission label on PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get permissionNotifications;

  /// Reason for notifications permission on PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Stay on track with daily reminders and streak nudges'**
  String get permissionNotificationsReason;

  /// ONB-07 summary screen headline
  ///
  /// In en, this message translates to:
  /// **'You\'re all set!'**
  String get summaryTitle;

  /// ONB-07 summary screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Kotoka is now ready to help you build your vocabulary.'**
  String get summarySubtitle;

  /// Account secured badge label in hero card
  ///
  /// In en, this message translates to:
  /// **'Account Secured'**
  String get summaryAccountSecured;

  /// Account secured badge description
  ///
  /// In en, this message translates to:
  /// **'Your data is encrypted and safe.'**
  String get summaryAccountSecuredDesc;

  /// Smart tags feature card title
  ///
  /// In en, this message translates to:
  /// **'Smart Tags'**
  String get summarySmartTags;

  /// Smart tags feature card description
  ///
  /// In en, this message translates to:
  /// **'Koko auto-categorizes your vocabulary.'**
  String get summarySmartTagsDesc;

  /// Cloud sync feature card title
  ///
  /// In en, this message translates to:
  /// **'Cloud Sync'**
  String get summaryCloudSync;

  /// Cloud sync feature card description
  ///
  /// In en, this message translates to:
  /// **'Encrypted backup across all devices.'**
  String get summaryCloudSyncDesc;

  /// Primary CTA on summary screen
  ///
  /// In en, this message translates to:
  /// **'Snap my first place'**
  String get summarySnapCta;

  /// Ghost secondary link on summary screen
  ///
  /// In en, this message translates to:
  /// **'Take a tour first'**
  String get summaryTourLink;

  /// Bottom-right toast on summary screen
  ///
  /// In en, this message translates to:
  /// **'Setup complete'**
  String get summarySetupToast;

  /// Accessibility label for Koko animation on summary screen
  ///
  /// In en, this message translates to:
  /// **'Koko celebrating your setup completion'**
  String get summaryKokoSemantics;

  /// Label above sample word chips on goal select screen
  ///
  /// In en, this message translates to:
  /// **'What you\'ll learn:'**
  String get goalWhatYoullLearn;

  /// Sample words preview on goal select screen
  ///
  /// In en, this message translates to:
  /// **'café · meeting · contract · invoice · deadline'**
  String get goalSampleWords;

  /// Label before sample text on level select screen
  ///
  /// In en, this message translates to:
  /// **'Sample:'**
  String get levelSampleLabel;

  /// Sample vocabulary preview on level select screen
  ///
  /// In en, this message translates to:
  /// **'Hello · Thank you · Good morning'**
  String get levelSampleText;

  /// No description provided for @profileSettingsSection.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettingsSection;

  /// No description provided for @profileAppVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get profileAppVersion;

  /// No description provided for @profileNotifications.
  ///
  /// In en, this message translates to:
  /// **'Daily Reminders'**
  String get profileNotifications;

  /// No description provided for @profileSendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get profileSendFeedback;

  /// No description provided for @profileSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOut;

  /// No description provided for @profileChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get profileChangeLanguage;

  /// No description provided for @shopGetFreePack.
  ///
  /// In en, this message translates to:
  /// **'Get Free Pack'**
  String get shopGetFreePack;

  /// No description provided for @reviewCompleteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Great work! Keep it up.'**
  String get reviewCompleteSubtitle;

  /// No description provided for @reviewCompleteStatCards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get reviewCompleteStatCards;

  /// No description provided for @reviewCompleteStatAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get reviewCompleteStatAccuracy;

  /// No description provided for @reviewCompleteStatXp.
  ///
  /// In en, this message translates to:
  /// **'XP Earned'**
  String get reviewCompleteStatXp;

  /// No description provided for @reviewConversationTitle.
  ///
  /// In en, this message translates to:
  /// **'Conversation Practice'**
  String get reviewConversationTitle;

  /// No description provided for @reviewFillBlankHint.
  ///
  /// In en, this message translates to:
  /// **'Type your answer...'**
  String get reviewFillBlankHint;

  /// No description provided for @reviewFillBlankAnswer.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get reviewFillBlankAnswer;

  /// No description provided for @reviewFillBlankHintBtn.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get reviewFillBlankHintBtn;

  /// No description provided for @reviewFillBlankNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get reviewFillBlankNext;

  /// No description provided for @reviewFillBlankCheck.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get reviewFillBlankCheck;

  /// Ghost link below Get Started on welcome screen
  ///
  /// In en, this message translates to:
  /// **'Sign in to account'**
  String get welcomeSignIn;

  /// Feature preview card label on welcome screen
  ///
  /// In en, this message translates to:
  /// **'Snap'**
  String get featureSnap;

  /// Feature preview card label on welcome screen
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get featureAI;

  /// Feature preview card label on welcome screen
  ///
  /// In en, this message translates to:
  /// **'Vault'**
  String get featureVault;

  /// Auth screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome to Kotoka'**
  String get authTitle;

  /// Google sign-in button
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authGoogle;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get authEmail;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// Primary sign-in CTA
  ///
  /// In en, this message translates to:
  /// **'Sign in to Kotoka'**
  String get authSignIn;

  /// Sign up link on auth screen
  ///
  /// In en, this message translates to:
  /// **'No account? Sign up →'**
  String get authNoAccount;

  /// Privacy and terms caption on auth screen
  ///
  /// In en, this message translates to:
  /// **'Privacy · Terms'**
  String get authPrivacyTerms;

  /// Divider label between Google and email sign-in
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get authOr;

  /// Redesigned PDPA screen title
  ///
  /// In en, this message translates to:
  /// **'Help Kotoka learn'**
  String get pdpaNewTitle;

  /// Redesigned PDPA screen subtitle
  ///
  /// In en, this message translates to:
  /// **'To provide a seamless experience we need a few permissions.'**
  String get pdpaNewSubtitle;

  /// Camera permission description on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Snap memories'**
  String get pdpaCameraDesc;

  /// Location permission label on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get pdpaLocationLabel;

  /// Location permission description on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Geo-tag memories'**
  String get pdpaLocationDesc;

  /// Microphone permission label on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get pdpaMicrophoneLabel;

  /// Microphone permission description on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Voice notes, AI'**
  String get pdpaMicrophoneDesc;

  /// Notifications permission description on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Smart reminders'**
  String get pdpaNotificationsDesc;

  /// Allow selected permissions CTA on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Allow Selected'**
  String get pdpaAllow;

  /// Maybe later ghost button on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get pdpaMaybeLater;

  /// Caption below CTA on redesigned PDPA screen
  ///
  /// In en, this message translates to:
  /// **'Change anytime in Device Settings →'**
  String get pdpaSettings;

  /// Proficiency assessment screen title
  ///
  /// In en, this message translates to:
  /// **'Choose your path'**
  String get assessTitle;

  /// Proficiency assessment screen subtitle
  ///
  /// In en, this message translates to:
  /// **'How familiar are you with this language?'**
  String get assessSubtitle;

  /// Beginner path card title
  ///
  /// In en, this message translates to:
  /// **'Learning for the first time?'**
  String get assessBeginner;

  /// Beginner path card subtitle
  ///
  /// In en, this message translates to:
  /// **'Start from scratch!'**
  String get assessBeginnerSub;

  /// Experienced path card title
  ///
  /// In en, this message translates to:
  /// **'Already know some?'**
  String get assessExperienced;

  /// Experienced path card subtitle
  ///
  /// In en, this message translates to:
  /// **'Check your level!'**
  String get assessExperiencedSub;

  /// Step indicator on proficiency assessment screen
  ///
  /// In en, this message translates to:
  /// **'Step 2 of 4'**
  String get assessStep;

  /// Goal commitment screen title
  ///
  /// In en, this message translates to:
  /// **'What\'s your focus?'**
  String get goalFocusTitle;

  /// Goal commitment screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Set your personalized goals and daily rhythm'**
  String get goalFocusSubtitle;

  /// Goals section heading on goal commitment screen
  ///
  /// In en, this message translates to:
  /// **'Select Goals'**
  String get goalSelectGoals;

  /// Step badge on goal commitment screen
  ///
  /// In en, this message translates to:
  /// **'Step 1/2'**
  String get goalStep1;

  /// Step badge on goal commitment screen
  ///
  /// In en, this message translates to:
  /// **'Step 2/2'**
  String get goalStep2;

  /// Commitment section heading on goal commitment screen
  ///
  /// In en, this message translates to:
  /// **'Commitment'**
  String get goalCommitment;

  /// Breezy time commitment label
  ///
  /// In en, this message translates to:
  /// **'Breezy'**
  String get goalBreezy;

  /// Breezy time commitment duration
  ///
  /// In en, this message translates to:
  /// **'5–10 min/day'**
  String get goalBreezyTime;

  /// Steady time commitment label
  ///
  /// In en, this message translates to:
  /// **'Steady'**
  String get goalSteady;

  /// Steady time commitment duration
  ///
  /// In en, this message translates to:
  /// **'15–20 min/day'**
  String get goalSteadyTime;

  /// Deep Dive time commitment label
  ///
  /// In en, this message translates to:
  /// **'Deep Dive'**
  String get goalDeepDive;

  /// Deep Dive time commitment duration
  ///
  /// In en, this message translates to:
  /// **'30+ min/day'**
  String get goalDeepDiveTime;

  /// Confirm selection CTA on goal commitment screen
  ///
  /// In en, this message translates to:
  /// **'Confirm Selection'**
  String get goalConfirm;

  /// Caption below CTA on goal commitment screen
  ///
  /// In en, this message translates to:
  /// **'Change goals in settings'**
  String get goalChangeSettings;

  /// Flashcard mode card title on review screen
  ///
  /// In en, this message translates to:
  /// **'Flashcard'**
  String get reviewFlashcardMode;

  /// Flashcard mode card description
  ///
  /// In en, this message translates to:
  /// **'Flip & rate'**
  String get reviewFlashcardDesc;

  /// Fill-in-blank mode card title on review screen
  ///
  /// In en, this message translates to:
  /// **'Fill-in-blank'**
  String get reviewFillMode;

  /// Fill-in-blank mode card description
  ///
  /// In en, this message translates to:
  /// **'Type the word'**
  String get reviewFillDesc;

  /// Conversation mode card title on review screen
  ///
  /// In en, this message translates to:
  /// **'Conversation'**
  String get reviewConvMode;

  /// Conversation mode card description
  ///
  /// In en, this message translates to:
  /// **'Practice speaking'**
  String get reviewConvDesc;

  /// Pronunciation mode card title on review screen
  ///
  /// In en, this message translates to:
  /// **'Pronunciation'**
  String get reviewPronounMode;

  /// Pronunciation mode card description
  ///
  /// In en, this message translates to:
  /// **'Say it aloud'**
  String get reviewPronounDesc;

  /// Mock deck 1 name
  ///
  /// In en, this message translates to:
  /// **'Iced Latte'**
  String get homeMockDeck1;

  /// Mock deck 2 name
  ///
  /// In en, this message translates to:
  /// **'Wireless Earphones'**
  String get homeMockDeck2;

  /// No description provided for @shopPack1Name.
  ///
  /// In en, this message translates to:
  /// **'Workplace Thai'**
  String get shopPack1Name;

  /// No description provided for @shopPack1Desc.
  ///
  /// In en, this message translates to:
  /// **'Essential vocab for meetings, emails, and office life'**
  String get shopPack1Desc;

  /// No description provided for @shopPack2Name.
  ///
  /// In en, this message translates to:
  /// **'Street Food & Cafés'**
  String get shopPack2Name;

  /// No description provided for @shopPack2Desc.
  ///
  /// In en, this message translates to:
  /// **'Order like a local at any stall or coffee shop'**
  String get shopPack2Desc;

  /// No description provided for @shopPack3Name.
  ///
  /// In en, this message translates to:
  /// **'Travel & Transport'**
  String get shopPack3Name;

  /// No description provided for @shopPack3Desc.
  ///
  /// In en, this message translates to:
  /// **'Navigate airports, taxis, and hotels with ease'**
  String get shopPack3Desc;

  /// No description provided for @shopPack4Name.
  ///
  /// In en, this message translates to:
  /// **'Health & Pharmacy'**
  String get shopPack4Name;

  /// No description provided for @shopPack4Desc.
  ///
  /// In en, this message translates to:
  /// **'Describe symptoms and understand prescriptions'**
  String get shopPack4Desc;

  /// No description provided for @shopPack5Name.
  ///
  /// In en, this message translates to:
  /// **'Shopping & Bargaining'**
  String get shopPack5Name;

  /// No description provided for @shopPack5Desc.
  ///
  /// In en, this message translates to:
  /// **'Prices, sizes, and polite negotiation phrases'**
  String get shopPack5Desc;

  /// No description provided for @shopPack6Name.
  ///
  /// In en, this message translates to:
  /// **'Social & Dating'**
  String get shopPack6Name;

  /// No description provided for @shopPack6Desc.
  ///
  /// In en, this message translates to:
  /// **'Small talk, compliments, and making friends'**
  String get shopPack6Desc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'es',
        'lo',
        'th',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'lo':
      return AppLocalizationsLo();
    case 'th':
      return AppLocalizationsTh();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
