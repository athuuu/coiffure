import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class FinalisationCommande extends StatefulWidget {
  const FinalisationCommande({Key? key}) : super(key: key);

  @override
  State<FinalisationCommande> createState() => _FinalisationCommandeState();
}

class _FinalisationCommandeState extends State<FinalisationCommande> {
  final databaseReference = FirebaseFirestore.instance;
  final CollectionReference _alertes =
      FirebaseFirestore.instance.collection('alertes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 37),
        child: Column(children: [
          const SizedBox(height: 60),
          const SizedBox(
            width: 300,
            child: Text('Prendre un rendez-vous: ',
                style: TextStyle(fontSize: 23, fontWeight: firstweight)),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 115.0),
            child: Text('en quelques clics seulement',
                style: TextStyle(fontSize: 13, fontWeight: firstweight)),
          ),
          const SizedBox(height: 20),
          Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: secondarycolor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text('Récapitulatif',
                  style: TextStyle(color: primarycolor, fontSize: firstsize)),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            width: 300,
            child: StreamBuilder(
                stream: _alertes.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final documentSnapshot =
                              streamSnapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                          return Column(
                            children: [
                              const Text('Nombre de Clients',
                                  style: TextStyle(
                                    fontWeight: firstweight,
                                    fontSize: firstsize,
                                  )),
                              const Text('1 personne'),
                              const Text('Type de prestation',
                                  style: TextStyle(
                                    fontWeight: firstweight,
                                    fontSize: firstsize,
                                  )),
                              Text(documentSnapshot["prestation"]),
                              const Text('Dates et heures',
                                  style: TextStyle(
                                    fontWeight: firstweight,
                                    fontSize: firstsize,
                                  )),
                              Text(
                                  "${(documentSnapshot["date"] as Timestamp).toDate()}"),
                              const Text('nom et prenom',
                                  style: TextStyle(
                                    fontWeight: firstweight,
                                    fontSize: firstsize,
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(documentSnapshot["nom"]),
                                  const SizedBox(width: 5),
                                  Text(documentSnapshot["prenom"]),
                                ],
                              ),
                              const Text('adresse',
                                  style: TextStyle(
                                    fontWeight: firstweight,
                                    fontSize: firstsize,
                                  )),
                              Text(documentSnapshot["adresse"]),
                              const Text('complement d\'adresse',
                                  style: TextStyle(
                                    fontWeight: firstweight,
                                    fontSize: firstsize,
                                  )),
                              Text(documentSnapshot["complement"])
                            ],
                          );
                        });
                  }
                  return const Text("hello");
                }),
          ),
          const SizedBox(height: 10),
          const Text('100€',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100)),
          const Text('A domicile',
              style: TextStyle(fontSize: 20, fontWeight: firstweight)),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondarycolor,
            ),
            child: Column(children: const [
              Text('Accompte sur reservation',
                  style: TextStyle(fontSize: 16, color: primarycolor)),
              Text('10€',
                  style: TextStyle(
                      fontSize: 20,
                      color: primarycolor,
                      fontWeight: firstweight)),
            ]),
          ),
          const SizedBox(height: 15),
        ]),
      ),
    );
  }
}
