import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/SearchFoodController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themecolor/ThemeColors.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../widgets/back_button.dart';
import '../widgets/big_text.dart';
import '../widgets/conatiner_with_image.dart';
import '../widgets/find_resturant_card.dart';
import '../widgets/search_food_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_storage/get_storage.dart';
class SearchFoodScreen extends GetView<SearchFoodController>  {
  const SearchFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SearchFoodController>(

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
                body: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),

                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1.2 ,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: GestureDetector(
                                  onTap: (){
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

                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>Get.toNamed(Routes.searchScreen),
                                  child: Container(

                                    height: 51.h,
                                    // width: MediaQuery.of(context).size.width * 0.73,
                                    padding: EdgeInsets.all(6).w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.r),
                                        border: Border.all(color: ThemeColors().greyBlack)
                                    ),
                                    child: Row(children: [
                                      Icon(Icons.search_outlined,color: ThemeColors().greyBlack,),
                                      SizedBox(width: 5.w,),
                                      BigText(text: "Find for food or restaurant...",size: 14.sp,color: ThemeColors().kSecondaryTextColor,)
                                    ],),
                                  ),
                                ),
                              ),
                              //
                              // IconAppTextField(
                              //   textController: _searchTextField,
                              //   icon: Icons.search_outlined,
                              //   hintText: "Find for food or restaurant...",
                              // ),
                              // Expanded(child: Container()),
                              SizedBox(width: 4,),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: GestureDetector(
                                    onTap: () {

                                      // return navigateToCategoryPage();
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
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.h),
                          child: Container(
                            // margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(color: greayColor),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TabBar(
                                  indicator: BoxDecoration(
                                      color: orangeColor,
                                      borderRadius: BorderRadius.circular(25.0)),
                                  // labelColor: orangeColor,
                                  unselectedLabelColor: ThemeColors().kPrimaryTextColor,
                                  controller: controller.tabController,
                                  tabs: const [
                                    Tab(
                                      text: "Food Item",
                                    ),
                                    Tab(
                                      text: "Restaurant",
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: controller.tabController,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:GridView.custom(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverWovenGridDelegate.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 100,
                                    crossAxisSpacing: 20,
                                    tileBottomSpace: 40,
                                    pattern: [
                                      WovenGridTile(1),
                                      WovenGridTile(
                                        5/ 6,
                                        crossAxisRatio: 1,
                                        alignment: AlignmentDirectional.centerEnd,
                                      ),
                                    ],
                                  ),
                                  childrenDelegate: SliverChildBuilderDelegate(
                                    childCount: controller.popularItemRating.length,
                                        (context, index) => SearchFoodCard(
                                      name: controller.popularItemName[index],
                                      details: controller.popularItemDetails[index],
                                      rating: controller.popularItemRating[index],
                                      reviewsCount:
                                      controller.popularItemReviewCount[index],
                                      imageUrl: controller.popularItemImageUrl[index],
                                      price: controller.popularItemPrice[index],
                                    ),
                                  ),
                                ),


                                // GridView.builder(
                                //   physics: NeverScrollableScrollPhysics(),
                                //     gridDelegate:
                                //         SliverGridDelegateWithFixedCrossAxisCount(
                                //             crossAxisCount: 2,
                                //             mainAxisSpacing:
                                //                 MediaQuery.of(context).size.height *
                                //                     0.12,
                                //             crossAxisSpacing:
                                //                 MediaQuery.of(context).size.width *
                                //                     0.03),
                                //     shrinkWrap: false,
                                //     itemCount: popularItemPrice.length,
                                //     itemBuilder: (context, index) => SearchFoodCard(
                                //           name: popularItemName[index],
                                //           details: popularItemDetails[index],
                                //           rating: popularItemRating[index],
                                //           reviewsCount:
                                //               popularItemReviewCount[index],
                                //           imageUrl: popularItemImageUrl[index],
                                //           price: popularItemPrice[index],
                                //         )),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:GridView.custom(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverWovenGridDelegate.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 20,
                                    tileBottomSpace: 20,
                                    pattern: [
                                      WovenGridTile(1),
                                      WovenGridTile(
                                        5 / 6,
                                        crossAxisRatio: 1,
                                        alignment: AlignmentDirectional.topEnd,
                                      ),
                                    ],
                                  ),
                                  childrenDelegate: SliverChildBuilderDelegate(
                                      childCount: controller.popularItemRating.length,
                                          (context, index) => FindResurentCard()
                                  ),
                                ),


                                // GridView.builder(
                                //   physics: NeverScrollableScrollPhysics(),
                                //     gridDelegate:
                                //         SliverGridDelegateWithFixedCrossAxisCount(
                                //             crossAxisCount: 2,
                                //             mainAxisSpacing:
                                //                 MediaQuery.of(context).size.height *
                                //                     0.12,
                                //             crossAxisSpacing:
                                //                 MediaQuery.of(context).size.width *
                                //                     0.03),
                                //     shrinkWrap: false,
                                //     itemCount: popularItemPrice.length,
                                //     itemBuilder: (context, index) => SearchFoodCard(
                                //           name: popularItemName[index],
                                //           details: popularItemDetails[index],
                                //           rating: popularItemRating[index],
                                //           reviewsCount:
                                //               popularItemReviewCount[index],
                                //           imageUrl: popularItemImageUrl[index],
                                //           price: popularItemPrice[index],
                                //         )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ),);
        });
  }

}