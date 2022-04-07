
import 'package:coiffeur/pages/boutique.dart';
import 'package:coiffeur/pages/thirdpageprocess.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class PageChoixsoin extends StatefulWidget {
  const PageChoixsoin({ Key? key }) : super(key: key);

  @override
  State<PageChoixsoin> createState() => _PageChoixsoinState();
}

class _PageChoixsoinState extends State<PageChoixsoin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              backgroundColor: MaterialStateProperty.all<Color>(secondarycolor)),
            child: Row(
              children: const [
                Icon(
                  Icons.add_circle_outline_outlined,
                  size: 30,
                color: primarycolor),
                Text('Boutique',
                style: TextStyle(
                  color:primarycolor,
                  fontSize: 20,
                  fontWeight: firstweight,
                )),
                
              ]),
          onPressed: () {
            Navigator.push(
              context, 
            MaterialPageRoute(builder: (context) => const Boutique()));
          },),
        ),
        const SizedBox(
          height: 40),
        const SizedBox(
          width: 300,
          child: Text(
            'Prendre un rendez-vous: ',
            style: TextStyle(fontSize: 23,
            fontWeight: firstweight)),
            ),
          const Padding(
            padding: EdgeInsets.only(right: 115.0),
            child: Text('en quelques clics seulement',
            style: TextStyle(fontSize: 13,
            fontWeight:firstweight)),
          ),
          const SizedBox(height:30),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height:30,
                decoration: BoxDecoration(
                  color: secondarycolor,
                  border: Border.all(color: secondarycolor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(child: Text('1',
                style: TextStyle(color:primarycolor)
                )
                  ),
                ),
                const SizedBox(
                  child: Text('-------'),
                ),
              Container(
                 width: 30,
                height:30,
                decoration: BoxDecoration(
                  color: primarycolor,
                  border: Border.all(color: secondarycolor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text('2',
                  style: TextStyle(color: secondarycolor)
                  ),
                )),
                const SizedBox(child: Text('-------'),),
              Container(
                 width: 30,
                height:30,
                decoration: BoxDecoration(
                  color: secondarycolor,
                  border: Border.all(color: secondarycolor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text('3',
                style: TextStyle(
                  color: primarycolor)
                ))),
                const SizedBox(child: Text('-------'),),
              Container(
                 width: 30,
                height:30,
                decoration: BoxDecoration(
                  color: secondarycolor,
                  border: Border.all(color: secondarycolor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const  Center(child: Text('4',
                style: TextStyle(color: primarycolor)))),
              ],
            ),
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: SizedBox(
                height: 80,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40)))),
                    backgroundColor: MaterialStateProperty.all<Color>(secondarycolor)
                  ),
                  child: const Text('Soins Bottox',
                  style: TextStyle(fontSize: 50)),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TabBarMenuThird()));
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: SizedBox(
                height: 80,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>( 
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40)
                        )
                      )
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(secondarycolor),
                  ),
                  child: const Text('Lissage',
                  style: TextStyle(fontSize: 50)),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TabBarMenuThird()));
                  }
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 IconButton(
                   onPressed: () {
                     Navigator.pop(context);
                   },
                  icon: const Icon(
                    Icons.arrow_back,
                  size: 40)),
                
              ],
            )    
      ]
    );
  }
}