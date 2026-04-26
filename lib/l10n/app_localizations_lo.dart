// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lao (`lo`).
class AppLocalizationsLo extends AppLocalizations {
  AppLocalizationsLo([String locale = 'lo']) : super(locale);

  @override
  String get appName => 'ໂຄໂຕກາ';

  @override
  String get tagline => 'ສະແນັບໂລກຂອງທ່ານ ເວົ້າໄດ້ທຸກພາສາ';

  @override
  String get getStarted => 'ເລີ່ມຕົ້ນ';

  @override
  String get selectLanguage => 'ເລືອກພາສາຂອງທ່ານ';

  @override
  String get selectGoal => 'ເປົ້າໝາຍຂອງທ່ານແມ່ນຫຍັງ?';

  @override
  String get selectLevel => 'ລະດັບຂອງທ່ານຢູ່ໃສ?';

  @override
  String get selectSchedule => 'ກຳນົດຕາຕະລາງການຮຽນປະຈຳວັນ';

  @override
  String get pdpaTitle => 'ຄວາມເປັນສ່ວນຕົວ ແລະ ສິດທິ';

  @override
  String get pdpaConsent =>
      'ໂດຍການດຳເນີນຕໍ່ ທ່ານຕົກລົງໃຈກັບນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ ແລະ ຍິນຍອມໃຫ້ໃຊ້ຂໍ້ມູນຕາມທີ່ອະທິບາຍໄວ້ດ້ານລຸ່ມ.';

  @override
  String get profileSetup => 'ຕັ້ງຄ່າໂປຣໄຟລ໌ຂອງທ່ານ';

  @override
  String get letsGo => 'ໄປກັນເລີຍ!';

  @override
  String get goalCareer => 'ອາຊີບ';

  @override
  String get goalTravel => 'ການທ່ອງທ່ຽວ';

  @override
  String get goalAcademic => 'ການສຶກສາ';

  @override
  String get goalPersonal => 'ການພັດທະນາຕົນເອງ';

  @override
  String get goalCareerDesc =>
      'ຄຳສັບສຳລັບບ່ອນເຮັດວຽກ ແລະ ບໍລິບົດທາງດ້ານວິຊາຊີບ';

  @override
  String get goalTravelDesc => 'ຄຳ ແລະ ປະໂຫຍກສຳລັບການສຳຫຼວດໂລກ';

  @override
  String get goalAcademicDesc => 'ຄຳສັບສຳລັບການຮຽນ ການຄົ້ນຄ້ວາ ແລະ ການສອບເສັງ';

  @override
  String get goalPersonalDesc => 'ພາສາປະຈຳວັນສຳລັບການເຊື່ອມຕໍ່ກັບຄົນອື່ນ';

  @override
  String get levelBeginner => 'ຜູ້ເລີ່ມຕົ້ນ';

  @override
  String get levelIntermediate => 'ລະດັບກາງ';

  @override
  String get levelAdvanced => 'ລະດັບສູງ';

  @override
  String get levelBeginnerDesc => 'ຂ້ອຍຮູ້ຈັກຄຳສັບໜ້ອຍກວ່າ 500 ຄຳ';

  @override
  String get levelIntermediateDesc => 'ຂ້ອຍສາມາດສົນທະນາຂັ້ນພື້ນຖານໄດ້';

  @override
  String get levelAdvancedDesc => 'ຂ້ອຍສື່ສານໄດ້ດີ ແຕ່ຢາກພັດທະນາເພີ່ມ';

  @override
  String get scheduleTitle => 'ທ່ານມີເວລາຮຽນຈັກນາທີຕໍ່ວັນ?';

  @override
  String get schedule5min => '5 ນາທີ';

  @override
  String get schedule10min => '10 ນາທີ';

  @override
  String get schedule15min => '15 ນາທີ';

  @override
  String get schedule30min => '30 ນາທີ';

  @override
  String wordsPerDay(int count) {
    return '$count ຄຳ / ວັນ';
  }

  @override
  String get pdpaCamera => 'ກ້ອງຖ່າຍຮູບ';

  @override
  String get pdpaCameraReason => 'ເພື່ອສະແນັບ ແລະ ຮຽນຄຳໃໝ່ຈາກໂລກອ້ອມຂ້າງທ່ານ';

  @override
  String get pdpaGPS => 'ສະຖານທີ່';

  @override
  String get pdpaGPSReason => 'ປັບຄຳສັບໃຫ້ເໝາະກັບສະຖານທີ່ທີ່ທ່ານໄປຢ້ຽມຢາມ';

  @override
  String get pdpaVoice => 'ໄມໂຄໂຟນ';

  @override
  String get pdpaVoiceReason => 'ຝຶກການອອກສຽງດ້ວຍການຮັບຮູ້ສຽງ';

  @override
  String get pdpaRequired => 'ຈຳເປັນ';

  @override
  String homeGreetingMorning(String name) {
    return 'ສະບາຍດີຕອນເຊົ້າ $name!';
  }

  @override
  String homeGreetingAfternoon(String name) {
    return 'ສະບາຍດີຕອນສວາຍ $name!';
  }

  @override
  String homeGreetingEvening(String name) {
    return 'ສະບາຍດີຕອນແລງ $name!';
  }

  @override
  String homeStreak(int days) {
    return 'ຕໍ່ເນື່ອງ $days ວັນ';
  }

  @override
  String get homeMissions => 'ພາລະກິດວັນນີ້';

  @override
  String get homeStartReview => 'ເລີ່ມທົບທວນ';

  @override
  String get homeRecentWords => 'ຄຳສັບທີ່ຫາກໍຮຽນ';

  @override
  String get continueBtn => 'ດຳເນີນຕໍ່';

  @override
  String get backBtn => 'ກັບຄືນ';

  @override
  String get skipBtn => 'ຂ້າມ';

  @override
  String get doneBtn => 'ສຳເລັດ';

  @override
  String get loadingText => 'ກຳລັງໂຫລດ…';

  @override
  String get errorGeneric => 'ເກີດຂໍ້ຜິດພາດ ກະລຸນາລອງໃໝ່ອີກຄັ້ງ';

  @override
  String get retryBtn => 'ລອງໃໝ່';

  @override
  String get navHome => 'ໜ້າຫຼັກ';

  @override
  String get navSnap => 'ຖ່າຍຮູບ';

  @override
  String get navReview => 'ທົບທວນ';

  @override
  String get navShop => 'ຮ້ານຄ້າ';

  @override
  String get navProfile => 'ໂປຣໄຟລ໌';

  @override
  String get langThai => 'ພາສາໄທ';

  @override
  String get langEnglish => 'ພາສາອັງກິດ';

  @override
  String get langMandarin => 'ພາສາຈີນກາງ';

  @override
  String get langSpanish => 'ພາສາສະເປນ';

  @override
  String get langVietnamese => 'ພາສາຫວຽດນາມ';

  @override
  String get langLao => 'ພາສາລາວ';

  @override
  String get welcomeTagline => 'ຮຽນຄຳສັບທີ່ສຳຄັນ — ຜູກພັນກັບໂລກຂອງທ່ານ.';

  @override
  String get welcomeGetStarted => 'ເລີ່ມຕົ້ນ';

  @override
  String get welcomeTerms =>
      'ການດຳເນີນຕໍ່ໝາຍຄວາມວ່າທ່ານຕົກລົງກັບເງື່ອນໄຂການໃຊ້ງານ ແລະ ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ.';

  @override
  String get continueButton => 'ດຳເນີນຕໍ່';

  @override
  String get languageSelectTitle => 'ເລືອກພາສາ';

  @override
  String get languageSelectSubtitle => 'ທ່ານຕ້ອງການຮຽນຄູ່ພາສາໃດ?';

  @override
  String get goalSelectTitle => 'ເປົ້າໝາຍຂອງທ່ານ';

  @override
  String get goalSelectSubtitle => 'ຫຍັງພາທ່ານມາທີ່ Kotoka?';

  @override
  String get levelSelectTitle => 'ລະດັບຂອງທ່ານ';

  @override
  String get levelSelectSubtitle => 'ທ່ານຮູ້ຫຍັງຢູ່ແລ້ວ?';

  @override
  String get scheduleSubtitle => 'ທ່ານມີເວລາຮຽນຈັກນາທີຕໍ່ວັນ?';

  @override
  String scheduleMinutes(int count) {
    return '$count ນາທີ';
  }

  @override
  String scheduleWordsPerDay(int count) {
    return '~$count ຄຳໃໝ່ຕໍ່ວັນ';
  }

  @override
  String get pdpaExplanation =>
      'Kotoka ໃຊ້ກ້ອງ ຕຳແໜ່ງ ແລະ ໄມໂຄໂຟນຂອງທ່ານເພື່ອສ້າງຄຳສັບສ່ວນຕົວຈາກໂລກຄວາມເປັນຈິງ. ຂໍ້ມູນຂອງທ່ານຖືກເຂົ້າລະຫັດ ແລະ ບໍ່ມີການຂາຍ. ນີ້ແມ່ນຂໍ້ກຳນົດຕາມກົດໝາຍຄຸ້ມຄອງຂໍ້ມູນສ່ວນຕົວ (PDPA) ຂອງປະເທດໄທ.';

  @override
  String get pdpaRequiredAll =>
      'ຕ້ອງໄດ້ຮັບສິດທິ໌ທັງສາມລາຍການຈຶ່ງຈະດຳເນີນຕໍ່ໄດ້.';

  @override
  String get pdpaLocation => 'ຕຳແໜ່ງ GPS';

  @override
  String get pdpaMicrophone => 'ສຽງ ແລະ ໄມໂຄໂຟນ';

  @override
  String get pdpaLocationReason =>
      'ໃຊ້ເພື່ອກວດຈັບສະຖານທີ່ທີ່ທ່ານໄປຢ້ຽມຢາມ ແລະ ແນະນຳຄຳສັບທີ່ກ່ຽວຂ້ອງ.';

  @override
  String get pdpaMicrophoneReason =>
      'ເພື່ອໃຫ້ Kotoka ໄດ້ຍິນການອອກສຽງຂອງທ່ານ ແລະ ນຳພາທ່ານ';

  @override
  String get pdpaWhatWeUse => 'ເຮົາໃຊ້ສິ່ງນີ້ເພື່ອຫຍັງ';

  @override
  String get profileSetupTitle => 'ໂປຣໄຟລ໌ຂອງທ່ານ';

  @override
  String get profileNameLabel => 'ຊື່ທີ່ສະແດງ';

  @override
  String get profileNameHint => 'ໃສ່ຊື່ຂອງທ່ານ';

  @override
  String get profileAvatarHint => 'ແຕະເພື່ອປ່ຽນຮູບ';

  @override
  String get profileLetsGo => 'ໄປກັນເລີຍ';

  @override
  String homeGreeting(String name) {
    return 'ສະບາຍດີຕອນເຊົ້າ $name';
  }

  @override
  String homeStreakDays(int count) {
    return 'ຕໍ່ເນື່ອງ $count ວັນ';
  }

  @override
  String get homeStreakLabel => 'ຮັກສາໄວ້ຕໍ່ໄປ!';

  @override
  String get homeTodaysMission => 'ພາລະກິດວັນນີ້';

  @override
  String get homeMissionReview => 'ທົບທວນ 10 ຄຳ';

  @override
  String get homeMissionNewWords => 'ຮຽນ 5 ຄຳໃໝ່';

  @override
  String homeMissionProgress(int current, int total) {
    return '$current ຈາກ $total ສຳເລັດແລ້ວ';
  }

  @override
  String get onbWelcomeFocusToggle => 'ໂໝດໂຟກັສ (ເຊື່ອງໂຄໂຄ)';

  @override
  String get onbWelcomeFocusToggleHint =>
      'UI ແບບຮຽບງ່າຍສຳລັບການໃຊ້ງານດ້ານວິຊາຊີບ.';

  @override
  String get onbGoalWorkMeeting => 'ການປະຊຸມວຽກ';

  @override
  String get onbGoalEmailWriting => 'ການຂຽນອີເມວ';

  @override
  String get onbGoalPresentation => 'ການນຳສະເໜີ';

  @override
  String get onbCommitTitle => 'ຢູ່ໃນເສັ້ນທາງ';

  @override
  String get onbCommitValueProp1 => 'ການແຈ້ງເຕືອນປະຈຳວັນຕາມເວລາທີ່ທ່ານເລືອກ.';

  @override
  String get onbCommitValueProp2 => 'ການແຈ້ງເຕືອນ streak ເພື່ອບໍ່ໃຫ້ລະລາຍໂຊ່.';

  @override
  String get onbCommitAllow => 'ອະນຸຍາດການແຈ້ງເຕືອນ';

  @override
  String get onbCommitGrace => 'ພາດວັນໜຶ່ງ? ທ່ານໄດ້ 1 ບັດຜ່ານຟຣີຕໍ່ອາທິດ.';

  @override
  String get onbMissionTitle => 'ພາລະກິດທຳອິດຂອງທ່ານລໍຖ້າຢູ່';

  @override
  String get onbMissionBody =>
      'ຖ່າຍຮູບຄຳສັບຈາກໂລກຂອງທ່ານ. ໂຄໂຄຈະຊ່ວຍໃຫ້ທ່ານຈຳໄດ້ຕະຫຼອດ.';

  @override
  String get onbSummaryTitle => 'ພ້ອມແລ້ວ!';

  @override
  String get onbSummaryBody => 'ນີ້ຄືການຕັ້ງຄ່າການຮຽນຂອງທ່ານ:';

  @override
  String get onbSummaryLanguagePair => 'ພາສາ';

  @override
  String get onbSummaryLevel => 'ລະດັບ';

  @override
  String get onbSummaryDailyGoal => 'ເປົ້າໝາຍປະຈຳວັນ';

  @override
  String get onbSummaryStart => 'ເລີ່ມຮຽນໄດ້ເລີຍ';

  @override
  String get homeTooltipSensoryTag =>
      'ປ້າຍສະແດງຄວາມຮູ້ສຶກຂອງຄຳ — ສຽງ ການເບິ່ງ ການກະທຳ. ແຕະເພື່ອສຳຫຼວດ.';

  @override
  String get a11yFocusToggleOn => 'ໂໝດໂຟກັສເປີດ: ເຊື່ອງໂຄໂຄ';

  @override
  String get a11yFocusToggleOff => 'ໂໝດໂຟກັສປິດ: ເຫັນໂຄໂຄ';

  @override
  String get snapTitle => 'ສະແນັບ';

  @override
  String get snapTabCamera => 'ກ້ອງ';

  @override
  String get snapTabText => 'ຂໍ້ຄວາມ';

  @override
  String get snapTabGps => 'GPS';

  @override
  String get snapCameraViewfinder => 'ຊີ້ໄປທີ່ຂໍ້ຄວາມ · ເມນູ · ປ້າຍ';

  @override
  String get snapTextPrompt => 'ພິມຫຼືວາງຄຳທີ່ຕ້ອງການຮຽນ:';

  @override
  String get snapTextHint => 'ປ້ອນຂໍ້ຄວາມທີ່ນີ້…';

  @override
  String get snapTextGenerate => 'ສ້າງຄຳສັບ';

  @override
  String get snapProcessingTitle => 'ກຳລັງອ່ານຮູບຂອງທ່ານ…';

  @override
  String get snapProcessingSubtitle =>
      'Gemini ກຳລັງຊອກຫາຄຳທີ່ສຳຄັນໃນສະຖານທີ່ນີ້.';

  @override
  String get snapProcessingCancel => 'ຍົກເລີກ';

  @override
  String snapResultsWordsFound(int count) {
    return 'ພົບ $count ຄຳ';
  }

  @override
  String snapResultsMoreWords(int count) {
    return '+ ອີກ $count ຄຳ';
  }

  @override
  String get snapResultsSaveAll => 'ບັນທຶກທັງໝົດໃສ່ຄຳຂອງຂ້ອຍ';

  @override
  String get snapResultsReviewNow => 'ທົບທວນດຽວນີ້ (ໄວ 3 ນາທີ)';

  @override
  String get reviewTitle => 'ທົບທວນວັນນີ້';

  @override
  String reviewWordsDue(int count, int minutes) {
    return '$count ຄຳທີ່ຕ້ອງທົບທວນ · ~$minutes ນາທີ';
  }

  @override
  String get reviewStartSession => 'ເລີ່ມເຊດຊັນ';

  @override
  String get reviewQuickMode => 'ໂໝດໄວ: 3 ຄຳ 2 ນາທີ';

  @override
  String reviewProgressOf(int current, int total) {
    return '$current ຈາກ $total';
  }

  @override
  String get reviewTapToFlip => 'ແຕະເພື່ອພິ້ວ';

  @override
  String get reviewRateAgain => 'ຈຳບໍ່ໄດ້';

  @override
  String get reviewRateHard => 'ເກືອບໄດ້';

  @override
  String get reviewRateGood => 'ໄດ້ແລ້ວ!';

  @override
  String get reviewRateEasy => 'ງ່າຍເກີນໄປ';

  @override
  String get reviewFillBlankTitle => 'ຕື່ມຊ່ອງຫວ່າງ';

  @override
  String get reviewConversationPrompt => 'ຄຳຕອບຂອງທ່ານ:';

  @override
  String get reviewCompleteTitle => 'ເຊດຊັນສຳເລັດ!';

  @override
  String get reviewCompleteBackHome => 'ກັບໜ້າຫຼັກ';

  @override
  String get reviewCompleteSnapAnother => 'ສະແນັບສະຖານທີ່ອື່ນ';

  @override
  String get shopTitle => 'ຮ້ານຄ້າ';

  @override
  String get shopPremiumTitle => 'Kotoka Premium';

  @override
  String get shopPremiumDesc =>
      'ສະແນັບບໍ່ຈຳກັດ, ແພັກໂດຍບໍ່ໃຊ້ອິນເຕີເນັດ, Koko ລຳດັບຕົ້ນ';

  @override
  String get shopStartTrial => 'ເລີ່ມທົດລອງຟຣີ';

  @override
  String get shopVocabPacks => 'ແພັກຄຳສັບ';

  @override
  String get shopGetPack => 'ຮັບ';

  @override
  String get shopBetaFreeTitle => 'ເບຕ້າ — ໃຊ້ຟຣີ';

  @override
  String get shopBetaFreeBody => 'ທຸກແພັກ ແລະຟີເຈີ Premium ໃຊ້ຟຣີໃນຊ່ວງເບຕ້າ';

  @override
  String get shopBetaFree => 'ຟຣີໃນເບຕ້າ';

  @override
  String get shopBetaUnlocked => 'ປົດລັອກແລ້ວ — ໃຊ້ຟຣີໃນຊ່ວງເບຕ້າ';

  @override
  String get profileTitle => 'ໂປຣໄຟລ໌';

  @override
  String get profileMemoryMap => 'ແຜນທີ່ຄວາມຈຳຂອງຂ້ອຍ';

  @override
  String get profileStatsWeek => 'ສະຖິຕິອາທິດນີ້';

  @override
  String get profileLanguagePairs => 'ຄູ່ພາສາ';

  @override
  String get profileAddPair => '+ ເພີ່ມຄູ່ພາສາອື່ນ';

  @override
  String get profileMapEmpty => 'ສະຖານທີ່ຮຽນຮູ້ຂອງທ່ານຈະປາກົດຢູ່ທີ່ນີ້';

  @override
  String get profileStatWords => 'ຄຳສັບທີ່ຮຽນ';

  @override
  String get profileStatSessions => 'ເຊດຊັນ';

  @override
  String get profileStatAccuracy => 'ຄວາມຖືກຕ້ອງ';

  @override
  String get homeSnapLearnBtn => 'ຖ່າຍ & ຮຽນ';

  @override
  String get homeSubtitle => 'ມາຮຽນສິ່ງໃໝ່ວັນນີ້ເລີຍ!';

  @override
  String get homeWordsLearned => 'ຄຳທີ່ຮຽນແລ້ວ';

  @override
  String get homeDaysStreak => 'ວັນຕິດຕໍ່ກັນ';

  @override
  String homeWordsCount(int count) {
    return '$count ຄຳ';
  }

  @override
  String get homeRecentDecks => 'ຊຸດຄຳສັບລ່າສຸດ';

  @override
  String get homeDeckReviewBtn => 'ທົບທວນ';

  @override
  String get homeWeeklyStory => 'ເລື່ອງລາວປະຈຳອາທິດ';

  @override
  String get homeForgettingCurve => 'ເສັ້ນໂຄ້ງການລືມ';

  @override
  String get homeUrgentLabel => 'ຮີບດ່ວນ';

  @override
  String homeAchievementBanner(String title) {
    return '$title ປົດລັອກແລ້ວ!';
  }

  @override
  String get homeAchievementCta => 'ທົດສອບ CEFR →';

  @override
  String get homeReadStory => 'ອ່ານເລື່ອງ →';

  @override
  String get langDisplayLanguage => 'ພາສາສະແດງ';

  @override
  String get langCustomPair => 'ຄູ່ພາສາກຳນົດເອງ';

  @override
  String get langISpeak => 'ຂ້ອຍເວົ້າ…';

  @override
  String get langILearn => 'ຂ້ອຍຢາກຮຽນ…';

  @override
  String get langSelectPair => 'ເລືອກຄູ່ນີ້';

  @override
  String get reviewTipsHeading => 'ຄໍາແນະນໍາມື້ນີ້';

  @override
  String get reviewTip1 => 'ການທົບທວນມື້ນີ້ຊ່ວຍຈົດຈໍາຄໍາສັບກ່ອນທີ່ຈະລືມ.';

  @override
  String get reviewTip2 => 'ຮຽນສັ້ນ (10 ນາທີ) ດີກວ່າຮຽນຍາວ — ເຮັດທຸກວັນ.';

  @override
  String get reviewTip3 => 'ຄວາມຖືກຕ້ອງຂອງທ່ານດີຂຶ້ນທຸກຄັ້ງທີ່ທົບທວນ.';

  @override
  String get profileMapEmptyDesc =>
      'ສແນັບຄຳສັບທີ່ຮ້ານກາເຟ, ຫ້ອງການ ແລະ ສະຖານທີ່ທ່ານໄປ — ມັນຈະປາກົດຢູ່ໃນແຜນທີ່ຂອງທ່ານ.';

  @override
  String get profileMapEmptyCta => 'ສແນັບຄັ້ງທຳອິດ →';

  @override
  String get reviewIncludesSpeaking => 'ລວມມີການຝຶກເວົ້າ';

  @override
  String get pdpaAgreeAndContinue => 'ຕົກລົງ ແລະ ດຳເນີນຕໍ່';

  @override
  String get onbMissionCta => 'ໄປກັນເລີຍ!';

  @override
  String get snapFlash => 'ແຟລດ';

  @override
  String get snapGrid => 'ຕາໜ່າງ';

  @override
  String get kokoWavingSemantics => 'ໂຄໂຄໂບກມືທັກທາຍ';

  @override
  String get kokoMascotSemantics => 'ມາສຄອດໂຄໂຄ';

  @override
  String get permissionNotifications => 'ການແຈ້ງເຕືອນ';

  @override
  String get permissionNotificationsReason =>
      'ຮັກສາເສັ້ນທາງດ້ວຍການແຈ້ງເຕືອນປະຈຳວັນ ແລະ ການແຈ້ງເຕືອນ streak';

  @override
  String get summaryTitle => 'ສຳເລັດແລ້ວ!';

  @override
  String get summarySubtitle => 'Kotoka ພ້ອມຊ່ວຍທ່ານສ້າງຄຳສັບແລ້ວ.';

  @override
  String get summaryAccountSecured => 'Account Secured';

  @override
  String get summaryAccountSecuredDesc => 'Your data is encrypted and safe.';

  @override
  String get summarySmartTags => 'Smart Tags';

  @override
  String get summarySmartTagsDesc => 'Koko auto-categorizes your vocabulary.';

  @override
  String get summaryCloudSync => 'Cloud Sync';

  @override
  String get summaryCloudSyncDesc => 'Encrypted backup across all devices.';

  @override
  String get summarySnapCta => 'ຖ່າຍຮູບສະຖານທີ່ທຳອິດ';

  @override
  String get summaryTourLink => 'ເບິ່ງທົວກ່ອນ';

  @override
  String get summarySetupToast => 'ຕັ້ງຄ່າສຳເລັດ';

  @override
  String get summaryKokoSemantics => 'ໂກໂກ ກຳລັງສະເຫລີມສະຫລອງ';

  @override
  String get goalWhatYoullLearn => 'What you\'ll learn:';

  @override
  String get goalSampleWords =>
      'café · meeting · contract · invoice · deadline';

  @override
  String get levelSampleLabel => 'Sample:';

  @override
  String get levelSampleText => 'Hello · Thank you · Good morning';

  @override
  String get profileSettingsSection => 'ການຕັ້ງຄ່າ';

  @override
  String get profileAppVersion => 'ເວີຊັ່ນ 1.0.0';

  @override
  String get profileNotifications => 'ການແຈ້ງເຕືອນປະຈຳວັນ';

  @override
  String get profileSendFeedback => 'ສົ່ງຄຳຄິດເຫັນ';

  @override
  String get profileSignOut => 'ອອກຈາກລະບົບ';

  @override
  String get profileChangeLanguage => 'ປ່ຽນພາສາ';

  @override
  String get shopGetFreePack => 'ຮັບຊຸດຟຣີ';

  @override
  String get reviewCompleteSubtitle => 'ດີຫຼາຍ! ສືບຕໍ່ໄປ.';

  @override
  String get reviewCompleteStatCards => 'ບັດ';

  @override
  String get reviewCompleteStatAccuracy => 'ຄວາມຖືກຕ້ອງ';

  @override
  String get reviewCompleteStatXp => 'XP ທີ່ໄດ້ຮັບ';

  @override
  String get reviewConversationTitle => 'ຝຶກສົນທະນາ';

  @override
  String get reviewFillBlankHint => 'ພິມຄຳຕອບ...';

  @override
  String get reviewFillBlankAnswer => 'ຄຳຕອບ';

  @override
  String get reviewFillBlankHintBtn => 'ຄຳໃບ້';

  @override
  String get reviewFillBlankNext => 'ຕໍ່ໄປ';

  @override
  String get reviewFillBlankCheck => 'ກວດສອບ';

  @override
  String get welcomeSignIn => 'ເຂົ້າສູ່ລະບົບ';

  @override
  String get featureSnap => 'Snap';

  @override
  String get featureAI => 'AI';

  @override
  String get featureVault => 'ຄັງ';

  @override
  String get authTitle => 'ຍິນດີຕ້ອນຮັບສູ່ Kotoka';

  @override
  String get authGoogle => 'ດຳເນີນການດ້ວຍ Google';

  @override
  String get authEmail => 'ທີ່ຢູ່ອີເມວ';

  @override
  String get authPassword => 'ລະຫັດຜ່ານ';

  @override
  String get authSignIn => 'ເຂົ້າສູ່ລະບົບ Kotoka';

  @override
  String get authNoAccount => 'ບໍ່ມີບັນຊີ? ສະໝັກ →';

  @override
  String get authPrivacyTerms => 'Privacy · Terms';

  @override
  String get authOr => 'ຫຼື';

  @override
  String get pdpaNewTitle => 'ຊ່ວຍ Kotoka ຮຽນຮູ້';

  @override
  String get pdpaNewSubtitle => 'ເພື່ອໃຫ້ປະສົບການລຽບລ້ຽງ ພວກເຮົາຕ້ອງການສິດທິ.';

  @override
  String get pdpaCameraDesc => 'ຖ່າຍພາບຄວາມຊົງຈຳ';

  @override
  String get pdpaLocationLabel => 'ສະຖານທີ່';

  @override
  String get pdpaLocationDesc => 'ແທັກສະຖານທີ່ຄວາມຊົງຈຳ';

  @override
  String get pdpaMicrophoneLabel => 'ໄມໂຄຣໂຟນ';

  @override
  String get pdpaMicrophoneDesc => 'ບັນທຶກສຽງ, AI';

  @override
  String get pdpaNotificationsDesc => 'ການແຈ້ງເຕືອນສະຫຼາດ';

  @override
  String get pdpaAllow => 'ອະນຸຍາດທີ່ເລືອກ';

  @override
  String get pdpaMaybeLater => 'ບາງທີທຕ່ໄປ';

  @override
  String get pdpaSettings => 'ປ່ຽນໄດ້ທຸກເວລາໃນການຕັ້ງຄ່າ →';

  @override
  String get assessTitle => 'ເລືອກເສັ້ນທາງຂອງທ່ານ';

  @override
  String get assessSubtitle => 'ທ່ານຄຸ້ນເຄີຍກັບພາສານີ້ຫຼາຍຊໍ່ານ?';

  @override
  String get assessBeginner => 'ຮຽນເປັນຄັ້ງທຳອິດ?';

  @override
  String get assessBeginnerSub => 'ເລີ່ມຈາກໂຕ!';

  @override
  String get assessExperienced => 'ຮູ້ຈັກໜ້ອຍໜຶ່ງແລ້ວ?';

  @override
  String get assessExperiencedSub => 'ກວດສອບລະດັບຂອງທ່ານ!';

  @override
  String get assessStep => 'ຂັ້ນຕອນ 2 ໃນ 4';

  @override
  String get goalFocusTitle => 'ເປົ້າໝາຍຂອງທ່ານແມ່ນຫຍັງ?';

  @override
  String get goalFocusSubtitle => 'ຕັ້ງເປົ້າໝາຍແລະຈັງຫວະປະຈຳວັນຂອງທ່ານ';

  @override
  String get goalSelectGoals => 'ເລືອກເປົ້າໝາຍ';

  @override
  String get goalStep1 => 'Step 1/2';

  @override
  String get goalStep2 => 'Step 2/2';

  @override
  String get goalCommitment => 'ຄວາມມຸ່ງໝັ້ນ';

  @override
  String get goalBreezy => 'ສະບາຍໆ';

  @override
  String get goalBreezyTime => '5–10 min/day';

  @override
  String get goalSteady => 'ສະໝ່ຳສະເໝີ';

  @override
  String get goalSteadyTime => '15–20 min/day';

  @override
  String get goalDeepDive => 'ເລິກເຊິ່ງ';

  @override
  String get goalDeepDiveTime => '30+ min/day';

  @override
  String get goalConfirm => 'ຢືນຢັນການເລືອກ';

  @override
  String get goalChangeSettings => 'ປ່ຽນເປົ້າໝາຍໃນການຕັ້ງຄ່າ';

  @override
  String get reviewFlashcardMode => 'ບັດຄຳ';

  @override
  String get reviewFlashcardDesc => 'ພິວ & ໃຫ້ຄະແນນ';

  @override
  String get reviewFillMode => 'ຕື່ມຄຳ';

  @override
  String get reviewFillDesc => 'ພິມຄຳ';

  @override
  String get reviewConvMode => 'ສົນທະນາ';

  @override
  String get reviewConvDesc => 'ຝຶກເວົ້າ';
}
