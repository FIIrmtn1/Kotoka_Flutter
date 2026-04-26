// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '科托卡';

  @override
  String get tagline => '拍下你的世界，说任何语言';

  @override
  String get getStarted => '开始';

  @override
  String get selectLanguage => '选择您的语言';

  @override
  String get selectGoal => '您的学习目标是什么？';

  @override
  String get selectLevel => '您的语言水平如何？';

  @override
  String get selectSchedule => '设置每日学习计划';

  @override
  String get pdpaTitle => '隐私与权限';

  @override
  String get pdpaConsent => '继续即表示您同意我们的隐私政策，并同意以下所述的数据用途。';

  @override
  String get profileSetup => '设置您的个人资料';

  @override
  String get letsGo => '出发！';

  @override
  String get goalCareer => '职业发展';

  @override
  String get goalTravel => '旅行';

  @override
  String get goalAcademic => '学术';

  @override
  String get goalPersonal => '个人成长';

  @override
  String get goalCareerDesc => '适用于职场和专业场合的词汇';

  @override
  String get goalTravelDesc => '探索世界所需的单词和短语';

  @override
  String get goalAcademicDesc => '学习、研究和考试的专业术语';

  @override
  String get goalPersonalDesc => '与他人交流的日常用语';

  @override
  String get levelBeginner => '初学者';

  @override
  String get levelIntermediate => '中级';

  @override
  String get levelAdvanced => '高级';

  @override
  String get levelBeginnerDesc => '我掌握的词汇少于500个';

  @override
  String get levelIntermediateDesc => '我能进行基本对话';

  @override
  String get levelAdvancedDesc => '我交流顺畅，但希望进一步提升';

  @override
  String get scheduleTitle => '您每天能花多少时间学习？';

  @override
  String get schedule5min => '5分钟';

  @override
  String get schedule10min => '10分钟';

  @override
  String get schedule15min => '15分钟';

  @override
  String get schedule30min => '30分钟';

  @override
  String wordsPerDay(int count) {
    return '每天 $count 个词';
  }

  @override
  String get pdpaCamera => '相机';

  @override
  String get pdpaCameraReason => '拍下周围世界，学习新单词';

  @override
  String get pdpaGPS => '位置';

  @override
  String get pdpaGPSReason => '根据您访问的地点定制词汇';

  @override
  String get pdpaVoice => '麦克风';

  @override
  String get pdpaVoiceReason => '通过语音识别练习发音';

  @override
  String get pdpaRequired => '必需';

  @override
  String homeGreetingMorning(String name) {
    return '早上好，$name！';
  }

  @override
  String homeGreetingAfternoon(String name) {
    return '下午好，$name！';
  }

  @override
  String homeGreetingEvening(String name) {
    return '晚上好，$name！';
  }

  @override
  String homeStreak(int days) {
    return '连续 $days 天';
  }

  @override
  String get homeMissions => '今日任务';

  @override
  String get homeStartReview => '开始复习';

  @override
  String get homeRecentWords => '最近学习的词汇';

  @override
  String get continueBtn => '继续';

  @override
  String get backBtn => '返回';

  @override
  String get skipBtn => '跳过';

  @override
  String get doneBtn => '完成';

  @override
  String get loadingText => '加载中…';

  @override
  String get errorGeneric => '出错了，请重试。';

  @override
  String get retryBtn => '重试';

  @override
  String get navHome => '主页';

  @override
  String get navSnap => '拍照';

  @override
  String get navReview => '复习';

  @override
  String get navShop => '商店';

  @override
  String get navProfile => '个人资料';

  @override
  String get langThai => '泰语';

  @override
  String get langEnglish => '英语';

  @override
  String get langMandarin => '普通话';

  @override
  String get langSpanish => '西班牙语';

  @override
  String get langVietnamese => '越南语';

  @override
  String get langLao => '老挝语';

  @override
  String get welcomeTagline => '学习真正重要的词汇 — 扎根于你的世界。';

  @override
  String get welcomeGetStarted => '开始';

  @override
  String get welcomeTerms => '继续即表示您同意我们的服务条款和隐私政策。';

  @override
  String get continueButton => '继续';

  @override
  String get languageSelectTitle => '选择语言';

  @override
  String get languageSelectSubtitle => '您想学习哪种语言组合？';

  @override
  String get goalSelectTitle => '您的目标';

  @override
  String get goalSelectSubtitle => '是什么让您来到 Kotoka？';

  @override
  String get levelSelectTitle => '您的水平';

  @override
  String get levelSelectSubtitle => '您已经掌握了多少？';

  @override
  String get scheduleSubtitle => '您每天能花多少分钟学习？';

  @override
  String scheduleMinutes(int count) {
    return '$count 分钟';
  }

  @override
  String scheduleWordsPerDay(int count) {
    return '每天约 $count 个新词';
  }

  @override
  String get pdpaExplanation =>
      'Kotoka 使用您的相机、位置和麦克风，从您的真实世界中构建个性化词汇。您的数据经过加密，绝不出售。这是泰国个人数据保护法 (PDPA) 的要求。';

  @override
  String get pdpaRequiredAll => '需要获得全部三项权限才能继续。';

  @override
  String get pdpaLocation => 'GPS 位置';

  @override
  String get pdpaMicrophone => '语音和麦克风';

  @override
  String get pdpaLocationReason => '用于检测您访问的地点并推荐相关词汇。';

  @override
  String get pdpaMicrophoneReason => '让 Kotoka 听到你的发音并为你指导';

  @override
  String get pdpaWhatWeUse => '我们如何使用这项权限';

  @override
  String get profileSetupTitle => '您的个人资料';

  @override
  String get profileNameLabel => '显示名称';

  @override
  String get profileNameHint => '输入您的名字';

  @override
  String get profileAvatarHint => '点击更换头像';

  @override
  String get profileLetsGo => '出发';

  @override
  String homeGreeting(String name) {
    return '早上好，$name';
  }

  @override
  String homeStreakDays(int count) {
    return '连续 $count 天';
  }

  @override
  String get homeStreakLabel => '继续保持！';

  @override
  String get homeTodaysMission => '今日任务';

  @override
  String get homeMissionReview => '复习 10 个词';

  @override
  String get homeMissionNewWords => '学习 5 个新词';

  @override
  String homeMissionProgress(int current, int total) {
    return '已完成 $current/$total';
  }

  @override
  String get onbWelcomeFocusToggle => '专注模式（隐藏 Koko）';

  @override
  String get onbWelcomeFocusToggleHint => '适合职业使用的简洁界面。';

  @override
  String get onbGoalWorkMeeting => '工作会议';

  @override
  String get onbGoalEmailWriting => '邮件写作';

  @override
  String get onbGoalPresentation => '演示汇报';

  @override
  String get onbCommitTitle => '保持在轨';

  @override
  String get onbCommitValueProp1 => '每天在您选择的时间提醒。';

  @override
  String get onbCommitValueProp2 => '连续学习提醒，让您永不断链。';

  @override
  String get onbCommitAllow => '允许通知';

  @override
  String get onbCommitGrace => '漏了一天？每周有 1 次免费补救机会。';

  @override
  String get onbMissionTitle => '你的第一个任务在等你';

  @override
  String get onbMissionBody => '拍下你生活中的一个词，Koko 会帮你永远记住它。';

  @override
  String get onbSummaryTitle => '一切就绪！';

  @override
  String get onbSummaryBody => '这是您的学习设置：';

  @override
  String get onbSummaryLanguagePair => '语言';

  @override
  String get onbSummaryLevel => '级别';

  @override
  String get onbSummaryDailyGoal => '每日目标';

  @override
  String get onbSummaryStart => '开始学习';

  @override
  String get homeTooltipSensoryTag => '标签展示词语的感觉——声音、视觉、动作。点击探索。';

  @override
  String get a11yFocusToggleOn => '专注模式已开启：Koko 已隐藏';

  @override
  String get a11yFocusToggleOff => '专注模式已关闭：Koko 可见';

  @override
  String get snapTitle => '拍摄';

  @override
  String get snapTabCamera => '相机';

  @override
  String get snapTabText => '文本';

  @override
  String get snapTabGps => 'GPS';

  @override
  String get snapCameraViewfinder => '相机取景框';

  @override
  String get snapTextPrompt => '输入或粘贴您想学习的词汇：';

  @override
  String get snapTextHint => '在此输入文字…';

  @override
  String get snapTextGenerate => '生成词汇';

  @override
  String get snapProcessingTitle => '正在读取您的照片…';

  @override
  String get snapProcessingSubtitle => 'Gemini 正在寻找这个地方重要的词汇。';

  @override
  String get snapProcessingCancel => '取消';

  @override
  String snapResultsWordsFound(int count) {
    return '找到 $count 个词';
  }

  @override
  String snapResultsMoreWords(int count) {
    return '+ 还有 $count 个';
  }

  @override
  String get snapResultsSaveAll => '全部保存到我的词汇';

  @override
  String get snapResultsReviewNow => '立即复习（快速3分钟）';

  @override
  String get reviewTitle => '今日复习';

  @override
  String reviewWordsDue(int count, int minutes) {
    return '$count 个词待复习 · 约$minutes分钟';
  }

  @override
  String get reviewStartSession => '开始学习';

  @override
  String get reviewQuickMode => '快速模式：3个词，2分钟';

  @override
  String reviewProgressOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get reviewTapToFlip => '点击翻转';

  @override
  String get reviewRateAgain => '没记住';

  @override
  String get reviewRateHard => '差不多';

  @override
  String get reviewRateGood => '记住了！';

  @override
  String get reviewRateEasy => '太简单';

  @override
  String get reviewFillBlankTitle => '填空练习';

  @override
  String get reviewConversationPrompt => '您的回答：';

  @override
  String get reviewCompleteTitle => '学习完成！';

  @override
  String get reviewCompleteBackHome => '返回首页';

  @override
  String get reviewCompleteSnapAnother => '拍摄另一个地点';

  @override
  String get shopTitle => '商店';

  @override
  String get shopPremiumTitle => 'Kotoka 高级版';

  @override
  String get shopPremiumDesc => '无限拍摄、离线词包、Koko 优先';

  @override
  String get shopStartTrial => '开始免费试用';

  @override
  String get shopVocabPacks => '词汇包';

  @override
  String get shopGetPack => '获取';

  @override
  String get shopBetaFreeTitle => 'Beta — 免费使用';

  @override
  String get shopBetaFreeBody => '所有词包和高级功能在Beta期间均免费。';

  @override
  String get shopBetaFree => 'Beta期间免费';

  @override
  String get shopBetaUnlocked => '已解锁 — Beta期间免费使用';

  @override
  String get profileTitle => '个人资料';

  @override
  String get profileMemoryMap => '我的记忆地图';

  @override
  String get profileStatsWeek => '本周统计';

  @override
  String get profileLanguagePairs => '语言对';

  @override
  String get profileAddPair => '+ 添加其他语言对';

  @override
  String get profileMapEmpty => '您的学习地点将显示在这里';

  @override
  String get profileStatWords => '已学单词';

  @override
  String get profileStatSessions => '学习次数';

  @override
  String get profileStatAccuracy => '准确率';

  @override
  String get homeSnapLearnBtn => '拍照学习';

  @override
  String get homeSubtitle => '今天学点新东西吧！';

  @override
  String get homeWordsLearned => '已学词汇';

  @override
  String get homeDaysStreak => '连续天数';

  @override
  String homeWordsCount(int count) {
    return '$count 词';
  }

  @override
  String get homeRecentDecks => '最近的词组';

  @override
  String get homeDeckReviewBtn => '复习';

  @override
  String get homeWeeklyStory => '每周故事';

  @override
  String get homeForgettingCurve => '遗忘曲线';

  @override
  String get homeUrgentLabel => '紧急';

  @override
  String homeAchievementBanner(String title) {
    return '$title 已解锁！';
  }

  @override
  String get homeAchievementCta => '参加CEFR测试 →';

  @override
  String get homeReadStory => '阅读故事 →';

  @override
  String get langDisplayLanguage => '显示语言';

  @override
  String get langCustomPair => '自定义语言对';

  @override
  String get langISpeak => '我会说…';

  @override
  String get langILearn => '我想学…';

  @override
  String get langSelectPair => '选择此语言对';

  @override
  String get reviewTipsHeading => '今日小贴士';

  @override
  String get reviewTip1 => '今天复习，在遗忘前巩固词汇。';

  @override
  String get reviewTip2 => '短时练习（10分钟）胜过长时间——每天坚持。';

  @override
  String get reviewTip3 => '每次复习都能提高你的准确率。';

  @override
  String get profileMapEmptyDesc => '在咖啡馆、办公室和您去过的地方拍下单词 — 它们将显示在您的地图上。';

  @override
  String get profileMapEmptyCta => '开始第一次拍摄 →';

  @override
  String get reviewIncludesSpeaking => '包含口语练习';
}
