import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';
import 'package:test/web-app/core/widgets/hover_state.dart';

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
      this.isDisabled,
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
  bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: ResponsiveWidget.isWebScreen
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      direction: ResponsiveWidget.isWebScreen ? Axis.horizontal : Axis.vertical,
      children: [
        wantLabel == true
            ? RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: label.toString(),
                      style: AppTextStyle.regularBlack62Text.copyWith(
                          color: black62,
                          fontWeight: FontWeight.w600,
                          fontSize: (ResponsiveWidget.isWebScreen ? 18 : 14) *
                              SizeConfig.textMultiplier!)),
                ]),
              )
            : const SizedBox(),
        SizedBox(
          width: 10 * SizeConfig.widthMultiplier!,
          height: (ResponsiveWidget.isMobile ? 7 : 0) *
              SizeConfig.heightMultiplier!,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            enabled: !(isDisabled == true),
            controller: textEditingController,
            onChanged: (value) {
              onChanged(value);
            },
            keyboardType: textInputType,
            style: AppTextStyle.regularBlack62Text.copyWith(
                fontSize: ResponsiveWidget.isWebScreen
                    ? 18 * SizeConfig.textMultiplier!
                    : 14 * SizeConfig.textMultiplier!),
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObsecure,
            cursorColor: grey,
            decoration: InputDecoration(
              contentPadding: ResponsiveWidget.isWebScreen
                  ? EdgeInsets.symmetric(
                      horizontal: 16 * SizeConfig.widthMultiplier!,
                      vertical: (ResponsiveWidget.isWebScreen ? 22 : 7) *
                          SizeConfig.heightMultiplier!)
                  : EdgeInsets.symmetric(
                      horizontal: 16 * SizeConfig.widthMultiplier!,
                      vertical: 1 * SizeConfig.heightMultiplier!),
              filled: true,
              isDense: true,
              fillColor: Colors.white,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.0 * SizeConfig.widthMultiplier!,
                      color: white238),
                  borderRadius: borderRadius ??
                      const BorderRadius.all(
                        Radius.circular(5.0),
                      )),
              disabledBorder: OutlineInputBorder(
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
              suffixIcon: suffixWidget ?? SizedBox(),
              hintStyle: AppTextStyle.regularBlack62Text.copyWith(
                  color: grey,
                  fontSize: ResponsiveWidget.isWebScreen
                      ? 18 * SizeConfig.textMultiplier!
                      : 14 * SizeConfig.textMultiplier!),
            ),
          ),
        )
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
      this.wantCenterAlignment,
      Key? key})
      : super(key: key);

  Function onChanged;
  TextEditingController textEditingController;
  bool? wantLabel = false;
  String? label;
  String? subLabel;
  String? hint;
  double? width;
  bool? wantCenterAlignment;

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          (wantCenterAlignment == false || ResponsiveWidget.isMobile)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      direction: ResponsiveWidget.isWebScreen ? Axis.horizontal : Axis.vertical,
      children: [
        wantLabel == true
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: label.toString(),
                          style: AppTextStyle.regularBlack62Text.copyWith(
                              color: black62,
                              fontWeight: FontWeight.w600,
                              fontSize: (ResponsiveWidget.isMobile ? 14 : 18) *
                                  SizeConfig.textMultiplier!)),
                    ]),
                  ),
                ],
              )
            : const SizedBox(),
        SizedBox(
          width: 10 * SizeConfig.widthMultiplier!,
          height: (ResponsiveWidget.isMobile ? 7 : 0) *
              SizeConfig.heightMultiplier!,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            minLines: ResponsiveWidget.isWebScreen ? 4 : 1,
            maxLines: ResponsiveWidget.isWebScreen ? 4 : 2,
            controller: textEditingController,
            onChanged: (value) {
              onChanged(value);
            },
            style: AppTextStyle.regularBlack62Text.copyWith(
                fontSize: ResponsiveWidget.isWebScreen
                    ? 18 * SizeConfig.textMultiplier!
                    : 14 * SizeConfig.textMultiplier!),
            textAlignVertical: TextAlignVertical.bottom,
            // validator: (value) => (value == null || value.length < 10)
            //     ? 'Minimum 10 characters'
            //     : null,
            cursorColor: grey,
            decoration: InputDecoration(
              contentPadding: ResponsiveWidget.isWebScreen
                  ? EdgeInsets.symmetric(
                      horizontal: 16 * SizeConfig.widthMultiplier!,
                      vertical: (ResponsiveWidget.isWebScreen ? 22 : 7) *
                          SizeConfig.heightMultiplier!)
                  : null,
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
              hintStyle: AppTextStyle.regularBlack62Text.copyWith(
                  color: grey,
                  fontSize: ResponsiveWidget.isWebScreen
                      ? 18 * SizeConfig.textMultiplier!
                      : 14 * SizeConfig.textMultiplier!),
            ),
          ),
        ),
      ],
    );
  }
}
