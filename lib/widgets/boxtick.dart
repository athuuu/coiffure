import 'package:flutter/material.dart';

class BoxTick extends StatelessWidget {
  const BoxTick({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
                width: 30,
                height: 22,
                child: Text(
                  'Prix'
                  ),
             );
  }
}