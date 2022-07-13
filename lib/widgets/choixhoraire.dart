import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:coiffeur/widgets/gender_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wheel_chooser/wheel_chooser.dart';

class PageChoixHoraire extends ConsumerStatefulWidget {
  const PageChoixHoraire({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  ConsumerState<PageChoixHoraire> createState() => _PageChoixHoraireState();
}

class _PageChoixHoraireState extends ConsumerState<PageChoixHoraire> {
  final databaseReference = FirebaseFirestore.instance;
  final myController = TextEditingController();
  DateTime? dateTime;
  late int mins;
  late int heure;
  String? moment;

  @override
  void initState() {
    super.initState();
    initValue();
  }

  initValue() {
    setState(() {
      heure = commandeInfoC.heure ?? 0;
      mins = commandeInfoC.mins ?? 0;
      dateTime = commandeInfoC.date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Date , horaire et lieu',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            widget.pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(
                width: 220,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(secondarycolor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$heure : $mins",
                        ),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 50,
                                          height: 100,
                                          child: WheelChooser.integer(
                                            onValueChanged: (heure) {
                                              setState(() {
                                                this.heure = heure;
                                              });
                                              commandeInfoC.setHeure(heure);
                                            },
                                            maxValue: 19,
                                            minValue: 8,
                                          ),
                                        ),
                                        const Text(":"),
                                        SizedBox(
                                          width: 50,
                                          height: 100,
                                          child: WheelChooser.integer(
                                            onValueChanged: (mins) {
                                              setState(() {
                                                this.mins = mins;
                                              });
                                              commandeInfoC.setMins(mins);
                                            },
                                            maxValue: 45,
                                            minValue: 00,
                                            step: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      secondarycolor)),
                                          child: const Text('Ok'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                    }),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondarycolor),
                ),
                child: Text(
                    dateTime == null
                        ? 'choisissez une date'
                        : dateTime.toString(),
                    style: const TextStyle(color: primarycolor)),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2019),
                    lastDate: DateTime(2090),
                  ).then((date) {
                    setState(() {
                      dateTime = date;
                    });
                    commandeInfoC.setDate(date!);
                  });
                },
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CardChoice(
                  title: "A domicile",
                  onPressed: () {
                    widget.pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    commandeInfoC.setLieu("A domicile");
                  },
                ),
                CardChoice(
                  title: "Chez la coiffeuse",
                  onPressed: () {
                    widget.pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    commandeInfoC.setLieu("Chez la coiffeuse");
                  },
                ),
                CardChoice(
                  title: "En salon",
                  onPressed: () {
                    widget.pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    commandeInfoC.setLieu("En salon");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
