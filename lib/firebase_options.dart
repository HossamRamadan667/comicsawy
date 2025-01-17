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
    apiKey: 'AIzaSyDCzzvlw5Bz9Al3dN2xG5e_ZgTac-hAJHo',
    appId: '1:724038228975:web:dcd49e4f3a152a575eb41a',
    messagingSenderId: '724038228975',
    projectId: 'comicsawy-8b155',
    authDomain: 'comicsawy-8b155.firebaseapp.com',
    storageBucket: 'comicsawy-8b155.appspot.com',
    measurementId: 'G-WW0CVWQ53R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiC5ZGPR7nG9UtGbIC-26GMAQGvVQzQJI',
    appId: '1:724038228975:android:bbf8f2731cc68d945eb41a',
    messagingSenderId: '724038228975',
    projectId: 'comicsawy-8b155',
    storageBucket: 'comicsawy-8b155.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQFUSegPugEYjCu_vq6QehF6rUnJMLNig',
    appId: '1:724038228975:ios:fc7d47721aa602e05eb41a',
    messagingSenderId: '724038228975',
    projectId: 'comicsawy-8b155',
    storageBucket: 'comicsawy-8b155.appspot.com',
    iosBundleId: 'com.example.comicsawy',
  );
}
