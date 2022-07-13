import 'package:coiffeur/pages/user_profile/profil_coiffeuse_page.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CoiffeusePageV2(),
              ));
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const BouncingScrollPhysics(),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 24,
              ),
            ]),
      );
}
