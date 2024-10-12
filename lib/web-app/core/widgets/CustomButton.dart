import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/colors.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';

import '../constants/app-text-style.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final double borderRadius;
  final double? width;
  final Color splashColor;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  const CustomButton(
      {super.key,
      this.buttonColor = yellow,
      this.borderRadius = 4,
      this.width,
      this.splashColor = orange232,
      required this.text,
      this.onPressed,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
                animationDuration: const Duration(milliseconds: 300),
                foregroundColor: splashColor,
                textStyle: textStyle ??
                    AppTextStyle.ttCommon16.copyWith(
                      fontSize: 12 * SizeConfig.textMultiplier!,
                      fontWeight: FontWeight.w700,
                      color: black3E,
                    ),
                backgroundColor: buttonColor,
                fixedSize: Size(
                  width ?? double.infinity,
                  48 * SizeConfig.heightMultiplier!,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius))),
            child: Text(
              text.toUpperCase(),
              style: textStyle ??
                  AppTextStyle.ttCommon16.copyWith(
                    fontSize: 12 * SizeConfig.textMultiplier!,
                    fontWeight: FontWeight.w700,
                    color: black3E,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
