import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientNumbersWidget2 extends StatefulWidget {
  const ClientNumbersWidget2({Key? key}) : super(key: key);

  @override
  State<ClientNumbersWidget2> createState() => _ClientNumbersWidget2State();
}

class _ClientNumbersWidget2State extends State<ClientNumbersWidget2> {
  final CollectionReference _compteclient =
      FirebaseFirestore.instance.collection('compteclient');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _compteclient.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (content, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'anniversaire',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(documentSnapshot['anniversaire']),
                  ],
                );
              });
        });
  }
}
