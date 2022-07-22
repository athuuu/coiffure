import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/gender_choice.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final CollectionReference compteclient =
      FirebaseFirestore.instance.collection('compteclient');

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
              3,
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
      body: StreamBuilder(
        stream: compteclient
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
          if (streamSnapshot.hasData && streamSnapshot.data != null) {
            final documentSnapshot =
                streamSnapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: secondarycolor, width: 2)),
                child: Column(
                  children: [
                    const Text('Votre récapitulatif de commande',
                        style: TextStyle(
                          fontSize: firstsize,
                        )),
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          const Text('Nom et Prénom',
                              style: TextStyle(
                                  fontWeight: firstweight,
                                  fontSize: firstsize)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(documentSnapshot['nom']),
                              const SizedBox(width: 5),
                              Text(documentSnapshot['prenom']),
                            ],
                          ),
                          const SizedBox(height: 7),
                          const Text("Prestation",
                              style: TextStyle(
                                  fontWeight: firstweight,
                                  fontSize: firstsize)),
                          Text(
                            commandeInfoC.prestation!,
                          ),
                          const SizedBox(height: 7),
                          const Text('Date et heure',
                              style: TextStyle(
                                  fontWeight: firstweight,
                                  fontSize: firstsize)),
                          Text(
                              "${commandeInfoC.heure} H ${commandeInfoC.mins}"),
                          Text("${commandeInfoC.date}"),
                          const SizedBox(height: 7),
                          const Text('Adresse',
                              style: TextStyle(
                                  fontWeight: firstweight,
                                  fontSize: firstsize)),
                          Text(documentSnapshot['adresse']),
                          const SizedBox(height: 7),
                          const Text('Complément d\'adresse',
                              style: TextStyle(
                                  fontWeight: firstweight,
                                  fontSize: firstsize)),
                          Text(documentSnapshot['cpltadresse']),
                          const SizedBox(height: 7),
                          const Text('Prix',
                              style: TextStyle(
                                  fontWeight: firstweight,
                                  fontSize: firstsize)),
                          Text("${commandeInfoC.prix}€")
                        ],
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text('lieu de la prestation',
                        style: TextStyle(
                            fontWeight: firstweight, fontSize: firstsize)),
                    Text(commandeInfoC.lieu!),
                    const SizedBox(height: 7),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.warning),
                        SizedBox(width: 5),
                        Text('Acompte sur reservation - 10€',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith<
                                OutlinedBorder>((_) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }),
                            backgroundColor:
                                MaterialStateProperty.all(secondarycolor)),
                        child: const Text('Prendre votre Rendez-vous'),
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (_) => const AlertDialog(
                                    title: Text('Vers la page de paiement '),
                                  ));
                          await addDataToFirebase(documentSnapshot);
                          widget.pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Pensez a verifier si les infos sont corrects',
                        style: TextStyle(color: Colors.red))
                  ],
                ),
              ),
            );
          }
          if (streamSnapshot.hasError) {
            return const Text('Error');
          }
          return const Text('coucou');
        },
      ),
    );
  }

  addDataToFirebase(Map<String, dynamic> documentSnapshot) async {
    try {
      await databaseReference.collection("alertes").add({
        "nom": documentSnapshot['nom'],
        "prenom": documentSnapshot['prenom'],
        "adresse": documentSnapshot['adresse'],
        "complement": documentSnapshot['cpltadresse'],
        "date": commandeInfoC.date,
        "heure": commandeInfoC.heure,
        "minutes": commandeInfoC.mins,
        "prestation": commandeInfoC.prestation,
        "prix": commandeInfoC.prix,
        "lieu": commandeInfoC.lieu,
        "coiffeuse": null,
        "clientId": FirebaseAuth.instance.currentUser?.uid
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
