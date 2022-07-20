import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:coiffeur/widgets/gender_choice.dart';
import 'package:flutter/material.dart';

class ChoixtailleDomicile extends StatefulWidget {
  const ChoixtailleDomicile({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  State<ChoixtailleDomicile> createState() => _ChoixtailleDomicileState();
}

class _ChoixtailleDomicileState extends State<ChoixtailleDomicile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              'Longueur de cheveux',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                widget.pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            )),
        body: Column(
          children: [
            const Text('Definissez la longueur de votre cheveux'),
            const SizedBox(height: 60),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CardChoice(
                    title: "cheveux court",
                    subtitle: '100€',
                    onPressed: () {
                      widget.pageController.animateToPage(4,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      commandeInfoC.setPrix(100);
                    },
                  ),
                  CardChoice(
                    title: "cheveux Mi-long",
                    subtitle: '120€',
                    onPressed: () {
                      widget.pageController.animateToPage(4,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      commandeInfoC.setPrix(120);
                    },
                  ),
                  CardChoice(
                    title: "cheveux long ",
                    subtitle: '140€',
                    onPressed: () {
                      widget.pageController.animateToPage(4,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      commandeInfoC.setPrix(140);
                    },
                  ),
                  CardChoice(
                    title: "cheveux extras-long ",
                    subtitle: '160€',
                    onPressed: () {
                      widget.pageController.animateToPage(4,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      commandeInfoC.setPrix(160);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape:
                        MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20));
                    }),
                    backgroundColor: MaterialStateProperty.all(secondarycolor)),
                child: const Text('Voir votre taille',
                    style: TextStyle(fontSize: firstsize)),
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(actions: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ], title: Image.asset('assets/tariflongueur.jpeg')));
                },
              ),
            )
          ],
        ));
  }
}
