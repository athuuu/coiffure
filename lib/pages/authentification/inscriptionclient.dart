import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/pages/accueil_client.dart';

import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InscriptionClient extends StatefulWidget {
  const InscriptionClient({Key? key}) : super(key: key);

  @override
  State<InscriptionClient> createState() => _InscriptionClientState();
}

class _InscriptionClientState extends State<InscriptionClient> {
  final CollectionReference _compteclient =
      FirebaseFirestore.instance.collection('compteclient');
  final TextEditingController _mail = TextEditingController();
  TextEditingController _mdp = TextEditingController();
  final TextEditingController _nom = TextEditingController();
  final TextEditingController _prenom = TextEditingController();
  final TextEditingController _naissance = TextEditingController();
  final TextEditingController _description = TextEditingController();
  //final TextEditingController _adresse = TextEditingController();

  // Future<void> _createUpdate([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //     _mail.text = documentSnapshot['mail'];
  //     _nom.text = documentSnapshot['nom'];
  //     _prenom.text = documentSnapshot['prenom'];
  //     _mdp.text = documentSnapshot['mdp'];
  //     _naissance.value = documentSnapshot['naissance'];
  //     _adresse.text = documentSnapshot['adresse'];
  //     _description.text = documentSnapshot['description'];
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyAppClient()));
                }),
            const SizedBox(width: 55),
            const Text(
              'Créer un compte ',
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
          TextFormField(
            controller: _mail,
            decoration: InputDecoration(
              labelText: 'Votre mail',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            obscureText: true,
            controller: _mdp,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
              labelText: 'Mot de passe',
            ),
            validator: (val) => val!.length < 6
                ? "votre mot de passe doit faire au moins 6 caractères."
                : null,
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
              labelText: 'Confirmez votre Mot de passe',
            ),
            validator: (val) => val!.length < 6
                ? 'le mot de passe ne correspond pas a celui que vous avez entrer'
                : null,
            onChanged: (val) => _mdp = val as TextEditingController,
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _nom,
            decoration: InputDecoration(
              labelText: 'Nom',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _prenom,
            decoration: InputDecoration(
              labelText: 'Prénom',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _naissance,
            decoration: InputDecoration(
              labelText: 'Date de naissance',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _description,
            decoration: InputDecoration(
              labelText: "description",
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () async {
                    final id = await createUser();
                    await _compteclient.doc(id).set({
                      "mail": _mail.text,
                      "mdp": _mdp.text,
                      "nom": _nom.text,
                      "prenom": _prenom.text,
                      "naissance": _naissance.text,
                      "description": _description.text,
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyAppClient()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: secondarycolor,
                    padding: const EdgeInsets.all(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 10),
                      Text(
                        "Créer mon compte",
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

  Future<String> createUser() async {
    return "p02TgJm61xM9hRnEzI76HJclnr73";
  }
}
