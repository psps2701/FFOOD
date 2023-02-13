import 'dart:convert';


import 'package:ffood/Route/Routes.dart';
import 'package:ffood/helper/SharedKey.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/LoginModel.dart';
import '../../Service/ApiService.dart';
import '../../helper/singleton.dart';
import 'package:progress_state_button/progress_button.dart';
import '../../widgets/custom_snack_bar.dart';


class LoginController extends GetxController with StateMixin<dynamic> {

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginState = ButtonState.idle.obs;

  var  isLoading=false.obs;
  var sharedPreferences;
  var loginModel = LoginModel(success: false, message: '').obs;

  @override
  Future<void> onInit() async {
      sharedPreferences = await SharedPreferences.getInstance();

    super.onInit();
  }


  Future<void> login() async {
    String email = numberController.text.trim();
    String password = passwordController.text.trim();


    if(email.isEmpty) {
      showCustomsnackBar("Email cannot be empty");

    }else if(password.isEmpty) {
      showCustomsnackBar("Password cannot be empty");

    }else if(!GetUtils.isEmail(email)){
      showCustomsnackBar("Email is not in right format");
    }
    else
    {
      loginState.value = ButtonState.loading;

      late Map<String, String> body;

      body = {
        "email" : email,
        "password" : password
      };

      var loginResponse = await ApiService.login(body);

      if (loginResponse.success) {
        loginState.value = ButtonState.success;
        var userDataJson = json.encode(loginResponse.data?.toJson());
        sharedPreferences.setBool(SharedKey.isLoggedIn, true);
        Singleton.instance.setAuthToken("${loginResponse.data!.authToken}");
        Singleton.instance.setUserData(userDataJson);
        Future.delayed(const Duration(seconds: 1), () {
         // Get.toNamed(Routes.mainScreen);
        });
      } else {
        loginState.value = ButtonState.fail;
      }

    }

  }

  void onPressedIconWithText() async {
    switch (loginState.value) {
      case ButtonState.idle:
        loginState.value = ButtonState.loading;
        Future.delayed(const Duration(seconds: 1), () {

        });
        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        loginState.value = ButtonState.idle;
        break;
      case ButtonState.fail:
        loginState.value = ButtonState.idle;
        break;
    }
  }
}
