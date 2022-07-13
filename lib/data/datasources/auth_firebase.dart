import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  static AuthFirebase? _instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static getInstance() {
    _instance ??= AuthFirebase._();
    return _instance!;
  }

  AuthFirebase._();

  Future<UserCredential> signInWithCredentials(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  String? getUser() {
    return (_firebaseAuth.currentUser)?.email;
  }
}
