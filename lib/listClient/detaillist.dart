import 'package:coiffeur/listClient/body.dart';
import 'package:coiffeur/pages/user_profile/appbar_widget.dart';

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.alerte}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final alerte;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: BodyDetail(
        alerte: alerte,
      ),
    );
  }
}
