import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test/web-app/core/constants/Strings.dart';
import 'package:test/web-app/core/constants/app-text-style.dart';
import 'package:test/web-app/core/constants/colors.dart';
import 'package:test/web-app/core/constants/image-paths.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';
import 'package:test/web-app/core/widgets/CustomButton.dart';
import 'package:test/web-app/core/widgets/custom-dropdown.dart';
import 'package:test/web-app/core/widgets/footer_ui.dart';
import 'package:test/web-app/core/widgets/university_labels.dart';
import 'package:test/web-app/core/widgets/why_turkey_ui.dart';
import 'package:test/web-app/features/HomePage/controller/homePage-Controller.dart';

import '../../../core/widgets/TextFieldContainer.dart';
import '../widgets/common-title-widget.dart';
import '../widgets/image-carousal-widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  Future<void> _selectDate(BuildContext context) async {
    DateTime date = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(date.year - 18, date.month - 1, date.day),
      firstDate: DateTime(date.year - 60, date.month - 1, date.day),
      lastDate: DateTime(date.year - 18, date.month - 1, date.day),
    );
    if (pickedDate != null && pickedDate != homeController.formDOB.value) {
      homeController.formDOB.value = pickedDate;
    }
  }

  final LayerLink _fieldLink = LayerLink();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference registeredEmails =
      FirebaseFirestore.instance.collection('RegisteredEmails');

  @override
  Widget build(BuildContext context) {
    homeController.clearControllerValues();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CompositedTransformTarget(
                    link: _fieldLink,
                    child: SizedBox(
                      width: Get.width,
                      child: Stack(
                        children: [
                          Container(
                            color: pureWhite,
                            width: Get.width,
                            child: const ImageCarousalWidget(),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "SKY\nIS THE\nLIMIT",
                                style: AppTextStyle.neueHaasWhiteFont.copyWith(
                                    color: pureWhite,
                                    fontSize: (Get.width > 600 ? 50 : 20) *
                                        SizeConfig.textMultiplier!),
                              ),
                            ),
                          ),
                          if (Get.width > 600)
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Contact Us:- admin@skyisthelimt.com",
                                  style: AppTextStyle.neueHaasWhiteFont
                                      .copyWith(
                                          color: pureWhite,
                                          fontSize:
                                              15 * SizeConfig.widthMultiplier!),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: (ResponsiveWidget.isWebScreen ? 150 : 30) *
                              SizeConfig.heightMultiplier!),
                      SizedBox(
                        width: Get.width,
                        height: (ResponsiveWidget.isWebScreen ? 220 : 150) *
                            SizeConfig.heightMultiplier!,
                        child: const UniversityLabelCards(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                (ResponsiveWidget.isWebScreen ? 60 : 30) *
                                    SizeConfig.widthMultiplier!),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            WhyTurkeyUI(),
                            CommonTextWidget(
                              title: Strings.title1,
                              subtitle: Strings.subtitle1,
                              wantImage: true,
                              image: ImagePath.image1,
                            ),
                            //2
                            CommonTextWidget(
                              title: Strings.title2,
                              subtitle: Strings.subtitle2,
                            ),
                            //3
                            CommonTextWidget(
                              title: Strings.title3,
                              subtitle: Strings.subtitle3,
                              wantImage: true,
                              image: ImagePath.image2,
                            ),
                            //4
                            CommonTextWidget(
                              title: Strings.title4,
                              subtitle: Strings.subtitle4,
                            ),

                            // //5
                            // CommonTextWidget(
                            //   title: Strings.title5,
                            //   wantImage: true,
                            //   image: ImagePath.image3,
                            //   subtitle: Strings.subtitle5,
                            // ),
                            // //6
                            // CommonTextWidget(
                            //   title: Strings.title6,
                            //   subtitle: Strings.subtitle6,
                            // ),
                            // //7
                            // CommonTextWidget(
                            //   title: Strings.title7,
                            //   subtitle: Strings.subtitle7,
                            //   wantImage: true,
                            //   image: ImagePath.image4,
                            // ),
                            // //8
                            // CommonTextWidget(
                            //   title: Strings.title8,
                            //   subtitle: Strings.subtitle8,
                            // ),
                            // //9
                            // CommonTextWidget(
                            //   title: Strings.title9,
                            //   subtitle: Strings.subtitle9,
                            //   wantImage: true,
                            //   image: ImagePath.image5,
                            // ),
                            // //10
                            // CommonTextWidget(
                            //   title: Strings.title10,
                            //   subtitle: Strings.subtitle10,
                            // ),
                            // //11
                            // CommonTextWidget(
                            //   title: Strings.title11,
                            //   subtitle: Strings.subtitle11,
                            //   wantImage: true,
                            //   image: ImagePath.image6,
                            // ),
                            // //12
                            // CommonTextWidget(
                            //   title: Strings.title12,
                            //   subtitle: Strings.subtitle12,
                            // ),
                            // //13
                            // CommonTextWidget(
                            //   title: Strings.title13,
                            //   subtitle: Strings.subtitle13,
                            //   wantImage: true,
                            //   image: ImagePath.image7,
                            // ),
                            // //14
                            // CommonTextWidget(
                            //   title: Strings.title14,
                            //   subtitle: Strings.subtitle14,
                            // ),
                            // //15
                            // CommonTextWidget(
                            //   title: Strings.title15,
                            //   subtitle: Strings.subtitle15,
                            //   wantImage: true,
                            //   image: ImagePath.image8,
                            // ),
                            // //16
                            // CommonTextWidget(
                            //   title: Strings.title16,
                            //   subtitle: Strings.subtitle16,
                            // ),
                            // //17
                            // CommonTextWidget(
                            //   title: Strings.title17,
                            //   subtitle: Strings.subtitle17,
                            // ),
                            // //18
                            // CommonTextWidget(
                            //   title: Strings.title18,
                            //   subtitle: Strings.subtitle18,
                            // ),
                            // //19
                            // CommonTextWidget(
                            //   title: Strings.title19,
                            //   subtitle: Strings.subtitle19,
                            //   wantImage: true,
                            //   image: ImagePath.image9,
                            // ),
                            // //20
                            // CommonTextWidget(
                            //   title: Strings.title20,
                            //   subtitle: Strings.subtitle20,
                            // ),
                            SizedBox(
                                height:
                                    (ResponsiveWidget.isWebScreen ? 60 : 40) *
                                        SizeConfig.heightMultiplier!),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10 * SizeConfig.widthMultiplier!),
                                  child: Container(
                                    height: (ResponsiveWidget.isWebScreen
                                            ? 700
                                            : 160) *
                                        SizeConfig.heightMultiplier!,
                                    width: (ResponsiveWidget.isWebScreen
                                            ? 700
                                            : 160) *
                                        SizeConfig.heightMultiplier!,
                                    child: Image.network(
                                      ImagePath.founderImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            (ResponsiveWidget.isWebScreen
                                                    ? Get.width * 0.1
                                                    : 15) *
                                                SizeConfig.widthMultiplier!),
                                    child: ResponsiveWidget.isWebScreen
                                        ? Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  'Founder',
                                                  style: AppTextStyle
                                                      .titleStyleRed,
                                                ),
                                              ),
                                              SizedBox(
                                                height: (ResponsiveWidget
                                                            .isWebScreen
                                                        ? 18
                                                        : 10) *
                                                    SizeConfig
                                                        .heightMultiplier!,
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'WAQAS KALAM',
                                                  style: AppTextStyle
                                                      .largeTitleStyleBold,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  'Founder',
                                                  style: AppTextStyle
                                                      .titleStyleRedSmall,
                                                ),
                                              ),
                                              SizedBox(
                                                height: (ResponsiveWidget
                                                            .isWebScreen
                                                        ? 18
                                                        : 10) *
                                                    SizeConfig
                                                        .heightMultiplier!,
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'WAQAS\nKALAM',
                                                  style:
                                                      AppTextStyle.titleStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height: (ResponsiveWidget.isWebScreen ? 150 : 30) *
                              SizeConfig.heightMultiplier!),
                      //footer goes here
                      FooterUI(),
                    ],
                  )
                ],
              ),
            ),
          ),
          CompositedTransformFollower(
            link: _fieldLink,
            child: (Get.width > 500)
                ? getInputForm(context)
                : Align(
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: Offset(-10 * SizeConfig.widthMultiplier!,
                          125 * SizeConfig.heightMultiplier!),
                      child: SizedBox(
                        width: 100 * SizeConfig.widthMultiplier!,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 10 * SizeConfig.heightMultiplier!,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 4 * SizeConfig.widthMultiplier!),
                              child: Text(
                                "Learn Today,\nLead Tomorrow.",
                                style: AppTextStyle.boldTTWhite16.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10 * SizeConfig.heightMultiplier!,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return getInputForm(context,
                                          removeOffset: true);
                                    });
                              },
                              child: Card(
                                color: Colors.red.shade600.withOpacity(0.9),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            7 * SizeConfig.heightMultiplier!),
                                    child: Center(
                                      child: Text(
                                        "Contact Us",
                                        style: AppTextStyle.boldTTWhite16
                                            .copyWith(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget getInputForm(BuildContext context, {bool? removeOffset}) {
    return Align(
      alignment:
          ResponsiveWidget.isMobile ? Alignment.center : Alignment.topRight,
      child: Transform.translate(
        offset: removeOffset == true
            ? Offset(0, 0)
            : Offset(-Get.width * 0.04, Get.height * 0.23),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 20,
          child: Container(
            height: ResponsiveWidget.isMobile
                ? 500 * SizeConfig.heightMultiplier!
                : null,
            padding: const EdgeInsets.all(25),
            width: Get.width < 500
                ? 300 * SizeConfig.widthMultiplier!
                : 450 * SizeConfig.widthMultiplier!,
            decoration: BoxDecoration(
              color: pureWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomDropDown(
                    color: Colors.transparent,
                    hint: "heel",
                    labelText: "Country",
                    listofItems: const ["Turkey"],
                    onChanged: null,
                    value: "Turkey",
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  getSizedBox(),
                  TextFieldContainer(
                    wantLabel: true,
                    label: "Name",
                    hint: 'Enter Full Name',
                    isObsecure: false,
                    onChanged: () {},
                    suffixWidget: const SizedBox(),
                    textEditingController: homeController.nameController!,
                    textInputType: TextInputType.text,
                    subLabel: 'your full name',
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  getSizedBox(),
                  Obx(
                    () {
                      homeController.dobController?.text =
                          homeController.formDOB.value.isAfter(
                                  DateTime.now().subtract(Duration(hours: 10)))
                              ? ''
                              : DateFormat("dd/MM/yyyy")
                                  .format(homeController.formDOB.value);
                      return GestureDetector(
                        onTap: () {
                          _selectDate(context);
                          print(homeController.formDOB.value.toString());
                        },
                        child: TextFieldContainer(
                          wantLabel: true,
                          isDisabled: true,
                          width: ResponsiveWidget.isWebScreen
                              ? 300 * SizeConfig.widthMultiplier!
                              : null,
                          label: "Date Birth",
                          textEditingController: homeController.dobController!,
                          hint: '11/11/2022',
                          isObsecure: false,
                          onChanged: () {},
                          suffixWidget: null,
                          textInputType: TextInputType.text,
                          subLabel: '',
                        ),
                      );
                    },
                  ),
                  getSizedBox(),
                  TextFieldContainer(
                    wantLabel: true,
                    label: "Email",
                    hint: 'Enter Email',
                    isObsecure: false,
                    onChanged: () {},
                    suffixWidget: Icon(Icons.email_rounded),
                    textEditingController: homeController.emailController!,
                    textInputType: TextInputType.text,
                    subLabel: 'a valid email',
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  getSizedBox(),
                  TextFieldContainer(
                    wantLabel: true,
                    label: "Phone",
                    hint: 'Enter Phone',
                    isObsecure: false,
                    onChanged: () {},
                    suffixWidget: const SizedBox(),
                    textEditingController: homeController.phoneController!,
                    textInputType: TextInputType.text,
                    subLabel: 'with country\ncode',
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  getSizedBox(),
                  Obx(
                    () => CustomDropDown(
                      color: pale,
                      width: ResponsiveWidget.isWebScreen
                          ? 300 * SizeConfig.widthMultiplier!
                          : null,
                      hint: "Bachelor's, Master's",
                      labelText: ResponsiveWidget.isWebScreen
                          ? "Course\n Level"
                          : "Course Level",
                      listofItems: homeController.courseType,
                      onChanged: (value) {
                        homeController.selectedCourseType.value = value ?? '';
                      },
                      value: homeController.selectedCourseType.value == ""
                          ? null
                          : homeController.selectedCourseType.value,
                    ),
                  ),
                  getSizedBox(),
                  TextFieldContainer(
                    wantLabel: true,
                    label: "Program",
                    hint: 'Eg:- Accounting, Finance & Economics',
                    optional: true,
                    isObsecure: false,
                    onChanged: () {},
                    suffixWidget: const SizedBox(),
                    textEditingController: homeController.programController!,
                    textInputType: TextInputType.text,
                    subLabel: 'interested',
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  getSizedBox(),
                  LargeTextField(
                    wantCenterAlignment: false,
                    label: 'Comments',
                    wantLabel: true,
                    textEditingController: homeController.commentController!,
                    onChanged: () {},
                    subLabel: "Questions",
                    hint: 'Enter comments',
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  SizedBox(
                    height: 40 * SizeConfig.heightMultiplier!,
                  ),
                  SizedBox(
                    width: ResponsiveWidget.isWebScreen
                        ? 120 * SizeConfig.widthMultiplier!
                        : double.infinity,
                    height: ResponsiveWidget.isWebScreen
                        ? null
                        : 40 * SizeConfig.heightMultiplier!,
                    child: CustomButton(
                      text: 'Submit Form',
                      buttonColor: Colors.red,
                      onPressed: () async {
                        await users.add({
                          'country': 'turkey',
                          'Comments': homeController.commentController!.text,
                          'CourseLevel':
                              homeController.selectedCourseType.value,
                          'DateOfBirth': DateFormat('dd/MM/yyyy')
                              .format(homeController.formDOB.value),
                          'Email': homeController.emailController!.text,
                          'FullName': homeController.nameController!.text,
                          'Phone': homeController.phoneController!.text,
                          'Program': homeController.programController!.text,
                          'status': 1
                        }).then((value) {
                          if (homeController.emailController?.text.isNotEmpty ==
                              true) {
                            registeredEmails.add({
                              "email": homeController.emailController!.text
                            });
                          }
                          homeController.clearControllerValues();
                        });
                        if (ResponsiveWidget.isMobile) {
                          Navigator.pop(context);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Form submitted Successfully.")));
                      },
                      textStyle:
                          AppTextStyle.paleText.copyWith(color: pureWhite),
                      //width: 20 * SizeConfig.widthMultiplier!,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSizedBox() {
    return SizedBox(
      height: (ResponsiveWidget.isWebScreen ? 20 : 10) *
          SizeConfig.heightMultiplier!,
    );
  }
}

class DiagonalPathClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height - Get.height * 0.15)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
