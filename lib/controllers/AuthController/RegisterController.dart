import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController with StateMixin<dynamic> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading=false;


  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
