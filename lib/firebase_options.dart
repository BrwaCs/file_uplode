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
    apiKey: 'AIzaSyD1DAGiK5n9b5zxjgPvDS6Xjj8_XRrc-hs',
    appId: '1:36644345672:web:e74394803a26f55720857d',
    messagingSenderId: '36644345672',
    projectId: 'week9-18792',
    authDomain: 'week9-18792.firebaseapp.com',
    storageBucket: 'week9-18792.appspot.com',
    measurementId: 'G-GT4X4TDETC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXIiFNGNJ4NLAvc4smRNkDPGSuO8YNSMU',
    appId: '1:36644345672:android:525fc580b36ed94820857d',
    messagingSenderId: '36644345672',
    projectId: 'week9-18792',
    storageBucket: 'week9-18792.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB25yqj-ED1hKJaBDaVSSNPDEABpphxmDo',
    appId: '1:36644345672:ios:b9e01c4a7431dc0620857d',
    messagingSenderId: '36644345672',
    projectId: 'week9-18792',
    storageBucket: 'week9-18792.appspot.com',
    iosClientId: '36644345672-gkd3dplp2cre1breekheghuafaajieci.apps.googleusercontent.com',
    iosBundleId: 'com.example.fileUplode',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB25yqj-ED1hKJaBDaVSSNPDEABpphxmDo',
    appId: '1:36644345672:ios:b9e01c4a7431dc0620857d',
    messagingSenderId: '36644345672',
    projectId: 'week9-18792',
    storageBucket: 'week9-18792.appspot.com',
    iosClientId: '36644345672-gkd3dplp2cre1breekheghuafaajieci.apps.googleusercontent.com',
    iosBundleId: 'com.example.fileUplode',
  );
}
