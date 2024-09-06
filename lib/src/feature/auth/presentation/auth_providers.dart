import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, AuthProvider, PhoneAuthProvider, GoogleAuthProvider, AppleAuthProvider, FacebookAuthProvider, GithubAuthProvider, YahooAuthProvider;

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
import 'package:gtk_flutter/src/constants/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
List<AuthProvider<AuthListener, AuthCredential>> authProviders(AuthProvidersRef ref) {
  return [
    // corrigir as informações do link aqui
    EmailLinkAuthProvider(
      actionCodeSettings: ActionCodeSettings(
        url: 'https://<your-project-id>.page.link',
        handleCodeInApp: true,
        androidMinimumVersion: '1',
        androidPackageName: 'io.flutter.plugins.firebase_ui.firebase_ui_example',
        iOSBundleId: 'io.flutter.plugins.flutterfireui.flutterfireUIExample',
      ),
    ),
    EmailAuthProvider(),
    PhoneAuthProvider(),
    GoogleProvider(clientId: GOOGLE_CLIENT_ID),
    FacebookProvider(clientId: FACEBOOK_CLIENT_ID),
    AppleProvider(),
    // GithubAuthProvider(),
    // YahooAuthProvider(),
  ];
}
