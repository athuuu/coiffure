import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/data/rdvdatabase.dart';
import 'package:coiffeur/data/rdv_details_pages.dart';
import 'package:coiffeur/list/constant.dart';
import 'package:coiffeur/list/detaillist.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RdvPage extends StatefulWidget {
  const RdvPage({Key? key}) : super(key: key);

  @override
  State<RdvPage> createState() => _RdvPageState();
}

class _RdvPageState extends State<RdvPage> {
  late List<RdvPage> rdvs;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshRdv();
  }

  @override
  void dispose() {
    SqfDatabase.instance.close();

    super.dispose();
  }

  Future refreshRdv() async {
    setState(() => isLoading = true);

    rdvs = (await SqfDatabase.instance.readAllRdv()).cast<RdvPage>();

// page téléchargemetn
    FirebaseFirestore.instance
        .collection('alertes')
        .where('accepted', isEqualTo: true);

// page validation
    FirebaseFirestore.instance
        .collection('alertes')
        .where('accepted', isEqualTo: false)
        .where('declined', isEqualTo: false);

    setState(() => isLoading = false);
  }

  final CollectionReference _alertes =
      FirebaseFirestore.instance.collection('alertes');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        title: const Text(
          'Alertes rendez-vous',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _alertes.where("coiffeuse.id", isEqualTo: "123").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data!.docs.map((e) {
                final data = e.data() as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      //nos background
                      Container(
                        height: 136,
                        decoration: BoxDecoration(
                          boxShadow: const [kDefaultShadow],
                          borderRadius: BorderRadius.circular(22),
                          color: kBlackColor,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          height: 160,
                          width: 200,
                          child: Image.asset(
                            "assets/list1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // nom de la prestation , date , client et prix
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 136,
                          // l'image prend 200 en largeur , c'est pourquoi nous mettons la largeur total - 200
                          width: size.width - 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding,
                                ),
                                child: Text(
                                  "${(data["nom"])} ${(data["prenom"])}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Text(
                                  "Prestation : ${(data["prestation"])}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Text(
                                  "Date :  ${(data["date"] as Timestamp).toDate()}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              //occupe l'espace disponible
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      kDefaultPadding * 1.5, //30 padding
                                  vertical: kDefaultPadding / 4,
                                ),
                                decoration: const BoxDecoration(
                                  color: kSecondaryColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(22),
                                    topRight: Radius.circular(22),
                                  ),
                                ),
                                child: Text(
                                  "\$${(data["prix"])}",
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondarycolor,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RdvDetailPage(rdvId: 1)));

          refreshRdv();
        },
      ),
    );
  }

  Widget buildRdvs() => ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        // ignore: unused_local_variable
        final rdv = rdvs[index];

        return GestureDetector(
          onTap: () {
            refreshRdv();
          },
        );
      });
}
