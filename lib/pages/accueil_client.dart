import 'package:coiffeur/pages/accueil.dart';
import 'package:coiffeur/widgets/drawer_client.dart';
import 'package:flutter/material.dart';

class MyAppClient extends StatelessWidget {
  const MyAppClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        endDrawer: const Drawer(
          backgroundColor: Colors.white,
          child: DrawerLayoutClient(),
        ),
        appBar: AppBar(
          leading:
              Image.asset('assets/logocoiffeur.png', width: 35, height: 35),
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
            size: 20,
          ),
        ),
        body: const TabBarMenu(),
      ),
    );
  }
}
