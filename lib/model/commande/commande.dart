class Commande {
  late final int _id;
  late String _nom;
  late String _prenom;
  late String _genre;
  late int _nombre;
  late String _prestation;
  late String _date;
  late String _heure;
  late String _lieu;
  late String _adresse;
  late String _complementadresse;

  Commande({
    String? nom,
    String? prenom,
    String? genre,
    int? nombre,
    String? prestation,
    DateTime? date,
    String? heure,
    String? lieu,
    String? adresse,
    String? complementadresse,
  })  : _nom = nom ?? "",
        _nombre = nombre ?? 0;

  get getId => _id;

  get getNom => _nom;

  set setNom(String nom) => _nom = nom;

  get getPrenom => _prenom;

  set setPrenom(String prenom) => _prenom = prenom;

  get getGenre => _genre;

  set setGenre(String genre) => _genre = genre;

  get getNombre => _nombre;

  set setNombre(String nombre) => _nombre = nombre as int;

  get getPrestation => _prestation;

  set setPrestation(String prestation) => _prestation = prestation;

  get getDate => _date;

  set setDate(String date) => _date = date;

  get getHeure => _heure;

  set setHeure(String heure) => _heure = heure;

  get getLieu => _lieu;

  set setLieu(String lieu) => _lieu = lieu;

  get getAdresse => _adresse;

  set setAdresse(String adresse) => _adresse = adresse;

  get getComplementadresse => _complementadresse;

  set setComplementadresse(String complementadresse) =>
      _complementadresse = complementadresse;
}
