// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'โคโตกะ';

  @override
  String get tagline => 'เรียนรู้คำศัพท์จากชีวิตจริงของคุณ';

  @override
  String get getStarted => 'เริ่มต้น';

  @override
  String get selectLanguage => 'เลือกภาษาของคุณ';

  @override
  String get selectGoal => 'เป้าหมายของคุณคืออะไร?';

  @override
  String get selectLevel => 'ระดับของคุณอยู่ที่ไหน?';

  @override
  String get selectSchedule => 'กำหนดตารางเรียนรายวัน';

  @override
  String get pdpaTitle => 'ความเป็นส่วนตัวและสิทธิ์';

  @override
  String get pdpaConsent =>
      'หากดำเนินการต่อ แสดงว่าคุณยอมรับนโยบายความเป็นส่วนตัวและยินยอมให้ใช้ข้อมูลตามที่ระบุด้านล่าง';

  @override
  String get profileSetup => 'ตั้งค่าโปรไฟล์ของคุณ';

  @override
  String get letsGo => 'ไปกันเลย!';

  @override
  String get goalCareer => 'การทำงาน';

  @override
  String get goalTravel => 'การท่องเที่ยว';

  @override
  String get goalAcademic => 'การศึกษา';

  @override
  String get goalPersonal => 'การพัฒนาตนเอง';

  @override
  String get goalCareerDesc => 'คำศัพท์สำหรับที่ทำงานและบริบทมืออาชีพ';

  @override
  String get goalTravelDesc => 'คำและวลีสำหรับการสำรวจโลก';

  @override
  String get goalAcademicDesc => 'คำศัพท์สำหรับการเรียน การวิจัย และการสอบ';

  @override
  String get goalPersonalDesc => 'ภาษาประจำวันสำหรับการสร้างความสัมพันธ์';

  @override
  String get levelBeginner => 'ผู้เริ่มต้น';

  @override
  String get levelIntermediate => 'ระดับกลาง';

  @override
  String get levelAdvanced => 'ระดับสูง';

  @override
  String get levelBeginnerDesc => 'ฉันรู้จักคำศัพท์น้อยกว่า 500 คำ';

  @override
  String get levelIntermediateDesc => 'ฉันสามารถสนทนาขั้นพื้นฐานได้';

  @override
  String get levelAdvancedDesc => 'ฉันสื่อสารได้ดีแต่อยากพัฒนาเพิ่ม';

  @override
  String get scheduleTitle => 'คุณมีเวลาเรียนกี่นาทีต่อวัน?';

  @override
  String get schedule5min => '5 นาที';

  @override
  String get schedule10min => '10 นาที';

  @override
  String get schedule15min => '15 นาที';

  @override
  String get schedule30min => '30 นาที';

  @override
  String wordsPerDay(int count) {
    return '$count คำ / วัน';
  }

  @override
  String get pdpaCamera => 'กล้อง';

  @override
  String get pdpaCameraReason => 'ถ่ายภาพเพื่อระบุและเรียนรู้คำศัพท์ในบริบท';

  @override
  String get pdpaGPS => 'ตำแหน่งที่ตั้ง';

  @override
  String get pdpaGPSReason => 'ปรับคำศัพท์ให้เหมาะกับสถานที่ที่คุณเยี่ยมชม';

  @override
  String get pdpaVoice => 'ไมโครโฟน';

  @override
  String get pdpaVoiceReason => 'ฝึกการออกเสียงด้วยการจดจำเสียง';

  @override
  String get pdpaRequired => 'จำเป็น';

  @override
  String homeGreetingMorning(String name) {
    return 'สวัสดีตอนเช้า $name!';
  }

  @override
  String homeGreetingAfternoon(String name) {
    return 'สวัสดีตอนบ่าย $name!';
  }

  @override
  String homeGreetingEvening(String name) {
    return 'สวัสดีตอนเย็น $name!';
  }

  @override
  String homeStreak(int days) {
    return 'ต่อเนื่อง $days วัน';
  }

  @override
  String get homeMissions => 'ภารกิจวันนี้';

  @override
  String get homeStartReview => 'เริ่มทบทวน';

  @override
  String get homeRecentWords => 'คำศัพท์ที่เพิ่งเรียนรู้';

  @override
  String get continueBtn => 'ดำเนินการต่อ';

  @override
  String get backBtn => 'ย้อนกลับ';

  @override
  String get skipBtn => 'ข้าม';

  @override
  String get doneBtn => 'เสร็จสิ้น';

  @override
  String get loadingText => 'กำลังโหลด…';

  @override
  String get errorGeneric => 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง';

  @override
  String get retryBtn => 'ลองใหม่';

  @override
  String get navHome => 'หน้าหลัก';

  @override
  String get navSnap => 'ถ่ายภาพ';

  @override
  String get navReview => 'ทบทวน';

  @override
  String get navShop => 'ร้านค้า';

  @override
  String get navProfile => 'โปรไฟล์';

  @override
  String get langThai => 'ภาษาไทย';

  @override
  String get langEnglish => 'ภาษาอังกฤษ';

  @override
  String get langMandarin => 'ภาษาจีนกลาง';

  @override
  String get langSpanish => 'ภาษาสเปน';

  @override
  String get langVietnamese => 'ภาษาเวียดนาม';

  @override
  String get langLao => 'ภาษาลาว';

  @override
  String get welcomeTagline => 'เรียนรู้คำสำคัญ — ผูกพันกับโลกของคุณ';

  @override
  String get welcomeGetStarted => 'เริ่มต้น';

  @override
  String get welcomeTerms =>
      'การดำเนินการต่อหมายความว่าคุณยอมรับข้อกำหนดการใช้งานและนโยบายความเป็นส่วนตัว';

  @override
  String get continueButton => 'ดำเนินการต่อ';

  @override
  String get languageSelectTitle => 'เลือกภาษา';

  @override
  String get languageSelectSubtitle => 'คุณต้องการเรียนภาษาคู่ไหน?';

  @override
  String get goalSelectTitle => 'เป้าหมายของคุณ';

  @override
  String get goalSelectSubtitle => 'อะไรพาคุณมาที่ Kotoka?';

  @override
  String get levelSelectTitle => 'ระดับของคุณ';

  @override
  String get levelSelectSubtitle => 'คุณรู้อะไรบ้างแล้ว?';

  @override
  String get scheduleSubtitle => 'คุณมีเวลาเรียนกี่นาทีต่อวัน?';

  @override
  String scheduleMinutes(int count) {
    return '$count นาที';
  }

  @override
  String scheduleWordsPerDay(int count) {
    return '~$count คำใหม่ต่อวัน';
  }

  @override
  String get pdpaExplanation =>
      'Kotoka ใช้กล้อง ตำแหน่งที่ตั้ง และไมโครโฟนของคุณเพื่อสร้างคำศัพท์เฉพาะบุคคลจากโลกแห่งความเป็นจริง ข้อมูลของคุณถูกเข้ารหัสและไม่มีการขายให้บุคคลที่สาม ตามพระราชบัญญัติคุ้มครองข้อมูลส่วนบุคคล (PDPA) ของประเทศไทย';

  @override
  String get pdpaRequiredAll =>
      'ต้องได้รับสิทธิ์ทั้งสามรายการจึงจะดำเนินการต่อได้';

  @override
  String get pdpaLocation => 'ตำแหน่ง GPS';

  @override
  String get pdpaMicrophone => 'เสียงและไมโครโฟน';

  @override
  String get pdpaLocationReason =>
      'ใช้เพื่อตรวจจับสถานที่ที่คุณเยี่ยมชมและแนะนำคำศัพท์ที่เกี่ยวข้อง';

  @override
  String get pdpaMicrophoneReason =>
      'ใช้สำหรับแบบฝึกหัดเสียงและข้อเสนอแนะการออกเสียงระหว่างการทบทวน';

  @override
  String get pdpaWhatWeUse => 'เราใช้สิ่งนี้เพื่ออะไร';

  @override
  String get profileSetupTitle => 'โปรไฟล์ของคุณ';

  @override
  String get profileNameLabel => 'ชื่อที่แสดง';

  @override
  String get profileNameHint => 'ใส่ชื่อของคุณ';

  @override
  String get profileAvatarHint => 'แตะเพื่อเปลี่ยนรูปภาพ';

  @override
  String get profileLetsGo => 'ไปกันเลย';

  @override
  String homeGreeting(String name) {
    return 'สวัสดีตอนเช้า $name';
  }

  @override
  String homeStreakDays(int count) {
    return 'ต่อเนื่อง $count วัน';
  }

  @override
  String get homeStreakLabel => 'รักษาไว้ต่อไปนะ!';

  @override
  String get homeTodaysMission => 'ภารกิจวันนี้';

  @override
  String get homeMissionReview => 'ทบทวน 10 คำ';

  @override
  String get homeMissionNewWords => 'เรียนรู้ 5 คำใหม่';

  @override
  String homeMissionProgress(int current, int total) {
    return '$current จาก $total เสร็จแล้ว';
  }

  @override
  String get onbWelcomeFocusToggle => 'โหมดโฟกัส (ซ่อนโคโค)';

  @override
  String get onbWelcomeFocusToggleHint => 'UI แบบเรียบสำหรับการใช้งานอาชีพ';

  @override
  String get onbGoalWorkMeeting => 'การประชุมงาน';

  @override
  String get onbGoalEmailWriting => 'การเขียนอีเมล';

  @override
  String get onbGoalPresentation => 'การนำเสนอ';

  @override
  String get onbCommitTitle => 'อยู่ในเส้นทาง';

  @override
  String get onbCommitValueProp1 => 'การแจ้งเตือนรายวันตามเวลาที่คุณเลือก';

  @override
  String get onbCommitValueProp2 => 'แจ้งเตือนสตรีคเพื่อไม่ให้โซ่ขาด';

  @override
  String get onbCommitAllow => 'อนุญาตการแจ้งเตือน';

  @override
  String get onbCommitGrace =>
      'พลาดวันหนึ่ง? คุณได้รับบัตรผ่านฟรี 1 ใบต่อสัปดาห์';

  @override
  String get onbMissionTitle => 'ภารกิจแรกของคุณรอคุณอยู่';

  @override
  String get onbMissionBody =>
      'แตะคำศัพท์จากโลกของคุณ โคโคจะช่วยให้คุณจำไปตลอด';

  @override
  String get homeTooltipSensoryTag =>
      'แท็กแสดงความรู้สึกของคำ — เสียง การมองเห็น การกระทำ แตะเพื่อสำรวจ';

  @override
  String get a11yFocusToggleOn => 'โหมดโฟกัสเปิด: ซ่อนโคโค';

  @override
  String get a11yFocusToggleOff => 'โหมดโฟกัสปิด: มองเห็นโคโค';

  @override
  String get snapTitle => 'สแนป';

  @override
  String get snapTabCamera => 'กล้อง';

  @override
  String get snapTabText => 'ข้อความ';

  @override
  String get snapTabGps => 'GPS';

  @override
  String get snapCameraViewfinder => 'ช่องมองภาพกล้อง';

  @override
  String get snapTextPrompt => 'พิมพ์หรือวางคำที่ต้องการเรียน:';

  @override
  String get snapTextHint => 'ใส่ข้อความที่นี่…';

  @override
  String get snapTextGenerate => 'สร้างคำศัพท์';

  @override
  String get snapProcessingTitle => 'กำลังอ่านภาพถ่าย…';

  @override
  String get snapProcessingSubtitle =>
      'Gemini กำลังค้นหาคำที่สำคัญในสถานที่นี้';

  @override
  String get snapProcessingCancel => 'ยกเลิก';

  @override
  String snapResultsWordsFound(int count) {
    return 'พบ $count คำ';
  }

  @override
  String snapResultsMoreWords(int count) {
    return '+ อีก $count คำ';
  }

  @override
  String get snapResultsSaveAll => 'บันทึกทั้งหมดเป็นคำของฉัน';

  @override
  String get snapResultsReviewNow => 'ทบทวนเดี๋ยวนี้ (3 นาทีเร็ว)';

  @override
  String get reviewTitle => 'ทบทวนวันนี้';

  @override
  String reviewWordsDue(int count, int minutes) {
    return '$count คำที่ต้องทบทวน · ~$minutes นาที';
  }

  @override
  String get reviewStartSession => 'เริ่มเซสชัน';

  @override
  String get reviewQuickMode => 'โหมดเร็ว: 3 คำ 2 นาที';

  @override
  String reviewProgressOf(int current, int total) {
    return '$current จาก $total';
  }

  @override
  String get reviewTapToFlip => 'แตะเพื่อพลิก';

  @override
  String get reviewRateHard => 'ยาก';

  @override
  String get reviewRateOk => 'โอเค';

  @override
  String get reviewRateEasy => 'ง่าย';

  @override
  String get reviewFillBlankTitle => 'เติมช่องว่าง';

  @override
  String get reviewConversationPrompt => 'คำตอบของคุณ:';

  @override
  String get reviewCompleteTitle => 'เซสชันเสร็จสิ้น!';

  @override
  String get reviewCompleteBackHome => 'กลับหน้าหลัก';

  @override
  String get reviewCompleteSnapAnother => 'สแนปสถานที่อื่น';

  @override
  String get shopTitle => 'ร้านค้า';

  @override
  String get shopPremiumTitle => 'Kotoka Premium';

  @override
  String get shopPremiumDesc => 'สแนปไม่จำกัด, แพ็กออฟไลน์, Koko priority';

  @override
  String get shopStartTrial => 'เริ่มทดลองฟรี';

  @override
  String get shopVocabPacks => 'แพ็กคำศัพท์';

  @override
  String get shopGetPack => 'รับ';

  @override
  String get profileTitle => 'โปรไฟล์';

  @override
  String get profileMemoryMap => 'แผนที่ความจำของฉัน';

  @override
  String get profileStatsWeek => 'สถิติสัปดาห์นี้';

  @override
  String get profileLanguagePairs => 'คู่ภาษา';

  @override
  String get profileAddPair => '+ เพิ่มคู่ภาษาอื่น';

  @override
  String get profileMapEmpty => 'สถานที่เรียนรู้ของคุณจะปรากฏที่นี่';

  @override
  String get profileStatWords => 'คำที่เรียนรู้';

  @override
  String get profileStatSessions => 'เซสชัน';

  @override
  String get profileStatAccuracy => 'ความแม่นยำ';

  @override
  String get homeSnapLearnBtn => 'ถ่ายและเรียนรู้';

  @override
  String get homeSubtitle => 'มาเรียนรู้สิ่งใหม่วันนี้กันเลย!';

  @override
  String get homeWordsLearned => 'คำที่เรียนรู้แล้ว';

  @override
  String get homeDaysStreak => 'วันติดต่อกัน';

  @override
  String homeWordsCount(int count) {
    return '$count คำ';
  }

  @override
  String get homeRecentDecks => 'ชุดคำศัพท์ล่าสุด';

  @override
  String get homeDeckReviewBtn => 'ทบทวน';

  @override
  String get homeWeeklyStory => 'เรื่องราวประจำสัปดาห์';

  @override
  String get homeForgettingCurve => 'เส้นโค้งการลืม';

  @override
  String get homeUrgentLabel => 'เร่งด่วน';

  @override
  String homeAchievementBanner(String title) {
    return '$title ปลดล็อคแล้ว!';
  }

  @override
  String get homeAchievementCta => 'ทดสอบ CEFR →';

  @override
  String get homeReadStory => 'อ่านเรื่องราว →';

  @override
  String get langDisplayLanguage => 'ภาษาที่แสดง';

  @override
  String get langCustomPair => 'คู่ภาษาที่กำหนดเอง';

  @override
  String get langISpeak => 'ฉันพูด…';

  @override
  String get langILearn => 'ฉันต้องการเรียน…';

  @override
  String get langSelectPair => 'เลือกคู่นี้';
}
