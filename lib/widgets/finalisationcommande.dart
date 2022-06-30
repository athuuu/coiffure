import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/gender_choice.dart';
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
            child: Column(
              children: [
                const Text("nom"),
                const Text("prenom"),
                const Text("prestation"),
                Text(
                  commandeInfoC.prestation!,
                ),
                const Text(
                  'Dates et heures',
                ),
                Text("${commandeInfoC.heure} ${commandeInfoC.mins}"),
                Text("${commandeInfoC.date}"),
                const Text(
                  'adresse',
                ),
                const Text("adresse"),
                const Text(
                  'complement d\'adresse',
                ),
                const Text("complement")
              ],
            ),
          ),
          Text(commandeInfoC.lieu!),
          const Text('Acompte sur reservation - 10€'),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20));
                  }),
                  backgroundColor: MaterialStateProperty.all(secondarycolor)),
              child: const Text('Prendre votre Rendez-vous'),
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                          title: Text('Vers la page de paiement '),
                        ));
                await addDataToFirebase();
                widget.pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  addDataToFirebase() async {
    try {
      await databaseReference.collection("alertes").add({
        "nom": "test",
        "prenom": "test",
        "adresse": "3 rue de la paix",
        "complement": "59000 Lille",
        "date": commandeInfoC.date,
        "prestation": commandeInfoC.prestation,
        "prix": 100,
        "coiffeuse": null,
      }).then((value) async {
        await databaseReference
            .collection("alertes")
            .doc(value.id)
            .update({"id": value.id});
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
