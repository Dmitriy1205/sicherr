import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChange;

  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  });

  Future<void> confirmPhoneSignIn(
      {required String verificationId, required String code});

  Future<void> confirmPhoneChange({required String verificationId, required String code, required String newPhoneNumber});

  Future<void> logout();
}
