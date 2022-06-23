import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
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
  String _val = '';
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
    // ignore: unnecessary_null_comparison
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

    if (picker != null) {
      setState(() {
        _val = picker.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(children: [
          const SizedBox(height: 40),
          const SizedBox(
            width: 300,
            child: Text('Prendre un rendez-vous: ',
                style: TextStyle(fontSize: 23, fontWeight: firstweight)),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 115.0),
            child: Text('en quelques clics seulement',
                style: TextStyle(fontSize: 13, fontWeight: firstweight)),
          ),
          const SizedBox(height: 15),
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
                child: Text(_val, style: const TextStyle(color: primarycolor)),
                onPressed: () {
                  _selectDate();
                },
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 40,
            width: 300,
            child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(secondarycolor)),
                child: const Text('A domicile',
                    style: TextStyle(
                      color: primarycolor,
                      fontSize: 15,
                      fontWeight: firstweight,
                    )),
                onPressed: () {
                  widget.pageController.animateToPage(4,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 40,
            width: 300,
            child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondarycolor)),
              child: const Text('Chez la coiffeuse',
                  style: TextStyle(
                    color: primarycolor,
                    fontSize: 15,
                    fontWeight: firstweight,
                  )),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 40,
            width: 300,
            child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondarycolor)),
              child: const Text('En salon',
                  style: TextStyle(
                    color: primarycolor,
                    fontSize: 15,
                    fontWeight: firstweight,
                  )),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    widget.pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  icon: const Icon(Icons.arrow_back, size: 40)),
            ],
          )
        ]),
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
