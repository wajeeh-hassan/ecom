

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/seed/picsum/4/1',
    'https://picsum.photos/seed/picsum/4/1',
    'https://picsum.photos/seed/picsum/4/1',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((imageUrl) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Container(
              color: Colors.red,
              child: Image.network(imageUrl,fit: BoxFit.fill)
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 3.0,
        enlargeCenterPage: false,
      ),
    );
  }
}