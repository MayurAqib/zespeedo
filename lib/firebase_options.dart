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
    apiKey: 'AIzaSyAficb44AkoFc5o_Wsx2QYG8JnkNsvBuoQ',
    appId: '1:599139585480:web:52a797165821301b0fc4fd',
    messagingSenderId: '599139585480',
    projectId: 'zespeedo-ab880',
    authDomain: 'zespeedo-ab880.firebaseapp.com',
    storageBucket: 'zespeedo-ab880.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIlrAN-hTPg6GcLju713s5iv78U3jju6Y',
    appId: '1:599139585480:android:63ffebb413e214010fc4fd',
    messagingSenderId: '599139585480',
    projectId: 'zespeedo-ab880',
    storageBucket: 'zespeedo-ab880.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbUCJ7Bwvn8RlM2JduPX8fCnhIVfJmPWY',
    appId: '1:599139585480:ios:53ba6ee2e792f0130fc4fd',
    messagingSenderId: '599139585480',
    projectId: 'zespeedo-ab880',
    storageBucket: 'zespeedo-ab880.appspot.com',
    iosBundleId: 'com.example.zespeedo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbUCJ7Bwvn8RlM2JduPX8fCnhIVfJmPWY',
    appId: '1:599139585480:ios:e745a24b61a2d9220fc4fd',
    messagingSenderId: '599139585480',
    projectId: 'zespeedo-ab880',
    storageBucket: 'zespeedo-ab880.appspot.com',
    iosBundleId: 'com.example.zespeedo.RunnerTests',
  );
}
