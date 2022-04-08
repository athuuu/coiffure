import 'package:flutter/material.dart';

class Inscription extends StatelessWidget {
  const Inscription({ Key? key }) : super(key: key);

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
              
                ElevatedButton(
                  
                  onPressed: () {
                    // envoie des données dans la base de donnée 
                  },
                  child: Text('Envoyer les données ')),
              ]
            ),
          ),
        )
      )
    );
  }
}