import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/historiquepage.dart';
import 'package:coiffeur/widgets/recherchepage.dart';
import 'package:flutter/material.dart';

class TabBarMenu extends StatefulWidget {
  const TabBarMenu({Key? key}) : super(key: key);

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu> {
  final contenu = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Container(
            color: primarycolor,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: AppBar(
                  elevation: 0.0,
                  backgroundColor: secondarycolor,
                  bottom: const TabBar(
                    labelColor: primarycolor,
                    indicatorColor: primarycolor,
                    tabs: <Widget>[
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
              body: TabBarView(
                children: <Widget>[
                  Navigator(
                      key: GlobalKey(),
                      onGenerateRoute: (routeSettings) {
                        return MaterialPageRoute(
                            builder: (context) => const PageRecherche());
                      }),
                  Navigator(
                      key: GlobalKey(),
                      onGenerateRoute: (routeSettings) {
                        return MaterialPageRoute(
                          builder: (context) => const PageHistorique(),
                        );
                      }),
                ],
              ),
            )));
  }
}
