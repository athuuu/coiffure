import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/data/rdv_pages.dart';
import 'package:coiffeur/pages/authentification/inscriptioncoiffeuse.dart';
import 'package:coiffeur/pages/user_profile/coiffeuse_page_v2.dart';
import 'package:coiffeur/prestations/prest.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class DrawerLayoutCoiffeur extends StatefulWidget {
  const DrawerLayoutCoiffeur({Key? key}) : super(key: key);

  @override
  State<DrawerLayoutCoiffeur> createState() => _DrawerLayoutCoiffeurState();
}

class _DrawerLayoutCoiffeurState extends State<DrawerLayoutCoiffeur> {
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
                const SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/visage.jpeg'),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Column(
                        children: const [
                          Text('Sophia Medah'),
                          Text('membre depuis le 18/03/2022',
                              style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_calendar_outlined)),
                  ],
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
                            builder: (context) => const CoiffeusePageV2()));
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
                      Icons.verified_user,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                const InscriptionCoiffeuse()));
                      },
                      child: const Text('Inscription',
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
                      Icons.verified_user,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Prestation()));
                      },
                      child: const Text('Prestations',
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
                      Icons.handyman_outlined,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Image.asset('assets/logocoiffeur.png',
                                      width: 80, height: 80),
                                  content: SizedBox(
                                    height: 85,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('pages non développer',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: firstweight)),
                                        Text(
                                            'les pages seront fait prochainement'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                secondarycolor),
                                      ),
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Ok, J\'ai compris',
                                          style:
                                              TextStyle(color: primarycolor)),
                                    ),
                                  ],
                                ));
                      },
                      child: const Text('Reglages',
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
                      Icons.receipt_long_outlined,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Factures',
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
                                builder: (context) => const RdvPage()));
                      },
                      child: const Text('Telechargement',
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
                      Icons.settings,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Image.asset('assets/logocoiffeur.png',
                                      width: 80, height: 80),
                                  content: SizedBox(
                                    height: 85,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Pages non développer',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: firstweight)),
                                        Text(
                                            'les pages seront fait prochainement'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                secondarycolor),
                                      ),
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Ok, J\'ai compris',
                                          style:
                                              TextStyle(color: primarycolor)),
                                    ),
                                  ],
                                ));
                      },
                      child: const Text('Paramètres',
                          style: TextStyle(
                            fontSize: firstsize,
                            color: secondarycolor,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 120),
                Row(
                  children: [
                    const Icon(
                      Icons.power_settings_new_outlined,
                      size: 40,
                      color: secondarycolor,
                    ),
                    TextButton(
                      onPressed: () {},
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