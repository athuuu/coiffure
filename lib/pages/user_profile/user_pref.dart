import 'package:firebase_auth/firebase_auth.dart';

class UserPreferences {
  User? get user => FirebaseAuth.instance.currentUser;
}
