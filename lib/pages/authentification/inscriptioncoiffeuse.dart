import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/pages/accueil_coiffeuse.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Diplome {
  final int id;
  final String name;

  Diplome({
    required this.id,
    required this.name,
  });
}

class Experience {
  final int id;
  final String annee;

  Experience({
    required this.id,
    required this.annee,
  });
}

class Prestations {
  final int id;
  final String nom;

  Prestations({
    required this.id,
    required this.nom,
  });
}

class InscriptionCoiffeuse extends StatefulWidget {
  const InscriptionCoiffeuse({Key? key}) : super(key: key);

  @override
  State<InscriptionCoiffeuse> createState() => _InscriptionCoiffeuseState();
}

class _InscriptionCoiffeuseState extends State<InscriptionCoiffeuse> {
  final List<Prestations?> _prestation = [
    Prestations(id: 1, nom: "lissage"),
    Prestations(id: 2, nom: "soins bottox"),
    Prestations(id: 3, nom: "coupe "),
  ];
  final List<Experience?> _experiences = [
    Experience(id: 1, annee: "- 1 an"),
    Experience(id: 2, annee: "2-4 ans"),
    Experience(id: 3, annee: "4-6 ans "),
    Experience(id: 4, annee: "+6 ans ")
  ];
  final List<Diplome?> _diplomes = [
    Diplome(id: 1, name: "baccalauréat"),
    Diplome(id: 2, name: "cap coiffure"),
    Diplome(id: 3, name: "license"),
    Diplome(id: 4, name: "master")
  ];
  final CollectionReference _compte =
      FirebaseFirestore.instance.collection('comptecoiffeuse');

  final TextEditingController _diplome = TextEditingController();

  final TextEditingController _prestations = TextEditingController();

  final TextEditingController _experience = TextEditingController();

  final TextEditingController _adresseSalon = TextEditingController();

  // Future<void> _createUpdate([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //     _mail.text = documentSnapshot['mail'];
  //     _nom.text = documentSnapshot['nom'];
  //     _prenom.text = documentSnapshot['prenom'];
  //     _mdp.text = documentSnapshot['mdp'];
  //     _naissance.value = documentSnapshot['naissance'];
  //     _prestations.selection = documentSnapshot['prestations'];
  //     _experience.value = documentSnapshot['experience'];
  //     _adresse.text = documentSnapshot['adresse'];
  //     _diplome.text = documentSnapshot['diplome'];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Form(
        child: Column(children: <Widget>[
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: const AssetImage('assets/logocoiffeur.png'),
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
          Row(children: [
            IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            const SizedBox(width: 55),
            const Text(
              'Devenir prestataire ',
            ),
          ]),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            height: 100,
            child: Column(
              children: const [
                Text(
                  "Il est recommandé de connecter votre adresse mail afin que nous puissions protéger vos données personnelles.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _prestations,
            decoration: InputDecoration(
              labelText: 'Prestations',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          MultiSelectChipField(
            selectedChipColor: Colors.green,
            title: const Text('vos prestations '),
            headerColor: primarycolor,
            textStyle: const TextStyle(color: primarycolor),
            chipColor: Colors.red,
            items: _prestation
                .map((e) => MultiSelectItem(e, e?.nom ?? ''))
                .toList(),
            onTap: (value) {
              setState(() {
                _prestation;
              });
            },
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _experience,
            decoration: InputDecoration(
              labelText: "Année d'expérience",
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          MultiSelectChipField(
            selectedChipColor: Colors.green,
            title: const Text('votre expérience'),
            headerColor: primarycolor,
            textStyle: const TextStyle(color: primarycolor),
            chipColor: Colors.red,
            items: _experiences
                .map((e) => MultiSelectItem(e, e?.annee ?? ''))
                .toList(),
            onTap: (value) {
              setState(() {
                _experiences;
              });
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _diplome,
            decoration: InputDecoration(
              labelText: "diplomes",
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          MultiSelectChipField(
            selectedChipColor: Colors.green,
            title: const Text('vos dîplomes '),
            headerColor: primarycolor,
            textStyle: const TextStyle(color: primarycolor),
            chipColor: Colors.red,
            items: _diplomes
                .map((e) => MultiSelectItem(e, e?.name ?? ''))
                .toList(),
            onTap: (value) {
              setState(() {
                _diplomes;
              });
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
              controller: _adresseSalon,
              decoration: InputDecoration(
                labelText: "adresse du salon",
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                border: const OutlineInputBorder(),
              )),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyAppCoiffeuse()));
                    await _compte.add({
                      "experience": _experience.text,
                      "prestation": _prestations.text,
                      "diplome": _diplome.text,
                      "adresseSalon": _adresseSalon.text,
                    }).then((value) {
                      // ignore: avoid_print
                      print(FirebaseAuth.instance.currentUser!.uid);
                      return FirebaseFirestore.instance
                          .collection('compteclient')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({'idVendeur': value.id});
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondarycolor,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 10),
                      Text(
                        "Devenir prestataire",
                        style: TextStyle(
                          color: primarycolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ))
            ]),
          ),
        ]),
      ),
    )));
  }
}
