import 'package:ffood/controllers/AuthController/LoginController.dart';
import 'package:ffood/controllers/AuthController/RegistrationController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';


class RegistrationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>RegistrationController());
  }


}