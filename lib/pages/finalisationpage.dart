import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/drawer.dart';
import 'package:coiffeur/widgets/finalisationcommande.dart';
import 'package:coiffeur/widgets/historiquepage.dart';
import 'package:flutter/material.dart';

class FinalisationPage extends StatefulWidget {
  const FinalisationPage({ Key? key }) : super(key: key);

  @override
  State<FinalisationPage> createState() => _FinalisationPageState();
}

class _FinalisationPageState extends State<FinalisationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
        color: primarycolor,
        
        child: Scaffold(
          endDrawer: const Drawer(
          backgroundColor: Colors.white,
          child: DrawerLayout(),
        ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              iconTheme: const IconThemeData(color: secondarycolor),
              elevation: 0.0,
            backgroundColor: primarycolor,
            leading: Image.asset('assets/logocoiffeur.png'),
            bottom: const TabBar(
              labelColor: secondarycolor,
              indicatorColor: secondarycolor,
              tabs: <Widget> [
                Tab(
                  child: Text('Recherche'),
                  ),
                Tab(
                  child: Text('Historique'),
                  ),
                ],
              ),
            ),
          ),
          body:  const TabBarView(
            children: <Widget>[
              FinalisationCommande(),
              PageHistorique(),

            ],
          ),
          
        )
      )
    );
  }
}
