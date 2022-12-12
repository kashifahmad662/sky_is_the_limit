import 'package:flutter/material.dart';
import 'package:skyisthelimit/web-app/core/responsive/SizeConfig.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle regularBlack62Text = TextStyle(
    fontSize: (18) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    fontFamily: 'TTCommon',
    color: black62,
  );
  static TextStyle headerText = TextStyle(
    fontSize: (20) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w900,
    fontFamily: 'Montserrat',
    color: black62,
  );
  static TextStyle ttCommon16 = TextStyle(
    fontSize: (16) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    fontFamily: 'TT Common',
    color: darkGrey,
  );
  static TextStyle ttCommonBold16 = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    fontFamily: 'TTCommon Bold',
    color: darkGrey,
  );
  static TextStyle paleText = TextStyle(
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w800,
    fontFamily: 'Montserrat',
    color: pale,
  );
  static TextStyle neueHaasWhiteFont = TextStyle(
    fontSize: 15 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w800,
    fontFamily: 'Montserrat',
    color: pureWhite,
  );
  static TextStyle regularGrey10 = TextStyle(
    fontSize: 10 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
    color: grey,
  );
  static TextStyle normalTitle = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
    color: darkGrey,
  );
  static TextStyle boldBlack10 = TextStyle(
    fontSize: 10 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
    color: black18,
  );
  static TextStyle tTCommonBold = TextStyle(
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    fontFamily: 'TTCommon Bold',
    color: black62,
  );
  static TextStyle boldTTBlack12 = TextStyle(
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.bold,
    fontFamily: 'TTCommon',
    color: black62,
  );
  static TextStyle boldTTWhite16 = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    fontFamily: 'TTCommon',
    color: white250,
  );
  static TextStyle boldMTBlack10 = TextStyle(
    fontSize: 20 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );
}
