import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShampooingProduit extends StatelessWidget {
  const ShampooingProduit({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: 130,
                width: 350,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    viewportFraction: 0.5,
                    pageSnapping: false,
                    ),
                    items: [
                      Column(
                        children: [
                          const Text('mini kit GOLD'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 180,
                              height: 80,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/produit1.jpg'),
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('BRAZIL GOLD 022'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 180,
                              height: 80,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/produitcheveux.jpeg'),
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('BRAZIL GOLD 022'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 180,
                              height: 80,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/produitcheveuxx.jpg'),
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('BRAZIL GOLD 022'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 180,
                              height: 80,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/produitcheveuxxx.jpeg'),
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('BRAZIL GOLD 024 huile',
                          style: TextStyle(fontSize: 12)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 180,
                              height: 80,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/produit1.jpg'),
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                      ],
                    ),
              );
  }
}