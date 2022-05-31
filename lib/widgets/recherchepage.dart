import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/choixsoin.dart';
import 'package:flutter/material.dart';

class PageRecherche extends StatefulWidget {
  const PageRecherche({
    Key? key,
  }) : super(key: key);

  @override
  State<PageRecherche> createState() => _PageRechercheState();
}

class _PageRechercheState extends State<PageRecherche> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(right: 130),
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
            child: Row(children: const [
              Icon(Icons.add_circle_outline_outlined,
                  size: 30, color: primarycolor),
              Text('Boutique',
                  style: TextStyle(
                    color: primarycolor,
                    fontSize: 20,
                    fontWeight: firstweight,
                  )),
            ]),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 40),
        const SizedBox(
          width: 300,
          child: Text('Trouver une coiffeuse pour votre lissage',
              style: TextStyle(fontSize: 23, fontWeight: firstweight)),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 115.0),
          child: Text('en quelques clics seulement',
              style: TextStyle(fontSize: 13, fontWeight: firstweight)),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: primarycolor,
                border: Border.all(color: secondarycolor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(child: Text('1')),
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
                  color: secondarycolor,
                  border: Border.all(color: secondarycolor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                    child: Text('3', style: TextStyle(color: primarycolor)))),
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
        const SizedBox(height: 60),
        Container(
          margin: const EdgeInsets.only(right: 80),
          height: 35,
          width: 210,
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
            child: const Text('Nombres de personnes',
                style: TextStyle(
                  color: primarycolor,
                  fontSize: 17,
                )),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
            height: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    border: Border.all(color: secondarycolor),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _decrementCounter();
                      (_counter);
                    },
                    child: const Center(
                      child: Text('-',
                          style:
                              TextStyle(color: secondarycolor, fontSize: 30)),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: secondarycolor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 120,
                    height: 200,
                    child: Center(
                      child: Text('$_counter',
                          style: const TextStyle(fontSize: 70)),
                    )),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    border: Border.all(color: secondarycolor),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _incrementCounter();
                      // ignore: avoid_print
                      print(_counter);
                    },
                    child: const Center(
                      child: Text('+',
                          style:
                              TextStyle(color: secondarycolor, fontSize: 30)),
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 1),
            Padding(
              padding: const EdgeInsets.only(right: 40),
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
                child: const Text('Suivant',
                    style: TextStyle(
                      color: primarycolor,
                      fontSize: 15,
                      fontWeight: firstweight,
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageChoixsoin()),
                  );
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
