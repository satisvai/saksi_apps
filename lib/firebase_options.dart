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
    apiKey: 'AIzaSyDIBghKOhKCfxuUHhNZhRAouuHKh7s4OiI',
    appId: '1:723046150443:web:46c6aba81a7ec531b5156e',
    messagingSenderId: '723046150443',
    projectId: 'saksi-8b2a2',
    authDomain: 'saksi-8b2a2.firebaseapp.com',
    storageBucket: 'saksi-8b2a2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByjVx31wINpECLAEdxfrksTpT3dhqjis4',
    appId: '1:723046150443:android:c2b1145b236f8df1b5156e',
    messagingSenderId: '723046150443',
    projectId: 'saksi-8b2a2',
    storageBucket: 'saksi-8b2a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoSOTioxGGTtlKXcYxFboRpAkcmSCZHBc',
    appId: '1:723046150443:ios:d2c7dff7d185382eb5156e',
    messagingSenderId: '723046150443',
    projectId: 'saksi-8b2a2',
    storageBucket: 'saksi-8b2a2.appspot.com',
    iosBundleId: 'com.example.saksiApps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDoSOTioxGGTtlKXcYxFboRpAkcmSCZHBc',
    appId: '1:723046150443:ios:7118ea0fdde96c56b5156e',
    messagingSenderId: '723046150443',
    projectId: 'saksi-8b2a2',
    storageBucket: 'saksi-8b2a2.appspot.com',
    iosBundleId: 'com.example.saksiApps.RunnerTests',
  );
}
