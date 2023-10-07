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
    apiKey: 'AIzaSyDzxNNJ2T9HLRLpQkaE0oaMEGlituDQ5JA',
    appId: '1:737126350829:web:05e87e8fae6743eb6d71e4',
    messagingSenderId: '737126350829',
    projectId: 'notes-42fbf',
    authDomain: 'notes-42fbf.firebaseapp.com',
    databaseURL: 'https://notes-42fbf-default-rtdb.firebaseio.com',
    storageBucket: 'notes-42fbf.appspot.com',
    measurementId: 'G-Z37FG7MS6E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZUq5hNdXggx1tMx9OpILfCxfaXmcoo6s',
    appId: '1:737126350829:android:a57ef4646ad6d2626d71e4',
    messagingSenderId: '737126350829',
    projectId: 'notes-42fbf',
    databaseURL: 'https://notes-42fbf-default-rtdb.firebaseio.com',
    storageBucket: 'notes-42fbf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBD-mqMvxo3yqdd_dB-FQjmE7D90w2ck1s',
    appId: '1:737126350829:ios:01a9d604ecdb880f6d71e4',
    messagingSenderId: '737126350829',
    projectId: 'notes-42fbf',
    databaseURL: 'https://notes-42fbf-default-rtdb.firebaseio.com',
    storageBucket: 'notes-42fbf.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBD-mqMvxo3yqdd_dB-FQjmE7D90w2ck1s',
    appId: '1:737126350829:ios:deb74a764df2220e6d71e4',
    messagingSenderId: '737126350829',
    projectId: 'notes-42fbf',
    databaseURL: 'https://notes-42fbf-default-rtdb.firebaseio.com',
    storageBucket: 'notes-42fbf.appspot.com',
    iosBundleId: 'com.example.notes.RunnerTests',
  );
}
