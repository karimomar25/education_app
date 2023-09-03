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
    apiKey: 'AIzaSyA5ac8bx9mNzJKhvxUCCEO4Vcjyue3P-Nw',
    appId: '1:918483692853:web:166e1b49d26cb13a11f07c',
    messagingSenderId: '918483692853',
    projectId: 'education-app-fa446',
    authDomain: 'education-app-fa446.firebaseapp.com',
    storageBucket: 'education-app-fa446.appspot.com',
    measurementId: 'G-0J43KK99ZV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTjPeX2VyOpZ0cLvqzRHxyxpp8OVOtNkE',
    appId: '1:918483692853:android:001e210f14f4047111f07c',
    messagingSenderId: '918483692853',
    projectId: 'education-app-fa446',
    storageBucket: 'education-app-fa446.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4kXuPlUsDYrN5WDcT0Q0pQ0UL8qgQtvY',
    appId: '1:918483692853:ios:ef49d3afcd037a3a11f07c',
    messagingSenderId: '918483692853',
    projectId: 'education-app-fa446',
    storageBucket: 'education-app-fa446.appspot.com',
    iosClientId: '918483692853-1ddejduavbvqa87nlm33ajav75b8dj2a.apps.googleusercontent.com',
    iosBundleId: 'com.education.app.educationApp',
  );
}
