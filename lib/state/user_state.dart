import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/model/commande/utilisateur/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateProvider = ChangeNotifierProvider<UserState>((ref) {
  return UserState();
});

class UserState with ChangeNotifier {
  Person? user;

  getUser() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('compteclient')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (userDoc.data() != null) {
      Person user = Person.fromJson(userDoc.data()!);
      this.user = user;
    }
  }
}
