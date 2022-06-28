import 'package:coiffeur/data/rdvdatabase.dart';
import 'package:coiffeur/model/rdv.dart';
import 'package:coiffeur/widgets/rdv_form_widget.dart';
import 'package:flutter/material.dart';

class AddEditRdvPage extends StatefulWidget {
  final Rdv? rdv;

  const AddEditRdvPage({
    Key? key,
    this.rdv,
  }) : super(key: key);

  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditRdvPage> {
  final _formKey = GlobalKey<FormState>();
  late String nom;
  late int createdTime;
  late String title;
  late String prestation;
  late String prenom;
  late String adresse;
  late String cpltadresse;

  @override
  void initState() {
    super.initState();

    nom = widget.rdv?.nom ?? '';
    createdTime = (widget.rdv?.createdTime ?? DateTime(0)) as int;
    prestation = widget.rdv?.prestation ?? '';
    prenom = widget.rdv?.prenom ?? '';
    adresse = widget.rdv?.adresse ?? '';
    cpltadresse = widget.rdv?.cpltadresse ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        actions: [buildButton()],
      ),
      body: Form(
        key: _formKey,
        child: RdvFormWidget(
          prestation: prestation,
          createdTime: createdTime,
          nom: nom,
          prenom: prenom,
          adresse: adresse,
          cpltadresse: cpltadresse,
        ),
      ));

  Widget buildButton() {
    // ignore: unused_local_variable
    final isFormValid = title.isNotEmpty && prestation.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: addOrUpdateRdv,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateRdv() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.rdv != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final rdv = widget.rdv!.copy(
      createdTime: DateTime.now(),
      prenom: prenom,
      prestation: prestation,
      nom: nom,
      adresse: adresse,
      cpltadresse: cpltadresse,
    );

    await SqfDatabase.instance.update(rdv);
  }

  Future addNote() async {
    final rdv = Rdv(
      prestation: prestation,
      createdTime: DateTime.now(),
      prenom: prenom,
      nom: nom,
      number: 0,
      adresse: adresse,
      cpltadresse: cpltadresse,
    );

    await SqfDatabase.instance.create(rdv);
  }
}
