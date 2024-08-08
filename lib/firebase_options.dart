import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAu1qYKEP8Ed8C_deBr5KNQa1EIRrk7Ap4',
    appId: '1:675018185376:web:83e91d8241031fd26c87c5',
    messagingSenderId: '675018185376',
    projectId: 'fir-flutter-codelabs-9b876',
    authDomain: 'fir-flutter-codelabs-9b876.firebaseapp.com',
    storageBucket: 'fir-flutter-codelabs-9b876.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUdEdsRO9l5CThOUaWvfj_bV-bOThN1ow',
    appId: '1:675018185376:android:e0d73eb694a5eb8f6c87c5',
    messagingSenderId: '675018185376',
    projectId: 'fir-flutter-codelabs-9b876',
    storageBucket: 'fir-flutter-codelabs-9b876.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJ2jeR67gMuYEiKpLaLDg6rLsF4NoVZd8',
    appId: '1:675018185376:ios:575f03c96bf328a26c87c5',
    messagingSenderId: '675018185376',
    projectId: 'fir-flutter-codelabs-9b876',
    storageBucket: 'fir-flutter-codelabs-9b876.appspot.com',
    iosBundleId: 'com.example.gtkFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJ2jeR67gMuYEiKpLaLDg6rLsF4NoVZd8',
    appId: '1:675018185376:ios:575f03c96bf328a26c87c5',
    messagingSenderId: '675018185376',
    projectId: 'fir-flutter-codelabs-9b876',
    storageBucket: 'fir-flutter-codelabs-9b876.appspot.com',
    iosBundleId: 'com.example.gtkFlutter',
  );

}