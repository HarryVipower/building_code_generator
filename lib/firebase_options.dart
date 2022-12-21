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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBy8piaFW6oEESpyrpKuOUgkBrhjZXcm00',
    appId: '1:622876856342:web:6b39be49e83bd1a116e537',
    messagingSenderId: '622876856342',
    projectId: 'building-code-generator',
    authDomain: 'building-code-generator.firebaseapp.com',
    storageBucket: 'building-code-generator.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1tnugCSGhKr-MO44gDQ_83opOtTPySvY',
    appId: '1:622876856342:android:2e01025624539f5416e537',
    messagingSenderId: '622876856342',
    projectId: 'building-code-generator',
    storageBucket: 'building-code-generator.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqENnnXWdOk8McQDiBE071Q8Q_iutazSc',
    appId: '1:622876856342:ios:ddc6f496438db41d16e537',
    messagingSenderId: '622876856342',
    projectId: 'building-code-generator',
    storageBucket: 'building-code-generator.appspot.com',
    iosClientId: '622876856342-sh1dtji8696sm7bfe2ik23pbkmd2oe4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.buildingCodeGen',
  );
}
