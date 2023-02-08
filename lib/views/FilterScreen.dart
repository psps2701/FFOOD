import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/CategoryScreenController.dart';
import 'package:ffood/controllers/FilterScreenController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/RatingController.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/big_text.dart';
import '../widgets/category_screen_food_container.dart';
import '../widgets/common_image_view.dart';
import '../widgets/conatiner_with_image.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/small_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class FilterScreen extends GetView<FilterScreenController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: CustomBackButton(),
                    ),
                    SizedBox(
                      width: 98.w,
                    ),
                    BigText(
                      text: "Filters",
                      size: 18.sp,
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BigText(
                    text: "Cuisines",
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.dishNames.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 45),
                    itemBuilder: (_, index) {
                      final pressAttention = controller.pressedAttentionIndex == index;
                      return GestureDetector(
                        onTap: () {

                          controller.pressedAttentionIndex = index;

                        },
                        child: Container(
                          // width: 122.w,
                          // height: MediaQuery.of(context).size.height * 0.01,
                          // alignment: Alignment.center,
                          // padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: pressAttention ? 4 : 1,
                                  offset:
                                  pressAttention ? Offset(4, 10) : Offset(1, 4),
                                  color: pressAttention
                                      ? orangeColor.withOpacity(0.2)
                                      : Colors.grey.withOpacity(0.6),
                                )
                              ],
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: pressAttention
                                          ? orangeColor
                                          : Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100.r))),
                              color: pressAttention ? orangeColor : Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: Container(
                                    width: 31.w,
                                    height: 31.h,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100.r),
                                        child: Image.asset(
                                          controller.imageUrl[index],
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                    child: Text(
                                      controller.dishNames[index],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style:TextStyle(color: ThemeColors().kPrimaryTextColor
                                      ),
                                    )
                                )
                              ],
                            )),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BigText(
                    text: "Short by",
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.shortBy.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 45),
                    itemBuilder: (_, index) {
                      final shortByPressAttention = controller.shortByAttentionIndex == index;
                      return GestureDetector(
                        onTap: () {

                            controller. shortByAttentionIndex = index;

                        },
                        child: Container(
                          // width: 122.w,
                          // height: MediaQuery.of(context).size.height * 0.01,
                          // alignment: Alignment.center,
                          // padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: shortByPressAttention ? 4 : 1,
                                  offset: shortByPressAttention
                                      ? Offset(4, 10)
                                      : Offset(1, 4),
                                  color: shortByPressAttention
                                      ? orangeColor.withOpacity(0.2)
                                      : Colors.grey.withOpacity(0.6),
                                )
                              ],
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: shortByPressAttention
                                          ? orangeColor
                                          : Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100.r))),
                              color: shortByPressAttention
                                  ? orangeColor
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                                child: BigText(
                                  text: controller.shortBy[index],
                                  size: 13.sp,
                                  color: shortByPressAttention
                                      ? Colors.white
                                      : blackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BigText(
                    text: "Rating",
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.rating.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 45),
                    itemBuilder: (_, index) {
                      final ratingPressAttention =controller.ratingAttentionIndex == index;
                      return GestureDetector(
                        onTap: () {

                          controller.ratingAttentionIndex = index;

                        },
                        child: Container(
                          // width: 122.w,
                          // height: MediaQuery.of(context).size.height * 0.01,
                          // alignment: Alignment.center,
                          // padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: ratingPressAttention ? 4 : 1,
                                  offset: ratingPressAttention
                                      ? Offset(4, 10)
                                      : Offset(1, 4),
                                  color: ratingPressAttention
                                      ? orangeColor.withOpacity(0.2)
                                      : Colors.grey.withOpacity(0.6),
                                )
                              ],
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ratingPressAttention
                                          ? orangeColor
                                          : Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100.r))),
                              color:
                              ratingPressAttention ? orangeColor : Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: BigText(
                                    text: controller.reversedRating[index],
                                    size: 13.sp,
                                    color: ratingPressAttention
                                        ? Colors.white
                                        : blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: Icon(
                                    Icons.star,
                                    size: 12,
                                    color: ratingPressAttention
                                        ? Colors.white
                                        : starColor,
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),
                SizedBox(height: 40.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BigText(
                        text: "Price range",
                        size: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BigText(
                        text: "€5 - €500",
                        size: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                RangeSlider(
                    values: controller.values,
                    max: 500,
                    min: 0,
                    activeColor: orangeColor,
                    inactiveColor: rangeBarColor,
                    onChanged: (values) {

                    }),

                SizedBox(height: 40.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: GestureDetector(
                          child: Container(
                              width: 153.w,
                              height: 60.h,
                              // height: MediaQuery.of(context).size.height * 0.06,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  border: Border.all(color: orangeColor),
                                  color: Colors.white),
                              child: BigText(
                                text: "Reset",
                                size: 15.sp,
                                color: orangeColor,
                              )

                            // Text(
                            //   'LOGIN',
                            //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                            // ),
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          child: Container(
                              width: 153.w,
                              height: 60.h,
                              // height: MediaQuery.of(context).size.height * 0.06,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(100.r))),
                                  color: orangeColor),
                              child: BigText(
                                text: "Apply",
                                size: 15.sp,
                                color: Colors.white,
                              )

                            // Text(
                            //   'LOGIN',
                            //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );;
  }

}