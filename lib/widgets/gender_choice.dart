import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class GenderChoice extends StatefulWidget {
  const GenderChoice({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  State<GenderChoice> createState() => _GenderChoiceState();
}

class _GenderChoiceState extends State<GenderChoice> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 30),
      Container(
        margin: const EdgeInsets.only(right: 130),
        height: 40,
        width: 140,
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
          child: Row(children: const [
            Icon(Icons.add_circle_outline_outlined,
                size: 30, color: primarycolor),
            Text('Boutique',
                style: TextStyle(
                  color: primarycolor,
                  fontSize: 20,
                  fontWeight: firstweight,
                )),
          ]),
          onPressed: () {},
        ),
      ),
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
      const SizedBox(height: 150),
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
                    MaterialStateProperty.all<Color>(secondarycolor)),
            child: const Text('Homme', style: TextStyle(fontSize: 50)),
            onPressed: () {
              widget.pageController.animateToPage(2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
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
                    MaterialStateProperty.all<Color>(secondarycolor),
              ),
              child: const Text('Femme', style: TextStyle(fontSize: 50)),
              onPressed: () {}),
        ),
      ),
      const SizedBox(height: 40),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                widget.pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              icon: const Icon(Icons.arrow_back, size: 40)),
        ],
      )
    ]);
  }
}
