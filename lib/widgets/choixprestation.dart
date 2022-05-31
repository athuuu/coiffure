import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/pages/boutique.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/choixhoraire.dart';
import 'package:flutter/material.dart';

class PageChoixPresta extends StatefulWidget {
  const PageChoixPresta({Key? key}) : super(key: key);

  @override
  State<PageChoixPresta> createState() => _PageChoixPrestaState();
}

class _PageChoixPrestaState extends State<PageChoixPresta> {
  final CollectionReference _prestas =
      FirebaseFirestore.instance.collection('prestas');
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
            child: Text('Hommes',
                style: TextStyle(
                  color: primarycolor,
                  fontSize: 20,
                  fontWeight: firstweight,
                )),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Boutique()));
          },
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
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: secondarycolor,
              border: Border.all(color: secondarycolor),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
                child: Text('1', style: TextStyle(color: primarycolor))),
          ),
          const SizedBox(
            child: Text('-------'),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: secondarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text('2', style: TextStyle(color: primarycolor)),
              )),
          const SizedBox(
            child: Text('-------'),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: primarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                  child: Text('3', style: TextStyle(color: secondarycolor)))),
          const SizedBox(
            child: Text('-------'),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: secondarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                  child: Text('4', style: TextStyle(color: primarycolor)))),
          const SizedBox(
            child: Text('-------'),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: secondarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                  child: Text('5', style: TextStyle(color: primarycolor)))),
        ],
      ),
      const SizedBox(height: 40),
      SizedBox(
          width: 360,
          height: 300,
          child: StreamBuilder(
              stream: _prestas.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(documentSnapshot["prestation"]),
                                Text(documentSnapshot["prix"].toString()),
                                Text(documentSnapshot["temps"]),
                                ElevatedButton(
                                  child: const Text('choisir'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PageChoixHoraire()));
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              secondarycolor)),
                                )
                              ],
                            ),
                          )
                        ]);
                      });
                }
                return const Text("hi");
              })),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 40)),
        ],
      )
    ]);
  }
}
