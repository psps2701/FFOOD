import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddressController extends GetxController  with GetTickerProviderStateMixin {



  final TextEditingController fullNameTextController = TextEditingController();
  final TextEditingController mobileNumberTextController = TextEditingController();
  final TextEditingController stateTextController = TextEditingController();
  final TextEditingController cityTextController = TextEditingController();
  final TextEditingController streetTextController = TextEditingController();


  @override
  Future<void> onInit() async {

    super.onInit();
  }
}
