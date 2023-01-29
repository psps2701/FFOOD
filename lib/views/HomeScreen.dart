import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:ffood/views/HomeView.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/common_image_view.dart';
import '../widgets/small_text.dart';
import 'DrawerScreen.dart';

import 'package:get_storage/get_storage.dart';
class HomeScreen extends GetView<HomeScreenController>

{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => HomeScreenController());

    return  SafeArea(

      child:GetX<HomeScreenController>(

          builder: (controller) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value:   SystemUiOverlayStyle(
                systemNavigationBarColor:  controller.isDarkMode.value  ? ThemeColors().mainBgColor  : ThemeColors().mainBgColor , // Navigation bar
                statusBarColor:  ThemeColors().statusBarColor,
                statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
                statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark,
                // Status bar
              ),
              child: Scaffold(

                body: Stack(
                  children:  [
                    DrawerScreen(),
                    HomeView(),
                  ],
                ),
              ),
            );
          }
      ),);;
  }

}