import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/boxprix.dart';
import 'package:coiffeur/widgets/boxtick.dart';
import 'package:flutter/material.dart';

class ChoixCoiffeur extends StatelessWidget {
  const ChoixCoiffeur({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                        width: 350,
                        height: 370,
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(0,8,0,0),
                          children: [ 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Salima.K',
                                style: TextStyle(
                                  fontWeight: firstweight,
                                  color: primarycolor,
                                  fontSize: firstsize)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                  ],
                                ),
                              ElevatedButton(
                                child: const Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: secondarycolor)),
                                
                                onPressed: (){
                                  showModalBottomSheet(
                                    context: context, 
                                    builder: (BuildContext context) {
                                      return Container(
                                        color: secondarycolor,
                                        height: 600,
                                        child: Column(
                                          children: [
                                             const SizedBox(height: 10),
                                            SizedBox(
                                             width: 300,
                                             height: 50,
                                             child: ElevatedButton(
                                              style:  ButtonStyle(
                                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                                const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(30)))),
                                              backgroundColor: MaterialStateProperty.all<Color>(primarycolor)),
                                                child: const Text(
                                                  'Cliquez sur le bouton qui correspond à votre longueur',
                                                style: TextStyle(
                                              color: secondarycolor, fontSize: 16)),
                                              onPressed: () {},
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                              const Text('Salima.k',
                                              style: TextStyle(color: primarycolor, fontSize: secondsize)),
                                              Row(
                                                children: const [
                                                Icon(Icons.star,
                                                color: primarycolor,
                                                size: secondsize),
                                                Icon(Icons.star,
                                                color: primarycolor,
                                                size: secondsize),
                                                Icon(Icons.star,
                                                color: primarycolor,
                                                size: secondsize),
                                                Icon(Icons.star,
                                                color: primarycolor,
                                                size: secondsize),
                                                Icon(Icons.star,
                                                color: primarycolor,
                                                size: secondsize),],)
                                            ],),
                                            const SizedBox(height:20),
                                            Container(
                                              color: primarycolor,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 200,
                                                      height: 338,
                                                    child: Image.asset(                                                     
                                                      'assets/femmeimage.jpg',                                                     
                                                      fit: BoxFit.fill,
                                                      ),
                                                  ),
                                                   SizedBox(
                                                    child: Column(
                                                      mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                                      children: const [
                                                        SizedBox(height: 26),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        BoxTick(),
                                                        
                                                      ],
                                                    )
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: const [
                                                        SizedBox(height:8),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                        BoxPrix(),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      const SizedBox(height: 200),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 30.0),
                                                        child: IconButton(
                                                          icon: const Icon(Icons.arrow_back,
                                                          size: 30),
                                                          onPressed:() {
                                                            Navigator.pop(context);
                                                          }),
                                                      ),
                                                    ],
                                                  )
                                                ]
                                              ),
                                            )
                                          ]
                                        )
                                      );
                                      }
                                    );
                                  },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                     const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(40)))),
                                  backgroundColor: MaterialStateProperty.all(primarycolor)
                                ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('laurie.D',
                                style: TextStyle(
                                  fontWeight: firstweight,
                                  color: primarycolor,
                                  fontSize: firstsize)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                  ],
                                ),
                              ElevatedButton(
                                child: const Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: secondarycolor)),
                                
                                onPressed: (){

                                  },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                     const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(40)))),
                                  backgroundColor: MaterialStateProperty.all(primarycolor)
                                ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Sylvie.L',
                                style: TextStyle(
                                  fontWeight: firstweight,
                                  color: primarycolor,
                                  fontSize: firstsize)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                  ],
                                ),
                              ElevatedButton(
                                child: const Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: secondarycolor)),
                                
                                onPressed: (){

                                  },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                     const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(40)))),
                                  backgroundColor: MaterialStateProperty.all(primarycolor)
                                ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Laura.F',
                                style: TextStyle(
                                  fontWeight: firstweight,
                                  color: primarycolor,
                                  fontSize: firstsize)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                  ],
                                ),
                              ElevatedButton(
                                child: const Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: secondarycolor)),
                                
                                onPressed: (){

                                  },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                     const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(40)))),
                                  backgroundColor: MaterialStateProperty.all(primarycolor)
                                ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Jamila.A',
                                style: TextStyle(
                                  fontWeight: firstweight,
                                  color: primarycolor,
                                  fontSize: firstsize)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                  ],
                                ),
                              ElevatedButton(
                                child: const Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: secondarycolor)),
                                
                                onPressed: (){

                                  },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                     const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(40)))),
                                  backgroundColor: MaterialStateProperty.all(primarycolor)
                                ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Alicia.F',
                                style: TextStyle(
                                  fontWeight: firstweight,
                                  color: primarycolor,
                                  fontSize: firstsize)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                  ],
                                ),
                              ElevatedButton(
                                child: const Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: secondarycolor)),
                                
                                onPressed: (){

                                  },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                     const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(40)))),
                                  backgroundColor: MaterialStateProperty.all(primarycolor)
                                ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Fatima.O',
                                style: TextStyle(
                                  fontWeight: firstweight,
                                  color: primarycolor,
                                  fontSize: firstsize)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                  ],
                                ),
                              ElevatedButton(
                                child: const Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: secondarycolor)),
                                
                                onPressed: (){

                                  },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                     const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(40)))),
                                  backgroundColor: MaterialStateProperty.all(primarycolor)
                                ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Karima.E',
                                style: TextStyle(
                                  fontWeight: firstweight,
                                  color: primarycolor,
                                  fontSize: firstsize)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                    Icon(
                                      Icons.star_outline,
                                      size: secondsize,
                                      color: primarycolor),
                                  ],
                                ),
                              ElevatedButton(
                                child: const Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: secondarycolor)),
                                
                                onPressed: (){

                                  },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                     const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(40)))),
                                  backgroundColor: MaterialStateProperty.all(primarycolor)
                                ),
                                )
                              ],
                            ),
                          ]
                        ),
                      );
  }
}