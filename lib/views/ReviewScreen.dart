import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/MainScreen/MainScreenController.dart';
import '../controllers/MainScreen/ReviewScreenController.dart';
import '../themecolor/ThemeColors.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/CustomCard.dart';
import '../widgets/big_text.dart';
import '../widgets/common_image_view.dart';
import '../widgets/review_card.dart';
import '../widgets/small_text.dart';


class ReviewScreen extends GetView<ReviewScreenController>

{
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => ReviewScreenController());

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor:  ThemeColors().mainBgColor, // Navigation bar
        statusBarColor:  ThemeColors().statusBarColor,
        statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
        statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark,
          // Status bar
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ThemeColors().mainBgColor,
          body: Column(
            children: [
              Row(
                // crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  GestureDetector(
                    // onTap: navigateToHomeScreen,
                    child: GestureDetector(
                      onTap: (){
                        var cm = Get.find<MainScreenController>();

                        cm.navigationTapped(0);
                        cm.currentIndex.value = 0 ;
                        cm.currentIndex.refresh();
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        margin: getMargin(left: 15,top: 15,bottom: 10),
                        // padding: EdgeInsets.symmetric(horizontal: 15),

                        child: CustomCard(
                          margin: 0,
                          color: ThemeColors().shadow.withOpacity(0.3),
                          bgColor: ThemeColors().mainColor,
                          blurRadius: 10,
                          child: Image.asset(Images.icBack, color: ThemeColors().lightDark,
                          ),
                        ),
                      ),
                    ),
                  ),


                  Expanded(child: Center(child: BigText(text: "Review", size: 20.sp,color: ThemeColors().lightDark,))),
                  Container(
                    width: 38,
                    height: 38,
                    margin: getMargin(left: 15,top: 15,bottom: 10),
                    // padding: EdgeInsets.symmetric(horizontal: 15),


                  ),
                ],
              ),
              SizedBox(height: 20,),

              Container(
                width: 350.w,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
                decoration: BoxDecoration(
                  color: ThemeColors().mainBgColor,
                  borderRadius: BorderRadius.circular(30),
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 3,
                  //     spreadRadius: 1,
                  //     offset: const Offset(1, 10),
                  //     color: Colors.grey.withOpacity(0.2),
                  //   )
                  // ]

                ),
                child: TextField(
                  controller: controller.reviewSearchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundImage: AssetImage(
                          "assets/sidemenuuser.png",
                        ),
                      ),
                    ),
                    hintStyle:  TextStyle(color: ThemeColors().lightDark, fontSize: 14.sp),
                    hintText: "Write your review...",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
                      borderSide:  BorderSide(
                        width: 2.0,
                        color: ThemeColors().mainColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
                      borderSide:  BorderSide(
                        width: 2.0,
                        color: ThemeColors().mainColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
                      borderSide:  BorderSide(
                        width: 2.0,
                        color: ThemeColors().mainColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Expanded(child: Container(
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0).r,
                        child: ReviewCard(),
                      );
                    }),
              ))
            ],
          ),
        ),
      ),
    );;
  }

}