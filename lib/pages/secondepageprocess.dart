import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/choixsoin.dart';
import 'package:coiffeur/widgets/drawer.dart';
import 'package:coiffeur/widgets/historiquepage.dart';
import 'package:flutter/material.dart';

class TabBarMenusecond extends StatefulWidget {
  const TabBarMenusecond({ Key? key }) : super(key: key);

  @override
  State<TabBarMenusecond> createState() => _TabBarMenusecondState();
}

class _TabBarMenusecondState extends State<TabBarMenusecond> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
        color: primarycolor,
        
        child:Scaffold(
          endDrawer: const Drawer(
          backgroundColor: Colors.white,
          child: DrawerLayout(),
        ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              iconTheme:const IconThemeData(color: secondarycolor),
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
          body: const TabBarView(
            children: <Widget>[
              PageChoixsoin(),
              PageHistorique(),

            ],
          ),
          
        )
      )
    );
  }
}