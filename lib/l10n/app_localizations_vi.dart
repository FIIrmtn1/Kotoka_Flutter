// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Kotoka';

  @override
  String get tagline => 'Chụp thế giới của bạn, nói bất kỳ ngôn ngữ nào';

  @override
  String get getStarted => 'Bắt đầu';

  @override
  String get selectLanguage => 'Chọn ngôn ngữ của bạn';

  @override
  String get selectGoal => 'Mục tiêu của bạn là gì?';

  @override
  String get selectLevel => 'Trình độ của bạn ở đâu?';

  @override
  String get selectSchedule => 'Đặt lịch học hàng ngày';

  @override
  String get pdpaTitle => 'Quyền riêng tư và quyền truy cập';

  @override
  String get pdpaConsent =>
      'Bằng cách tiếp tục, bạn đồng ý với Chính sách Quyền riêng tư và đồng ý với các cách sử dụng dữ liệu được mô tả dưới đây.';

  @override
  String get profileSetup => 'Thiết lập hồ sơ của bạn';

  @override
  String get letsGo => 'Bắt đầu thôi!';

  @override
  String get goalCareer => 'Sự nghiệp';

  @override
  String get goalTravel => 'Du lịch';

  @override
  String get goalAcademic => 'Học thuật';

  @override
  String get goalPersonal => 'Phát triển bản thân';

  @override
  String get goalCareerDesc =>
      'Từ vựng cho môi trường công việc và bối cảnh chuyên nghiệp';

  @override
  String get goalTravelDesc => 'Từ và cụm từ để khám phá thế giới';

  @override
  String get goalAcademicDesc =>
      'Thuật ngữ dành cho học tập, nghiên cứu và thi cử';

  @override
  String get goalPersonalDesc => 'Ngôn ngữ hàng ngày để kết nối với mọi người';

  @override
  String get levelBeginner => 'Người mới bắt đầu';

  @override
  String get levelIntermediate => 'Trung cấp';

  @override
  String get levelAdvanced => 'Nâng cao';

  @override
  String get levelBeginnerDesc => 'Tôi biết ít hơn 500 từ';

  @override
  String get levelIntermediateDesc => 'Tôi có thể giao tiếp cơ bản';

  @override
  String get levelAdvancedDesc => 'Tôi giao tiếp tốt nhưng muốn phát triển hơn';

  @override
  String get scheduleTitle => 'Bạn có thể dành bao nhiêu thời gian mỗi ngày?';

  @override
  String get schedule5min => '5 phút';

  @override
  String get schedule10min => '10 phút';

  @override
  String get schedule15min => '15 phút';

  @override
  String get schedule30min => '30 phút';

  @override
  String wordsPerDay(int count) {
    return '$count từ / ngày';
  }

  @override
  String get pdpaCamera => 'Máy ảnh';

  @override
  String get pdpaCameraReason =>
      'để chụp và học từ mới từ thế giới xung quanh bạn';

  @override
  String get pdpaGPS => 'Vị trí';

  @override
  String get pdpaGPSReason => 'Tùy chỉnh từ vựng theo những nơi bạn ghé thăm';

  @override
  String get pdpaVoice => 'Micrô';

  @override
  String get pdpaVoiceReason => 'Luyện phát âm với nhận dạng giọng nói';

  @override
  String get pdpaRequired => 'Bắt buộc';

  @override
  String homeGreetingMorning(String name) {
    return 'Chào buổi sáng, $name!';
  }

  @override
  String homeGreetingAfternoon(String name) {
    return 'Chào buổi chiều, $name!';
  }

  @override
  String homeGreetingEvening(String name) {
    return 'Chào buổi tối, $name!';
  }

  @override
  String homeStreak(int days) {
    return 'Chuỗi $days ngày';
  }

  @override
  String get homeMissions => 'Nhiệm vụ hôm nay';

  @override
  String get homeStartReview => 'Bắt đầu ôn tập';

  @override
  String get homeRecentWords => 'Từ vừa học';

  @override
  String get continueBtn => 'Tiếp tục';

  @override
  String get backBtn => 'Quay lại';

  @override
  String get skipBtn => 'Bỏ qua';

  @override
  String get doneBtn => 'Xong';

  @override
  String get loadingText => 'Đang tải…';

  @override
  String get errorGeneric => 'Đã xảy ra lỗi. Vui lòng thử lại.';

  @override
  String get retryBtn => 'Thử lại';

  @override
  String get navHome => 'Trang chủ';

  @override
  String get navSnap => 'Chụp ảnh';

  @override
  String get navReview => 'Ôn tập';

  @override
  String get navShop => 'Cửa hàng';

  @override
  String get navProfile => 'Hồ sơ';

  @override
  String get langThai => 'Tiếng Thái';

  @override
  String get langEnglish => 'Tiếng Anh';

  @override
  String get langMandarin => 'Tiếng Phổ thông';

  @override
  String get langSpanish => 'Tiếng Tây Ban Nha';

  @override
  String get langVietnamese => 'Tiếng Việt';

  @override
  String get langLao => 'Tiếng Lào';

  @override
  String get welcomeTagline =>
      'Học những từ quan trọng — gắn liền với cuộc sống của bạn.';

  @override
  String get welcomeGetStarted => 'Bắt đầu';

  @override
  String get welcomeTerms =>
      'Tiếp tục có nghĩa là bạn đồng ý với Điều khoản Dịch vụ và Chính sách Bảo mật.';

  @override
  String get continueButton => 'Tiếp tục';

  @override
  String get languageSelectTitle => 'Chọn ngôn ngữ';

  @override
  String get languageSelectSubtitle => 'Bạn muốn học cặp ngôn ngữ nào?';

  @override
  String get goalSelectTitle => 'Mục tiêu của bạn';

  @override
  String get goalSelectSubtitle => 'Điều gì đưa bạn đến Kotoka?';

  @override
  String get levelSelectTitle => 'Trình độ của bạn';

  @override
  String get levelSelectSubtitle => 'Bạn đã biết bao nhiêu rồi?';

  @override
  String get scheduleSubtitle => 'Bạn có thể dành bao nhiêu phút mỗi ngày?';

  @override
  String scheduleMinutes(int count) {
    return '$count phút';
  }

  @override
  String scheduleWordsPerDay(int count) {
    return '~$count từ mới mỗi ngày';
  }

  @override
  String get pdpaExplanation =>
      'Kotoka sử dụng camera, vị trí và micro của bạn để tạo từ vựng cá nhân hóa từ thế giới thực. Dữ liệu của bạn được mã hóa và không bao giờ được bán. Đây là yêu cầu theo Đạo luật Bảo vệ Dữ liệu Cá nhân (PDPA) của Thái Lan.';

  @override
  String get pdpaRequiredAll => 'Cần có cả ba quyền để tiếp tục.';

  @override
  String get pdpaLocation => 'Vị trí GPS';

  @override
  String get pdpaMicrophone => 'Giọng nói và Micrô';

  @override
  String get pdpaLocationReason =>
      'Dùng để phát hiện những nơi bạn ghé thăm và đề xuất từ vựng phù hợp.';

  @override
  String get pdpaMicrophoneReason =>
      'để Kotoka có thể nghe phát âm của bạn và hướng dẫn bạn';

  @override
  String get pdpaWhatWeUse => 'Chúng tôi dùng điều này để làm gì';

  @override
  String get profileSetupTitle => 'Hồ sơ của bạn';

  @override
  String get profileNameLabel => 'Tên hiển thị';

  @override
  String get profileNameHint => 'Nhập tên của bạn';

  @override
  String get profileAvatarHint => 'Nhấn để thay đổi ảnh';

  @override
  String get profileLetsGo => 'Bắt đầu thôi';

  @override
  String homeGreeting(String name) {
    return 'Chào buổi sáng, $name';
  }

  @override
  String homeStreakDays(int count) {
    return 'Chuỗi $count ngày';
  }

  @override
  String get homeStreakLabel => 'Tiếp tục phát huy!';

  @override
  String get homeTodaysMission => 'Nhiệm vụ hôm nay';

  @override
  String get homeMissionReview => 'Ôn tập 10 từ';

  @override
  String get homeMissionNewWords => 'Học 5 từ mới';

  @override
  String homeMissionProgress(int current, int total) {
    return '$current trong $total đã hoàn thành';
  }

  @override
  String get onbWelcomeFocusToggle => 'Chế độ tập trung (ẩn Koko)';

  @override
  String get onbWelcomeFocusToggleHint =>
      'Giao diện tối giản cho môi trường chuyên nghiệp.';

  @override
  String get onbGoalWorkMeeting => 'Họp công việc';

  @override
  String get onbGoalEmailWriting => 'Viết email';

  @override
  String get onbGoalPresentation => 'Thuyết trình';

  @override
  String get onbCommitTitle => 'Đi đúng hướng';

  @override
  String get onbCommitValueProp1 =>
      'Nhắc nhở hàng ngày vào thời gian bạn chọn.';

  @override
  String get onbCommitValueProp2 =>
      'Nhắc chuỗi liên tiếp để bạn không bao giờ bị gián đoạn.';

  @override
  String get onbCommitAllow => 'Cho phép thông báo';

  @override
  String get onbCommitGrace =>
      'Bỏ lỡ một ngày? Bạn có 1 lượt miễn phí mỗi tuần.';

  @override
  String get onbMissionTitle => 'Nhiệm vụ đầu tiên của bạn đang chờ';

  @override
  String get onbMissionBody =>
      'Chụp một từ từ thế giới của bạn. Koko sẽ giúp bạn nhớ mãi mãi.';

  @override
  String get onbSummaryTitle => 'Tất cả đã sẵn sàng!';

  @override
  String get onbSummaryBody => 'Đây là thiết lập học tập của bạn:';

  @override
  String get onbSummaryLanguagePair => 'Ngôn ngữ';

  @override
  String get onbSummaryLevel => 'Cấp độ';

  @override
  String get onbSummaryDailyGoal => 'Mục tiêu hàng ngày';

  @override
  String get onbSummaryStart => 'Bắt đầu học';

  @override
  String get homeTooltipSensoryTag =>
      'Thẻ cho thấy cảm giác của từ — âm thanh, hình ảnh, hành động. Nhấn để khám phá.';

  @override
  String get a11yFocusToggleOn => 'Chế độ tập trung bật: Koko đã ẩn';

  @override
  String get a11yFocusToggleOff => 'Chế độ tập trung tắt: Koko hiển thị';

  @override
  String get snapTitle => 'Snap';

  @override
  String get snapTabCamera => 'Máy ảnh';

  @override
  String get snapTabText => 'Văn bản';

  @override
  String get snapTabGps => 'GPS';

  @override
  String get snapCameraViewfinder => 'Khung ngắm máy ảnh';

  @override
  String get snapTextPrompt => 'Gõ hoặc dán các từ bạn muốn học:';

  @override
  String get snapTextHint => 'Nhập văn bản tại đây…';

  @override
  String get snapTextGenerate => 'Tạo từ vựng';

  @override
  String get snapProcessingTitle => 'Đang đọc ảnh của bạn…';

  @override
  String get snapProcessingSubtitle =>
      'Gemini đang tìm những từ quan trọng tại địa điểm này.';

  @override
  String get snapProcessingCancel => 'Hủy';

  @override
  String snapResultsWordsFound(int count) {
    return 'Tìm thấy $count từ';
  }

  @override
  String snapResultsMoreWords(int count) {
    return '+ $count từ nữa';
  }

  @override
  String get snapResultsSaveAll => 'Lưu tất cả vào từ của tôi';

  @override
  String get snapResultsReviewNow => 'Ôn tập ngay (3 phút nhanh)';

  @override
  String get reviewTitle => 'Ôn tập hôm nay';

  @override
  String reviewWordsDue(int count, int minutes) {
    return '$count từ cần ôn · ~$minutes phút';
  }

  @override
  String get reviewStartSession => 'Bắt đầu phiên';

  @override
  String get reviewQuickMode => 'Chế độ nhanh: 3 từ, 2 phút';

  @override
  String reviewProgressOf(int current, int total) {
    return '$current trong $total';
  }

  @override
  String get reviewTapToFlip => 'Nhấn để lật';

  @override
  String get reviewRateAgain => 'Chưa nhớ';

  @override
  String get reviewRateHard => 'Gần đúng';

  @override
  String get reviewRateGood => 'Nhớ rồi!';

  @override
  String get reviewRateEasy => 'Quá dễ';

  @override
  String get reviewFillBlankTitle => 'Điền vào chỗ trống';

  @override
  String get reviewConversationPrompt => 'Câu trả lời của bạn:';

  @override
  String get reviewCompleteTitle => 'Hoàn thành phiên!';

  @override
  String get reviewCompleteBackHome => 'Về trang chủ';

  @override
  String get reviewCompleteSnapAnother => 'Snap địa điểm khác';

  @override
  String get shopTitle => 'Cửa hàng';

  @override
  String get shopPremiumTitle => 'Kotoka Premium';

  @override
  String get shopPremiumDesc =>
      'Snap không giới hạn, gói ngoại tuyến, ưu tiên Koko';

  @override
  String get shopStartTrial => 'Bắt đầu dùng thử miễn phí';

  @override
  String get shopVocabPacks => 'Gói từ vựng';

  @override
  String get shopGetPack => 'Lấy';

  @override
  String get shopBetaFreeTitle => 'Beta — Truy cập miễn phí';

  @override
  String get shopBetaFreeBody =>
      'Tất cả gói và tính năng Cao cấp đều miễn phí trong giai đoạn beta.';

  @override
  String get shopBetaFree => 'Miễn phí trong beta';

  @override
  String get shopBetaUnlocked => 'Đã mở khóa — miễn phí trong giai đoạn beta';

  @override
  String get profileTitle => 'Hồ sơ';

  @override
  String get profileMemoryMap => 'Bản đồ ký ức của tôi';

  @override
  String get profileStatsWeek => 'Thống kê tuần này';

  @override
  String get profileLanguagePairs => 'Cặp ngôn ngữ';

  @override
  String get profileAddPair => '+ Thêm cặp ngôn ngữ khác';

  @override
  String get profileMapEmpty =>
      'Các địa điểm học tập của bạn sẽ xuất hiện ở đây';

  @override
  String get profileStatWords => 'Từ đã học';

  @override
  String get profileStatSessions => 'Phiên học';

  @override
  String get profileStatAccuracy => 'Độ chính xác';

  @override
  String get homeSnapLearnBtn => 'Chụp & Học';

  @override
  String get homeSubtitle => 'Hãy học điều gì đó hôm nay!';

  @override
  String get homeWordsLearned => 'Từ Đã Học';

  @override
  String get homeDaysStreak => 'Ngày Liên Tiếp';

  @override
  String homeWordsCount(int count) {
    return '$count từ';
  }

  @override
  String get homeRecentDecks => 'Bộ Thẻ Gần Đây';

  @override
  String get homeDeckReviewBtn => 'Ôn Tập';

  @override
  String get homeWeeklyStory => 'Câu Chuyện Tuần Này';

  @override
  String get homeForgettingCurve => 'Đường Cong Quên Lãng';

  @override
  String get homeUrgentLabel => 'Khẩn Cấp';

  @override
  String homeAchievementBanner(String title) {
    return '$title đã mở khóa!';
  }

  @override
  String get homeAchievementCta => 'Kiểm tra CEFR →';

  @override
  String get homeReadStory => 'Đọc câu chuyện →';

  @override
  String get langDisplayLanguage => 'Ngôn ngữ hiển thị';

  @override
  String get langCustomPair => 'Cặp ngôn ngữ tùy chỉnh';

  @override
  String get langISpeak => 'Tôi nói…';

  @override
  String get langILearn => 'Tôi muốn học…';

  @override
  String get langSelectPair => 'Chọn cặp này';

  @override
  String get reviewTipsHeading => 'Mẹo hôm nay';

  @override
  String get reviewTip1 =>
      'Ôn tập hôm nay giúp ghi nhớ từ vựng trước khi quên.';

  @override
  String get reviewTip2 =>
      'Buổi học ngắn (10 phút) hiệu quả hơn buổi dài — làm mỗi ngày.';

  @override
  String get reviewTip3 => 'Độ chính xác của bạn cải thiện mỗi lần ôn tập.';

  @override
  String get profileMapEmptyDesc =>
      'Chụp từ vựng ở quán cà phê, văn phòng và những nơi bạn ghé — chúng sẽ hiện trên bản đồ của bạn.';

  @override
  String get profileMapEmptyCta => 'Snap lần đầu tiên →';

  @override
  String get reviewIncludesSpeaking => 'Bao gồm luyện nói';
}
