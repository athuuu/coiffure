import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/card_choice.dart';
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
                              "${documentSnapshot["prix"].toStringAsFixed(2)} € - ${documentSnapshot["temps"]} ",
                          onPressed: () {
                            widget.pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
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

// Column(
// children: <Widget>[
// Container(
// decoration: const BoxDecoration(
// border: Border(
// bottom: BorderSide(
// width: 1, color: secondarycolor))),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// SizedBox(
// width: 100,
// child: Text(
// documentSnapshot["prestation"])),
// SizedBox(
// width: 30,
// child: Text(documentSnapshot["prix"]
// .toString())),
// Text(documentSnapshot["temps"]),
// Checkbox(
// value: isChecked,
// onChanged: (bool? value) {
// setState(() {
// isChecked = value!;
// });
// },
// )
// ],
// ),
// )
// ],
// );
