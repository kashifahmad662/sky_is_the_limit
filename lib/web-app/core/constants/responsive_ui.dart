import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool get isMobile {
    return Get.width < 800;
  }

  static bool get isLargeScreen {
    return Get.width > 1200;
  }

  static bool get isMediumScreen {
    return Get.width >= 800 && Get.width <= 1200;
  }

  static bool get isWebScreen {
    return Get.width >= 800;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen ?? Container();
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return (mediumScreen ?? largeScreen) ?? Container();
        } else {
          return (smallScreen ?? largeScreen) ?? Container();
        }
      },
    );
  }
}
