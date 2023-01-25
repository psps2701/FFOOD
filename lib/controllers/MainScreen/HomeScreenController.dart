import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class HomeScreenController extends GetxController with StateMixin<dynamic> {

  var isLoading = false.obs;


  var listPressed = false.obs;
  var gridPressed = true.obs;


  var popularItemName = ["Chicken Hawaiian", "Chicken", "Biryani", "Qorma"].obs;

  var popularItemPrice = ["3.45", "4.45", "5.45", "6.45"];
  var popularItemRating = ["4.5", "4.4", "5.4", "1.4"];
  var popularItemImageUrl = [
    "https://images.unsplash.com/photo-1475090169767-40ed8d18f67d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  ];

  var popularItemDetails = [
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple"
  ];
  var popularItemReviewCount = ["25", "25", "25", "25"];

  var onPress = [false, true, false, false, false].obs;
  var imageUrl = [
    "assets/home_burger.png",
    "assets/donut.png",
    "assets/mexican.png",
    "assets/pizze.png",
    "assets/pizze.png"
  ].obs;

  var name = ['Burger', "Donat", "Pizza", "Mexican", "Asian"].obs;



  final TextEditingController searchTextField = TextEditingController();
  var xOffset = 0.0.obs;
  var yOffset = 0.0.obs;
  var scaleFactor = 1.0.obs;

  var isDrawerOpen = false.obs;
  var page = 0.obs;
  PageController pageController = PageController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
