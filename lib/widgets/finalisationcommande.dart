import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/main.dart';
import 'package:coiffeur/pages/boutique.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class FinalisationCommande extends StatefulWidget {
  const FinalisationCommande({Key? key}) : super(key: key);

  @override
  State<FinalisationCommande> createState() => _FinalisationCommandeState();
}

class _FinalisationCommandeState extends State<FinalisationCommande> {
  final CollectionReference _alertes =
      FirebaseFirestore.instance.collection('alertes');
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 30),
      Container(
        margin: const EdgeInsets.only(right: 130),
        height: 40,
        width: 140,
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(secondarycolor)),
          child: Row(children: const [
            Icon(Icons.add_circle_outline_outlined,
                size: 30, color: primarycolor),
            Text('Boutique',
                style: TextStyle(
                  color: primarycolor,
                  fontSize: 20,
                  fontWeight: firstweight,
                )),
          ]),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Boutique()));
          },
        ),
      ),
      const SizedBox(height: 40),
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
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: secondarycolor,
              border: Border.all(color: secondarycolor),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
                child: Text('1', style: TextStyle(color: primarycolor))),
          ),
          const SizedBox(
            child: Text('-------'),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: secondarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text('2', style: TextStyle(color: primarycolor)),
              )),
          const SizedBox(
            child: Text('-------'),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: secondarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                  child: Text('3', style: TextStyle(color: primarycolor)))),
          const SizedBox(
            child: Text('-------'),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: secondarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                  child: Text('4', style: TextStyle(color: primarycolor)))),
          const SizedBox(
            child: Text('-------'),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: primarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                  child: Text('5', style: TextStyle(color: secondarycolor)))),
        ],
      ),
      const SizedBox(
        height: 40,
      ),
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
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final documentSnapshot = streamSnapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
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
      const SizedBox(height: 10),
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
                  fontSize: 20, color: primarycolor, fontWeight: firstweight)),
        ]),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: Image.asset('assets/logocoiffeur.png',
                            width: 80, height: 80),
                        content: SizedBox(
                          height: 85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('félicitations',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: firstweight)),
                              Text('Page Paiement'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 30),
                            child: SizedBox(
                              width: 130,
                              height: 30,
                              child: TextButton(
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          secondarycolor),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const MyApp())));
                                },
                                child: const Text('Merci',
                                    style: TextStyle(color: primarycolor)),
                              ),
                            ),
                          ),
                        ],
                      ));
            },
            child: const Text('Valider'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(secondarycolor),
            ),
          ),
        ]),
      )
    ]);
  }
}
