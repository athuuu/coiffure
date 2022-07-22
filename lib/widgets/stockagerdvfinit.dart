import 'package:coiffeur/model/rdv.dart';
import 'package:coiffeur/widgets/rdv_card_widget.dart';
import 'package:flutter/material.dart';

class StockageRdv extends StatelessWidget {
  const StockageRdv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      // RdvCardWidget(rdv: Rdv(adresse: 'hello', prestation: 'lissage', cpltadresse: '12300 Paris', createdTime: , nom: 'moi', prenom: 'toi', number: 3), index: 0,),
      const Text('rdv finit'), const Text('rdv finit')
    ]));
  }
}
