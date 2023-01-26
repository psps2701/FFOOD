import 'package:ffood/util/images.dart';
import 'package:ffood/views/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../views/CartScreen.dart';
import '../../views/FavoriteScreen.dart';
import '../../views/ProfileScreen.dart';
import '../../views/ReviewScreen.dart';


class MainScreenController extends GetxController with StateMixin<dynamic> {


 PageController  pageController = PageController();
 var currentIndex = 0.obs;
 var page = 0.obs;
 List<String> imagePath = [Images.bottomHome,Images.bottomLocation ,Images.bottomCart,Images.bottomFavorite,Images.bottomNotification ];

 var mainScreenItems = [
    HomeScreen(),
    ReviewScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ].obs;

  @override
  Future<void> onInit() async {

    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

 void navigationTapped(int page) {
   // this will act as a link between tab bar and the pageView widget in the scaffold body.
   pageController.jumpToPage(page);
 }


}
