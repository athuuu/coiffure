import 'package:coiffeur/list/body.dart';
import 'package:coiffeur/pages/user_profile/appbar_widget.dart';

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: const BodyDetail(),
    );
  }
}
