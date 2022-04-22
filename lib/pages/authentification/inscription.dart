
import 'package:coiffeur/pages/authentification/connexion.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Inscription extends StatelessWidget {
  const Inscription({ Key? key }) : super(key: key);

  void loginToFirebase() {
    try {
      FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: 'azerty@gmail.com',
          password: 'azertyuiop')
          .then((value) {
            // ignore: avoid_print
            print(value.toString());
          });
    }catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Form(
            child: Column(
              children: <Widget>[
                Image.asset('assets/logocoiffeur.png', height: 100, width: 100),
                const Center(
                  child: Text('Créer un compte ',
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'nom',
                    border: OutlineInputBorder()
                  )
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'prenom',
                    border: OutlineInputBorder()
                  )
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'adresse postal',
                    border: OutlineInputBorder(),
                  )
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'adresse mail',
                    border: OutlineInputBorder(),
                  )
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'mot de passe',
                    border: OutlineInputBorder(),
                  )
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'confirmation mot de passe',
                    border: OutlineInputBorder(),
                  )
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'date de naissance',
                    border: OutlineInputBorder(),
                  )
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  
                  onPressed: () {
                    loginToFirebase();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Connexion()));
                  },
                  child: const Text(
                    'Envoyer les données '),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(secondarycolor))),

              ]
            ),
          ),
        )
      )
    );
  }
}