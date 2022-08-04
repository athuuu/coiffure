import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:flutter/material.dart';

class ChoixCoiffeuse extends StatefulWidget {
  const ChoixCoiffeuse({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController? pageController;

  @override
  State<ChoixCoiffeuse> createState() => _ChoixCoiffeuseState();
}

class _ChoixCoiffeuseState extends State<ChoixCoiffeuse> {
  final CollectionReference _coiffeuses =
      FirebaseFirestore.instance.collection('compteclient');
  var isClosed = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: StreamBuilder(
      stream: _coiffeuses.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return ListView(children: [
            const Center(
              child: SizedBox(
                  height: 40,
                  child: Text('Choisissez une coiffeuse',
                      style: TextStyle(fontSize: 20, fontWeight: firstweight))),
            ),
            ...streamSnapshot.data!.docs.map((docs) {
              final documentsnapshot = docs.data() as Map<String, dynamic>;
              return CardChoice(
                  title: "${documentsnapshot['prenom']}",
                  subtitle: "${documentsnapshot["nom"]}",
                  onPressed: () async {
                    Navigator.pop(context, documentsnapshot['prenom']);
                  });
            })
          ]);
        }
        return const Text('les infos ne sont pas chargés');
      },
    ));
  }
}
