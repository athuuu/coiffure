import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class FinalisationCommande extends StatefulWidget {
  const FinalisationCommande({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
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
      appBar: AppBar(
        title: const Text(
          'Recapitulatif ',
          style: TextStyle(color: secondarycolor),
        ),
        backgroundColor: primarycolor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            widget.pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: secondarycolor,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 220,
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
                                const SizedBox(height: 15),
                                const Text('Nombre de Clients',
                                    style: TextStyle(fontWeight: firstweight)),
                                const Text('1 personne'),
                                const Text('Type de prestation',
                                    style: TextStyle(fontWeight: firstweight)),
                                Text(documentSnapshot["prestation"]),
                                const Text('Dates et heures',
                                    style: TextStyle(fontWeight: firstweight)),
                                Text(
                                    "${(documentSnapshot["date"] as Timestamp).toDate()}"),
                                const Text('nom et prénom',
                                    style: TextStyle(fontWeight: firstweight)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(documentSnapshot["nom"]),
                                    const SizedBox(width: 5),
                                    Text(documentSnapshot["prenom"]),
                                  ],
                                ),
                                const Text('adresse',
                                    style: TextStyle(fontWeight: firstweight)),
                                Text(documentSnapshot["adresse"]),
                                const Text('complement d\'adresse',
                                    style: TextStyle(fontWeight: firstweight)),
                                Text(documentSnapshot["complement"])
                              ],
                            );
                          });
                    }
                    return const CircularProgressIndicator();
                  }),
            ),
          ),
          const Text('A domicile'),
          const Text('Acompte sur reservation - 10€'),
        ],
      ),
    );
  }
}
