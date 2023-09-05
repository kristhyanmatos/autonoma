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
    apiKey: 'AIzaSyBW5Eytvcpkcf50n7mk1M4Dt7F6gXdge-M',
    appId: '1:103784877506:web:e0faf0829c26c8d978da5b',
    messagingSenderId: '103784877506',
    projectId: 'autonoma-29e17',
    authDomain: 'autonoma-29e17.firebaseapp.com',
    storageBucket: 'autonoma-29e17.appspot.com',
    measurementId: 'G-J60XN2QVL3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBc8S67TRjaEwnfJOnyhqDHX6Rv3vjYf8E',
    appId: '1:103784877506:android:56d5d095380746b878da5b',
    messagingSenderId: '103784877506',
    projectId: 'autonoma-29e17',
    storageBucket: 'autonoma-29e17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlEw6Jqt6vFSU9DsdZ4ZWsaNxGasjibuE',
    appId: '1:103784877506:ios:7be756610a2d05f478da5b',
    messagingSenderId: '103784877506',
    projectId: 'autonoma-29e17',
    storageBucket: 'autonoma-29e17.appspot.com',
    androidClientId: '103784877506-ip24nelmdfb2d9imtg2knaotqj3714ld.apps.googleusercontent.com',
    iosClientId: '103784877506-1g9uvk5kr0tunjlkdvt3skinvguh2hou.apps.googleusercontent.com',
    iosBundleId: 'com.kris.autonoma',
  );
}