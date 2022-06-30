import 'package:coiffeur/pages/accueil_coiffeuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = CupertinoIcons.back;

  return AppBar(
    leading: IconButton(
      icon: const Icon(
        icon,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyAppCoiffeuse()));
      },
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
