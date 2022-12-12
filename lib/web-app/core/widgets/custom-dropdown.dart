import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skyisthelimit/web-app/core/responsive/SizeConfig.dart';

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (labelText != null)
            Text(labelText.toString(),
                style: AppTextStyle.regularBlack62Text.copyWith(
                    color: black62, fontWeight: FontWeight.w600, fontSize: 18)),
          SizedBox(width: 6 * SizeConfig.widthMultiplier!),
          SizedBox(
              width: width ?? double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40 * SizeConfig.heightMultiplier!,
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1 * SizeConfig.widthMultiplier!,
                        color: white238,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      hint.toString(),
                      style: AppTextStyle.regularBlack62Text
                          .copyWith(color: grey128),
                      overflow: TextOverflow.ellipsis,
                    ),
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
                      child: Padding(
                          padding: EdgeInsets.only(
                              right: 0.0 * SizeConfig.widthMultiplier!),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 15 * SizeConfig.imageSizeMultiplier!,
                            color: color,
                          )),
                    ),
                    iconSize: 0.0,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    dropdownMaxHeight: 296 * SizeConfig.heightMultiplier!,
                    // dropdownWidth: 320,
                    dropdownPadding: null,
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
