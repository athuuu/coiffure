import 'package:flutter/material.dart';

class PaiementScreen extends StatefulWidget {
  const PaiementScreen({Key? key}) : super(key: key);

  @override
  State<PaiementScreen> createState() => _PaiementScreenState();
}

class _PaiementScreenState extends State<PaiementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title:  const Text('voici la page de paiement '),
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            ),
        onPressed:() {
          // ignore: avoid_print
          print('rechercher un moyen de paiement');
          },
        ),
      ),
      body: Column(
        children: [
          const TextField(

          ),
          const SizedBox(),
          ElevatedButton(
            child: const Text(
              "Payer Maintenant",
            ),
            onPressed: () {
              
            },

          )
        ],)
    );
  }
}