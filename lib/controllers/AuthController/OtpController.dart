import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
class OtpController extends GetxController with StateMixin<dynamic> {

  OtpFieldController otpController = OtpFieldController();
  bool isLoading = false;
  String email = "";
  String phone = "";

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
