import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coiffeur/pages/accueil_client.dart';
import 'package:coiffeur/pages/authentification/connexion.dart';
import 'package:coiffeur/pages/user_profile/client_numbers_widget.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coiffeur/pages/user_profile/user_pref.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ClientPageV2 extends StatefulWidget {
  const ClientPageV2({Key? key}) : super(key: key);

  @override
  State<ClientPageV2> createState() => _ClientPageV2State();
}

FirebaseStorage storage = FirebaseStorage.instance;

class _ClientPageV2State extends State<ClientPageV2> {
  Future uploadFile() async {
    Reference storageRef = storage.ref("users").child('salmon.jpeg');
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

  FirebaseAuth auth = FirebaseAuth.instance;
  get user => FirebaseAuth.instance.currentUser;
  final DocumentReference _compteclient = FirebaseFirestore.instance
      .collection('compteclient')
      .doc(UserPreferences().user!.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        elevation: 0,
        leading: IconButton(
          color: secondarycolor,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyAppClient()));
          },
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text("une erreur s'est produite"));
            } else if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: SizedBox(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const ImageStorage(),
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
                      Column(children: [
                        Text(
                          user.email,
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ]),
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
                          },
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
                      stream: _compteclient.snapshots(),
                      builder: (context,
                          AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
                        if (streamSnapshot.data == null) return const Text('');
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                          child: ListView(children: [
                            Column(children: [
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
                                    auth.signOut();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Connexion()));
                                  },
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
                              const Text('vous n\'êtes pas connecté'),
                              const SizedBox(
                                height: 48,
                              ),
                            ]),
                          ]),
                        );
                      }),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondarycolor,
        child: const Icon(Icons.add_a_photo),
        onPressed: () {
          getImage();
        },
      ),
    );
  }
}

class ImageStorage extends StatelessWidget {
  const ImageStorage({Key? key}) : super(key: key);

  Future<String> getProfilImage() async {
    try {
      Reference ref = storage.ref('users').child('athu.jpeg');
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
      future: getProfilImage(),
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
