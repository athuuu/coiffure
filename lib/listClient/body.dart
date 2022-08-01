import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/listClient/constant.dart';
import 'package:coiffeur/listClient/product_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _alertesRef = FirebaseFirestore.instance.collection('alertes');

class BodyDetail extends StatefulWidget {
  const BodyDetail({Key? key, required this.alerte}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final alerte;

  @override
  State<BodyDetail> createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  final databaseReference = FirebaseFirestore.instance;

  late Map<String, dynamic> alertes;

  @override
  Widget build(BuildContext context) {
    // ça permet de fournir la hauteur et largeur total
    Size size = MediaQuery.of(context).size;

    return widget.alerte == null
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
                              "Client : ${(widget.alerte["nom"])} ${(widget.alerte["prenom"])}",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2.7),
                          child: Text(
                            "Prestation :  ${(widget.alerte["prestation"])} ",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2.6),
                          child: Text(
                            "adresse : ${(widget.alerte["adresse"])}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2.6),
                          child: Text(
                            "complement d'adresse : ${(widget.alerte["complement"])}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2.6),
                          child: Text(
                            "Date: le ${(widget.alerte["date"] as Timestamp).toDate()}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2.6),
                          child: Text(
                            "heure: ${(widget.alerte["heure"])} H ${(widget.alerte["minutes"])}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2.6),
                          child: Text(
                            "Lieu : ${(widget.alerte["lieu"])}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2.6),
                          child: Text(
                            "prix : ${(widget.alerte["prix"])}" "€",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // if (_alertes.id == AuthFirebase.currentUser.uid)
                    ElevatedButton(
                        onPressed: () async {
                          // ignore: unused_local_variable
                          String? currentUser =
                              FirebaseAuth.instance.currentUser?.uid;
                          await _alertesRef.doc(widget.alerte["id"]).update(
                            {
                              "coiffeuse": {
                                "id": FirebaseAuth.instance.currentUser!.uid,
                              }
                            },
                          );
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              "Accepter",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )),

                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              "Refuser",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ],
          );
  }
}
