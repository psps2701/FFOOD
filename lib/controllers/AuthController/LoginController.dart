import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LoginController extends GetxController with StateMixin<dynamic> {

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading=false;
  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
