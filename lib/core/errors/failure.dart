abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}

/* class AuthFailure extends Failure {
  AuthFailure({required super.errorMessage});

  static AuthFailure fromFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return AuthFailure(errorMessage: 'No user found for this email.');
      case 'wrong-password':
        return AuthFailure(errorMessage: 'Invalid password.');
      case 'email-already-in-use':
        return AuthFailure(errorMessage: 'Email is already in use.');
      case 'invalid-email':
        return AuthFailure(errorMessage: 'Invalid email address.');
      case 'weak-password':
        return AuthFailure(errorMessage: 'Password is too weak.');
      default:
        return AuthFailure(errorMessage: 'An unknown error occurred.');
    }
  }
}

class DatabaseFailure extends Failure {
  DatabaseFailure({required super.errorMessage});

  static DatabaseFailure fromFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return DatabaseFailure(
            errorMessage: 'You do not have permission to access this data.');
      case 'unavailable':
        return DatabaseFailure(
            errorMessage:
                'The database is temporarily unavailable. Try again later.');
      case 'network-error':
        return DatabaseFailure(
            errorMessage:
                'Network error. Please check your internet connection.');
      case 'data-stale':
        return DatabaseFailure(
            errorMessage: 'The data is outdated. Please refresh.');
      case 'operation-not-allowed':
        return DatabaseFailure(errorMessage: 'This operation is not allowed.');
      case 'unknown':
      default:
        return DatabaseFailure(
            errorMessage:
                'An unknown error occurred while accessing the database.');
    }
  }
} */
