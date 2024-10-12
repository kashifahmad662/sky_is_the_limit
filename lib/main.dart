import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test/web-app/features/HomePage/view/home-page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'web-app/core/constants/colors.dart';
import 'web-app/core/responsive/SizeConfig.dart';

void main() async {
  // //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDe0m56rzDzzPgOEvd0HwqTc1dEzZAGHbI",
      appId: "1:195233003771:web:16b4255abb20820cf2185e",
      messagingSenderId: "195233003771",
      projectId: "sky-is-the-limit-7208a",
    ),
  );

  runApp(const WebApp());
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Size size = Get.size;
    return ScreenUtilInit(
        designSize: size.width < 500
            ? const Size(350, 720)
            : size.width > 500 && size.width < 1000
                ? const Size(500, 800)
                : const Size(1440, 950),
        minTextAdapt: true,
        builder: (context, snapshot) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return OrientationBuilder(builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return GetMaterialApp(
                  title: 'Sky is the limit',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    fontFamily: 'Roboto',
                    scaffoldBackgroundColor: pureWhite,
                  ),
                  // onGenerateRoute: GenerateRoute.generateRoute,
                  home: HomePage(),
                );
              });
            },
          );
        });
  }
}
