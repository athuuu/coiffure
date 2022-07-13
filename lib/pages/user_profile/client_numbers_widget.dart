import 'package:cloud_firestore/cloud_firestore.dart';
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
                height: 400,
                width: 300,
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
                    const SizedBox(
                      height: 20,
                    ),
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
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(documentSnapshot['adresse']),
                      ]),
                      Column(children: [
                        const Text(
                          'complement',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(documentSnapshot['cpltadresse'])
                      ])
                    ]),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        const Text(
                          'description',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(documentSnapshot['description'])
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
