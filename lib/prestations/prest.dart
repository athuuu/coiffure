import 'package:coiffeur/list/list.dart';
import 'package:coiffeur/main.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coiffeur/pages/user_profile/appbar_widget.dart';
import 'package:coiffeur/pages/user_profile/user_pref.dart';

class Prestation extends StatefulWidget {
  const Prestation({Key? key}) : super(key: key);

  @override
  State<Prestation> createState() => _PrestationState();
}

class _PrestationState extends State<Prestation> {
  get user => FirebaseAuth.instance.currentUser;
  final usered = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text("une erreur s'est produite"));
              } else if (snapshot.hasData) {
                return Scaffold(
                  appBar: buildAppBar(context),
                  backgroundColor: Colors.white,
                  body: const ListPresta(),
                );
              } else {
                return Scaffold(
                  appBar: AppBar(
                      backgroundColor: primarycolor,
                      elevation: 0.0,
                      leading: IconButton(
                          color: secondarycolor,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyApp()));
                          })),
                  body: const ListPresta(),
                );
              }
            }),
      );
}
