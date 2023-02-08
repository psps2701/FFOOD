import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrdersEmptyController extends GetxController  with GetTickerProviderStateMixin {

  late TabController tabController;

  List<String> items = ["Upcoming", "History"].obs;
  int orders = 0;



  @override
  Future<void> onInit() async {

    super.onInit();
  }
}
