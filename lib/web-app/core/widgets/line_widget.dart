import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.white,
          width: (ResponsiveWidget.isWebScreen ? 200 : 85) *
              SizeConfig.widthMultiplier!,
          height: (ResponsiveWidget.isWebScreen ? 4 : 3) *
              SizeConfig.heightMultiplier!,
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            height: (ResponsiveWidget.isWebScreen ? 2 : 1.5) *
                SizeConfig.heightMultiplier!,
          ),
        ),
      ],
    );
  }
}
