import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConfig {
  static double? _screenWidth;
  static double? _screenHeight;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;

  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;
    isPortrait = true;
    //   if (_screenWidth! < 450) {
    //     isMobilePortrait = true;
    //   }
    // } else {

    //   isPortrait = false;
    //   isMobilePortrait = false;
    // }
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;
    log(_screenWidth.toString());

    if (_screenWidth! > 1400.0 || _screenWidth! >= 1000) {
      textMultiplier = 1.sp;
      imageSizeMultiplier = 1;
      heightMultiplier = 1.h;
      widthMultiplier = 1.w;
    } else if (_screenWidth! < 1000 && _screenWidth! > 500) {
      textMultiplier = 1.sp;
      imageSizeMultiplier = 1;
      heightMultiplier = 1.h;
      widthMultiplier = 1.w;
    } else {
      ScreenUtil().setSp(500);
      _screenHeight = _screenHeight;
      textMultiplier = 1.sp;
      imageSizeMultiplier = 1;
      ScreenUtil().screenHeight;
      heightMultiplier = 1.h;
      widthMultiplier = 1.w;
    }
  }
}
