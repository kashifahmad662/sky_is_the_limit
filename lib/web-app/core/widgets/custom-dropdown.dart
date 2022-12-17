import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';

import '../constants/app-text-style.dart';
import '../constants/colors.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {this.labelText,
      this.width,
      required this.hint,
      required this.listofItems,
      required this.onChanged,
      required this.value,
      required this.color});

  List<String> listofItems;
  void Function(String?)? onChanged;
  String? hint;
  String? labelText;
  String? value;
  double? width;
  Color? color;

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
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1 * SizeConfig.widthMultiplier!,
                        color: white238,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton2(
                    selectedItemBuilder: (context) {
                      return [
                        Text(
                          value ?? '',
                          style: AppTextStyle.regularBlack62Text.copyWith(
                              fontSize: ResponsiveWidget.isWebScreen
                                  ? 18 * SizeConfig.textMultiplier!
                                  : 14 * SizeConfig.textMultiplier!),
                        )
                      ];
                    },
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
                    buttonHeight: ResponsiveWidget.isWebScreen
                        ? 50 * SizeConfig.heightMultiplier!
                        : 40 * SizeConfig.heightMultiplier!,
                    underline: Container(),
                    items: listofItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item,
                                    style: AppTextStyle.regularBlack62Text,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    value: value,
                    onChanged: onChanged,
                    icon: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 15 * SizeConfig.imageSizeMultiplier!,
                        color: color,
                      ),
                    ),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    dropdownMaxHeight: 296 * SizeConfig.heightMultiplier!,
                    dropdownPadding: null,
                    buttonPadding: ResponsiveWidget.isWebScreen
                        ? EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier!,
                            vertical: 0 * SizeConfig.heightMultiplier!)
                        : null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.white,
                    ),
                    dropdownElevation: 1,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(0, 0),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
