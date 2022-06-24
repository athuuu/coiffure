import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/pages/accueil_client.dart';
import 'package:coiffeur/pages/authentification/connexion.dart';
import 'package:coiffeur/pages/user_profile/client_numbers_widget.dart';
import 'package:coiffeur/pages/user_profile/client_numbers_widget2.dart';

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
  get user => FirebaseAuth.instance.currentUser;
  final usered = UserPreferences.myUser;
  final CollectionReference _compteclient =
      FirebaseFirestore.instance.collection('compteclient');

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
                  backgroundColor: Colors.white,
                  body: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
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
                          Text(
                            user.name,
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
                            onPressed: () => FirebaseAuth.instance
                                .signOut(), //la fonction signOut
                            style: ElevatedButton.styleFrom(
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
                        const ClientNumbersWidget2(),
                        const SizedBox(
                          height: 48,
                        ),
                        buildAbout(),
                      ],
                    ),
                  ),
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
                                    builder: (context) => const MyAppClient()));
                          })),
                  body: Container(
                    color: primarycolor,
                    child: StreamBuilder(
                        stream: _compteclient.snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 14),
                            child: ListView.builder(
                                itemCount: streamSnapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  final DocumentSnapshot documentSnapshot =
                                      streamSnapshot.data!.docs[index];
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
                                        children: [
                                          Text(
                                            documentSnapshot['nom'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            documentSnapshot['prenom'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
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
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Connexion()));
                                        },
                                        style: ElevatedButton.styleFrom(
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
                                    const ClientNumbersWidget(),
                                    const ClientNumbersWidget2(),
                                    const SizedBox(
                                      height: 48,
                                    ),
                                    buildAbout(),
                                  ]);
                                }),
                          );
                        }),
                  ),
                );
              }
            }),
      );

  Widget buildAbout() => StreamBuilder(
      stream: _compteclient.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        return Container(
          height: 250,
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Column(children: [
                  const Text(
                    "Descriptions",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "Changez de description lorsque vous vous connecter a votre profil !",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    documentSnapshot['description'],
                    style: const TextStyle(fontSize: 16, height: 1.4),
                  ),
                ]);
              }),
        );
      });
}
