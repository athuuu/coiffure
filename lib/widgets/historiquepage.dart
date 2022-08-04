import 'package:coiffeur/utils/utils.dart';

import 'package:flutter/material.dart';

class PageHistorique extends StatefulWidget {
  const PageHistorique({Key? key}) : super(key: key);

  @override
  State<PageHistorique> createState() => _PageHistoriqueState();
}

class _PageHistoriqueState extends State<PageHistorique> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primarycolor,
      child: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text('Votre dernière prestation',
                    style: TextStyle(fontSize: 20, fontWeight: firstweight)),
              ),
              SizedBox(height: 5),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Color.fromARGB(255, 224, 223, 223),
                width: 1.0,
              ),
            )),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Affichage des rendez-vous passés'),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: TextButton(
                                child: const Text('REÇU',
                                    style: TextStyle(
                                        color: secondarycolor,
                                        fontWeight: firstweight)),
                                onPressed: () {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Image.asset(
                                                'assets/logocoiffeur.png',
                                                width: 80,
                                                height: 80),
                                            content: SizedBox(
                                              height: 85,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                      'information de la prestation',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              firstweight)),
                                                  Text(
                                                      'prix, date, temps, lieu et repasser un rendez-vous'),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all<OutlinedBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          secondarycolor),
                                                ),
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text('Ok',
                                                    style: TextStyle(
                                                        color: primarycolor)),
                                              ),
                                            ],
                                          ));
                                }),
                          )
                        ]),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Text('prochain rendez-vous',
                          style:
                              TextStyle(fontSize: 20, fontWeight: firstweight)),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
