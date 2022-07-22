import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  Person({
    this.id,
    required this.nom,
    required this.prenom,
    required this.mail,
    this.phone,
    required this.adresse,
    required this.cpltadresse,
    this.photo,
    this.diplome,
    this.experience,
    this.prestation,
    this.coiffeur = false,
    this.idVendeur,
  });

  String? id;
  final String nom;
  final String prenom;
  final String mail;
  String? phone;
  final String adresse;
  final String cpltadresse;
  String? photo;
  String? diplome;
  int? experience;
  String? prestation;
  bool coiffeur;
  String? idVendeur;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
