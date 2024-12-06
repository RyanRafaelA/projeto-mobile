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
    apiKey: 'AIzaSyD9eh-yW8krRKnm143yfT4LKYwZ0xtERZc',
    appId: '1:283292125367:web:ca21f000bff02fc90de532',
    messagingSenderId: '283292125367',
    projectId: 'sistema-login-cadastro-1c19c',
    authDomain: 'sistema-login-cadastro-1c19c.firebaseapp.com',
    storageBucket: 'sistema-login-cadastro-1c19c.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGVQwPSAr2IzP-NE5dFzcboMJ8RRLzmPQ',
    appId: '1:283292125367:android:1bd1f976199176380de532',
    messagingSenderId: '283292125367',
    projectId: 'sistema-login-cadastro-1c19c',
    storageBucket: 'sistema-login-cadastro-1c19c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAktnqf5R_kaf2nj7t78D6BjVh_xhSjenI',
    appId: '1:283292125367:ios:e8733403f05cdd5c0de532',
    messagingSenderId: '283292125367',
    projectId: 'sistema-login-cadastro-1c19c',
    storageBucket: 'sistema-login-cadastro-1c19c.firebasestorage.app',
    iosBundleId: 'com.example.sistemaLoginCadastro',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAktnqf5R_kaf2nj7t78D6BjVh_xhSjenI',
    appId: '1:283292125367:ios:e8733403f05cdd5c0de532',
    messagingSenderId: '283292125367',
    projectId: 'sistema-login-cadastro-1c19c',
    storageBucket: 'sistema-login-cadastro-1c19c.firebasestorage.app',
    iosBundleId: 'com.example.sistemaLoginCadastro',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9eh-yW8krRKnm143yfT4LKYwZ0xtERZc',
    appId: '1:283292125367:web:0b7daf2150efa3b00de532',
    messagingSenderId: '283292125367',
    projectId: 'sistema-login-cadastro-1c19c',
    authDomain: 'sistema-login-cadastro-1c19c.firebaseapp.com',
    storageBucket: 'sistema-login-cadastro-1c19c.firebasestorage.app',
  );
}
