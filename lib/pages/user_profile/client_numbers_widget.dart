import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClientNumbersWidget extends StatefulWidget {
  const ClientNumbersWidget({Key? key}) : super(key: key);

  @override
  State<ClientNumbersWidget> createState() => _ClientNumbersWidgetState();
}

class _ClientNumbersWidgetState extends State<ClientNumbersWidget> {
  final CollectionReference _compteclient =
      FirebaseFirestore.instance.collection('compteclient');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _compteclient
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
          if (streamSnapshot.hasData && streamSnapshot.data != null) {
            final documentSnapshot =
                streamSnapshot.data!.data() as Map<String, dynamic>;
            return SizedBox(
                height: 250,
                width: 340,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Nom",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(documentSnapshot['nom'].toString())
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            const Text(
                              "Prenom",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(documentSnapshot['prenom'])
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        const Text(
                          'date de naissance',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(documentSnapshot['naissance'])
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Column(children: [
                        const Text(
                          'Adresse',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(documentSnapshot['adresse']),
                      ]),
                      Column(children: [
                        const Text(
                          'complement',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(documentSnapshot['cpltadresse'])
                      ]),
                      IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            updateDataAdresse('', '', context);
                          })
                    ]),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            const Text(
                              'description',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(documentSnapshot['description'])
                          ],
                        ),
                        IconButton(
                            icon: const Icon(Icons.settings),
                            onPressed: () {
                              updateDataDescription(context);
                            }),
                      ],
                    )
                  ],
                ));
          }
          if (streamSnapshot.hasError) {
            return const Text('Error');
          }
          return const Text('pas d\'infos');
        });
  }
}

Future<void> updateDataAdresse(
    String adresse, String cpltadresse, BuildContext context) {
  var adressController = TextEditingController(text: adresse);
  var cpltadresseController = TextEditingController(text: cpltadresse);
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Nouvelle Adresse'),
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  TextFormField(
                    controller: adressController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      label: Text("Adresse"),
                    ),
                  ),
                  TextFormField(
                      controller: cpltadresseController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        label: Text("Complément d'adresse"),
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(secondarycolor)),
                    child: const Text('Sauvegarder les données'),
                    onPressed: () {
                      updateInfosUser(adressController, cpltadresseController);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ));
      });
}

Future<void> updateDataDescription(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Nouvelle Description'),
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      label: Text("Votre description"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(secondarycolor)),
                    child: const Text('Sauvegarder les données'),
                    onPressed: () {},
                  )
                ],
              ),
            ));
      });
}

Future<void> updateInfosUser(TextEditingController adressController,
    TextEditingController cpltadresseController) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  return firestore
      .collection('compteclient')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
        'adresse': adressController.text,
        'cpltadresse': cpltadresseController.text,
      })
      // ignore: avoid_print
      .then((value) => print("les changement ont été pris en compte "))
      .catchError(
        // ignore: avoid_print
        (error) => print("Erreur : $error"),
      );
}

Future<void> updateInfosUserDescription(
    TextEditingController descriptionController) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  return firestore
      .collection('compteclient')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
        'description': descriptionController.text,
      })
      // ignore: avoid_print
      .then((value) => print("les changement ont été pris en compte "))
      .catchError(
        // ignore: avoid_print
        (error) => print("Erreur : $error"),
      );
}
