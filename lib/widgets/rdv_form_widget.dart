import 'package:flutter/material.dart';

class RdvFormWidget extends StatelessWidget {
  final String? nom;
  final int? createdTime;
  final String? prestation;
  final String? prenom;

  const RdvFormWidget({
    Key? key,
    this.nom = '',
    this.prenom = '',
    this.prestation = '',
    this.createdTime = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              const SizedBox(height: 8),
              buildDescription(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: prestation,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (prestation) => prestation != null && prestation.isEmpty
            ? 'The title cannot be empty'
            : null,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: prestation,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
      );
}
