import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/app-text-style.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';

class ContactDetailsUI extends StatelessWidget {
  const ContactDetailsUI(
      {Key? key,
      required this.title,
      this.onTap,
      this.subText,
      this.onSeconderyTapped,
      this.onTrippleTap})
      : super(key: key);
  final String title;
  final VoidCallback? onTap;
  final VoidCallback? onSeconderyTapped;
  final VoidCallback? onTrippleTap;
  final String? subText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onTrippleTap,
      onTap: subText != null ? null : onTap,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
            bottom: (ResponsiveWidget.isWebScreen ? 20 : 10) *
                SizeConfig.heightMultiplier!),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0, (ResponsiveWidget.isWebScreen ? 3 : 2)),
              child: Transform.scale(
                scale: 1.6,
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: ResponsiveWidget.isWebScreen ? 15 : 14,
                ),
              ),
            ),
            SizedBox(
              width: (ResponsiveWidget.isWebScreen ? 10 : 5) *
                  SizeConfig.widthMultiplier!,
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                title,
                style: AppTextStyle.whiteSmallDesriptionOnlyForContact,
              ),
            ),
            if (subText != null)
              GestureDetector(
                onTap: onSeconderyTapped,
                child: Text(
                  subText ?? '',
                  style: AppTextStyle.whiteSmallDesriptionOnlyForContact,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
