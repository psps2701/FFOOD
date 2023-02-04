import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class RatingController extends GetxController with StateMixin<dynamic> {

  TextEditingController reviewController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
