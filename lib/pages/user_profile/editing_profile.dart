import 'package:coiffeur/pages/user_profile/profile_widget.dart';
import 'package:coiffeur/pages/user_profile/user.dart';
import 'package:coiffeur/pages/user_profile/profil_coiffeuse_page.dart';
import 'package:flutter/material.dart';
import 'user_pref.dart';
import 'textfwid.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Usered user = UserPreferences.myUser;

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
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldWidget(
                label: "Description",
                text: user.about,
                maxLines: 5,
                onChanged: (about) {},
              ),
            ]),
      );
}
