import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/state/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoiffeuseNumbersWidget extends ConsumerStatefulWidget {
  const CoiffeuseNumbersWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CoiffeuseNumbersWidget> createState() =>
      _CoiffeuseNumbersWidgetState();
}

class _CoiffeuseNumbersWidgetState
    extends ConsumerState<CoiffeuseNumbersWidget> {
  final CollectionReference _compte =
      FirebaseFirestore.instance.collection('comptecoiffeuse');

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider);
    return StreamBuilder(
        stream: _compte.doc(userState.user!.idVendeur).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
          if (streamSnapshot.hasData &&
              streamSnapshot.data != null &&
              streamSnapshot.data!.data() != null) {
            final documentSnapshot =
                streamSnapshot.data?.data() as Map<String, dynamic>;
            return SizedBox(
              height: 95,
              width: 300,
              child: Column(
                children: [
                  const Text(
                    "Année d'Expérience",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(documentSnapshot['experience'].toString()),
                  const SizedBox(width: 10),
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
              ),
            );
          }
          if (streamSnapshot.hasError) {
            return const Text('Error dans le traitement');
          }
          return const Text('yeahhhh');
        });
  }
}
