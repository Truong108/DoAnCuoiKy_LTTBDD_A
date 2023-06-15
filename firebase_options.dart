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
    apiKey: 'AIzaSyDeIBz5x0vLe89YIsXXivtHqKwTgt73RsI',
    appId: '1:1021193820840:web:cc2e8bf84f56eeae10c09d',
    messagingSenderId: '1021193820840',
    projectId: 'ktdkappfood',
    authDomain: 'ktdkappfood.firebaseapp.com',
    storageBucket: 'ktdkappfood.appspot.com',
    measurementId: 'G-6BR4CW85N0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrugEhIDQctY3nRd29JnIDSJ8X7aMrCm0',
    appId: '1:1021193820840:android:f2cb40308b75d95510c09d',
    messagingSenderId: '1021193820840',
    projectId: 'ktdkappfood',
    storageBucket: 'ktdkappfood.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA57oLi552IDM6gOGd-pQB2KUWUPqHPIaE',
    appId: '1:1021193820840:ios:22bf8feb7bf2b3e010c09d',
    messagingSenderId: '1021193820840',
    projectId: 'ktdkappfood',
    storageBucket: 'ktdkappfood.appspot.com',
    iosClientId: '1021193820840-pdkq561lltvpptgprkk15l9np2cpm90j.apps.googleusercontent.com',
    iosBundleId: 'com.example.demoDoanFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA57oLi552IDM6gOGd-pQB2KUWUPqHPIaE',
    appId: '1:1021193820840:ios:22bf8feb7bf2b3e010c09d',
    messagingSenderId: '1021193820840',
    projectId: 'ktdkappfood',
    storageBucket: 'ktdkappfood.appspot.com',
    iosClientId: '1021193820840-pdkq561lltvpptgprkk15l9np2cpm90j.apps.googleusercontent.com',
    iosBundleId: 'com.example.demoDoanFlutter',
  );
}
