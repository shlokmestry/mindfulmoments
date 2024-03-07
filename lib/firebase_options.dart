// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAtGG0xMSlK1imUYaYEAjcyMhbIG_L5m80',
    appId: '1:973497471772:web:b4c157fc42dfc9ff6220d9',
    messagingSenderId: '973497471772',
    projectId: 'mindfulmoments-f557a',
    authDomain: 'mindfulmoments-f557a.firebaseapp.com',
    storageBucket: 'mindfulmoments-f557a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYgOwGcZztPqo4_LGXos4qQttT2SmEEUg',
    appId: '1:973497471772:android:e1d10d2d02b62c7b6220d9',
    messagingSenderId: '973497471772',
    projectId: 'mindfulmoments-f557a',
    storageBucket: 'mindfulmoments-f557a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeAKgZdlfNgmbyzB_blEy-WDHnqhjwI9Q',
    appId: '1:973497471772:ios:577040827b12934a6220d9',
    messagingSenderId: '973497471772',
    projectId: 'mindfulmoments-f557a',
    storageBucket: 'mindfulmoments-f557a.appspot.com',
    iosBundleId: 'com.example.mindfulmoments',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeAKgZdlfNgmbyzB_blEy-WDHnqhjwI9Q',
    appId: '1:973497471772:ios:7384f01f68d17d376220d9',
    messagingSenderId: '973497471772',
    projectId: 'mindfulmoments-f557a',
    storageBucket: 'mindfulmoments-f557a.appspot.com',
    iosBundleId: 'com.example.mindfulmoments.RunnerTests',
  );
}