import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/pages/authentification/connexion.dart';

import 'package:coiffeur/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InscriptionClient extends StatefulWidget {
  const InscriptionClient({Key? key}) : super(key: key);

  @override
  State<InscriptionClient> createState() => _InscriptionClientState();
}

class _InscriptionClientState extends State<InscriptionClient> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _compteclient =
      FirebaseFirestore.instance.collection('compteclient');
  final TextEditingController _mail = TextEditingController();
  TextEditingController _mdp = TextEditingController();
  final TextEditingController _nom = TextEditingController();
  final TextEditingController _prenom = TextEditingController();
  final TextEditingController _naissance = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _adresse = TextEditingController();
  final TextEditingController _cpltadresse = TextEditingController();

  Future<void> addUser(String userID, String pseudo, String naissance) {
    return firestore
        .collection('Users')
        .doc(userID)
        .set({
          'pseudo': pseudo,
          'birthdate': naissance,
        })
        // ignore: avoid_print
        .then((value) => print("Utilisateur ajouté"))
        .catchError(
          // ignore: avoid_print
          (error) => print("Erreur: $error"),
        );
  }

  Future<UserCredential?> signUpToFirebase() async {
    try {
      return await auth
          .createUserWithEmailAndPassword(
        email: _mail.text.trim(),
        password: _mdp.text.trim(),
      )
          .then((value) {
        // ignore: avoid_print
        print(value.user!.uid);
        return value;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }

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
                          builder: (context) => const Connexion()));
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
              hintText: 'ex : 01 janvier 2020',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _adresse,
            decoration: InputDecoration(
              labelText: 'adresse ',
              hintText: 'ex : 10 boulevard de la liberté',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _cpltadresse,
            decoration: InputDecoration(
              labelText: 'complement d\'adresse',
              hintText: 'ex : 59000 Lille',
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
              labelText: "description de votre cheveux",
              hintText: "cheveux long et blond",
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
                    const AlertDialog(
                        title: Text(
                            'un mail de confirmation va vous etre envoyé pour confirmer la création de votre compte'));
                    UserCredential? userCredential = await signUpToFirebase();
                    if (userCredential != null) {
                      await _compteclient.doc(userCredential.user!.uid).set({
                        "mail": _mail.text,
                        "mdp": _mdp.text,
                        "nom": _nom.text,
                        "prenom": _prenom.text,
                        "naissance": _naissance.text,
                        "description": _description.text,
                        "adresse": _adresse.text,
                        "cpltadresse": _cpltadresse.text,
                      });
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Connexion()));
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
}
