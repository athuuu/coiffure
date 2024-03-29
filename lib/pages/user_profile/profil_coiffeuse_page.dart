import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/pages/accueil_coiffeuse.dart';
import 'package:coiffeur/pages/authentification/connexion.dart';
import 'package:coiffeur/pages/user_profile/client_numbers_widget.dart';
import 'package:coiffeur/pages/user_profile/client_profil.dart';

import 'package:coiffeur/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'coiffeuse_numbers_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CoiffeusePageV2 extends StatefulWidget {
  const CoiffeusePageV2({Key? key}) : super(key: key);

  @override
  State<CoiffeusePageV2> createState() => _CoiffeusePageV2State();
}

class _CoiffeusePageV2State extends State<CoiffeusePageV2> {
  Future uploadFile() async {
    Reference storageRef = storage.ref("coiffeuse").child('visage.jpeg');
    UploadTask uploadTask = storageRef.putFile(_image!);
    // ignore: avoid_print
    await uploadTask.whenComplete(() => print('File upload'));
  }

  File? _image;
  final picker = ImagePicker();
  Future getImage() async {
    // ignore: deprecated_member_use
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        // ignore: avoid_print
        print('pas d\'image selectionner ');
      }
    });
  }

  get user => FirebaseAuth.instance.currentUser;

  final CollectionReference _compte =
      FirebaseFirestore.instance.collection('comptecoiffeuse');

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(user.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyAppCoiffeuse()));
            },
            icon: const Icon(Icons.arrow_back, color: secondarycolor)),
      ),
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text("nous ne chargeons pas les données"));
            } else if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          const ImageStorageCoiffeuse(),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(secondarycolor)),
                            child: const Text('enregistrer une image'),
                            onPressed: () {
                              uploadFile();
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.email ?? '',
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Connexion()));
                          }, //la fonction signOut
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondarycolor,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.all(14),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                "Se déconnecter",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      const CoiffeuseNumbersWidget(),
                      const ClientNumbersWidget(),
                      const SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Container(
                  color: primarycolor,
                  child: StreamBuilder(
                    stream: _compte.snapshots(),
                    builder: (
                      context,
                      AsyncSnapshot<QuerySnapshot> streamSnapshot,
                    ) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        child: ListView.builder(
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              return Column(children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                Column(children: [
                                  Text(
                                    "non connecté",
                                    style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        documentSnapshot['nom'],
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        documentSnapshot['prenom'],
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   "non connecté",
                                  //   style: GoogleFonts.poppins(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ), mettre le display.name
                                ]),
                                const SizedBox(
                                  height: 24,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Connexion()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.all(14),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(width: 10),
                                        Text(
                                          "Se Connecter",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    )),
                                const SizedBox(
                                  height: 24,
                                ),
                                const ClientPageV2(),
                                const SizedBox(
                                  height: 48,
                                ),
                              ]);
                            }),
                      );
                    },
                  ),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondarycolor,
        child: const Icon(Icons.add_a_photo),
        onPressed: () {
          FutureBuilder(
              future: _getImage(context, "users/athu.jpeg"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 1.2,
                    // child: snapshot.data,
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const CircularProgressIndicator());
                }
                return Container();
              });
        },
      ),
    );
  }

  Widget buildAbout() => StreamBuilder(
      stream: _compte.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Container(
          height: 250,
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Column(children: [
                  const Text(
                    "Descriptions",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "Changez de description lorsque vous vous connecter a votre profil !",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    documentSnapshot['description'],
                    style: const TextStyle(fontSize: 16, height: 1.4),
                  ),
                ]);
              }),
        );
      });
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  // ignore: non_constant_identifier_names
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}

Future<Image?> _getImage(BuildContext context, String imageName) async {
  Image? image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(
      value.toString(),
      fit: BoxFit.scaleDown,
    );
  });
  return image;
}

class ImageStorageCoiffeuse extends StatelessWidget {
  const ImageStorageCoiffeuse({Key? key}) : super(key: key);

  Future<String> getProfilImageCoiffeuse() async {
    try {
      Reference ref = storage.ref('coiffeuse').child('visage.jpeg');
      String url = await ref.getDownloadURL();

      return url;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    String defaulUrl =
        'https://oasys.ch/wp-content/uploads/2019/03/photo-avatar-profil.png';
    return FutureBuilder<String>(
      future: getProfilImageCoiffeuse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          const Center(
            child: CircleAvatar(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if ((snapshot.hasError) || (!snapshot.hasData)) {
          Center(
            child: CircleAvatar(
              backgroundColor: secondarycolor,
              backgroundImage: NetworkImage(defaulUrl),
            ),
          );
        }
        return Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: secondarycolor,
            backgroundImage: NetworkImage(snapshot.data ?? defaulUrl),
          ),
        );
      },
    );
  }
}
