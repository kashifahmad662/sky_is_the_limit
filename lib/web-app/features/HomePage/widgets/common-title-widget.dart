import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';

import '../../../core/constants/app-text-style.dart';
import '../../../core/constants/colors.dart';
import '../../../core/responsive/SizeConfig.dart';
import 'package:get/get.dart';

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
          top: (ResponsiveWidget.isWebScreen ? 60 : 40) *
              SizeConfig.heightMultiplier!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toString(), style: AppTextStyle.titleStyle),
          if (wantImage == true)
            SizedBox(
              height: 20 * SizeConfig.heightMultiplier!,
            ),
          if (wantImage == true)
            Image.asset(
              image.toString(),
            ),
          SizedBox(
            height: 20 * SizeConfig.heightMultiplier!,
          ),
          Text(subtitle.toString(), style: AppTextStyle.lightLabelStyle),
        ],
      ),
    );
  }
}
