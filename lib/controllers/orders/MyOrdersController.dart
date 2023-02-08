import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyOrdersController extends GetxController  with GetTickerProviderStateMixin {

  late TabController tabController;

  var isFromSide = false.obs;
  List<String> items = ["Upcoming", "History"].obs;
  int orders = 0;



  @override
  Future<void> onInit() async {

    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }
}
