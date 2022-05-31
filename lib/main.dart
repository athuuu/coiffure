import 'package:coiffeur/pages/accueil.dart';
import 'package:coiffeur/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'coiffeur_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'Create Table coiffeurs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    },
    version: 1,
  );

  // ignore: unused_element

  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      // ignore: avoid_print
      print('pas fais ');
    } else {
      // ignore: avoid_print
      print('fais: ' + user.email!);
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          child: DrawerLayout(),
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
