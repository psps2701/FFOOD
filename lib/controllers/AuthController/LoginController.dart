import 'package:ffood/Route/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../widgets/custom_snack_bar.dart';


class LoginController extends GetxController with StateMixin<dynamic> {

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var  isLoading=false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
  }


  Future<void> login() async {
    String email = numberController.text.trim();
    String password = passwordController.text.trim();
    Get.toNamed(Routes.homeScreen);
/*    if(email.isEmpty) {
      showCustomsnackBar("Email cannot be empty");

    }else if(password.isEmpty) {
      showCustomsnackBar("Password cannot be empty");

    }else if(!GetUtils.isEmail(email)){
      showCustomsnackBar("Email is not in right format");

    }
    else
    {
      Get.toNamed(Routes.homeScreen);
    }*/

  }
}
