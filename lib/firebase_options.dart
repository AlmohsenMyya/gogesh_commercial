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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyTX1fN4dkY0XXiXMSIZ0lTl4n-N64W5k',
    appId: '1:1093195633733:android:008ce245c926623c2aff2c',
    messagingSenderId: '1093195633733',
    projectId: 'gogesh-seller',
    storageBucket: 'gogesh-seller.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCy9vHydayOyhKvJtWfWnEkgnz3JVrvY7A',
    appId: '1:1093195633733:ios:73cf2c2d6f1809c12aff2c',
    messagingSenderId: '1093195633733',
    projectId: 'gogesh-seller',
    storageBucket: 'gogesh-seller.appspot.com',
    androidClientId: '1093195633733-b2ssjnvvqdc16mu5h56un5rj3ge7kgj0.apps.googleusercontent.com',
    iosClientId: '1093195633733-cb8tplmr45mqjevtllrkdbjc07rh2qtn.apps.googleusercontent.com',
    iosBundleId: 'com.gogesh.seller',
  );
}
