import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';

import '../constants/app-text-style.dart';
import '../constants/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> listofItems;
  final void Function(String?)? onChanged;
  final String? hint;
  final String? labelText;
  final String? value;
  final double? width;
  final Color? color;
  const CustomDropDown(
      {super.key,
      this.labelText,
      this.width,
      required this.hint,
      required this.listofItems,
      required this.onChanged,
      required this.value,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Flex(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: ResponsiveWidget.isWebScreen
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        direction:
            ResponsiveWidget.isWebScreen ? Axis.horizontal : Axis.vertical,
        children: [
          if (labelText != null)
            Text(labelText ?? '',
                style: AppTextStyle.regularBlack62Text.copyWith(
                    color: black62,
                    fontWeight: FontWeight.w600,
                    fontSize: ResponsiveWidget.isMobile
                        ? 14 * SizeConfig.textMultiplier!
                        : 18 * SizeConfig.textMultiplier!)),
          SizedBox(
            width: 10 * SizeConfig.widthMultiplier!,
            height: (ResponsiveWidget.isMobile ? 7 : 0) *
                SizeConfig.heightMultiplier!,
          ),
          SizedBox(
              width: width ?? double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  // width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1 * SizeConfig.widthMultiplier!,
                        color: white238,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton2(
                   
                    isDense: true,
                    style: AppTextStyle.regularBlack62Text.copyWith(
                        fontSize: ResponsiveWidget.isWebScreen
                            ? 18 * SizeConfig.textMultiplier!
                            : 14 * SizeConfig.textMultiplier!),
                    isExpanded: true,
                    hint: Text(
                      hint.toString(),
                      style: AppTextStyle.regularBlack62Text.copyWith(
                          color: grey,
                          fontSize: ResponsiveWidget.isWebScreen
                              ? 18 * SizeConfig.textMultiplier!
                              : 14 * SizeConfig.textMultiplier!),
                      overflow: TextOverflow.ellipsis,
                    ),
                    // buttonHeight: ResponsiveWidget.isWebScreen
                    //     ? 50 * SizeConfig.heightMultiplier!
                    //     : 40 * SizeConfig.heightMultiplier!,
                    underline: Container(),
                    items: listofItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item,
                                    style: AppTextStyle.regularBlack62Text
                                        .copyWith(
                                            color: Color(0xff333333),
                                            fontSize: ResponsiveWidget
                                                    .isWebScreen
                                                ? 18 *
                                                    SizeConfig.textMultiplier!
                                                : 14 *
                                                    SizeConfig.textMultiplier!),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    value: value,
                    onChanged: onChanged,
                    // icon: Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Icon(
                    //     Icons.keyboard_arrow_down_sharp,
                    //     size: 15 * SizeConfig.imageSizeMultiplier!,
                    //     color: color,
                    //   ),
                    // ),
                    // buttonDecoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(14),
                    //   border: Border.all(
                    //     color: Colors.transparent,
                    //   ),
                    // ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
