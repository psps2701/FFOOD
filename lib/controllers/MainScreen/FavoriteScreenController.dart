import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FavoriteScreenController extends GetxController with GetSingleTickerProviderStateMixin {

  TabController? tabController;


  List<String> items = ["Food Items", "Resturents"];
  List<String> name = ["Chicken Hawaiian", "Chicken", "Biryani", "Qorma"];
  List<String> details = [
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple"
  ];
  List<String> price = ["3.45", "4.45", "5.45", "6.45"];
  List<String> rating = ["4.5", "4.4", "5.4", "1.4"];
  List<String> imageUril = [
    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Zm9vZHxlbnwwfDB8MHx8&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ];

  List<String> favResList = [
    "https://images.unsplash.com/photo-1540914124281-342587941389?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://plus.unsplash.com/premium_photo-1663840344687-a91e96693fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ];

  List<String> reviewCount = ["25", "25", "25", "25"];

  @override
  Future<void> onInit() async {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.onInit();
  }
}
