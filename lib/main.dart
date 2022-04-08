import 'package:coiffeur/pages/accueil.dart';
import 'package:coiffeur/widgets/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return  MaterialApp(
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
          leading: Image.asset('assets/logocoiffeur.png',

          width: 35,
          height: 35),
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




