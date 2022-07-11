import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/pages/accueil_client.dart';
import 'package:coiffeur/pages/authentification/connexion.dart';
import 'package:coiffeur/pages/user_profile/client_numbers_widget.dart';

import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coiffeur/pages/user_profile/user_pref.dart';
import 'profile_widget.dart';

import 'package:google_fonts/google_fonts.dart';

class ClientPageV2 extends StatefulWidget {
  const ClientPageV2({Key? key}) : super(key: key);

  @override
  State<ClientPageV2> createState() => _ClientPageV2State();
}

class _ClientPageV2State extends State<ClientPageV2> {
  FirebaseAuth auth = FirebaseAuth.instance;
  get user => FirebaseAuth.instance.currentUser;
  final usered = UserPreferences.myUser;
  final CollectionReference _compteclient =
      FirebaseFirestore.instance.collection('compteclient');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        elevation: 0,
        leading: IconButton(
          color: secondarycolor,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyAppClient()));
          },
        ),
      ),
      body: StreamBuilder(
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
                backgroundColor: Colors.white,
                body: SizedBox(
                  child: ListView(
                    children: [
                      ProfileWidget(
                        imagePath: usered.imagePath,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(children: [
                        Text(
                          user.email,
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ]),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Connexion()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondarycolor,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.all(14),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                "Se déconnecter",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      const ClientNumbersWidget(),
                      const SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Container(
                  color: primarycolor,
                  child: StreamBuilder(
                      stream: _compteclient.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.data == null) return const Text('');
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                          child: ListView.builder(
                              itemCount: streamSnapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  ProfileWidget(
                                    imagePath: usered.imagePath,
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Column(children: [
                                    Text(
                                      "non connecté",
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                    // Text(
                                    //   "non connecté",
                                    //   style: GoogleFonts.poppins(
                                    //     color: Colors.grey,
                                    //   ),
                                    // ), mettre le display.name
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        auth.signOut();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Connexion()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: secondarycolor,
                                        shape: const StadiumBorder(),
                                        padding: const EdgeInsets.all(14),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 10),
                                          Text(
                                            "Se Connecter",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  const Text('vous n\'êtes pas connecté'),
                                  const SizedBox(
                                    height: 48,
                                  ),
                                ]);
                              }),
                        );
                      }),
                ),
              );
            }
          }),
    );
  }
}
