import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class RegistrationController extends GetxController with StateMixin<dynamic> {

  TextEditingController numberTextFieldController = TextEditingController();
  bool isLoading = false;
  String dialcode = "";

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
