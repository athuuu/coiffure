import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/commande/utilisateur/person.dart';

class UserFirebase {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static UserFirebase? _instance;

  static late final CollectionReference<Person> _userRef;

  UserFirebase._();

  UserFirebase getInstance() {
    if (_instance == null) {
      _userRef = _firebaseFirestore.collection('compteclient').withConverter(
          fromFirestore: (snapshot, _) => Person.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson());
      _instance = UserFirebase._();
    }
    return _instance!;
  }

  Future<void> insertUser(Person user) async {
    await _userRef.add(user);
    return;
  }

  Future<void> insertUserWithId(Person user, String id) async {
    return _userRef.doc(id).set(user);
  }

  Future<void> updateUserWithId(Person user, String id) async {
    return _userRef.doc(id).set(user);
  }

  Future<QuerySnapshot<Person>> getAll() async {
    QuerySnapshot<Person> person = await _userRef.get();
    // ignore: avoid_function_literals_in_foreach_calls
    person.docs.forEach((element) {});
    return _userRef.get();
  }

  Future<Person?> getUserById(String id) async {
    // ignore: unused_local_variable
    var document = await _userRef.doc(id).get();
    return null;
  }

  Future<QuerySnapshot<Person>> searchUsers(String name) async {
    return _userRef.where('name', isEqualTo: name).get();
  }

  Future<void> deleteUser(String id) async {
    return _userRef.doc(id).delete();
  }
}
