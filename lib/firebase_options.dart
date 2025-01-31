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
        return macos;
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
    apiKey: 'AIzaSyD54nINJh5w0zxtg2XJau3iO1r48HwsUeE',
    appId: '1:6162690231:web:faf5937aa8bfea7ff4dd32',
    messagingSenderId: '6162690231',
    projectId: 'ask-classes-cd953',
    authDomain: 'ask-classes-cd953.firebaseapp.com',
    storageBucket: 'ask-classes-cd953.firebasestorage.app',
    measurementId: 'G-4YFFG8CKK8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGKCBX_dlD676Pl4pU2XoK5ZkhZMpclPg',
    appId: '1:6162690231:android:1099dbd69fa6660ff4dd32',
    messagingSenderId: '6162690231',
    projectId: 'ask-classes-cd953',
    storageBucket: 'ask-classes-cd953.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvU65FAz4DooX0sRQdYpy-H_lhnR1DwLA',
    appId: '1:6162690231:ios:dbca13d52e602a15f4dd32',
    messagingSenderId: '6162690231',
    projectId: 'ask-classes-cd953',
    storageBucket: 'ask-classes-cd953.firebasestorage.app',
    iosBundleId: 'com.example.askClasses',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvU65FAz4DooX0sRQdYpy-H_lhnR1DwLA',
    appId: '1:6162690231:ios:dbca13d52e602a15f4dd32',
    messagingSenderId: '6162690231',
    projectId: 'ask-classes-cd953',
    storageBucket: 'ask-classes-cd953.firebasestorage.app',
    iosBundleId: 'com.example.askClasses',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD54nINJh5w0zxtg2XJau3iO1r48HwsUeE',
    appId: '1:6162690231:web:f51404d0133c2988f4dd32',
    messagingSenderId: '6162690231',
    projectId: 'ask-classes-cd953',
    authDomain: 'ask-classes-cd953.firebaseapp.com',
    storageBucket: 'ask-classes-cd953.firebasestorage.app',
    measurementId: 'G-8279KVE32W',
  );
}
