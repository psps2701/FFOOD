import 'package:ffood/controllers/AuthController/LoginController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';


class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>LoginController());
  }


}