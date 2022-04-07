import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Infosprofil extends StatefulWidget {
  const Infosprofil({ Key? key }) : super(key: key);

  @override
  State<Infosprofil> createState() => _InfosprofilState();
}

class _InfosprofilState extends State<Infosprofil> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FirebaseMessage()),
    );
  }
}

class FirebaseMessage extends StatelessWidget{
  const FirebaseMessage({Key? key}) : super(key: key);
@override 
Widget build(BuildContext context) {
  CollectionReference users = 
    FirebaseFirestore.instance.collection('client');
  return FutureBuilder<DocumentSnapshot>(
    future: users.doc('datamessage').get(),
    builder: 
      (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) { 
        return const Text("Un bug dans la matrice ");
      }
      if(snapshot.hasData && !snapshot.data!.exists){
        return const Text('ce que je demande existe pas');
      }
      if (snapshot.connectionState == ConnectionState.done){ 
        Map<String, dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
      return MessageDesign(
      nom: data["nom"],
      prenom: data["prenom"],
        );
      }
      return const Text('ça charge');
    }
    );
  }
}

class MessageDesign extends StatelessWidget{
  final String nom;
  final String prenom;
  const MessageDesign( 
    {Key? key, required this.nom,  required this.prenom, dateinscription})
  :super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset('assets/logocoiffeur.png'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
                Text(
                  nom,
                  style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                )
            ]
              ) ,
              const SizedBox(width: 20),
              Text(
                prenom,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 100),
            ]
          )
    );
  }

  
}