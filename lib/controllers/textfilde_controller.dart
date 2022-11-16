import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TextfieldController extends GetxController{
  TextEditingController? taskTitle;
  TextEditingController? taskSubtitle;

  @override
  void onInit(){
    taskTitle = TextEditingController();
    taskSubtitle = TextEditingController();
    super.onInit();
  }
}