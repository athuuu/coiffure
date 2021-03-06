import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, "Expérience", "2 ans"),
          buildDivider(),
          buildButton(context, "Diplôme", "CAP"),
        ],
      ),
    );
  }

  Widget buildDivider() => const SizedBox(
   height: 24, child: VerticalDivider());

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 4),
          onPressed: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ));
}
