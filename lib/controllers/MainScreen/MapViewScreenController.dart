import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MapViewScreenController extends GetxController with StateMixin<dynamic> {

  TextEditingController reviewController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }


  var isDarkMode = false.obs;
}
