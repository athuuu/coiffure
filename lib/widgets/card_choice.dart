import 'package:coiffeur/utils/utils.dart';
import 'package:flutter/material.dart';

class CardChoice extends StatelessWidget {
  const CardChoice(
      {Key? key,
      this.onPressed,
      required this.title,
      this.fontSize = 20,
      this.subtitle,
      this.image})
      : super(key: key);
  final Function()? onPressed;
  final String? image;
  final String title;
  final String? subtitle;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(secondarycolor),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: fontSize, color: Colors.white),
            ),
            subtitle: subtitle != null
                ? Text(
                    subtitle!,
                    style: const TextStyle(color: Colors.white),
                  )
                : null,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
