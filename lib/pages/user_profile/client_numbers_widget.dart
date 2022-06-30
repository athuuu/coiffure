import 'package:cloud_firestore/cloud_firestore.dart';
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
        stream: _compteclient.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (!streamSnapshot.hasData || streamSnapshot.data == null) {
            return const Text('');
          }
          return SizedBox(
            height: 400,
            width: 300,
            child: ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (content, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Column(
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
                                "prenom",
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
                  );
                }),
          );
        });
  }
}
