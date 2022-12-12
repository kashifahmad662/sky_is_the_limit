import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/app-text-style.dart';
import '../constants/colors.dart';
import '../responsive/SizeConfig.dart';

Widget dobField(
    {String? dobvalue,
    String? dobLabel,
    String? dobSubLabel,
    required double? width,
    Color? color,
    void Function()? onSelectDOB}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: dobLabel.toString(),
                  style: AppTextStyle.regularBlack62Text.copyWith(
                      color: black62,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              TextSpan(
                  text: "*",
                  style: AppTextStyle.regularBlack62Text.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
            ]),
          ),
          Text(dobSubLabel.toString(),
              textAlign: TextAlign.end,
              style: AppTextStyle.regularBlack62Text.copyWith(
                  color: grey128, fontWeight: FontWeight.w200, fontSize: 13)),
        ],
      ),
      SizedBox(width: 6 * SizeConfig.widthMultiplier!),
      GestureDetector(
        onTap: onSelectDOB!,
        child: Container(
          height: 48 * SizeConfig.heightMultiplier!,
          width: width ?? Get.width * 0.2,
          padding: EdgeInsets.symmetric(
              horizontal: 16 * SizeConfig.widthMultiplier!,
              vertical: 12 * SizeConfig.heightMultiplier!),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: color!, width: 1)),
          child: Text(
            dobvalue ?? "DD/MM/YYYY",
            style: AppTextStyle.ttCommon16.copyWith(
              fontSize: 16 * SizeConfig.textMultiplier!,
              fontWeight: FontWeight.w400,
              color: dobvalue == null ? grey128 : black3E,
            ),
          ),
        ),
      ),
    ],
  );
}
