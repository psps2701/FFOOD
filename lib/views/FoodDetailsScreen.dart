import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/FoodDetailsController.dart';
import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/small_text.dart';

class FoodDetailsScreen extends GetView<FoodDetailsController> {
  const FoodDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.themeColor, // Navigation bar
          statusBarColor: ThemeColors().statusBarColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark

          // Status bar
          ),
      child: Scaffold(
        backgroundColor: ThemeColors().mainBgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/dish1.png",
                              fit: BoxFit.fitHeight,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.27,
                            )),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: CustomBackButton(),
                            ),
                            Flexible(child: Container()),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: GestureDetector(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  // padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: const ShapeDecoration(
                                      // shadows: withShadow == true
                                      //     ? [
                                      //         BoxShadow(
                                      //             // color: Colors.grey.withOpacity(0.2),
                                      //             blurRadius: 3,
                                      //             color: greayColor,
                                      //             offset: Offset(1, 10))
                                      //       ]
                                      //     : [],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100))),
                                      color: orangeColor),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8),
                    child: BigText(
                      text: "Ground Beef Tacos",
                      size: 31.sp,
                      color: ThemeColors().kPrimaryTextColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.ratingScreen),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/bigstar.png",
                            // width: 50,
                            // height: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          BigText(
                            text: "4.5",
                            size: 14,
                            color: ThemeColors().kPrimaryTextColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "(25+)",
                            size: 12,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                   onTap: ()=>Get.toNamed(Routes.ratingScreen),
                                  child: SmallText(
                                text: "See Review ",
                                color: orangeColor,
                                size:
                                    MediaQuery.of(context).size.height / 52.75,
                              )),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height: 2,
                                color: orangeColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BigText(
                              text: "€",
                              color: orangeColor,
                              size: 16.sp,
                            ),
                            BigText(
                              text: "9.50",
                              color: ThemeColors().kPrimaryTextColor,
                              size: MediaQuery.of(context).size.height * 0.034,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 38,
                                height: 38,
                                // padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: orangeColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    color: ThemeColors().mainColor),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: ThemeColors().kPrimaryTextColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            BigText(
                              text: "0",
                              color: ThemeColors().kPrimaryTextColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 38,
                                height: 38,
                                // padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: orangeColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    color: ThemeColors().mainColor),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 15,
                                    color: ThemeColors().kPrimaryTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16),
                    child: SmallText(
                        size: 15.sp,
                        color: textColor,
                        text:
                            "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: BigText(
                      text: "Choice of Add On",
                      size: 18.sp,
                      color: ThemeColors().kPrimaryTextColor,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 10.h),
                    child: Row(
                      children: [
                        Image.asset("assets/addon.png"),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: "Pepper  Julienned",
                          color: ThemeColors().kPrimaryTextColor,
                          size: 14.sp,
                        ),
                        Flexible(child: Container()),

                        // TODO: Radio button
                        Row(
                          children: [
                            SmallText(
                              text: "+\$2.30",
                              size: 14,
                              color: ThemeColors().kPrimaryTextColor,
                            ),
                            Radio(
                                value: 1,
                                groupValue: controller.valuen,
                                activeColor: orangeColor,
                                focusColor: orangeColor,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        ThemeColors().kPrimaryTextColor),
                                onChanged: (value) {})
                          ],
                        ),
                      ],
                    ),
                  ), //TODO: Addon list Tile
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        Image.asset("assets/addon.png"),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: "Baby Spinach",
                          color: ThemeColors().kPrimaryTextColor,
                          size: 14.sp,
                        ),
                        Flexible(child: Container()),

                        // TODO: Radio button
                        Row(
                          children: [
                            SmallText(
                              text: "+\$2.30",
                              size: 14,
                              color: ThemeColors().kPrimaryTextColor,
                            ),
                            Radio(
                                value: 2,
                                groupValue: 0,
                                activeColor: orangeColor,
                                focusColor: orangeColor,
                                onChanged: (value) {})
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45.h,),
                  Center(
                    child: Container(
                      width: 167.w,
                      height: 57.h,
                      decoration: ShapeDecoration(
                        shadows: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 3,
                              offset: Offset(1, 10))
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        color: orangeColor,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: ShapeDecoration(
                                  // shadows: [
                                  //   BoxShadow(
                                  //       color: Colors.grey.withOpacity(0.2),
                                  //       blurRadius: 3,
                                  //       offset: Offset(1, 10))
                                  // ],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  color: Colors.white),
                              child: Image.asset(
                                "assets/cart.png",
                                fit: BoxFit.none,
                                width: 12.w,
                              ),
                            ),
                          ),
                          SmallText(
                            text: "ADD TO CART",
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
