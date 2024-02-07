import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository({required FirebaseAuth auth}) : _auth = auth;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  User? currentUser() {
    return _auth.currentUser;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
