import 'dart:convert';


import 'package:ffood/Route/Routes.dart';
import 'package:ffood/helper/SharedKey.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/LoginModel.dart';
import '../../Service/ApiService.dart';
import '../../helper/singleton.dart';
import '../../widgets/custom_snack_bar.dart';


class LoginController extends GetxController with StateMixin<dynamic> {

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

      late Map<String, String> body;

      body = {
        "email" : email,
        "password" : password
      };

      var loginResponse = await ApiService.login(body);

      if (loginResponse.success) {
        var userDataJson = json.encode(loginResponse.data?.toJson());
        sharedPreferences.setBool(SharedKey.isLoggedIn, true);
        Singleton.instance.setAuthToken("${loginResponse.data!.authToken}");
        Singleton.instance.setUserData(userDataJson);
        //showCustomsnackBar(loginResponse.message);
        Get.toNamed(Routes.homeScreen);
      } else {
        showCustomsnackBar(loginResponse.message);
      }

    }

  }
}
