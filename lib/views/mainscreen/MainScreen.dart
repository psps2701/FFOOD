import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/MainScreen/CartScreenController.dart';
import '../../controllers/MainScreen/MainScreenController.dart';
import '../../util/colors.dart';



class MainScreen extends GetView<MainScreenController>

{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.mainScreenItems.value,
      ),
      bottomNavigationBar: Container(
        // width: 3.w,
          height: 70.h,
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(10).w,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color:  Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
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
      ),
    );;
  }
}