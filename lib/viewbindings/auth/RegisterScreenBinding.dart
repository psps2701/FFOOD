import 'package:ffood/controllers/AuthController/LoginController.dart';
import 'package:ffood/controllers/AuthController/RegisterController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';


class RegisterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>RegisterController());
  }


}