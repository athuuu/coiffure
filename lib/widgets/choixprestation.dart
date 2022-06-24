import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class PageChoixPresta extends StatefulWidget {
  const PageChoixPresta({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(height: 30),
          SizedBox(
            height: 40,
            width: 140,
            child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondarycolor)),
              child: const Center(
                child: Text('Prestations',
                    style: TextStyle(
                      color: primarycolor,
                      fontSize: 20,
                      fontWeight: firstweight,
                    )),
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 40),
          const SizedBox(
            width: 300,
            child: Text('Prendre un rendez-vous: ',
                style: TextStyle(fontSize: 23, fontWeight: firstweight)),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 115.0),
            child: Text('en quelques clics seulement',
                style: TextStyle(fontSize: 13, fontWeight: firstweight)),
          ),
          SizedBox(
              width: 360,
              height: 300,
              child: StreamBuilder(
                  stream: _prestas.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final documentSnapshot =
                                streamSnapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;

                            return Column(children: <Widget>[
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: secondarycolor))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child: Text(
                                            documentSnapshot["prestation"])),
                                    SizedBox(
                                        width: 30,
                                        child: Text(documentSnapshot["prix"]
                                            .toString())),
                                    Text(documentSnapshot["temps"]),
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              )
                            ]);
                          });
                    }
                    return const Text("hi");
                  })),
          TextButton(
              onPressed: () {}, child: const Text('indiquer votre longueur'))
        ]),
      ),
    );
  }
}
