import 'package:coiffeur/pages/accueil_client.dart';
import 'package:coiffeur/pages/accueil_coiffeuse.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class ChoixTypePersonne extends StatelessWidget {
  const ChoixTypePersonne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: secondarycolor,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/logocoiffeur.png',
              ),
            ),
            const Text('je suis',
                style: TextStyle(color: primarycolor, fontSize: 30)),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 200,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primarycolor),
                  ),
                  child: const Text('Une coiffeuse',
                      style: TextStyle(fontSize: 20, color: secondarycolor)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyAppCoiffeuse()));
                  }),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 200,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primarycolor),
                  ),
                  child: const Text(
                    'Un client',
                    style: TextStyle(fontSize: 20, color: secondarycolor),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyAppClient(),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
