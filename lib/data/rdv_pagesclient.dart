import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coiffeur/listClient/constant.dart';
import 'package:coiffeur/listClient/detaillist.dart';
import 'package:coiffeur/state/user_state.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class RdvPageClient extends ConsumerStatefulWidget {
  const RdvPageClient({Key? key}) : super(key: key);

  @override
  ConsumerState<RdvPageClient> createState() => _RdvPageClientState();
}

class _RdvPageClientState extends ConsumerState<RdvPageClient> {
  late List<RdvPageClient> rdvs;
  bool isLoading = false;

  Future refreshRdv() async {
    setState(() => isLoading = true);

// page téléchargemetn
    FirebaseFirestore.instance
        .collection('alertescoiffeuse')
        .where('accepted', isEqualTo: true);

// page validation
    FirebaseFirestore.instance
        .collection('alertescoiffeuse')
        .where('accepted', isEqualTo: false)
        .where('declined', isEqualTo: false);

    setState(() => isLoading = false);
  }

  final CollectionReference _alertes =
      FirebaseFirestore.instance.collection('alertescoiffeuse');

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider);
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
        stream: userState.user!.idVendeur != null
            ? _alertes
                .where("coiffeuse.id",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots()
            : _alertes
                .where("coiffeuse.id", isNull: false)
                .where('clientId',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data!.docs.map((e) {
                final data = e.data() as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          alerte: data,
                        ),
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
                            "assets/athu.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

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
