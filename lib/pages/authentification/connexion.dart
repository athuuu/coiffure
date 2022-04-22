import 'package:coiffeur/main.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class Connexion extends StatelessWidget {
  const Connexion({ Key? key }) : super(key: key);

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
                    labelText: 'email',
                    border: OutlineInputBorder()
                  )
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'mot de passe',
                    border: OutlineInputBorder()
                  )
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(secondarycolor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20))
                      ))
                  ),

                  child: const Text('Connexion',)
                  , 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
                })
              ]
            
            )))));
  }
}