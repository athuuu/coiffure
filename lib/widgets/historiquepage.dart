import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class PageHistorique extends StatefulWidget {
  const PageHistorique({ Key? key }) : super(key: key);

  @override
  State<PageHistorique> createState() => _PageHistoriqueState();
}

class _PageHistoriqueState extends State<PageHistorique> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primarycolor,
      child: Column(
        children:  [
        const SizedBox(height: 60),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left:30.0),
              child: Text('Votre dernière prestation',
              style: TextStyle(fontSize: 20,
              fontWeight: firstweight)),
            ),
            SizedBox(height:5),
            ],
          ),
            Image.asset(
              'assets/tableauhisto.png',
            width: 310,
            height: 100
          ),
          const SizedBox(height: 40),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text('Votre galerie photo : ',
                style: TextStyle(fontSize: 20,
                fontWeight: firstweight)
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Text('Avant',
                    style: TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 20,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/coiffureavant.png',
                      width: 120,
                      height: 120),
                    )
                  ]
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Après',
                  style: TextStyle(fontSize: 18)),
                  const SizedBox(
                    height: 20,
                  ),
                   ClipRRect(
                     borderRadius: BorderRadius.circular(15),
                     child: Image.asset(
                        'assets/coiffureapres.png',
                        width: 120,
                        height: 120,
                        ),
                   ),
                ]
              )
            ],
          ),
            const SizedBox(height: 60),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top : BorderSide(
                  color:  Color.fromARGB(255, 224, 223, 223) ,
                  width: 1.0,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(top: 30.0),
                        child:  Text('Votre dernière commande',
                        style: TextStyle(fontSize: 20,
                        fontWeight: firstweight)),
                      ),
                      const Text('shampooing Balmain 300ml'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('19,99€',
                          style: TextStyle()),
                          Padding(
                            padding: const EdgeInsets.only(right: 80.0),
                            child: TextButton(
                              child : const Text(
                                'REÇU',
                              style: TextStyle(color: secondarycolor,
                              fontWeight: firstweight)),
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                  title: Image.asset('assets/logocoiffeur.png',
                                  width: 80,
                                  height:80),
                                    content: SizedBox(
                                      height: 85,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('en cours de developpement',
                                          style: TextStyle(fontSize: 18,
                                          fontWeight: firstweight)),
                                          Text('fonctionnalité en cours de développement'),
                                        ],
                                      ),
                                    ),
                                      actions: <Widget>[
                                         TextButton(
                                           style: ButtonStyle(
                                             shape: MaterialStateProperty.all<OutlinedBorder>(
                                               RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(20),
                                               ),
                                             ),
                                             backgroundColor: MaterialStateProperty.all<Color>(secondarycolor),
                                           ),
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                           child: const Text('Ok, J\'ai compris',
                                           style: TextStyle(color:primarycolor)),
                                          ),
                                        
                                      ],
                                    )
                                  );
                              }
                            ),
                          )
                        ])
                    ]
                  ),
                ),
              )
        ],
      ),
    );
  }
}