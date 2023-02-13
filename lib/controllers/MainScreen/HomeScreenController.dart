import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/HomeResponseModel.dart';
import '../../Service/ApiService.dart';
import '../../helper/SharedKey.dart';
import '../../helper/singleton.dart';
import '../../util/app_themes.dart';
import '../../util/get_storage_key.dart';
import '../../widgets/custom_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController with StateMixin<dynamic> {
  var isLoading = false.obs;

  var listPressed = false.obs;
  var gridPressed = true.obs;
  var isDarkModel = false.obs;
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

  late final GetStorage _getStorage;
  var isDarkMode = false.obs;

  final TextEditingController searchTextField = TextEditingController();
  var xOffset = 0.0.obs;
  var yOffset = 0.0.obs;
  var scaleFactor = 1.0.obs;

  var isDrawerOpen = false.obs;
  var page = 0.obs;
  PageController pageController = PageController();



  var sharedPreferences;
  var homeResposneModel = HomeResponseModel(success: false, message: '').obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _getStorage = GetStorage();
    sharedPreferences = await SharedPreferences.getInstance();
    isDarkMode.value = _getStorage.read(GetStorageKey.IS_DARK_MODE);
    //await home();
  }

  void changeTheme(BuildContext context) {
    if (kDebugMode) {
      print("isDarkMode==>${GetStorage().read(GetStorageKey.IS_DARK_MODE)}");
    }
    final theme = GetStorage().read(GetStorageKey.IS_DARK_MODE)
        ? AppThemes.lightThemeData
        : AppThemes.darkThemeData;
    ThemeSwitcher.of(context).changeTheme(theme: theme);
    if (_getStorage.read(GetStorageKey.IS_DARK_MODE)) {
      _getStorage.write(GetStorageKey.IS_DARK_MODE, false);
      isDarkMode.value = false;
    } else {
      _getStorage.write(GetStorageKey.IS_DARK_MODE, true);
      isDarkMode.value = true;
    }
  }

  void closeDrawer()
  {
    if(isDrawerOpen.value == true) {
      xOffset.value = 0;
      yOffset.value = 0;
      scaleFactor.value = 1;
      isDrawerOpen.value  = false;
    }else{
      isDrawerOpen.value = true;
      xOffset.value = 200;
      yOffset.value = 200;
      scaleFactor.value = 0.6;
    }
  }

  Future<void> home() async {


      late Map<String, String> body;

      body = {
        "latitude":"40.77938309719483",
        "longitude":"21.404710494379223"
      };

      var homeResponse = await ApiService.home(body);

      if (homeResponse.success!) {
        homeResposneModel.value =homeResponse ;
      }
      else
      {
        showCustomsnackBar(homeResponse.message!);
      }



  }
}
