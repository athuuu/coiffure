import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';


class Calendrier extends StatefulWidget {
  const Calendrier({ Key? key }) : super(key: key);

  @override
  State<Calendrier> createState() => _CalendrierState();
}

class _CalendrierState extends State<Calendrier> {

  


   @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: primarycolor,
              title: const Text('choisissez un RDV',
              style: TextStyle(color: secondarycolor)),
            ),
            body: Stack(
              children: const <Widget>[
                
                
                
              ],
            )));
  }
}