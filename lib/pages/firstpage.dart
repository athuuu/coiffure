

import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('je suis : '),
          ElevatedButton(
          onPressed: () {  },
        child: const Text('coiffeur '),)
        ]),);
  }
}