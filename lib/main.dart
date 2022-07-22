import 'package:coiffeur/pages/authentification/connexion.dart';

import 'package:coiffeur/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: unused_element

  await Firebase.initializeApp();
  // ignore: unused_local_variable
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      const Connexion();
      // ignore: avoid_print
      print('pas fais');
    } else {
      // ignore: avoid_print
      print('fais: ' + user.email!);
    }
  });
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Connexion(),
    );
  }
}
