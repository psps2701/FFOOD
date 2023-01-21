import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class OnBoardingController extends GetxController with StateMixin<dynamic> {

  PageController pageController = PageController();
  var isLastPage = false.obs;
  var isComplete = false.obs;


  @override
  Future<void> onInit() async {
    isComplete.value = true;
    super.onInit();
  }
}
