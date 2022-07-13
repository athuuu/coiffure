import 'package:coiffeur/data/datasources/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static AuthRepository? _instance;
  static final AuthFirebase _userFirestore = AuthFirebase.getInstance();

  static AuthRepository getInstance() {
    _instance ??= AuthRepository._();
    return _instance!;
  }

  AuthRepository._();

  Future<User?> signIn({required email, required password}) async {
    UserCredential userCredential = await _userFirestore.signInWithCredentials(
        email: email, password: password);
    return userCredential.user;
  }

  Future<User?> signUp({required email, required password}) async {
    UserCredential? userCredential = await _userFirestore.signInWithCredentials(
        email: email, password: password);
    return userCredential.user;
  }
}
