class Presta {
  final int? id;
  final String prestation, description, image, client, rdv;

  Presta(
      {required this.id,
      required this.prestation,
      required this.description,
      required this.image,
      required this.client,
      required this.rdv});
}

List<Presta> prestation = [
  Presta(
    id: 1,
    client: "",
    rdv: "",
    prestation: "",
    image: "assets/list3.png",
    description: "",
  ),
];
