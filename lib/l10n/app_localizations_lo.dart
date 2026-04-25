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
  String get tagline => 'ຮຽນຮູ້ຄຳສັບຈາກຊີວິດຈິງຂອງທ່ານ';

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
  String get pdpaCameraReason => 'ຖ່າຍຮູບເພື່ອລະບຸ ແລະ ຮຽນຮູ້ຄຳສັບໃນບໍລິບົດ';

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
      'ໃຊ້ສຳລັບແບບຝຶກຫັດສຽງ ແລະ ຄຳຄຶດຄຳຄ່ອນການອອກສຽງ.';

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
  String get snapCameraViewfinder => 'ຊ່ອງມອງຮູບກ້ອງ';

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
  String get reviewRateHard => 'ຍາກ';

  @override
  String get reviewRateOk => 'ໂອເຄ';

  @override
  String get reviewRateEasy => 'ງ່າຍ';

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
}
