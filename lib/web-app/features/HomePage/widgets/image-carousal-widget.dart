import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test/web-app/core/constants/image-paths.dart';

class ImageCarousalWidget extends StatelessWidget {
  const ImageCarousalWidget({super.key});
  static final List<String> imgList = [
    ImagePath.carousal1,
    ImagePath.carousal2,
    ImagePath.carousal3,
    ImagePath.carousal4,
    ImagePath.carousal5,
    ImagePath.carousal6
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      disableGesture: false,
      options: CarouselOptions(
          scrollPhysics: const NeverScrollableScrollPhysics(),
          viewportFraction: 1.0,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3)),
      items: imgList
          .map((item) => Image.network(
                item,
                fit: BoxFit.cover,
                height: Get.height * 0.8,
                width: double.infinity,
              ))
          .toList(),
    );
  }
}
