import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app-text-style.dart';
import '../../../core/constants/colors.dart';
import '../../../core/responsive/SizeConfig.dart';

class CommonTextWidget extends StatelessWidget {
  CommonTextWidget({
    required this.title,
    required this.subtitle,
    this.image,
    this.wantImage = false,
    Key? key,
  }) : super(key: key);

  String? title;
  String? subtitle;
  String? image;
  bool wantImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 30 * SizeConfig.heightMultiplier!,
          bottom: 40 * SizeConfig.heightMultiplier!,
          left: 60 * SizeConfig.widthMultiplier!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: AppTextStyle.ttCommon16.copyWith(
                fontSize: (40) * SizeConfig.textMultiplier!,
                fontWeight: FontWeight.w800,
                color: Colors.red),
          ),
          if (wantImage == true)
            SizedBox(
              height: 20 * SizeConfig.heightMultiplier!,
            ),
          if (wantImage == true)
            Image.asset(
              image.toString(),
              height: Get.height * 0.7,
              width: Get.width * 0.8,
            ),
          SizedBox(
            height: 20 * SizeConfig.heightMultiplier!,
          ),
          SizedBox(
            width: Get.width * 0.7,
            child: Text(
              subtitle.toString(),
              style: AppTextStyle.ttCommon16.copyWith(
                  height: 2,
                  fontSize: (22) * SizeConfig.textMultiplier!,
                  fontWeight: FontWeight.w400,
                  color: black62),
            ),
          ),
        ],
      ),
    );
  }
}
