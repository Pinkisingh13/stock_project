class AuthException implements Exception {
  final String message;

  const AuthException(this.message);

  @override
  String toString() => message;
}

class FirebaseAuthFailure extends AuthException {
  const FirebaseAuthFailure(super.message);

  factory FirebaseAuthFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseAuthFailure('Invalid email address.');
      case 'user-not-found':
        return const FirebaseAuthFailure('No user found for this email.');
      case 'wrong-password':
        return const FirebaseAuthFailure('Wrong password.');
      case 'invalid-credential':
        return const FirebaseAuthFailure('Incorrect email or password.');
      case 'email-already-in-use':
        return const FirebaseAuthFailure(
          'An account already exists with this email.',
        );
      case 'weak-password':
        return const FirebaseAuthFailure(
          'Password should contain at least 6 characters.',
        );
      case 'network-request-failed':
        return const FirebaseAuthFailure(
          'Check your internet connection and try again.',
        );
      default:
        return const FirebaseAuthFailure(
          'Authentication failed. Please try again.',
        );
    }
  }
}

class GoogleSignInFailure extends AuthException {
  const GoogleSignInFailure(super.message);

  factory GoogleSignInFailure.fromCode(String code) {
    switch (code) {
      case 'sign-in-canceled':
        return const GoogleSignInFailure('Sign in canceled.');
      case 'sign-in-failed':
        return const GoogleSignInFailure('Sign in failed.');
      default:
        return const GoogleSignInFailure(
          'Google sign-in failed. Please try again.',
        );
    }
  }
}

class GoogleSignInCancelled implements Exception {
  const GoogleSignInCancelled();
}
