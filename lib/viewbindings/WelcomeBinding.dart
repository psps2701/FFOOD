import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/MainScreen/HomeScreenController.dart';


class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>HomeScreenController());
  }


}