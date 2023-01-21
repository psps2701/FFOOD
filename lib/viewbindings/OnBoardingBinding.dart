import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/OnBoardingController.dart';


class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>OnBoardingController());
  }


}