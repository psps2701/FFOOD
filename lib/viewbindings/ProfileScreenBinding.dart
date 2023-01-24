import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/MainScreen/ProfileScreenController.dart';


class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>ProfileScreenController());
  }


}