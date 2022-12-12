import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyisthelimit/web-app/core/responsive/SizeConfig.dart';
import 'package:skyisthelimit/web-app/core/widgets/hover_state.dart';

import '../constants/app-text-style.dart';
import '../constants/colors.dart';

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer(
      {this.borderRadius,
      required this.hint,
      required this.isObsecure,
      required this.onChanged,
      required this.suffixWidget,
      required this.textEditingController,
      required this.textInputType,
      required this.subLabel,
      this.wantLabel,
      this.label,
      this.optional = false,
      required this.width,
      Key? key})
      : super(key: key);

  TextEditingController textEditingController;
  Function onChanged;
  TextInputType textInputType;
  bool isObsecure;
  String? hint;
  BorderRadius? borderRadius;
  Widget? suffixWidget;
  bool? wantLabel = false;
  String? label;
  String? subLabel;
  bool? optional;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        wantLabel == true
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: label.toString(),
                          style: AppTextStyle.regularBlack62Text.copyWith(
                              color: black62,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                      if (optional == false)
                        TextSpan(
                            text: "*",
                            style: AppTextStyle.regularBlack62Text.copyWith(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                    ]),
                  ),
                  Text(subLabel.toString(),
                      textAlign: TextAlign.end,
                      style: AppTextStyle.regularBlack62Text.copyWith(
                          color: grey128,
                          fontWeight: FontWeight.w200,
                          fontSize: 13)),
                ],
              )
            : const SizedBox(),
        SizedBox(width: 6 * SizeConfig.widthMultiplier!),
        OnHover(builder: (isHovered) {
          return SizedBox(
            width: width ?? Get.width * 0.2,
            child: TextField(
              controller: textEditingController,
              onChanged: (value) {
                onChanged(value);
              },
              keyboardType: textInputType,
              style: AppTextStyle.regularBlack62Text,
              textAlignVertical: TextAlignVertical.bottom,
              obscureText: isObsecure,
              cursorColor: grey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 12 * SizeConfig.widthMultiplier!,
                    vertical: 22 * SizeConfig.heightMultiplier!),
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hoverColor: isHovered ? Colors.white : Colors.white,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.0 * SizeConfig.widthMultiplier!,
                        color: white238),
                    borderRadius: borderRadius ??
                        const BorderRadius.all(
                          Radius.circular(5.0),
                        )),
                hintText: hint,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1.0, color: yellow),
                  borderRadius: borderRadius ??
                      const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                ),
                suffixIcon: suffixWidget ??
                    SizedBox(
                      height: 10 * SizeConfig.heightMultiplier!,
                      width: 10 * SizeConfig.widthMultiplier!,
                    ),
                hintStyle:
                    AppTextStyle.regularBlack62Text.copyWith(color: grey),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class LargeTextField extends StatelessWidget {
  LargeTextField(
      {required this.textEditingController,
      required this.onChanged,
      required this.subLabel,
      required this.hint,
      this.wantLabel,
      this.label,
      required this.width,
      Key? key})
      : super(key: key);

  Function onChanged;
  TextEditingController textEditingController;
  bool? wantLabel = false;
  String? label;
  String? subLabel;
  String? hint;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        wantLabel == true
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: label.toString(),
                          style: AppTextStyle.regularBlack62Text.copyWith(
                              color: black62,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                    ]),
                  ),
                  Text(subLabel.toString(),
                      textAlign: TextAlign.end,
                      style: AppTextStyle.regularBlack62Text.copyWith(
                          color: grey128,
                          fontWeight: FontWeight.w200,
                          fontSize: 13)),
                ],
              )
            : const SizedBox(),
        SizedBox(width: 6 * SizeConfig.widthMultiplier!),
        SizedBox(
          width: width ?? Get.width * 0.2,
          child: TextFormField(
            minLines: 4,
            maxLines: 4,
            controller: textEditingController,
            onChanged: (value) {
              onChanged(value);
            },
            style: AppTextStyle.regularBlack62Text,
            textAlignVertical: TextAlignVertical.bottom,
            // validator: (value) => (value == null || value.length < 10)
            //     ? 'Minimum 10 characters'
            //     : null,
            cursorColor: grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 12 * SizeConfig.widthMultiplier!,
                  vertical: 22 * SizeConfig.heightMultiplier!),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.0 * SizeConfig.widthMultiplier!,
                      color: white238),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  )),
              hintText: hint,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: yellow),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              hintStyle: AppTextStyle.regularBlack62Text.copyWith(color: grey),
            ),
          ),
        ),
      ],
    );
  }
}
