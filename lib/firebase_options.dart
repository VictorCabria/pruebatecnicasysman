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
    apiKey: 'AIzaSyBsYP9ZMbIBzQbSu9RSV1Z0X00fS4vNVhY',
    appId: '1:911814964024:web:edb1745352dc64402a47cd',
    messagingSenderId: '911814964024',
    projectId: 'synergiaprestamostoti',
    authDomain: 'synergiaprestamostoti.firebaseapp.com',
    storageBucket: 'synergiaprestamostoti.appspot.com',
    measurementId: 'G-FSK89HGTQX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnjaxrd_bn6UYg18WnEFBZDv94dlXmmNM',
    appId: '1:911814964024:android:4c05bc25cd7c4ca32a47cd',
    messagingSenderId: '911814964024',
    projectId: 'synergiaprestamostoti',
    storageBucket: 'synergiaprestamostoti.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6NvoYyPGwGnLYG-ZSbsfLzQmRO8EBVCI',
    appId: '1:911814964024:ios:fc6841802253db202a47cd',
    messagingSenderId: '911814964024',
    projectId: 'synergiaprestamostoti',
    storageBucket: 'synergiaprestamostoti.appspot.com',
    iosBundleId: 'com.example.purbeasysman1',
  );
}
