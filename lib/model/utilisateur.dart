import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Utilisateur {
  Utilisateur({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.mail,
    required this.phone,
    required this.adresse,
    required this.cpltadresse,
    this.photo,
    this.diplome,
    this.experience,
    this.prestation,
    this.coiffeur = false,
  });

  final int id;
  final String nom;
  final String prenom;
  final String mail;
  final String phone;
  final String adresse;
  final String cpltadresse;
  String? photo;
  String? diplome;
  int? experience;
  String? prestation;
  bool coiffeur;
}
