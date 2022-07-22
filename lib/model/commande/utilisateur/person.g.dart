// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map json) => Person(
      id: json['id'] as String?,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      mail: json['mail'] as String,
      phone: json['phone'] as String?,
      adresse: json['adresse'] as String,
      cpltadresse: json['cpltadresse'] as String,
      photo: json['photo'] as String?,
      diplome: json['diplome'] as String?,
      experience: json['experience'] as int?,
      prestation: json['prestation'] as String?,
      coiffeur: json['coiffeur'] as bool? ?? false,
      idVendeur: json['idVendeur'] as String?,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'mail': instance.mail,
      'phone': instance.phone,
      'adresse': instance.adresse,
      'cpltadresse': instance.cpltadresse,
      'photo': instance.photo,
      'diplome': instance.diplome,
      'experience': instance.experience,
      'prestation': instance.prestation,
      'coiffeur': instance.coiffeur,
      'idVendeur': instance.idVendeur,
    };
