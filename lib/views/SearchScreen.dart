import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/MainScreen/ReviewScreenController.dart';
import '../controllers/SearchController.dart';
import '../themecolor/ThemeColors.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/back_button.dart';
import '../widgets/big_text.dart';
import '../widgets/common_image_view.dart';
import '../widgets/conatiner_with_image.dart';
import '../widgets/small_text.dart';
import '../widgets/text_field_with_icon.dart';
import 'package:get_storage/get_storage.dart';


class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SearchController>(

        builder: (controller) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                systemNavigationBarColor:  ThemeColors().mainBgColor, // Navigation bar
                statusBarColor:  ThemeColors().statusBarColor,
                statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
                statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark,
// Status bar
              ),
              child:
              SafeArea(child:
              Scaffold(
                backgroundColor: ThemeColors().mainBgColor,
                body: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CustomBackButton()),
                    ),
                    BigText(text: "Search Food",color: ThemeColors().kPrimaryTextColor,),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 38.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Image.asset("assets/sidemenuuser.png")),
                        )),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [

                      //
                      IconAppTextField(
                        textController: controller.searchTextField,
                        icon: Icons.search_outlined,
                        hintText: "Find for food or restaurant...",
                      ),
                      // Expanded(child: Container()),
                      SizedBox(width: 4,),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                            onTap: () {


                            },
                            child: ImageContainer(
                              imageName: "assets/filter_button.png",
                              width: 48.w,
                              height: 48.h, themeValue: 0,
                              // isPressed: gridPressed,
                            )),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: BigText(text: "Recent searches", size: 18.sp,color: ThemeColors().kPrimaryTextColor,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.searchList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Icon(Icons.access_time_rounded,
                                color: ThemeColors().kSecondaryTextColor, size: 19,),
                              SizedBox(width: 10.w,),
                              SmallText(text: controller.searchList[index],
                                color: ThemeColors().kSecondaryTextColor,
                                size: 15.sp,),

                            ],
                          ),
                        );
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: BigText(text: "Cuisines", size: 18.sp,),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
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

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
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
                                    pressAttention ? Offset(4, 10) : Offset(
                                        1, 4),
                                    color: pressAttention
                                        ? ThemeColors().mainOrangeWhite.withOpacity(0.2)
                                        : ThemeColors().greyBlack.withOpacity(0.6),
                                  )
                                ],
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: pressAttention
                                            ? ThemeColors().mainColor
                                            : ThemeColors().mainColor),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(100.r))),
                                color: pressAttention ? ThemeColors().greyBlack : ThemeColors().greyBlack,
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
                                          borderRadius: BorderRadius.circular(
                                              100.r),
                                          child: Image.asset(
                                            controller.imageUrl[index],
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: Text(
                                        controller.dishNames[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: pressAttention
                                                ? ThemeColors().kPrimaryTextColor
                                                : ThemeColors().kPrimaryTextColor,
                                            fontWeight: FontWeight.w500
                                        ),
                                      )
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                ),




                ],),
              )
          ),);
        });
  }

}