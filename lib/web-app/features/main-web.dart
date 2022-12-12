import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/constants/colors.dart';
import '../core/responsive/SizeConfig.dart';
import 'HomePage/view/home-page.dart';

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 950),
        minTextAdapt: true,
        builder: (context, snapshot) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return OrientationBuilder(builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                // SystemChrome.setPreferredOrientations(
                //     [DeviceOrientation.portraitUp]);
                return GetMaterialApp(
                  title: 'Contact Center',
                  theme: ThemeData(
                      scaffoldBackgroundColor: pureWhite,
                      visualDensity: VisualDensity.adaptivePlatformDensity),
                  //   onGenerateRoute: GenerateRoute.generateRoute,
                  home: HomePage(),
                );
              });
            },
          );
        });
  }
}
