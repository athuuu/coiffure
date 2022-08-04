import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
import 'package:coiffeur/widgets/choix_coiffeuse.dart';
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
                          subtitle: "environ ${documentSnapshot["temps"]} ",
                          onPressed: () async {
                            commandeInfoC
                                .setPrestation(documentSnapshot["prestation"]);
                            if (commandeInfoC.prestation == "lissage") {
                              final result = await showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const SizedBox(
                                        height: 600,
                                        child: ChoixCoiffeuse(
                                          pageController: null,
                                        ));
                                  });

                              if (result != null) {
                                widget.pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              }
                            } else if (commandeInfoC.prestation ==
                                "soin bottox") {
                              final result = await showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const SizedBox(
                                        height: 600,
                                        child: ChoixCoiffeuse(
                                          pageController: null,
                                        ));
                                  });

                              if (result != null) {
                                widget.pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              }
                            }
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
        ],
      ),
    );
  }
}
