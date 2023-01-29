import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../util/colors.dart';
import 'big_text.dart';
import 'small_text.dart';

void showCustomsnackBar(String message, {bool isError =true, String title = "Error"}){
  Get.snackbar(title, message,titleText: Center(child: BigText(text: title, color: Colors.white,)), messageText: Center(child: SmallText(text: message, color: Colors.white,)), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: iconColor);
}