import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:coiffeur/widgets/gender_choice.dart';
import 'package:flutter/material.dart';

class PageChoixPresta extends StatefulWidget {
  const PageChoixPresta({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;

  @override
  State<PageChoixPresta> createState() => _PageChoixPrestaState();
}

class _PageChoixPrestaState extends State<PageChoixPresta> {
  bool isChecked = false;
  final CollectionReference _prestas =
      FirebaseFirestore.instance.collection('prestas');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Prestations",
          style: TextStyle(color: secondarycolor),
        ),
        leading: IconButton(
          onPressed: () {
            widget.pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: secondarycolor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: const [
              Text('Prendre un rendez-vous: '),
              Text('en quelques clics seulement'),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: StreamBuilder(
              stream: _prestas.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ...streamSnapshot.data!.docs.map((docs) {
                        final documentSnapshot =
                            docs.data() as Map<String, dynamic>;
                        return CardChoice(
                          title: "${documentSnapshot["prestation"]} ",
                          subtitle:
                              "${documentSnapshot["prix"]} € - ${documentSnapshot["temps"]} ",
                          onPressed: () {
                            widget.pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            commandeInfoC
                                .setPrestation(documentSnapshot["prestation"]);
                          },
                        );
                      }),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
          TextButton(
            child: const Text(
                'cliquez ici pour avoir une indication des prix pour un lissage selon la longueur de vos cheveux',
                style: TextStyle(color: secondarycolor)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                      title: Image.asset('assets/tariflongueur.jpeg')));
            },
          )
        ],
      ),
    );
  }
}
