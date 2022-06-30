import 'package:coiffeur/model/rdv.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final commandeStateProvider = Provider<CommandeState>((ref) {
  return CommandeState();
});

class CommandeState with ChangeNotifier {
  Rdv? rdv;

  setRdv(Rdv rdv) {
    this.rdv = rdv;
    notifyListeners();
  }
}
