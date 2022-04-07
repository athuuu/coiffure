import 'package:bordered_text/bordered_text.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/drawer.dart';
import 'package:coiffeur/widgets/shampooing.dart';
import 'package:flutter/material.dart';


class Boutique extends StatelessWidget {
  const Boutique({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        
      ),
      
    
      home: Scaffold(
        endDrawer: const Drawer(
          backgroundColor: Colors.white,
          child: DrawerLayout(),
        ),

        appBar: AppBar(
          leading: Image.asset(
            'assets/logocoiffeur.png',

          width: 35,
          height: 35),
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
            size: 20,
          ),
        ),
        body: Column(
          children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 200,
                  height: 40,
                  decoration : BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: secondarycolor
                  ),
                  child: Center(
                    child: Row(
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: BorderedText( 
                          strokeWidth: 2.0,
                          child: const Text('La ',
                     style: TextStyle(color: primarycolor, fontSize: 30),
                          ),
                        ),
                      ),
                       const Text('Boutique', 
                       style: TextStyle(fontWeight: firstweight, fontSize: 30, color: primarycolor)),
                    
                      ]
                  ),
                ),
              ),
            
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  
                  children: const [
                    Text(
                      'Lissage',
                      style: TextStyle(
                        fontWeight: firstweight,
                        fontSize: 19),
                    ),
                    
                  ],
                ),
              ),
                 
              const ShampooingProduit(),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  
                  children: const [
                    Text(
                      'Shampooing & apres-shampoing',
                      style: TextStyle(
                        fontWeight: firstweight,
                        fontSize: 19),
                    ),
                  ],
                ),
              ),
              const ShampooingProduit() ,
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  
                  children: const [
                    Text(
                      'Soins et Réparations',
                      style: TextStyle(
                        fontWeight: firstweight,
                        fontSize: 19),
                    ),
                   
                  ],
                ),
              ),
              const ShampooingProduit(),
              Container(
                width: 400,
               decoration: const  BoxDecoration(
                 border: Border(
                   top: BorderSide(color: Colors.grey, width: 1.0)
                   ),
                ),
              child: IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.grey,
                  size: 40),
                onPressed: () {

                },
              ),
            ),
            const Text('Voir plus',
            style: TextStyle(fontSize: 12))
          ]
        ),
      )
    );
  }
}

