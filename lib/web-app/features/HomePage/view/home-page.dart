import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skyisthelimit/web-app/core/constants/Strings.dart';
import 'package:skyisthelimit/web-app/core/constants/app-text-style.dart';
import 'package:skyisthelimit/web-app/core/constants/colors.dart';
import 'package:skyisthelimit/web-app/core/constants/image-paths.dart';
import 'package:skyisthelimit/web-app/core/responsive/SizeConfig.dart';
import 'package:skyisthelimit/web-app/core/widgets/CustomButton.dart';
import 'package:skyisthelimit/web-app/core/widgets/custom-dropdown.dart';
import 'package:skyisthelimit/web-app/features/HomePage/controller/homePage-Controller.dart';

import '../../../core/widgets/TextFieldContainer.dart';
import '../../../core/widgets/dob-widget.dart';
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

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    homeController.clearControllerValues();
    return Scaffold(
      backgroundColor: white244,
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
                  SizedBox(
                    width: Get.width,
                    child: Stack(
                      children: [
                        Container(
                          height: 700 * SizeConfig.widthMultiplier!,
                          color: pureWhite,
                          width: Get.width,
                          child: ImageCarousalWidget(),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "SKY\nIS THE\nLIMIT",
                              style: AppTextStyle.neueHaasWhiteFont
                                  .copyWith(color: pureWhite, fontSize: 30),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Contact Us:- admin@skyisthelimt.com",
                              style: AppTextStyle.neueHaasWhiteFont
                                  .copyWith(color: pureWhite, fontSize: 15),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          right: 60,
                          bottom: -40,
                          child: Material(
                            elevation: 10,
                            child: Container(
                              padding: const EdgeInsets.all(25),
                              color: pureWhite,
                              height: Get.height * 0.9,
                              width: 450,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomDropDown(
                                    color: Colors.transparent,
                                    width: 300 * SizeConfig.widthMultiplier!,
                                    hint: "heel",
                                    labelText: "Country",
                                    listofItems: const ["Turkey"],
                                    onChanged: null,
                                    value: "Turkey",
                                  ),
                                  SizedBox(
                                    height: 20 * SizeConfig.heightMultiplier!,
                                  ),
                                  Flexible(
                                    child: TextFieldContainer(
                                      wantLabel: true,
                                      label: "Name",
                                      hint: 'Enter Full Name',
                                      isObsecure: false,
                                      onChanged: () {},
                                      suffixWidget: const SizedBox(),
                                      textEditingController:
                                          homeController.nameController!,
                                      textInputType: TextInputType.text,
                                      subLabel: 'your full name',
                                      width: 300 * SizeConfig.widthMultiplier!,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20 * SizeConfig.heightMultiplier!,
                                  ),
                                  Obx(
                                    () => dobField(
                                        width:
                                            300 * SizeConfig.widthMultiplier!,
                                        dobLabel: "Date Birth",
                                        dobSubLabel: "select\ndate of birth",
                                        dobvalue: DateFormat("dd/MM/yyyy")
                                            .format(
                                                homeController.formDOB.value),
                                        color: white238,
                                        onSelectDOB: () {
                                          _selectDate(context);
                                          print(homeController.formDOB.value
                                              .toString());
                                        }),
                                  ),
                                  SizedBox(
                                    height: 20 * SizeConfig.heightMultiplier!,
                                  ),
                                  Flexible(
                                    child: TextFieldContainer(
                                      wantLabel: true,
                                      label: "Email",
                                      hint: 'Enter Email',
                                      isObsecure: false,
                                      onChanged: () {},
                                      suffixWidget:
                                          const Icon(Icons.email_rounded),
                                      textEditingController:
                                          homeController.emailController!,
                                      textInputType: TextInputType.text,
                                      subLabel: 'a valid email',
                                      width: 300 * SizeConfig.widthMultiplier!,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20 * SizeConfig.heightMultiplier!,
                                  ),
                                  Flexible(
                                    child: TextFieldContainer(
                                      wantLabel: true,
                                      label: "Phone",
                                      hint: 'Enter Phone',
                                      isObsecure: false,
                                      onChanged: () {},
                                      suffixWidget: const SizedBox(),
                                      textEditingController:
                                          homeController.phoneController!,
                                      textInputType: TextInputType.text,
                                      subLabel: 'with country\ncode',
                                      width: 300 * SizeConfig.widthMultiplier!,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20 * SizeConfig.heightMultiplier!,
                                  ),
                                  Obx(
                                    () => CustomDropDown(
                                      color: pale,
                                      width: 300 * SizeConfig.widthMultiplier!,
                                      hint: "Bachelor's, Master's",
                                      labelText: "Course\n Level",
                                      listofItems: homeController.courseType,
                                      onChanged: (value) {
                                        homeController
                                            .selectedCourseType.value = value!;
                                      },
                                      value: homeController
                                                  .selectedCourseType.value ==
                                              ""
                                          ? null
                                          : homeController
                                              .selectedCourseType.value,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20 * SizeConfig.heightMultiplier!,
                                  ),
                                  Flexible(
                                    child: TextFieldContainer(
                                      wantLabel: true,
                                      label: "Program",
                                      hint:
                                          'Eg:- Accounting, Finance & Economics',
                                      optional: true,
                                      isObsecure: false,
                                      onChanged: () {},
                                      suffixWidget: const SizedBox(),
                                      textEditingController:
                                          homeController.programController!,
                                      textInputType: TextInputType.text,
                                      subLabel: 'interested',
                                      width: 300 * SizeConfig.widthMultiplier!,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20 * SizeConfig.heightMultiplier!,
                                  ),
                                  Flexible(
                                      child: LargeTextField(
                                    label: 'Comments',
                                    wantLabel: true,
                                    textEditingController:
                                        homeController.commentController!,
                                    onChanged: () {},
                                    subLabel: "Questions",
                                    hint: 'Enter comments',
                                    width: 300 * SizeConfig.widthMultiplier!,
                                  )),
                                  SizedBox(
                                    height: 40 * SizeConfig.heightMultiplier!,
                                  ),
                                  SizedBox(
                                    width: 120 * SizeConfig.widthMultiplier!,
                                    child: CustomButton(
                                      text: 'Submit Form',
                                      buttonColor: Colors.red,
                                      onPressed: () async {
                                        await users.add({
                                          'country': 'turkey',
                                          'Comments': homeController
                                              .commentController!.text,
                                          'CourseLevel':
                                              homeController.courseType,
                                          'DateOfBirth':
                                              homeController.formDOB.value,
                                          'Email': homeController
                                              .emailController!.text,
                                          'FullName': homeController
                                              .nameController!.text,
                                          'Phone': homeController
                                              .phoneController!.text,
                                          'Program': homeController
                                              .programController!.text
                                        }).then((value) {
                                          print("User added");
                                          homeController
                                              .clearControllerValues();
                                        });
                                      },
                                      textStyle: AppTextStyle.paleText
                                          .copyWith(color: pureWhite),
                                      //width: 20 * SizeConfig.widthMultiplier!,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                      //5
                      CommonTextWidget(
                        title: Strings.title5,
                        wantImage: true,
                        image: ImagePath.image3,
                        subtitle: Strings.subtitle5,
                      ),
                      //6
                      CommonTextWidget(
                        title: Strings.title6,
                        subtitle: Strings.subtitle6,
                      ),
                      //7
                      CommonTextWidget(
                        title: Strings.title7,
                        subtitle: Strings.subtitle7,
                        wantImage: true,
                        image: ImagePath.image4,
                      ),
                      //8
                      CommonTextWidget(
                        title: Strings.title8,
                        subtitle: Strings.subtitle8,
                      ),
                      //9
                      CommonTextWidget(
                        title: Strings.title9,
                        subtitle: Strings.subtitle9,
                        wantImage: true,
                        image: ImagePath.image5,
                      ),
                      //10
                      CommonTextWidget(
                        title: Strings.title10,
                        subtitle: Strings.subtitle10,
                      ),
                      //11
                      CommonTextWidget(
                        title: Strings.title11,
                        subtitle: Strings.subtitle11,
                        wantImage: true,
                        image: ImagePath.image6,
                      ),
                      //12
                      CommonTextWidget(
                        title: Strings.title12,
                        subtitle: Strings.subtitle12,
                      ),
                      //13
                      CommonTextWidget(
                        title: Strings.title13,
                        subtitle: Strings.subtitle13,
                        wantImage: true,
                        image: ImagePath.image7,
                      ),
                      //14
                      CommonTextWidget(
                        title: Strings.title14,
                        subtitle: Strings.subtitle14,
                      ),
                      //15
                      CommonTextWidget(
                        title: Strings.title15,
                        subtitle: Strings.subtitle15,
                        wantImage: true,
                        image: ImagePath.image8,
                      ),
                      //16
                      CommonTextWidget(
                        title: Strings.title16,
                        subtitle: Strings.subtitle16,
                      ),
                      //17
                      CommonTextWidget(
                        title: Strings.title17,
                        subtitle: Strings.subtitle17,
                      ),
                      //18
                      CommonTextWidget(
                        title: Strings.title18,
                        subtitle: Strings.subtitle18,
                      ),
                      //19
                      CommonTextWidget(
                        title: Strings.title19,
                        subtitle: Strings.subtitle19,
                        wantImage: true,
                        image: ImagePath.image9,
                      ),
                      //20
                      CommonTextWidget(
                        title: Strings.title20,
                        subtitle: Strings.subtitle20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
