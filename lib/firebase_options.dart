// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD0GGwpY9TlmJ6gk2sXwrHC7UJhoceppnQ',
    appId: '1:217515345229:web:1b61d25bdf5c4bb87d6304',
    messagingSenderId: '217515345229',
    projectId: 'almsyrtftyt-4ab6e',
    authDomain: 'almsyrtftyt-4ab6e.firebaseapp.com',
    storageBucket: 'almsyrtftyt-4ab6e.appspot.com',
    measurementId: 'G-F2JT5XM34W',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD0GGwpY9TlmJ6gk2sXwrHC7UJhoceppnQ',
    appId: '1:217515345229:web:dcfc06cfa3a9e4857d6304',
    messagingSenderId: '217515345229',
    projectId: 'almsyrtftyt-4ab6e',
    authDomain: 'almsyrtftyt-4ab6e.firebaseapp.com',
    storageBucket: 'almsyrtftyt-4ab6e.appspot.com',
    measurementId: 'G-4E0TYKWSJY',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfjCCdDF-Eo7Jw0ip7hcx5narGfLsPncs',
    appId: '1:217515345229:ios:9d4574ac3be3b4a37d6304',
    messagingSenderId: '217515345229',
    projectId: 'almsyrtftyt-4ab6e',
    storageBucket: 'almsyrtftyt-4ab6e.appspot.com',
    iosBundleId: 'com.example.fityatalmasera',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB00XvBYkbUrLP-gxY82H432pMEW8iNr2w',
    appId: '1:217515345229:android:42b1caeb2e4d26367d6304',
    messagingSenderId: '217515345229',
    projectId: 'almsyrtftyt-4ab6e',
    storageBucket: 'almsyrtftyt-4ab6e.appspot.com',
  );

}