import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class GenderChoice extends StatefulWidget {
  const GenderChoice({Key? key}) : super(key: key);

  @override
  State<GenderChoice> createState() => _GenderChoiceState();
}

class _GenderChoiceState extends State<GenderChoice> {
  CommandeInfos commandeInfo = CommandeInfos();
  bool isChecked = false;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 40),
        const SizedBox(
          width: 300,
          child: Text('Je suis un :  ',
              style: TextStyle(fontSize: 23, fontWeight: firstweight)),
        ),
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: SizedBox(
            height: 80,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40)))),
                backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
              ),
              child: Row(
                children: [
                  const Text('Homme',
                      style: TextStyle(fontSize: 50, color: secondarycolor)),
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              ),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: SizedBox(
            height: 80,
            width: 350,
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40)))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primarycolor),
                ),
                child: Row(
                  children: [
                    const Text('Femme',
                        style: TextStyle(fontSize: 50, color: secondarycolor)),
                    Checkbox(
                      value: isChecked2,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked2 = value!;
                        });
                      },
                    )
                  ],
                ),
                onPressed: () {}),
          ),
        ),
      ]),
    );
  }
}
