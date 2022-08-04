import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/listClient/constant.dart';
import 'package:coiffeur/listClient/product_image.dart';

import 'package:flutter/material.dart';

// ignore: unused_element
final _alertesRefCoiffeuses =
    FirebaseFirestore.instance.collection('alertescoiffeuses');

class BodyDetailCoiffeuse extends StatefulWidget {
  const BodyDetailCoiffeuse({Key? key, required this.alertes})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final alertes;

  @override
  State<BodyDetailCoiffeuse> createState() => _BodyDetailCoiffeuseState();
}

class _BodyDetailCoiffeuseState extends State<BodyDetailCoiffeuse> {
  final databaseReference = FirebaseFirestore.instance;

  late Map<String, dynamic> alertes;

  @override
  Widget build(BuildContext context) {
    // ça permet de fournir la hauteur et largeur total
    Size size = MediaQuery.of(context).size;

    return widget.alertes == null
        ? const Center(child: CircularProgressIndicator())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: SizedBox(
                      height: 610,
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: ProductPoster(
                              size: size,
                              image: 'assets/athu.jpeg',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2.7),
                            child: Text(
                                "Coiffeuse : ${(widget.alertes["nom"])} ${(widget.alertes["prenom"])}",
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2.7),
                            child: Text(
                              "Prestation :  ${(widget.alertes["prestation"])} ",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2.6),
                            child: Text(
                              "adresse : ${(widget.alertes["adresse"])}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2.6),
                            child: Text(
                              "complement d'adresse : ${(widget.alertes["complement"])}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2.6),
                            child: Text(
                              "Date: le ${(widget.alertes["date"] as Timestamp).toDate()}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2.6),
                            child: Text(
                              "heure: ${(widget.alertes["heure"])} H ${(widget.alertes["minutes"])}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2.6),
                            child: Text(
                              "Lieu : ${(widget.alertes["lieu"])}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2.6),
                            child: Text(
                              "prix : ${(widget.alertes["prix"])}" "€",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                        ],
                      )),
                ),
              ]);
  }
}
