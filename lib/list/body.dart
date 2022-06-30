import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/list/constant.dart';
import 'package:coiffeur/list/product_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyDetail extends StatefulWidget {
  const BodyDetail({Key? key}) : super(key: key);

  @override
  State<BodyDetail> createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  final databaseReference = FirebaseFirestore.instance;
  final CollectionReference _alertes =
      FirebaseFirestore.instance.collection('alertes');

  late Map<String, dynamic> alertes;

  @override
  Widget build(BuildContext context) {
    // ça permet de fournir la hauteur et largeur total
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: SizedBox(
            height: 600,
            width: 300,
            child: StreamBuilder(
                stream: _alertes.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          final documentSnapshot =
                              streamSnapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                          alertes = documentSnapshot;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: ProductPoster(
                                  size: size,
                                  image: 'assets/list3.png',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 2),
                                child: Text(
                                    "Client : ${(documentSnapshot["nom"])} ${(documentSnapshot["prenom"])}",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 2),
                                child: Text(
                                  "Prestation :  ${(documentSnapshot["prestation"])} ",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 2),
                                child: Text(
                                  "adresse : ${(documentSnapshot["adresse"])}",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 2),
                                child: Text(
                                  "complement d'adresse : ${(documentSnapshot["complement"])}",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              Text(
                                "${(documentSnapshot["prix"])}" "€",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: kSecondaryColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 2),
                                child: Text(
                                  "le ${(documentSnapshot["date"] as Timestamp).toDate()}",
                                  style: const TextStyle(color: kTextColor),
                                ),
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                            ],
                          );
                        }));
                  }
                  return const Text('rdv prévu');
                }),
          ),
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
              ElevatedButton(
                  onPressed: () async {
                    await _alertes.doc("wFDwElj9Xu5Uh6JPwhgH").update(
                      {
                        "coiffeuse": {
                          "id": "123",
                          "name": "test",
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
                  onPressed: () {},
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
