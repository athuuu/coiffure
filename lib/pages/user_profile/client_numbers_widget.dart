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
          return SizedBox(
            height: 500,
            width: 300,
            child: ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (content, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Anniversaire",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(documentSnapshot['naissance'].toString())
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              const Text(
                                "mail",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(documentSnapshot['mail'])
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
          );
        });
  }
}
