import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CoiffeuseNumbersWidget2 extends StatefulWidget {
  const CoiffeuseNumbersWidget2({Key? key}) : super(key: key);

  @override
  State<CoiffeuseNumbersWidget2> createState() =>
      _CoiffeuseNumbersWidget2State();
}

class _CoiffeuseNumbersWidget2State extends State<CoiffeuseNumbersWidget2> {
  final CollectionReference _compte =
      FirebaseFirestore.instance.collection('comptecoiffeuse');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _compte.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'prestation',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text("Lissage"),
              SizedBox(height: 10)
            ],
          );
        });
  }
}
