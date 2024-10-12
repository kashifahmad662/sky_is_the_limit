import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  return GestureDetector(
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
  );
}
