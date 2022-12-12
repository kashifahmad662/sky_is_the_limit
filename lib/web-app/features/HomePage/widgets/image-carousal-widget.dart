import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skyisthelimit/web-app/core/constants/image-paths.dart';

class ImageCarousalWidget extends StatelessWidget {
  ImageCarousalWidget({super.key});
  static List<String> imgList = [
    ImagePath.carousal1,
    ImagePath.carousal2,
    ImagePath.carousal3,
    ImagePath.carousal4,
    ImagePath.carousal5
  ];

  final List<Widget> imageSliders = imgList
      .map((item) => Image.network(
            item,
            fit: BoxFit.cover,
            height: Get.height * 0.8,
            width: double.infinity,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }
}
