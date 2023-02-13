import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';


class SearchFoodController extends GetxController with StateMixin<dynamic>, GetTickerProviderStateMixin {

  List<String> items = ["Food Item", "Restaurant"].obs;
  late TabController tabController;
  final TextEditingController searchTextField = TextEditingController();
  List<String> popularItemName = [
    "Chicken Hawaiian",
    "Chicken",
    "Biryani",
    "Qorma"
  ].obs;
  List<String> popularItemDetails = [
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple"
  ].obs;
  List<String> popularItemPrice = ["3.45", "4.45", "5.45", "6.45"].obs;
  List<String> popularItemRating = ["4.5", "4.4", "5.4", "1.4"].obs;
  List<String> popularItemImageUrl = [
    "https://images.unsplash.com/photo-1475090169767-40ed8d18f67d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ].obs;
  List<String> popularItemReviewCount = ["25", "25", "25", "25"].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }


}
