import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:frontend/core/errors/auth_exception.dart';
import 'package:frontend/services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService authService = AuthService();

  bool isLoading = false;
  bool isCheckingSession = true;
  String? errorMessage;
  StreamSubscription<User?>? authStateListener;

  AuthController() {
    listenToAuthStateChanges();
    validateSavedSession();
  }

  User? get currentUser => authService.currentUser;

  void listenToAuthStateChanges() {
    authStateListener = authService.authStateChanges().listen(
      (user) {
        notifyListeners();
      },
      onError: (error) {
        log('Firebase auth-state listener error: $error');
      },
    );
  }

  Future<void> validateSavedSession() async {
    try {
      await authService.validateSavedSession();
    } catch (error, stackTrace) {
      log('Saved-session validation error: $error', name: 'AuthController', error: error, stackTrace: stackTrace, level: 1000);
    } finally {
      isCheckingSession = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userCredential = await authService.signInWithGoogle();

      if (userCredential.user == null) {
        errorMessage = 'Google sign-in was not completed. Please try again.';
      }
    } on GoogleSignInCancelled {
      // User cancelled, no error to show.
    } on GoogleSignInFailure catch (e) {
      errorMessage = e.message;
    } on AuthException catch (e) {
      errorMessage = e.message;
    } catch (error, stackTrace) {
      log('Google sign-in error: $error', name: 'AuthController', error: error, stackTrace: stackTrace, level: 1000);
      errorMessage = 'Google sign-in failed. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userCredential = await authService.signInWithEmailAndPassword(
        email,
        password,
      );
      if (userCredential.user == null) {
        errorMessage =
            'Email and password sign-in was not completed. Please try again.';
      }
    } on FirebaseAuthFailure catch (e) {
      errorMessage = e.message;
    } on AuthException catch (e) {
      errorMessage = e.message;
    } catch (error, stackTrace) {
      log('Email and password sign-in error: $error', name: 'AuthController', error: error, stackTrace: stackTrace, level: 1000);
      errorMessage = 'Email and password sign-in failed. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userCredential = await authService.registerWithEmailAndPassword(
        email,
        password,
      );

      if (userCredential.user == null) {
        errorMessage = 'Registration was not completed. Please try again.';
        return false;
      }

      await authService.signOut();
      return true;
    } on FirebaseAuthFailure catch (e) {
      errorMessage = e.message;
      return false;
    } on AuthException catch (e) {
      errorMessage = e.message;
      return false;
    } catch (error, stackTrace) {
      log('Email registration error: $error', name: 'AuthController', error: error, stackTrace: stackTrace, level: 1000);
      errorMessage = 'Registration failed. Please try again.';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await authService.signOut();
    } catch (error, stackTrace) {
      log('Sign-out error: $error', name: 'AuthController', error: error, stackTrace: stackTrace, level: 1000);
      errorMessage = 'Unable to sign out. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    authStateListener?.cancel();
    super.dispose();
  }
}
