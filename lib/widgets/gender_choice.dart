import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Je suis un :  '),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CardChoice(
                  title: "Homme",
                  onPressed: () {
                    setState(() {
                      isSelected = true;
                    });
                    widget.pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                CardChoice(
                  title: "Femme",
                  onPressed: () {
                    setState(() {
                      isSelected = false;
                    });
                    widget.pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
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
