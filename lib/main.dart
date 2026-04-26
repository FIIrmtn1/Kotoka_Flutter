/// Kotoka app bootstrap.
///
/// Responsibilities:
///   1. Firebase initialisation (with Firestore emulator in debug mode)
///   2. ApiClient singleton setup
///   3. ProviderScope (Riverpod)
///   4. MaterialApp.router with go_router + all 6 locales
library;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/api/api_client.dart';
import 'core/providers/locale_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

/// Controls whether the app uses light or dark theme.
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 2. Connect to emulators in debug mode
  if (kDebugMode) {
    await _connectToEmulators();
  }

  // 3. Initialise API client (requires Firebase to be ready)
  ApiClient.init(
    auth: FirebaseAuth.instance,
  );

  // 4. Run app
  runApp(
    const ProviderScope(
      child: KotokaApp(),
    ),
  );
}

/// Connects Firestore and Auth to local emulators when running in debug mode.
Future<void> _connectToEmulators() async {
  const firestoreHost = 'localhost';
  const firestorePort = 8080;
  const authHost = 'localhost';
  const authPort = 9099;

  try {
    FirebaseFirestore.instance.useFirestoreEmulator(
      firestoreHost,
      firestorePort,
    );
    await FirebaseAuth.instance.useAuthEmulator(authHost, authPort);
    debugPrint('[Kotoka] Connected to Firebase emulators — '
        'Firestore=$firestoreHost:$firestorePort, '
        'Auth=$authHost:$authPort');
  } catch (e) {
    debugPrint('[Kotoka] Emulator connection skipped: $e');
  }
}

// ---------------------------------------------------------------------------
// Root widget
// ---------------------------------------------------------------------------
class KotokaApp extends ConsumerWidget {
  const KotokaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Kotoka',
      debugShowCheckedModeBanner: false,

      // ------------------------------------------------------------------
      // Theme
      // ------------------------------------------------------------------
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ref.watch(themeModeProvider),

      // ------------------------------------------------------------------
      // Router
      // ------------------------------------------------------------------
      routerConfig: router,

      // ------------------------------------------------------------------
      // Localisation — all 6 supported locales
      // ------------------------------------------------------------------
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('th'), // Thai
        Locale('zh'), // Chinese (Simplified)
        Locale('es'), // Spanish
        Locale('vi'), // Vietnamese
        Locale('lo'), // Lao
      ],
      locale: ref.watch(localeProvider), // null = system locale
    );
  }
}
