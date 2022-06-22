import 'package:coiffeur/pages/accueil.dart';
import 'package:coiffeur/widgets/drawer_coiffeur.dart';
import 'package:flutter/material.dart';

class MyAppCoiffeuse extends StatelessWidget {
  const MyAppCoiffeuse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        backgroundColor: Colors.white,
        child: DrawerLayoutCoiffeur(),
      ),
      appBar: AppBar(
        leading: Image.asset('assets/logocoiffeur.png', width: 35, height: 35),
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
      ),
      body: const TabBarMenu(),
    );
  }
}
