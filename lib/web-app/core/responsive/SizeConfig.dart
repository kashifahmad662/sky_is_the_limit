import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConfig {
  static double? _screenWidth;
  static double? _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

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
    _blockSizeHorizontal = _screenWidth! / 100;
    _blockSizeVertical = _screenHeight! / 100;
    log(_screenWidth.toString());

    if (_screenWidth! > 1400.0) {
      textMultiplier = 1.sp;
      imageSizeMultiplier = 1;
      heightMultiplier = 1.h;
      widthMultiplier = 1.w;
    } else {
      textMultiplier = 1;
      imageSizeMultiplier = 1;
      heightMultiplier = 1;
      widthMultiplier = 1;
    }
  }
}
