

import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/widgets/back_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../util/get_storage_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/MainScreen/ReviewScreenController.dart';
import '../controllers/RestaurantProfileController.dart';
import '../themecolor/ThemeColors.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/big_text.dart';
import '../widgets/common_image_view.dart';
import '../widgets/conatiner_with_image.dart';
import '../widgets/featureItemCard.dart';
import '../widgets/popular_item_card.dart';
import '../widgets/resturent_profile_list_card.dart';
import '../widgets/small_text.dart';
import '../widgets/tag_box.dart';


class RestaurantProfileScreen extends GetView<RestaurantProfileController>

{
  const RestaurantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<RestaurantProfileController>(

        builder: (controller) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
          systemNavigationBarColor:  ThemeColors().mainBgColor  , // Navigation bar
          statusBarColor:  ThemeColors().statusBarColor,
          statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
          statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark
        // Status bar
      ),
      child:
        SafeArea(child:
        Scaffold(
        backgroundColor:ThemeColors().mainBgColor,
        body: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: ScreenUtil().screenHeight * 0.45,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0.r),
                          child: Image.asset(
                            "assets/banner.png",
                          )),
                    ),
                    // back button
                    Positioned(
                      // top: 0,
                      left: 15,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: CustomBackButton(),
                        ),
                      ),
                    ),

                    Positioned(
                      // bottom: 0,
                      top: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {

                                    controller.gridPressed.value = false;

                                  },
                                  child: ImageContainer(
                                    imageName: "assets/list_option.png",
                                    width: 51.w,
                                    height: 51.h,
                                    isPressed: !controller.gridPressed.value, themeValue: 0,
                                  )),
                              SizedBox(
                                width: 150.w,
                              ),

                              GestureDetector(
                                  onTap: () {
                                    controller.gridPressed.value = true;
                                  },
                                  child: ImageContainer(
                                    imageName: "assets/grid_option.png",
                                    width: 51.w,
                                    height: 51.h,
                                    isPressed: controller.gridPressed.value, themeValue: 0,
                                  )),
                            ],
                          ),
                          Center(child: BigText(text: "Pizza Hut", color: ThemeColors().kPrimaryTextColor,)),
                          SmallText(
                            text: "4102  Pretty View Lanenda",
                            size: 13,
                            color: ThemeColors().kSecondaryTextColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              height: 34.h,
                              // width: ScreenUtil().screenWidth,
                              child: Align(
                                alignment: Alignment.center,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller.tagBoxLabel.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: TagBoxWidget(
                                            tagLAbel: controller.tagBoxLabel[index],
                                            color: ThemeColors().tagBoxColor,
                                            textColor: ThemeColors().kPrimaryTextColor,
                                            labelSize: 12.sp.toInt(), themeValue: 0,
                                          ));
                                    }),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset("assets/rider.png"),
                              SizedBox(
                                width: 5,
                              ),
                              SmallText(
                                text: "Free delivery",
                                size: 14.sp,
                                color: loginPageLabelColor,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset("assets/stopwatch.png"),
                              SizedBox(
                                width: 5,
                              ),
                              SmallText(
                                text: "10-15 mins",
                                size: 14.sp,
                                color: loginPageLabelColor,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/resurent_profile_star.png",
                                width: 20,
                                height: 20,
                              ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              BigText(
                                text: "4.5",
                                size: MediaQuery.of(context).size.height * 0.0177,
                                color: ThemeColors().kPrimaryTextColor ,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SmallText(
                                text: "(25+)",
                                size: MediaQuery.of(context).size.height * 0.0144,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              controller.gridPressed.value ? RestaurantProfileGridView() : RestaurantProfileListView()
            ],
          ),
        ),
      )
        ),
    );});
  }


  Widget RestaurantProfileListView(){
    return Column(
      children: [
        Container(
          width:75.w,
          height: 22.h,
          // padding: EdgeInsets.only(right: 16, bottom: 3).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: orangeColor

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: SmallText(text: "Menu", color: ThemeColors().kSecondaryTextColorReverse, size: 12.sp,)),
              Icon(Icons.arrow_drop_down_circle, color:  ThemeColors().kSecondaryTextColorReverse, size: 15,)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BigText(text: "Pizza", color:  ThemeColors().kPrimaryTextColor,),
            ),
            Expanded(
              child: Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 16.w,
                height: 16.h,
                // padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: ShapeDecoration(
                  // shadows: [
                  //   BoxShadow(
                  //     // color: Colors.grey.withOpacity(0.2),
                  //       blurRadius: 3,
                  //       color: greayColor,
                  //       offset: Offset(1, 10))
                  // ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5).w)),
                    color: orangeColor),
                child: Center(
                    child: SmallText(
                      text: "9",
                      size: 11.sp,
                      color: Colors.white,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 10.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),


          ],
        ),
        SizedBox(
          height: 200.h,
          width: ScreenUtil().screenWidth,
          child: ListView.builder(
              itemCount: controller.dishName.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: ResturentProfileListCard(name: controller.dishName[index],themeValue: 0,),
                );

              }),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BigText(text: "Salad", color:  ThemeColors().kPrimaryTextColor ,),
            ),
            Expanded(
              child: Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 16.w,
                height: 16.h,
                // padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: ShapeDecoration(
                  // shadows: [
                  //   BoxShadow(
                  //     // color: Colors.grey.withOpacity(0.2),
                  //       blurRadius: 3,
                  //       color: greayColor,
                  //       offset: Offset(1, 10))
                  // ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5).w)),
                    color: orangeColor),
                child: Center(
                    child: SmallText(
                      text: "9",
                      size: 11.sp,
                      color: Colors.white,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 10.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),


          ],
        ),

        SizedBox(
          height: 500.h,
          width: ScreenUtil().screenWidth,
          child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
              itemCount: controller.dishName.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: ResturentProfileListCard(name: controller.saladName[index], themeValue:  0,),
                );

              }),
        ),






      ],
    );
  }

  Widget RestaurantProfileGridView(){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Featured items", color: ThemeColors().kPrimaryTextColor,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Container(
                  width: 14.w,
                  height: 14.h,
                  // padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: ShapeDecoration(
                    // shadows: [
                    //   BoxShadow(
                    //     // color: Colors.grey.withOpacity(0.2),
                    //       blurRadius: 3,
                    //       color: greayColor,
                    //       offset: Offset(1, 10))
                    // ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5).w)),
                      color: orangeColor),
                  child: Center(
                      child: SmallText(
                        text: "9",
                        size: 11.sp,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240.h,
          width: ScreenUtil().screenWidth,
          child: ListView.builder(
              itemCount: controller.name.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(
                      8),
                  child: FeatureItemCard(
                    name: controller.name[index],
                    details: controller.details[index],
                    rating: controller.rating[index],
                    reviewsCount: controller.reviewCount[index],
                    imageUrl: controller.imageUril[index],
                    price: controller.price[index], themeValue: 0,),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: ScreenUtil().screenWidth,
          // height: 100,
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                    itemCount: controller.tabItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          margin: EdgeInsets.all(5).w,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          // width: 100,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: greayColor),
                              borderRadius: BorderRadius.circular(25.r),
                              color: controller.current == index ? orangeColor:ThemeColors().kSecondaryTextColorReverse),
                          child: Center(child: SmallText(text: controller.tabItems[index],color: controller.current == index ? ThemeColors().kPrimaryTextColor : ThemeColors().kPrimaryTextColor, size: 15.sp,),),
                        ),
                      );

                    }),
              ),

              SizedBox(
                  height: 280.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.name.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return  PopularItemCard(name: controller.name[index], details: controller.details[index], rating: controller.rating[index], reviewsCount: controller.reviewCount[index], imageUrl: controller.imageUril[index], price: controller.price[index], themeValue: 0,);

                      }))
            ],
          ),
        )
      ],
    );
  }

}



