// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Kotoka';

  @override
  String get tagline => 'Aprende vocabulario de tu propia vida';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get selectLanguage => 'Elige tu idioma';

  @override
  String get selectGoal => '¿Cuál es tu objetivo?';

  @override
  String get selectLevel => '¿Cuál es tu nivel?';

  @override
  String get selectSchedule => 'Establece tu horario diario';

  @override
  String get pdpaTitle => 'Privacidad y permisos';

  @override
  String get pdpaConsent =>
      'Al continuar, aceptas nuestra Política de Privacidad y consientes los usos de datos descritos a continuación.';

  @override
  String get profileSetup => 'Configura tu perfil';

  @override
  String get letsGo => '¡Vamos!';

  @override
  String get goalCareer => 'Carrera';

  @override
  String get goalTravel => 'Viajes';

  @override
  String get goalAcademic => 'Académico';

  @override
  String get goalPersonal => 'Crecimiento personal';

  @override
  String get goalCareerDesc =>
      'Vocabulario para el entorno laboral y contextos profesionales';

  @override
  String get goalTravelDesc => 'Palabras y frases para explorar el mundo';

  @override
  String get goalAcademicDesc =>
      'Terminología para el estudio, la investigación y los exámenes';

  @override
  String get goalPersonalDesc =>
      'Lenguaje cotidiano para conectar con los demás';

  @override
  String get levelBeginner => 'Principiante';

  @override
  String get levelIntermediate => 'Intermedio';

  @override
  String get levelAdvanced => 'Avanzado';

  @override
  String get levelBeginnerDesc => 'Conozco menos de 500 palabras';

  @override
  String get levelIntermediateDesc => 'Puedo mantener conversaciones básicas';

  @override
  String get levelAdvancedDesc => 'Me desenvuelvo bien pero quiero mejorar';

  @override
  String get scheduleTitle => '¿Cuánto tiempo puedes dedicar cada día?';

  @override
  String get schedule5min => '5 minutos';

  @override
  String get schedule10min => '10 minutos';

  @override
  String get schedule15min => '15 minutos';

  @override
  String get schedule30min => '30 minutos';

  @override
  String wordsPerDay(int count) {
    return '$count palabras / día';
  }

  @override
  String get pdpaCamera => 'Cámara';

  @override
  String get pdpaCameraReason =>
      'Toma fotos para identificar y aprender vocabulario en contexto';

  @override
  String get pdpaGPS => 'Ubicación';

  @override
  String get pdpaGPSReason => 'Adapta las palabras a los lugares que visitas';

  @override
  String get pdpaVoice => 'Micrófono';

  @override
  String get pdpaVoiceReason =>
      'Practica la pronunciación con reconocimiento de voz';

  @override
  String get pdpaRequired => 'Obligatorio';

  @override
  String homeGreetingMorning(String name) {
    return '¡Buenos días, $name!';
  }

  @override
  String homeGreetingAfternoon(String name) {
    return '¡Buenas tardes, $name!';
  }

  @override
  String homeGreetingEvening(String name) {
    return '¡Buenas noches, $name!';
  }

  @override
  String homeStreak(int days) {
    return 'Racha de $days días';
  }

  @override
  String get homeMissions => 'Misiones de hoy';

  @override
  String get homeStartReview => 'Iniciar repaso';

  @override
  String get homeRecentWords => 'Palabras aprendidas recientemente';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get backBtn => 'Atrás';

  @override
  String get skipBtn => 'Omitir';

  @override
  String get doneBtn => 'Listo';

  @override
  String get loadingText => 'Cargando…';

  @override
  String get errorGeneric => 'Algo salió mal. Por favor, inténtalo de nuevo.';

  @override
  String get retryBtn => 'Reintentar';

  @override
  String get navHome => 'Inicio';

  @override
  String get navSnap => 'Capturar';

  @override
  String get navReview => 'Repasar';

  @override
  String get navShop => 'Tienda';

  @override
  String get navProfile => 'Perfil';

  @override
  String get langThai => 'Tailandés';

  @override
  String get langEnglish => 'Inglés';

  @override
  String get langMandarin => 'Mandarín';

  @override
  String get langSpanish => 'Español';

  @override
  String get langVietnamese => 'Vietnamita';

  @override
  String get langLao => 'Laosiano';

  @override
  String get welcomeTagline =>
      'Aprende las palabras que importan — ancladas a tu mundo.';

  @override
  String get welcomeGetStarted => 'Comenzar';

  @override
  String get welcomeTerms =>
      'Al continuar aceptas nuestros Términos de Servicio y Política de Privacidad.';

  @override
  String get continueButton => 'Continuar';

  @override
  String get languageSelectTitle => 'Elige idioma';

  @override
  String get languageSelectSubtitle => '¿Qué par de idiomas quieres aprender?';

  @override
  String get goalSelectTitle => 'Tu objetivo';

  @override
  String get goalSelectSubtitle => '¿Qué te trae a Kotoka?';

  @override
  String get levelSelectTitle => 'Tu nivel';

  @override
  String get levelSelectSubtitle => '¿Cuánto sabes ya?';

  @override
  String get scheduleSubtitle => '¿Cuántos minutos puedes dedicar cada día?';

  @override
  String scheduleMinutes(int count) {
    return '$count min';
  }

  @override
  String scheduleWordsPerDay(int count) {
    return '~$count palabras nuevas por día';
  }

  @override
  String get pdpaExplanation =>
      'Kotoka utiliza tu cámara, ubicación y micrófono para crear vocabulario personalizado a partir de tu mundo real. Tus datos están cifrados y nunca se venden. Esto es un requisito de la Ley de Protección de Datos Personales (PDPA) de Tailandia.';

  @override
  String get pdpaRequiredAll =>
      'Los tres permisos son obligatorios para continuar.';

  @override
  String get pdpaLocation => 'Ubicación GPS';

  @override
  String get pdpaMicrophone => 'Voz y micrófono';

  @override
  String get pdpaLocationReason =>
      'Se usa para detectar los lugares que visitas y sugerir vocabulario relevante.';

  @override
  String get pdpaMicrophoneReason =>
      'Se usa para ejercicios de voz y comentarios de pronunciación durante las sesiones de repaso.';

  @override
  String get pdpaWhatWeUse => 'Para qué usamos esto';

  @override
  String get profileSetupTitle => 'Tu perfil';

  @override
  String get profileNameLabel => 'Nombre para mostrar';

  @override
  String get profileNameHint => 'Introduce tu nombre';

  @override
  String get profileAvatarHint => 'Toca para cambiar foto';

  @override
  String get profileLetsGo => '¡Vamos';

  @override
  String homeGreeting(String name) {
    return 'Buenos días, $name';
  }

  @override
  String homeStreakDays(int count) {
    return 'Racha de $count días';
  }

  @override
  String get homeStreakLabel => '¡Sigue así!';

  @override
  String get homeTodaysMission => 'Misión de hoy';

  @override
  String get homeMissionReview => 'Repasar 10 palabras';

  @override
  String get homeMissionNewWords => 'Aprender 5 palabras nuevas';

  @override
  String homeMissionProgress(int current, int total) {
    return '$current de $total completadas';
  }

  @override
  String get onbWelcomeFocusToggle => 'Modo enfoque (ocultar Koko)';

  @override
  String get onbWelcomeFocusToggleHint =>
      'Interfaz mínima para uso profesional.';

  @override
  String get onbGoalWorkMeeting => 'Reunión de trabajo';

  @override
  String get onbGoalEmailWriting => 'Redacción de correos';

  @override
  String get onbGoalPresentation => 'Presentación';

  @override
  String get onbCommitTitle => 'Mantente en camino';

  @override
  String get onbCommitValueProp1 => 'Recordatorio diario a la hora que elijas.';

  @override
  String get onbCommitValueProp2 =>
      'Aviso de racha para que nunca rompas la cadena.';

  @override
  String get onbCommitAllow => 'Permitir notificaciones';

  @override
  String get onbCommitGrace =>
      '¿Faltaste un día? Tienes 1 pase libre por semana.';

  @override
  String get onbMissionTitle => 'Tu primera misión te espera';

  @override
  String get onbMissionBody =>
      'Captura una palabra de tu mundo. Koko te ayudará a recordarla para siempre.';

  @override
  String get homeTooltipSensoryTag =>
      'Las etiquetas muestran cómo se siente una palabra: sonido, vista, acción. Toca para explorar.';

  @override
  String get a11yFocusToggleOn => 'Modo enfoque activado: Koko oculto';

  @override
  String get a11yFocusToggleOff => 'Modo enfoque desactivado: Koko visible';

  @override
  String get snapTitle => 'Snap';

  @override
  String get snapTabCamera => 'Cámara';

  @override
  String get snapTabText => 'Texto';

  @override
  String get snapTabGps => 'GPS';

  @override
  String get snapCameraViewfinder => 'Visor de cámara';

  @override
  String get snapTextPrompt =>
      'Escribe o pega las palabras que quieres aprender:';

  @override
  String get snapTextHint => 'Escribe aquí…';

  @override
  String get snapTextGenerate => 'Generar palabras';

  @override
  String get snapProcessingTitle => 'Leyendo tu foto…';

  @override
  String get snapProcessingSubtitle =>
      'Gemini está encontrando las palabras que importan en este lugar.';

  @override
  String get snapProcessingCancel => 'Cancelar';

  @override
  String snapResultsWordsFound(int count) {
    return '$count palabras encontradas';
  }

  @override
  String snapResultsMoreWords(int count) {
    return '+ $count más';
  }

  @override
  String get snapResultsSaveAll => 'Guardar todas en mis palabras';

  @override
  String get snapResultsReviewNow => 'Repasar ahora (3 min rápido)';

  @override
  String get reviewTitle => 'Repaso de hoy';

  @override
  String reviewWordsDue(int count, int minutes) {
    return '$count palabras pendientes · ~$minutes minutos';
  }

  @override
  String get reviewStartSession => 'Iniciar sesión';

  @override
  String get reviewQuickMode => 'Modo rápido: 3 palabras, 2 min';

  @override
  String reviewProgressOf(int current, int total) {
    return '$current de $total';
  }

  @override
  String get reviewTapToFlip => 'Toca para voltear';

  @override
  String get reviewRateHard => 'Difícil';

  @override
  String get reviewRateOk => 'Regular';

  @override
  String get reviewRateEasy => 'Fácil';

  @override
  String get reviewFillBlankTitle => 'Rellena el espacio';

  @override
  String get reviewConversationPrompt => 'Tu respuesta:';

  @override
  String get reviewCompleteTitle => '¡Sesión completada!';

  @override
  String get reviewCompleteBackHome => 'Volver al inicio';

  @override
  String get reviewCompleteSnapAnother => 'Snap otro lugar';

  @override
  String get shopTitle => 'Tienda';

  @override
  String get shopPremiumTitle => 'Kotoka Premium';

  @override
  String get shopPremiumDesc =>
      'Snaps ilimitados, paquetes offline, prioridad Koko';

  @override
  String get shopStartTrial => 'Comenzar prueba gratis';

  @override
  String get shopVocabPacks => 'Paquetes de vocabulario';

  @override
  String get shopGetPack => 'Obtener';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileMemoryMap => 'Mi mapa de memoria';

  @override
  String get profileStatsWeek => 'Estadísticas de esta semana';

  @override
  String get profileLanguagePairs => 'Pares de idiomas';

  @override
  String get profileAddPair => '+ Agregar otro par de idiomas';

  @override
  String get profileMapEmpty => 'Tus lugares de aprendizaje aparecerán aquí';

  @override
  String get profileStatWords => 'Palabras aprendidas';

  @override
  String get profileStatSessions => 'Sesiones';

  @override
  String get profileStatAccuracy => 'Precisión';

  @override
  String get homeSnapLearnBtn => 'Snap y Aprende';

  @override
  String get homeSubtitle => '¡Aprende algo nuevo hoy!';

  @override
  String get homeWordsLearned => 'Palabras Aprendidas';

  @override
  String get homeDaysStreak => 'Días de Racha';

  @override
  String homeWordsCount(int count) {
    return '$count palabras';
  }

  @override
  String get homeRecentDecks => 'Mazos Recientes';

  @override
  String get homeDeckReviewBtn => 'Repasar';

  @override
  String get homeWeeklyStory => 'Historia Semanal';

  @override
  String get homeForgettingCurve => 'Curva del Olvido';

  @override
  String get homeUrgentLabel => 'Urgente';

  @override
  String homeAchievementBanner(String title) {
    return '¡$title desbloqueado!';
  }

  @override
  String get homeAchievementCta => 'Hacer prueba CEFR →';

  @override
  String get homeReadStory => 'Leer historia →';

  @override
  String get langDisplayLanguage => 'Idioma de la interfaz';

  @override
  String get langCustomPair => 'Par personalizado';

  @override
  String get langISpeak => 'Hablo…';

  @override
  String get langILearn => 'Quiero aprender…';

  @override
  String get langSelectPair => 'Seleccionar este par';

  @override
  String get reviewTipsHeading => 'Consejos de hoy';

  @override
  String get reviewTip1 =>
      'Repasar hoy fija las palabras antes de que las olvides.';

  @override
  String get reviewTip2 =>
      'Sesiones cortas (10 min) superan a las largas — hazlo a diario.';

  @override
  String get reviewTip3 => 'Tu precisión mejora cada vez que repasas.';

  @override
  String get profileMapEmptyDesc =>
      'Captura palabras en cafés, oficinas y lugares que visitas — aparecerán aquí en tu mapa.';

  @override
  String get profileMapEmptyCta => 'Haz tu primer Snap →';

  @override
  String get reviewIncludesSpeaking => 'Incluye práctica oral';
}
