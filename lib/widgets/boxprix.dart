import 'package:coiffeur/pages/finalisationpage.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class BoxPrix extends StatelessWidget {
  const BoxPrix({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        
        Column(
          children: [
            const SizedBox(height: 2),
            Container(
              color: Colors.grey,
                    width: 60,
                    height: 20,
                    child: IconButton(
                      iconSize: 16,
                      icon: const Icon(                                               
                        Icons.done,
                        color: primarycolor,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FinalisationPage()),
                          );
                        },
                      ),
                 ),
          ],
        );
      
  }
}