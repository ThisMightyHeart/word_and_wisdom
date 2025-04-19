import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

String generateNonce([int length = 32]) {
  final charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

Future<UserCredential> appleSignIn() async {
  if (kIsWeb) {
    final provider = OAuthProvider("apple.com")
      ..addScope('email')
      ..addScope('name');

    return await FirebaseAuth.instance.signInWithPopup(provider);
  }
  final rawNonce = generateNonce();
  final nonce = sha256ofString(rawNonce);

  final appleCredential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: nonce,
  );

  final oauthCredential = OAuthProvider("apple.com").credential(
    idToken: appleCredential.identityToken,
    rawNonce: rawNonce,
    accessToken: appleCredential.authorizationCode,
  );

  final user =
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);

  final displayName = [appleCredential.givenName, appleCredential.familyName]
      .where((name) => name != null)
      .join(' ');

  if (displayName.isNotEmpty) {
    await user.user?.updateDisplayName(displayName);
  }

  return user;
}
