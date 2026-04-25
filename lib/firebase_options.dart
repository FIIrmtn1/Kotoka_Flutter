import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// Stub options for local emulator development.
// Replace with real options from Firebase Console before production.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.windows:
        return windows;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'demo-api-key', //MOCKDATA
    appId: '1:000000000000:web:0000000000000000', //MOCKDATA
    messagingSenderId: '000000000000', //MOCKDATA
    projectId: 'kotoka-dev', //MOCKDATA
    storageBucket: 'kotoka-dev.appspot.com', //MOCKDATA
    authDomain: 'kotoka-dev.firebaseapp.com', //MOCKDATA
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'demo-api-key', //MOCKDATA
    appId: '1:000000000000:android:0000000000000000', //MOCKDATA
    messagingSenderId: '000000000000', //MOCKDATA
    projectId: 'kotoka-dev', //MOCKDATA
    storageBucket: 'kotoka-dev.appspot.com', //MOCKDATA
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'demo-api-key', //MOCKDATA
    appId: '1:000000000000:ios:0000000000000000', //MOCKDATA
    messagingSenderId: '000000000000', //MOCKDATA
    projectId: 'kotoka-dev', //MOCKDATA
    storageBucket: 'kotoka-dev.appspot.com', //MOCKDATA
    iosBundleId: 'com.kotoka.app', //MOCKDATA
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'demo-api-key', //MOCKDATA
    appId: '1:000000000000:web:0000000000000000', //MOCKDATA
    messagingSenderId: '000000000000', //MOCKDATA
    projectId: 'kotoka-dev', //MOCKDATA
    storageBucket: 'kotoka-dev.appspot.com', //MOCKDATA
    authDomain: 'kotoka-dev.firebaseapp.com', //MOCKDATA
  );
}
