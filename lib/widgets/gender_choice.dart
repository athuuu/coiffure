import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:flutter/material.dart';

CommandeInfoC commandeInfoC = CommandeInfoC();

class GenderChoice extends StatefulWidget {
  const GenderChoice({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  State<GenderChoice> createState() => _GenderChoiceState();
}

class _GenderChoiceState extends State<GenderChoice> {
  CommandeInfos commandeInfo = CommandeInfos();
  bool isSelected = true;
  @override
  void initState() {
    super.initState();
    commandeInfoC = CommandeInfoC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Que souhaitez-vous :  '),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CardChoice(
                  title: "J'aimerai une coiffeuse en particulier",
                  onPressed: () {
                    setState(() {
                      isSelected = true;
                    });
                    widget.pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    commandeInfoC.setGenreI(1);
                  },
                ),
                CardChoice(
                  title: "je n'ai pas de coiffeuse en tête",
                  onPressed: () {
                    setState(() {
                      isSelected = false;
                    });
                    widget.pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    commandeInfoC.setGenreI(0);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CommandeInfoC {
  int? genre;
  String? prestation;
  DateTime? date;
  int? heure;
  int? mins;
  String? lieu;
  int? prix;

  CommandeInfoC({
    this.genre,
    this.mins,
    this.prestation,
    this.date,
    this.heure,
    this.lieu,
    this.prix,
  });

  setGenreI(int genre) {
    this.genre = genre;
  }

  setPrestation(String prestation) {
    this.prestation = prestation;
  }

  setDate(DateTime date) {
    this.date = date;
  }

  setHeure(int heure) {
    this.heure = heure;
  }

  setMins(int mins) {
    this.mins = mins;
  }

  setLieu(String lieu) {
    this.lieu = lieu;
  }

  setPrix(int prix) {
    this.prix = prix;
  }

  @override
  String toString() {
    return "$genre, $prestation, $heure, $mins, $date, $lieu, $prix";
  }
}
