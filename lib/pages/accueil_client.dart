import 'package:coiffeur/pages/accueil.dart';
import 'package:coiffeur/widgets/drawer_client.dart';
import 'package:flutter/material.dart';

class MyAppClient extends StatelessWidget {
  const MyAppClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: DrawerLayoutClient(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/logocoiffeur.png', width: 60, height: 60),
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
