import 'package:coiffeur/data/rdvdatabase.dart';
import 'package:coiffeur/data/rdv_details_pages.dart';
import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class RdvPage extends StatefulWidget {
  const RdvPage({Key? key}) : super(key: key);

  @override
  State<RdvPage> createState() => _RdvPageState();
}

class _RdvPageState extends State<RdvPage> {
  late List<RdvPage> rdvs;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshRdv();
  }

@override
void dispose() {
  SqfDatabase.instance.close();

  super.dispose();
}

Future refreshRdv() async {
  setState(() => isLoading = true);

  rdvs = (await SqfDatabase.instance.readAllRdv()).cast<RdvPage>();

  setState(() => isLoading = false);
}

  @override
  Widget build(BuildContext context) =>
    Scaffold( 
      appBar: AppBar(
        backgroundColor: secondarycolor,
        title: const Text(
          'Alertes rendez-vous',
        style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: isLoading 
        ? const CircularProgressIndicator()
        : rdvs.isEmpty
          ? const Text(
            'pas de Rdv',
          style: TextStyle(color: primarycolor)
          )
          : buildRdvs(),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: secondarycolor,
        child: const Icon(Icons.add),
        onPressed:  () async{
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RdvDetailPage(rdvId: 1))
          );

          refreshRdv();
        },
      ),
    );
    Widget buildRdvs() => ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        // ignore: unused_local_variable
        final rdv = rdvs[index];


        return GestureDetector(
          onTap: ()  {
              refreshRdv();
          },
          
          );
      }
    );
  
}