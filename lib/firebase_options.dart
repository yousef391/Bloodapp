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
    apiKey: 'AIzaSyA5WwsjJcmNU4rwNLurq4R7ial-hIPMdq4',
    appId: '1:37358817214:web:2b505863696211b2eeb3ef',
    messagingSenderId: '37358817214',
    projectId: 'blood-donation-fcf02',
    authDomain: 'blood-donation-fcf02.firebaseapp.com',
    storageBucket: 'blood-donation-fcf02.appspot.com',
    measurementId: 'G-Z79J023LXG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA58ASalmVEgBXJnCMW78_FLNtQw44jQfU',
    appId: '1:37358817214:android:70c92e9fb3f4deceeeb3ef',
    messagingSenderId: '37358817214',
    projectId: 'blood-donation-fcf02',
    storageBucket: 'blood-donation-fcf02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMYnPn89mfui4D9hIXRMdaUnA4uE4dt3k',
    appId: '1:37358817214:ios:43e22feafa0fcdcbeeb3ef',
    messagingSenderId: '37358817214',
    projectId: 'blood-donation-fcf02',
    storageBucket: 'blood-donation-fcf02.appspot.com',
    iosBundleId: 'com.example.bloodDonation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMYnPn89mfui4D9hIXRMdaUnA4uE4dt3k',
    appId: '1:37358817214:ios:e163989f463c15d5eeb3ef',
    messagingSenderId: '37358817214',
    projectId: 'blood-donation-fcf02',
    storageBucket: 'blood-donation-fcf02.appspot.com',
    iosBundleId: 'com.example.bloodDonation.RunnerTests',
  );
}
