import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/MainScreen/ReviewScreenController.dart';


class ReviewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>ReviewScreenController());
  }


}