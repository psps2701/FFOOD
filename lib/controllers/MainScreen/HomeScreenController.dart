import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class HomeScreenController extends GetxController with StateMixin<dynamic> {

  var isLoading = false.obs;


  final TextEditingController searchTextField = TextEditingController();
  var xOffset = 0.obs;
  var yOffset = 0.obs;
  var scaleFactor = 1.obs;
  var isDrawerOpen = false.obs;
  var page = 0.obs;
  PageController pageController = PageController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
