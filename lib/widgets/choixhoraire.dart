import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/pages/boutique.dart';
import 'package:coiffeur/utils/utils.dart';

import 'package:coiffeur/widgets/choixcoiffeur.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PageChoixHoraire extends StatefulWidget {
  const PageChoixHoraire({ Key? key }) : super(key: key);

  @override
  State<PageChoixHoraire> createState() => _PageChoixHoraireState();
}

class _PageChoixHoraireState extends State<PageChoixHoraire> {
  final databaseReference = FirebaseFirestore.instance;
  String _val = '';

  Future _selectDate() async{

    DateTime? picker = await showDatePicker(
      context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime(2021), 
    lastDate: DateTime(2030),
    builder: (context, child){
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            onPrimary: secondarycolor,
            onSurface: primarycolor,
            primary: thirdcolor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: primarycolor,
              textStyle: const TextStyle(color: thirdcolor)
            ),
          ),
        ),
        child: child!,
        );
    },
    );

    if( picker!= null ) {
      setState((){
      _val = picker.toString();
    });
    }
  }
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
                  child: Text('2',
                  style: TextStyle(color: primarycolor)
                  ),
                )),
                const SizedBox(child: Text('-------'),),
              Container(
                 width: 30,
                height:30,
                decoration: BoxDecoration(
                  color: primarycolor,
                  border: Border.all(color: secondarycolor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text('3',
                style: TextStyle(
                  color: secondarycolor)
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
            const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ 
              SizedBox(
                height: 30,
                child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                                    ),
                                  ),
                                ),
                        backgroundColor: MaterialStateProperty.all<Color>(secondarycolor)),
                              child:  const Text('Date',
                              style: TextStyle(
                                color:primarycolor,
                                fontSize: 15,
                                fontWeight: firstweight,
                              )   
                            ),
                          onPressed: () {
                            
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left : 20.0),
                      child: Container(
                        margin: const EdgeInsets.only(right: 30),
                        height: 30,
                        child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                      ),
                                    ),
                                  ),
                          backgroundColor: MaterialStateProperty.all<Color>(secondarycolor)),
                                child:  const Text('Heures',
                                style: TextStyle(
                                  color:primarycolor,
                                  fontSize: 15,
                                  fontWeight: firstweight,
                                )   
                              ),
                            onPressed: () {
                              
                            },
                        ),
                      ),
                    ),
                ]
              ),
              const SizedBox(height: 15),
          Row(
            children: [ 
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                      ),
                                    ),
                                  ),
                          backgroundColor: MaterialStateProperty.all<Color>(secondarycolor)),
                                child:  Text( 
                                  _val,
                                style: const TextStyle(
                                  color:primarycolor,
                                  fontSize: 17,
                                  fontWeight: firstweight,
                                )   
                              ),
                            onPressed: () {
                              
                            },
                        ),
                ),
              ),
                    IconButton(
                      onPressed: () {
                        
                         _selectDate();
                         addDataToFirebase();
                        
                      },
                      icon: const Icon(Icons.calendar_month_outlined)),
                    
                       
                    
                  
          ]),
          const SizedBox(height: 40),
                  SizedBox(
                        height: 40,
                        width: 300,
                        child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                      ),
                                    ),
                                  ),
                          backgroundColor: MaterialStateProperty.all<Color>(secondarycolor)),
                                child:  const Text('A domicile',
                                style: TextStyle(
                                  color:primarycolor,
                                  fontSize: 15,
                                  fontWeight: firstweight,
                                )   
                              ),
                            onPressed: () {
                              showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 600,
                color: secondarycolor,
                child: Center(
                  child: Column(
                   
                    children: <Widget>[
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style:  ButtonStyle(
                            shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                      ),
                                    ),
                                  ),
                            backgroundColor: MaterialStateProperty.all<Color>(primarycolor)),
                          child: const Text('Choisissez une coiffeuse parmis nos partenaires',
                          style: TextStyle(color: secondarycolor, fontSize: 20)),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Coiffeuses disponibles', 
                        style: TextStyle(color: primarycolor,
                        fontSize: firstsize)
                      ),
                      const ChoixCoiffeur()
                    ],
                  ),
                ),
              );
            },
          );
                            },
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                      ),
                                    ),
                                  ),
                          backgroundColor: MaterialStateProperty.all<Color>(secondarycolor)),
                                child:  const Text('Chez la coiffeuse',
                                style: TextStyle(
                                  color:primarycolor,
                                  fontSize: 15,
                                  fontWeight: firstweight,
                                )   
                              ),
                            onPressed: () {
                              showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 600,
                color: secondarycolor,
                child: Center(
                  child: Column(
                   
                    children: <Widget>[
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style:  ButtonStyle(
                            shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                      ),
                                    ),
                                  ),
                            backgroundColor: MaterialStateProperty.all<Color>(primarycolor)),
                          child: const Text('Choisissez une coiffeuse parmis nos partenaires',
                          style: TextStyle(color: secondarycolor, fontSize: 20)),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Coiffeuses disponibles', 
                        style: TextStyle(color: primarycolor,
                        fontSize: firstsize)
                      ),
                      const ChoixCoiffeur()
                    ],
                  ),
                ),
              );
            },
          );
                            },
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                      ),
                                    ),
                                  ),
                          backgroundColor: MaterialStateProperty.all<Color>(secondarycolor)),
                                child:  const Text('En salon',
                                style: TextStyle(
                                  color:primarycolor,
                                  fontSize: 15,
                                  fontWeight: firstweight,
                                )   
                              ),
                            onPressed: () {
                              showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 600,
                color: secondarycolor,
                child: Center(
                  child: Column(
                   
                    children: <Widget>[
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style:  ButtonStyle(
                            shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                      ),
                                    ),
                                  ),
                            backgroundColor: MaterialStateProperty.all<Color>(primarycolor)),
                          child: const Text('Choisissez une coiffeuse parmis nos partenaires',
                          style: TextStyle(color: secondarycolor, fontSize: 20)),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Coiffeuses disponibles', 
                        style: TextStyle(color: primarycolor,
                        fontSize: firstsize)
                      ),
                      const ChoixCoiffeur()
                    ],
                  ),
                ),
              );
            },
          );
                            },
                        ),
                      ),
                      const SizedBox(height: 60),
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
  void addDataToFirebase(){
    try {
      databaseReference.collection('client').add({
      "prenom" : "josephine",
      "nom" : "dupont",
      "dateinscription": "23 avril 2022"
    // ignore: avoid_print
    }).then((value) => print(value.id) );
    }catch (error) {
      // ignore: avoid_print
      print(error.toString());
    }
  }
}