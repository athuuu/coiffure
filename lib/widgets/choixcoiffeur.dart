import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/widgets/finalisationcommande.dart';

import 'package:flutter/material.dart';

class ChoixCoiffeur extends StatefulWidget {
  const ChoixCoiffeur({Key? key}) : super(key: key);

  @override
  State<ChoixCoiffeur> createState() => _ChoixCoiffeurState();
}

class _ChoixCoiffeurState extends State<ChoixCoiffeur> {
  final CollectionReference _coiffeuses =
      FirebaseFirestore.instance.collection('coiffeuses');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 260,
      child: StreamBuilder(
          stream: _coiffeuses.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final documentSnapshot = streamSnapshot.data!.docs[index]
                        .data() as Map<String, dynamic>;
                    return Column(children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: InkWell(
                          child: ListTile(
                            leading: Image.asset('assets/visage.jpeg'),
                            subtitle: Text(documentSnapshot["prenom"]),
                            title: Text(documentSnapshot["annee"].toString()),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Text(documentSnapshot["nom"]),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FinalisationCommande()));
                          },
                        ),
                      ),
                    ]);
                  });
            }
            return const Text('donnée des coiffeuses');
          }),
    );
  }
}
