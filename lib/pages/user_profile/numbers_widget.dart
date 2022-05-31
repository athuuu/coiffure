import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NumbersWidget extends StatefulWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  State<NumbersWidget> createState() => _NumbersWidgetState();
}

class _NumbersWidgetState extends State<NumbersWidget> {
  final CollectionReference _compte = FirebaseFirestore.instance.collection('compte');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _compte.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        
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
                    const Text( "Expérience",
                    style:
                      TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                ),
                    Text(documentSnapshot['experience'].toString())
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    const Text( "Diplôme",
                    style:
                      TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                ),
                    Text(documentSnapshot['diplome'])
                  ],
                ),
              ],
            );
            }
          ),
        );
      }
    );
  }

 
}
