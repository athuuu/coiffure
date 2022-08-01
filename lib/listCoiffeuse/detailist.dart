import 'package:coiffeur/listClient/body.dart';
import 'package:coiffeur/listCoiffeuse/body.dart';
import 'package:coiffeur/pages/user_profile/appbar_widget.dart';

import 'package:flutter/material.dart';

class DetailScreenCoiffeuses extends StatelessWidget {
  const DetailScreenCoiffeuses({Key? key, required this.alertes})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final alertes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: BodyDetailCoiffeuse(
        alertes: alertes,
      ),
    );
  }
}
