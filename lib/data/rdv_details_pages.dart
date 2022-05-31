import 'package:coiffeur/data/rdvdatabase.dart';
import 'package:coiffeur/model/rdv.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:coiffeur/widgets/rdv_card_widget.dart';
import 'package:flutter/material.dart';

class RdvDetailPage extends StatefulWidget {
  final int rdvId;


  const RdvDetailPage({
    Key? key, 
    required this.rdvId
    }) : super(key: key);

  @override
  _RdvDetailPageState createState() => _RdvDetailPageState();
}

class _RdvDetailPageState extends State<RdvDetailPage> {
  late Rdv rdv;
  bool isLoading = false;
  
  @override
  void initState() {
    super.initState();

    refreshRdv();
  }

  Future refreshRdv() async{
    setState(() => isLoading = true);
      
    rdv = await SqfDatabase.instance.readRdv(widget.rdvId);
    
    setState(() => isLoading= false
      
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [editButton(), deleteButton()],
      ),
      body: isLoading 
        ? const Center(
            child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                Text(
                rdv.prestation,
                style: const TextStyle(
                  color: primarycolor,
                  fontSize: 22,
                  fontWeight: firstweight
                )
                ),
                const  SizedBox(height: 8),
                
              
                Text(
                  rdv.prenom,
                  style: const TextStyle(color:Colors.white70, fontSize: 18)
                )
              ]
            ),
          )
    );

    
  }
  Widget editButton() => IconButton(
    icon: const Icon(Icons.edit_outlined),
    onPressed: () async {
      if (isLoading) return;


      await Navigator.of(context).push( 
        MaterialPageRoute(builder: (context) => RdvCardWidget(rdv: rdv, index: 1,),
        )
      );

      refreshRdv();
      });

  Widget deleteButton() => IconButton(
    icon: const Icon(Icons.delete_outlined),
    onPressed: () async {
      await SqfDatabase.instance.delete(widget.rdvId);

      Navigator.of(context).pop();
    },
  );
}