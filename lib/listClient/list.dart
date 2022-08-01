import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/listClient/detaillist.dart';
import 'package:coiffeur/listClient/presta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';

class ListPresta extends StatelessWidget {
  const ListPresta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          Expanded(
            child: Stack(children: <Widget>[
              Container(
                //l'arriere plan de la liste
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: prestation
                    .length, //voir presta.dart si tu veux utiliser la list locale
                itemBuilder: (context, index) => BigContenu(
                  itemIndex: index,
                  presta: prestation[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          alerte: prestation[index],
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class BigContenu extends StatefulWidget {
  const BigContenu({
    Key? key,
    required this.itemIndex,
    required this.press,
    required this.presta,
  }) : super(key: key);

  final int itemIndex;
  final Presta presta;
  final Function press;

  @override
  State<BigContenu> createState() => _BigContenuState();
}

final _alertesRef = FirebaseFirestore.instance.collection('alertes');

class _BigContenuState extends State<BigContenu> {
  final _alertes = _alertesRef
      .where('clientId', isNotEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .where('coiffeuse', isNull: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: _alertes.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
          // ignore: avoid_print

          if (streamsnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (streamsnapshot.hasData == false ||
              streamsnapshot.data == null ||
              streamsnapshot.data!.size == 0) {
            return const Center(
              child: Text('pas de nouveaux rendez-vous'),
            );
          }

          return Container(
            margin: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            // color: Colors.blueAccent,
            height: 400,
            child: ListView.builder(
                itemCount: streamsnapshot.data!.docs.length,
                itemBuilder: (content, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamsnapshot.data!.docs[index];

                  final dareTime = documentSnapshot["date"] as Timestamp;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(alerte: documentSnapshot),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        //nos background
                        Container(
                          height: 136,
                          decoration: BoxDecoration(
                            boxShadow: const [kDefaultShadow],
                            borderRadius: BorderRadius.circular(22),
                            color: widget.itemIndex.isEven
                                ? kBlackColor
                                : kSecondaryColor,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 10,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            height: 160,
                            width: 200,
                            child: Image.asset(
                              widget.presta.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // nom de la prestation , date , client et prix
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: SizedBox(
                            height: 136,
                            // l'image prend 200 en largeur , c'est pourquoi nous mettons la largeur total - 200
                            width: size.width - 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding,
                                  ),
                                  child: Text(
                                    "${(documentSnapshot["nom"])} ${(documentSnapshot["prenom"])}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding),
                                  child: Text(
                                    "Prestation : ${(documentSnapshot["prestation"])}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding),
                                  child: Text(
                                    "Date :  ${DateTime.fromMicrosecondsSinceEpoch(dareTime.microsecondsSinceEpoch)}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                //occupe l'espace disponible
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        kDefaultPadding * 1.5, //30 padding
                                    vertical: kDefaultPadding / 4,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(22),
                                      topRight: Radius.circular(22),
                                    ),
                                  ),
                                  child: Text(
                                    "\$${(documentSnapshot["prix"])}",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
