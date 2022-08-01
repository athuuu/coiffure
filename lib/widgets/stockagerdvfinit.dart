import 'package:flutter/material.dart';

class StockageRdv extends StatelessWidget {
  const StockageRdv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      Container(
        child: Row(
          children: [
            const SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width / 4.0,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('premier Rdv '),
                  ),
                  Text('infos rdv')
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
                width: MediaQuery.of(context).size.width / 4.0,
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('dernier Rdv '),
                    ),
                    Text('infos rdv')
                  ],
                )),
          ],
        ),
      )
    ]));
  }
}
