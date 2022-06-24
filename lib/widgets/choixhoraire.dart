import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PageChoixHoraire extends StatefulWidget {
  const PageChoixHoraire({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  State<PageChoixHoraire> createState() => _PageChoixHoraireState();
}

class _PageChoixHoraireState extends State<PageChoixHoraire> {
  final databaseReference = FirebaseFirestore.instance;
  final myController = TextEditingController();
  TimeOfDay? time;
  DateTime? date;

  String getHeure() {
    if (time == null) {
      return 'Horaire';
    } else {
      return '${time!.hour}:${time!.minute}';
    }
  }

  getDate() {
    if (date == null) {
      return 'date';
    } else {
      return date;
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
                  child: Text(getHeure(),
                      style: const TextStyle(color: primarycolor)),
                  onPressed: () {
                    pickTime();
                  }),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondarycolor),
                ),
                child: Text(getDate(),
                    style: const TextStyle(color: primarycolor)),
                onPressed: () {},
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
