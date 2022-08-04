import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/data/rdv_pagescoiffeuses.dart';

import 'package:coiffeur/pages/authentification/connexion.dart';
import 'package:coiffeur/pages/authentification/inscriptioncoiffeuse.dart';

import 'package:coiffeur/pages/user_profile/client_profil.dart';

import 'package:coiffeur/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerLayoutClient extends StatefulWidget {
  const DrawerLayoutClient({Key? key}) : super(key: key);

  @override
  State<DrawerLayoutClient> createState() => _DrawerLayoutClientState();
}

class _DrawerLayoutClientState extends State<DrawerLayoutClient> {
  final databaseReference = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: databaseReference.collection('client').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: ListView(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 54,
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                    splashRadius: 20,
                  ),
                ),
                const SizedBox(height: 100),
                Row(
                  children: [
                    const Icon(
                      Icons.verified_user,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const ClientPageV2()));
                      },
                      child: const Text('Profil',
                          style: TextStyle(
                            fontSize: firstsize,
                            color: secondarycolor,
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.file_download,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RdvPageCoiffeuses()));
                      },
                      child: const Text('Vos Rdv',
                          style: TextStyle(
                            fontSize: firstsize,
                            color: secondarycolor,
                          )),
                    )
                  ],
                ),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.settings,
                //       size: 40,
                //       color: secondarycolor,
                //     ),
                //     TextButton(
                //       onPressed: () {
                //         showDialog<String>(
                //             context: context,
                //             builder: (BuildContext context) => AlertDialog(
                //                   title: Image.asset('assets/logocoiffeur.png',
                //                       width: 80, height: 80),
                //                   content: SizedBox(
                //                     height: 85,
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: const [
                //                         Text('Pages non développer',
                //                             style: TextStyle(
                //                                 fontSize: 20,
                //                                 fontWeight: firstweight)),
                //                         Text(
                //                             'les pages seront fait prochainement'),
                //                       ],
                //                     ),
                //                   ),
                //                   actions: <Widget>[
                //                     TextButton(
                //                       style: ButtonStyle(
                //                         shape: MaterialStateProperty.all<
                //                             OutlinedBorder>(
                //                           RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(20),
                //                           ),
                //                         ),
                //                         backgroundColor:
                //                             MaterialStateProperty.all<Color>(
                //                                 secondarycolor),
                //                       ),
                //                       onPressed: () =>
                //                           Navigator.pop(context, 'Cancel'),
                //                       child: const Text('Ok, J\'ai compris',
                //                           style:
                //                               TextStyle(color: primarycolor)),
                //                     ),
                //                   ],
                //                 ));
                //       },
                //       child: const Text('Paramètres',
                //           style: TextStyle(
                //             fontSize: firstsize,
                //             color: secondarycolor,
                //           )),
                //     ),
                //   ],
                // ),
                Row(children: [
                  const Icon(
                    Icons.new_label,
                    size: 40,
                    color: secondarycolor,
                  ),
                  TextButton(
                      child: const Text('devenir coiffeur',
                          style: TextStyle(
                              color: secondarycolor, fontSize: firstsize)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const InscriptionCoiffeuse()),
                        );
                      })
                ]),
                const SizedBox(height: 80),
                Row(
                  children: [
                    const Icon(
                      Icons.power_settings_new_outlined,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Connexion()));
                      },
                      child: const Text('deconnexion',
                          style: TextStyle(
                            fontSize: firstsize,
                            color: secondarycolor,
                          )),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
