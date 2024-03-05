import 'package:firebase_auth/firebase_auth.dart';
import 'package:sicherr/domain/repositories/auth/auth_repository.dart';

import '../../../core/exceptions/exceptions.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _auth;

  AuthRepositoryImpl({required FirebaseAuth auth}) : _auth = auth;

  @override
  Stream<User?> get authStateChange => _auth.authStateChanges();

  @override
  Future<void> loginWithPhone({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException catch (e) {
      throw BadRequestException(message: e.message!,code: e.code);
    } catch (e) {
      throw BadRequestException(message: e.toString(),code: e.toString());
    }
  }

  @override
  Future<void> verification(
      {required String verificationId, required String code}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);

      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw BadRequestException(message: e.message!,code: e.code);
    } catch (e) {
      throw BadRequestException(message: e.toString(),code: e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
