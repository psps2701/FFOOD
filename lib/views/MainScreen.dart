import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/MainScreen/CartScreenController.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/MainScreen/MainScreenController.dart';
import '../themecolor/ThemeColors.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/common_image_view.dart';
import '../widgets/small_text.dart';
import 'CartScreen.dart';
import 'FavoriteScreen.dart';
import 'HomeScreen.dart';
import 'ReviewScreen.dart';
import 'package:get_storage/get_storage.dart';


class MainScreen extends GetView<MainScreenController>

{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetX<MainScreenController>(

      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor:  controller.isDarkMode.value ? ThemeColors().mainBgColor : ThemeColors().mainBgColor , // Navigation bar
            statusBarColor:  ThemeColors().statusBarColor,
            statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
            statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark,
            // Status bar
          ),
          child: Scaffold(
            backgroundColor: ThemeColors().mainBgColor,
            body: Container(
              height: size.height,
              child: Stack(
                children: [
                  PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: controller.mainScreenItems.value,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    left: 10,
                    child: Container(
                      height: 50,
                      margin: getMargin(left: 10,right: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color:  ThemeColors().mainBgColor,
                          boxShadow: [
                            BoxShadow(
                              color:  ThemeColors().outline.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          // border: Border.all(color: greyColor),
                          borderRadius: BorderRadius.circular(30).r
                      ),
                      child: Center(
                        child: GetX<MainScreenController>(

                            builder: (controller) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.mainScreenItems.length,
                                  scrollDirection:  Axis.horizontal,
                                  itemBuilder: (context, index){
                                    return InkWell(
                                      // splashColor: orangeColor,
                                      highlightColor: orangeColor,
                                      onTap: (){
                                        controller.currentIndex.value = index;

                                        print("currentIndex==>${controller.currentIndex.value}");
                                        HapticFeedback.mediumImpact();
                                        if(index == 2)
                                        {
                                          Get.lazyPut(() =>CartScreenController());
                                        }
                                        if(index == 0)
                                        {
                                          Get.lazyPut(() =>HomeScreenController());
                                        }
                                        controller.navigationTapped(index);
                                        controller.currentIndex.refresh();
                                      },
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                                        child: GetX<MainScreenController>(

                                            builder: (controller) {
                                              return Image.asset(controller.imagePath[index], color: controller.currentIndex.value == index ? orangeColor : bottomNavigationItemColors,);
                                            }
                                        ),
                                      ),
                                    );
                                  });
                            }
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
           /* bottomNavigationBar: Container(
              // width: 3.w,
                height: 70.h,
                color: ThemeColors().mainBgColor,
                child: Container(
                  margin: const EdgeInsets.all(10).w,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color:  ThemeColors().mainColor,
                      boxShadow: [
                        BoxShadow(
                          color: ThemeColors().outline.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      // border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(30).r
                  ),
                  child: Center(
                    child: GetX<MainScreenController>(

                      builder: (controller) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.mainScreenItems.length,
                            scrollDirection:  Axis.horizontal,
                            itemBuilder: (context, index){
                              return InkWell(
                                // splashColor: orangeColor,
                                highlightColor: orangeColor,
                                onTap: (){
                                  controller.currentIndex.value = index;

                                  print("currentIndex==>${controller.currentIndex.value}");

                                  if(index == 0)
                                  {
                                    Get.lazyPut(() =>HomeScreenController());
                                  }
                                  HapticFeedback.mediumImpact();
                                  controller.navigationTapped(index);
                                  controller.currentIndex.refresh();
                                },
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                                  child: GetX<MainScreenController>(

                                    builder: (controller) {
                                      return Image.asset(controller.imagePath[index], color: controller.currentIndex.value == index ? orangeColor : bottomNavigationItemColors,);
                                    }
                                  ),
                                ),
                              );
                            });
                      }
                    ),
                  ),
                )
            ),*/
          ),
        );
      }
    );;
  }
}