import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle regularBlack62Text = TextStyle(
    fontSize: (18) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: black62,
  );
  static TextStyle headerText = TextStyle(
    fontSize: (20) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w900,
    color: black62,
  );
  static TextStyle ttCommon16 = TextStyle(
    fontSize: (16) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: darkGrey,
  );
  static TextStyle ttCommonBold16 = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: darkGrey,
  );
  static TextStyle paleText = TextStyle(
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w800,
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
    color: grey,
  );

  static TextStyle normalTitle = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: darkGrey,
  );
  static TextStyle boldBlack10 = TextStyle(
    fontSize: 10 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    color: black18,
  );
  static TextStyle tTCommonBold = TextStyle(
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    color: black62,
  );
  static TextStyle boldTTBlack12 = TextStyle(
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.bold,
    color: black62,
  );
  static TextStyle boldTTWhite16 = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    color: white250,
  );
  static TextStyle boldMTBlack10 = TextStyle(
    fontSize: 20 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  ///new styles stars from here

  static TextStyle titleStyle = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 40 : 28) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w300,
    color: const Color(0xff444444),
  );
  static TextStyle titleStyleRed = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 40 : 28) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w300,
    color: const Color(0xffE4322C),
  );
  static TextStyle titleStyleRedSmall = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 36 : 23) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w300,
    color: const Color(0xffE4322C),
  );
  static TextStyle titleWhite = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 40 : 28) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
  );
  static TextStyle largeTitleStyleBold = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 60 : 50) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: const Color(0xff444444),
  );

  static TextStyle boldDesdription = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 20 : 15) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w600,
    color: const Color(0xff444444),
  );

  static TextStyle subtitleStyle = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 20 : 16) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: const Color(0xff666666),
  );
  static TextStyle whiteSubtitleStyle = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 20 : 13) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
  );

  static TextStyle labelStyle = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 20 : 16) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: const Color(0xff444444),
  );
  static TextStyle whiteSmallDesriptionOnlyForContact = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 20 : 16) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
  );
  static TextStyle lightLabelStyle = TextStyle(
    fontSize:
        (ResponsiveWidget.isWebScreen ? 22 : 16) * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w300,
    color: const Color(0xff666666),
  );
}
