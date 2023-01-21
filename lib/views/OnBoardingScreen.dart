import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/OnBoardingController.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/common_image_view.dart';
import '../widgets/small_text.dart';


class OnBoardingScreen extends GetView<OnBoardingController>

{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.themeColor, // Navigation bar
        statusBarColor: AppColors.themeColor, //

        // Status bar
      ),
      child: Scaffold(
        body: SafeArea(
          child: GetX<OnBoardingController>(

            builder: (controller) {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  controller.isComplete.value ? EdgeInsets.symmetric(horizontal: 0.0.w) : EdgeInsets.symmetric(horizontal: 30.0.w) ,
                        child: Container(


                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: PageView(
                            controller: controller.pageController,
                            onPageChanged: (index) {
                              controller.isLastPage.value = index == 2;
                            },
                            children: [
                              Column(

                                children: [
                Stack(
                  children: [
                      Container(

                        height : MediaQuery.of(context).size.height * 0.5,
                        child: CommonImageView(
                        imagePath:
                        Images.icOnBoardOne,

                        fit: BoxFit.contain,
                        width: size.width,
                        ),
                      ),
                      Positioned.fill(
                        bottom: 50,
                        child: Align(

                          alignment: Alignment.bottomCenter,


                          child: SmoothPageIndicator(
                            controller: controller.pageController,
                            count: 3,
                            effect: const WormEffect(
                                activeDotColor: orangeColor,
                                dotColor: loginPageLabelColor,
                                dotHeight: 4,
                                dotWidth: 8,
                                spacing: 4),
                            onDotClicked: (index) => controller.pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInCubic),
                          ),
                        ),
                      ),

                  ],
                ),



                                  Row(
                                    children: [

                                      Expanded(
                                        child: Container(

                                            width: MediaQuery.of(context).size.width * 0.8,
                                            child: SmallText(text: "Browse our menu and order directly", size: 30.sp,color: blackColor,)),
                                      ),
                                    ],
                                  ),//36


                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/onboarding_pic2.png", height: 345.h,),
                                  Center(
                                    child: SmoothPageIndicator(
                                      controller: controller.pageController,
                                      count: 3,
                                      effect: const WormEffect(
                                          activeDotColor: orangeColor,
                                          dotColor: loginPageLabelColor,
                                          dotHeight: 4,
                                          dotWidth: 8,
                                          spacing: 4),
                                      onDotClicked: (index) => controller.pageController.animateToPage(
                                          index,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInCubic),
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Row(
                                    children: [
                                      SizedBox(width: 10.w,),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          child: SmallText(text: "Even to space with us! Together", size: 30.sp,color: blackColor,)),
                                    ],
                                  ),//36


                                ],
                              ),

                              Column(
                                children: [
                                  Image.asset("assets/on_boarding_logo3.png", height: 345.h,),
                                  Center(
                                    child: SmoothPageIndicator(
                                      controller: controller.pageController,
                                      count: 3,
                                      effect: const WormEffect(
                                          activeDotColor: orangeColor,
                                          dotColor: loginPageLabelColor,
                                          dotHeight: 4,
                                          dotWidth: 8,
                                          spacing: 4),
                                      onDotClicked: (index) => controller.pageController.animateToPage(
                                          index,
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.easeInCubic),
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Row(
                                    children: [
                                      SizedBox(width: 10.w,),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          child: SmallText(text: "Pickup or Delivery at your door", size: 30.sp,color: blackColor,)),
                                    ],
                                  ),//36


                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                        onTap: (){
                          controller.isLastPage.value ?  Get.toNamed(Routes.homeScreen) : controller.pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                        },
                        child: Image.asset("assets/move_next.png", height: 130.h,))

                  ],
                ),
              );
            }
          ),
        ),
      ),
    );;
  }

}