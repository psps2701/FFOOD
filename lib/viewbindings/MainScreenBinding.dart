import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/MainScreen/MainScreenController.dart';


class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>MainScreenController());
  }


}