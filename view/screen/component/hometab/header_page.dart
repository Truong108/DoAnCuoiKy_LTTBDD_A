import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderPage extends StatelessWidget {
  List<String> listImage =  [
   'https://hoanguthanhnhan.com/wp-content/uploads/2019/11/avtata-rau-cu-qua.jpg',
   'https://vcdn-suckhoe.vnecdn.net/2021/03/03/rau-cu-qua-9679-1614753495.jpg',
   'https://naganic.vn/wp-content/uploads/2021/10/rau-cu-giau-dinh-duong.jpg'
  ];
  @override
 Widget build(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 1), 
      CarouselSlider(
        options: CarouselOptions(
          height: 280,
          viewportFraction: 1.0,
          autoPlay: true,
          enlargeCenterPage: false,
        ),
        items: listImage.map((e) => Image.network(e, fit: BoxFit.cover)).toList(),
      ),
    ],
  );
}
}
