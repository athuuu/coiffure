import 'package:coiffeur/model/commande/commande.dart';
import 'package:flutter/material.dart';

const primarycolor = Colors.white;
const secondarycolor = Colors.black;
const thirdcolor = Colors.deepOrange;
const fourthcolor = Colors.grey;
const firstweight = FontWeight.bold;
const firstsize = 20.0;
const secondsize = 30.0;

class CommandeInfos {
  static final CommandeInfos _commandeinfos = CommandeInfos._internal();

  factory CommandeInfos() {
    return _commandeinfos;
  }

  CommandeInfos._internal();

  static CommandeInfos get shared => _commandeinfos;

  Commande? commande;
}
