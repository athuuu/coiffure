const String planning = 'rdv';

class Rdvfields {
  static final List<String> values = [
    id,
    createdTime,
    number,
    prestation,
    nom,
    prenom
  ];

  static const String id = '_id';
  static const String createdTime = 'createdTime';
  static const String number = 'number';
  static const String prestation = 'prestation';
  static const String nom = 'nom';
  static const String prenom = 'prenom';
}

class Rdv {
  final int? id;
  final DateTime createdTime;
  final int number;
  final String prestation;
  final String nom;
  final String prenom;

  const Rdv({
    this.id,
    required this.createdTime,
    required this.number,
    required this.prestation,
    required this.nom,
    required this.prenom,
  });

  Rdv copy({
    int? id,
    int? number,
    DateTime? createdTime,
    String? nom,
    String? prenom,
    String? prestation,
  }) =>
      Rdv(
          id: id ?? this.id,
          createdTime: createdTime ?? this.createdTime,
          prestation: prestation ?? this.prestation,
          nom: nom ?? this.nom,
          number: number ?? this.number,
          prenom: prenom ?? this.prenom);

  static Rdv fromJson(Map<String, Object?> json) => Rdv(
        id: json[Rdvfields.id] as int?,
        number: json[Rdvfields.number] as int,
        prestation: json[Rdvfields.prestation] as String,
        createdTime: DateTime.parse(json[Rdvfields.createdTime] as String),
        nom: json[Rdvfields.nom] as String,
        prenom: json[Rdvfields.prenom] as String,
      );

  Map<String, Object?> toJson() => {
        Rdvfields.id: id,
        Rdvfields.createdTime: createdTime,
        Rdvfields.prestation: prestation,
        Rdvfields.number: number,
        Rdvfields.nom: nom,
        Rdvfields.prenom: prenom,
      };
}
