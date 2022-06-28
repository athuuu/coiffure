// ignore_for_file: avoid_print

import 'package:coiffeur/pages/accueil_client.dart';
import 'package:coiffeur/pages/authentification/inscriptionclient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  void loginToFirebase() {
    try {
      auth
          .signInWithEmailAndPassword(
              email: emailField.text.trim(),
              password: passwordField.text.trim())
          .then((value) {
        print(value.toString());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
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
                  const Center(
                    child: Text(
                      'Connexion à votre compte ',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
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
                    controller: emailField,
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
                    controller: passwordField,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: const OutlineInputBorder(),
                      labelText: 'Mot de passe',
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed:
                            () {}, //faire la fonction permettant de cacher ou montrer le mdp
                      ),
                    ),

                    validator: (value) => value != null && value.isEmpty
                        ? "Entrer votre mot de passe est obligatoire."
                        : null, // ici si la taille du mot de passe n'est pas supérieur ou égal a 6  alors le message  s'afficheras ou alors le mdp est valide
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    child: Column(children: [
                      ElevatedButton(
                          onPressed: () {
                            loginToFirebase();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyAppClient()));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.all(14),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 10),
                              Text(
                                "Connexion",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.all(14),
                          ),
                          child: const Text('Créez un compte ?'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const InscriptionClient()));
                          },
                        ),
                      )
                    ]),
                  ),
                ])))));
  }
}
