import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/core/errors/auth_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dart:developer';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;

  Stream<User?> authStateChanges() {
    return auth.authStateChanges();
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      if (googleAuth.idToken == null) {
        throw Exception('Google authentication failed');
      }

      final userCredential = await auth.signInWithCredential(credential);
      log('Firebase authentication successful: ${userCredential.user}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log('Firebase auth exception: ${e.code}');
      throw FirebaseAuthFailure.fromCode(e.code);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw const GoogleSignInCancelled();
      }

      log('Google sign-in exception: ${e.code}');
      throw GoogleSignInFailure.fromCode(e.code.name);
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Firebase authentication successful: ${userCredential.user}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log('Firebase auth exception: ${e.code}');
      throw FirebaseAuthFailure.fromCode(e.code);
    } catch (e) {
      log('Firebase auth error: $e');
      throw AuthException(e.toString());
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Firebase registration successful: ${userCredential.user}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log('Firebase registration exception: ${e.code}');
      throw FirebaseAuthFailure.fromCode(e.code);
    } catch (e) {
      log('Firebase registration error: $e');
      throw AuthException(e.toString());
    }
  }

  Future<bool> validateSavedSession() async {
    final user = currentUser;

    if (user == null) {
      return false;
    }

    try {
      await user.reload();
      return auth.currentUser != null;
    } on FirebaseAuthException catch (e) {
      log('Session validation exception: ${e.code}');

      if (e.code == 'user-not-found' || e.code == 'user-disabled') {
        await auth.signOut();
      }
      return false;
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      if (currentUser != null) {
        await auth.signOut();
      }
    } catch (e) {
      throw AuthException(e.toString());
    }
  }
}
