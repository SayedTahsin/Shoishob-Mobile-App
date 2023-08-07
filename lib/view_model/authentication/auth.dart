import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoishob/utils/utils.dart';

import '../../services/session_manager.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      SessionController().userId = value.user?.uid.toString();
    });
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> forgotPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
  }

  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut().then((value) {
      SessionController().userId = "";
    });
  }
}
