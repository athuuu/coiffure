import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NumbersWidget2 extends StatefulWidget {
  const NumbersWidget2({Key? key}) : super(key: key);

  @override
  State<NumbersWidget2> createState() => _NumbersWidget2State();
}

class _NumbersWidget2State extends State<NumbersWidget2> {
  final CollectionReference _compte = FirebaseFirestore.instance.collection('compte');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _compte.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('prestation',
            style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24),
            ),
          Text( "Lissage"),
        ],
      );
      }
    );
  }
}
