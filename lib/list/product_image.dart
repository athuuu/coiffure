import 'package:coiffeur/list/constant.dart';

import 'package:flutter/material.dart';

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size.width * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: size.width * 0.3,
            width: size.width * 0.3,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            image,
            height: size.width * 0.50,
            width: size.width * 0.50,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
