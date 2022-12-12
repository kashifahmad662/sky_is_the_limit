import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> courseType = [
    'Associate Level',
    "Bachelor's Level",
    "Master's Level",
    'Doctorate'
  ];
  Rx<DateTime> formDOB = DateTime.now().obs;
  RxString selectedCourseType = "".obs;
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? programController = TextEditingController();
  final TextEditingController? commentController = TextEditingController();

  clearControllerValues() {
    nameController?.clear();
    emailController?.clear();
    programController?.clear();
    phoneController?.clear();
    commentController?.clear();
    selectedCourseType.value = "";
  }
}
