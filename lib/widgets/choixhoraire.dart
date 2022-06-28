import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/state/commande_state.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

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
  TimeOfDay? time;
  DateTime? _dateTime;
  late int mins;
  late int heure;
  late String moment;

  String getHeure() {
    if (time == null) {
      return 'Horaire';
    } else {
      return '${time!.hour}:${time!.minute}';
    }
  }

  Future pickTime() async {
    // ignore: prefer_const_constructors, unused_local_variable
    final initialTime = TimeOfDay(hour: 0, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? TimeOfDay.now(),
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }

  Future _selectDate() async {
    // ignore: unused_local_variable
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              onPrimary: secondarycolor,
              onSurface: primarycolor,
              primary: thirdcolor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  backgroundColor: primarycolor,
                  textStyle: const TextStyle(color: thirdcolor)),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Choisissez une date et un horaire',
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
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(secondarycolor),
                  ),
                  child: Text(
                    _dateTime == null
                        ? 'choisissez une heure'
                        : _dateTime.toString(),
                    style: const TextStyle(color: primarycolor),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width: 50,
                                        height: 100,
                                        child: WheelChooser.integer(
                                          // ignore: avoid_print
                                          onValueChanged: (heure) =>
                                              // ignore: avoid_print
                                              print(heure),
                                          maxValue: 12,
                                          minValue: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        height: 100,
                                        child: WheelChooser.integer(
                                          // ignore: avoid_print
                                          onValueChanged: (mins) =>
                                              // ignore: avoid_print
                                              print(mins),
                                          maxValue: 45,
                                          minValue: 00,
                                          step: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                        height: 100,
                                        child: WheelChooser(
                                            // ignore: avoid_print
                                            onValueChanged: (moment) =>
                                                // ignore: avoid_print
                                                print(moment),
                                            datas: const [
                                              "AM",
                                              "PM",
                                            ]),
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
                                        onPressed: () {},
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    secondarycolor)),
                                        child: const Text('annuler'),
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
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondarycolor),
                ),
                child: Text(
                    _dateTime == null
                        ? 'choisissez une date'
                        : _dateTime.toString(),
                    style: const TextStyle(color: primarycolor)),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2019),
                    lastDate: DateTime(2090),
                  ).then((date) {
                    setState(() {
                      _dateTime = date;
                    });
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
                  },
                ),
                CardChoice(
                  title: "Chez la coiffeuse",
                  onPressed: () {},
                ),
                CardChoice(
                  title: "En salon",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addDataToFirebase() {
    try {
      databaseReference
          .collection('client')
          .add({}).then((value) => (value.id));
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
    }
  }
}
