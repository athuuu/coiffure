import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/model/commande/commande.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/choixhoraire.dart';
import 'package:coiffeur/widgets/choixprestation.dart';
import 'package:coiffeur/widgets/finalisationcommande.dart';
import 'package:coiffeur/widgets/gender_choice.dart';
import 'package:flutter/material.dart';

class PageRecherche extends StatefulWidget {
  const PageRecherche({Key? key}) : super(key: key);

  @override
  State<PageRecherche> createState() => _PageRechercheState();
}

class _PageRechercheState extends State<PageRecherche> {
  void addDataToFirebase() {
    try {
      databaseReference.collection('alertes').add({
        "nom": "test",
        "prenom": "test",
        "prestation": "lissage",
        "prix": 40,
        "declined": false,
        "adresse": "5 rue de la paix",
        "coiffeuse": null,
        "complement": "59000 Lille",
        "accepted": false,
        "date": "11 juin 2022 à 15:30:00 UTC+2",
      }).then(
          // ignore: avoid_print
          (value) => print(value.id));
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
    }
  }

  final databaseReference = FirebaseFirestore.instance;
  final PageController pageController = PageController();
  int indexPage = 0;
  CommandeInfos commandeInfo = CommandeInfos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 1; i <= 4; i++)
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: indexPage == i - 1 ? primarycolor : secondarycolor,
                    border: Border.all(
                      color: secondarycolor,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      i.toString(),
                      style: TextStyle(
                        color:
                            indexPage == i - 1 ? secondarycolor : primarycolor,
                      ),
                    ),
                  ),
                )
            ],
          )),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            indexPage = index;
          });
        },
        children: [
          GenderChoice(
            pageController: pageController,
          ),
          PageChoixPresta(
            pageController: pageController,
          ),
          PageChoixHoraire(
            pageController: pageController,
          ),
          FinalisationCommande(
            pageController: pageController,
          )
        ],
      ),
    );
  }
}

class PersonChoice extends StatefulWidget {
  const PersonChoice({Key? key}) : super(key: key);

  @override
  State<PersonChoice> createState() => _PersonChoiceState();
}

class _PersonChoiceState extends State<PersonChoice> {
  int _counter = 1;

  CommandeInfos commandeinfo = CommandeInfos();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    commandeinfo.commande = Commande(nombre: _counter);
    // ignore: avoid_print
    print(commandeinfo.commande!.getNombre);
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 1) {
        _counter == _counter;
      } else {
        _counter--;
      }
    });
    commandeinfo.commande = Commande(nombre: _counter);
    // ignore: avoid_print
    print(commandeinfo.commande!.getNombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 30),
        const SizedBox(
          width: 300,
          child: Text('Trouver une coiffeuse pour votre lissage',
              style: TextStyle(fontSize: 23, fontWeight: firstweight)),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(right: 115.0),
          child: Text('en quelques clics seulement',
              style: TextStyle(fontSize: 13, fontWeight: firstweight)),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(right: 80),
          height: 35,
          width: 210,
          child: TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(secondarycolor)),
            child: const Text('Nombres de personnes',
                style: TextStyle(
                  color: primarycolor,
                  fontSize: 17,
                )),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
            height: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    border: Border.all(color: secondarycolor),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _decrementCounter();
                      (_counter);
                    },
                    child: const Center(
                      child: Text('-',
                          style:
                              TextStyle(color: secondarycolor, fontSize: 20)),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: secondarycolor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 120,
                    height: 200,
                    child: Center(
                      child: Text('$_counter',
                          style: const TextStyle(fontSize: 70)),
                    )),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    border: Border.all(color: secondarycolor),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _incrementCounter();
                      // ignore: avoid_print
                    },
                    child: const Center(
                      child: Text('+',
                          style:
                              TextStyle(color: secondarycolor, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
