import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoiffeuseNumbersWidget extends StatefulWidget {
  const CoiffeuseNumbersWidget({Key? key}) : super(key: key);

  @override
  State<CoiffeuseNumbersWidget> createState() => _CoiffeuseNumbersWidgetState();
}

class _CoiffeuseNumbersWidgetState extends State<CoiffeuseNumbersWidget> {
  final CollectionReference _compte =
      FirebaseFirestore.instance.collection('comptecoiffeuse');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _compte.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return SizedBox(
            height: 60,
            width: 300,
            child: ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (content, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Expérience",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text(documentSnapshot['experience'].toString())
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const Text(
                            "Diplôme",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text(documentSnapshot['diplome'])
                        ],
                      ),
                    ],
                  );
                }),
          );
        });
  }
}
