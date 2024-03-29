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
    apiKey: 'AIzaSyAD4bI_MMJLLHxM78uoDFSxH0cZV2ozrlI',
    appId: '1:581825612905:web:da171555d068eaec75e6f8',
    messagingSenderId: '581825612905',
    projectId: 'smartfarm-flutter-app',
    authDomain: 'smartfarm-flutter-app.firebaseapp.com',
    storageBucket: 'smartfarm-flutter-app.appspot.com',
    measurementId: 'G-5ZG1YM5SQD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAz9ojUH8-1lQK6N87S6buX2H4GQ4VSoQE',
    appId: '1:581825612905:android:3c59b5ffa5b8ff3c75e6f8',
    messagingSenderId: '581825612905',
    projectId: 'smartfarm-flutter-app',
    storageBucket: 'smartfarm-flutter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJnlgjR_OQgjvtVeOHd0h3NagRxNw-ePw',
    appId: '1:581825612905:ios:f6aa63646db802c975e6f8',
    messagingSenderId: '581825612905',
    projectId: 'smartfarm-flutter-app',
    storageBucket: 'smartfarm-flutter-app.appspot.com',
    iosBundleId: 'com.example.smartfarmFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJnlgjR_OQgjvtVeOHd0h3NagRxNw-ePw',
    appId: '1:581825612905:ios:02b13977f24ee47875e6f8',
    messagingSenderId: '581825612905',
    projectId: 'smartfarm-flutter-app',
    storageBucket: 'smartfarm-flutter-app.appspot.com',
    iosBundleId: 'com.example.smartfarmFlutterApp.RunnerTests',
  );
}
