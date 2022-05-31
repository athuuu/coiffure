import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:coiffeur/model/rdv.dart';


class RdvCardWidget extends StatelessWidget {
  const RdvCardWidget({
    Key? key,
    required this.rdv,
    required this.index,
  }) : super(key: key);

  final Rdv rdv;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final createdTime = DateFormat.yMMMd().format(rdv.createdTime);


    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              createdTime,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 4),
            Text(
              rdv.prestation,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}