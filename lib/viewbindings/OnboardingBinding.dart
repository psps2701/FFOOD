import 'package:ffood/controllers/OnBoardingController.dart';
import 'package:get/get.dart';


class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>OnBoardingController());
  }


}