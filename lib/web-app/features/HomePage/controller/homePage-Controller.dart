import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> courseType = [
    "Bachelor's Level",
    "Master's Level",
  ];
  Rx<DateTime> formDOB = DateTime.now().obs;
  RxString selectedCourseType = "".obs;
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? programController = TextEditingController();
  final TextEditingController? commentController = TextEditingController();
  final TextEditingController? dobController = TextEditingController();

  clearControllerValues() {
    nameController?.clear();
    emailController?.clear();
    programController?.clear();
    phoneController?.clear();
    commentController?.clear();
    selectedCourseType.value = "";
  }
}
