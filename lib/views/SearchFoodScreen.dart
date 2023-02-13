import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/SearchFoodController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themecolor/ThemeColors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/CustomShadow.dart';
import '../widgets/big_text.dart';
import '../widgets/conatiner_with_image.dart';
import '../widgets/custom_back_button.dart';
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
                            padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
                            child: CustomBackButton()),
                        Expanded(child: Center(child: BigText(text: "Search Food",color: ThemeColors().kPrimaryTextColor,))),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
                          child: Container(
                            height: 38.h,
                            width: 38.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: AssetImage(
                                  "assets/sidemenuuser.png",
                                ),)
                            ),
                          ),
                        ),
                      ],
                    ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [

                              Expanded(
                                child: Container(
                                  margin: getMargin(left: 10,right: 10),
                                  child: Neumorphic(
                                    style: NeumorphicStyle(
                                      depth: -1,
                                      intensity: 0.8,

                                      border: NeumorphicBorder(
                                        color: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?   const Color(0xDD2C2C37) : Colors.grey.shade100,
                                        width: 0.8,
                                      ),
                                      lightSource: LightSource.topLeft,
                                      shadowDarkColorEmboss:  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?   const Color(0xDD2C2C37) :Colors.grey.shade400,
                                      shadowLightColorEmboss: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?   const Color(0xDD2C2C37) :Colors.grey.shade400,
                                      color: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?   const Color(0xDD393948) : Colors.white,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(10)),
                                    ),
                                    child: Container(
                                      decoration:   BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        color: ThemeColors().mainColor,
                                      ),
                                      height: 50,
                                      child: Row(children: [
                                        SizedBox(width: 10,),
                                        Icon(Icons.search_outlined, color: orangeColor,),
                                        SizedBox(width: 5,),
                                        Expanded(child: BigText(text: "Find for food or restaurant...",size: 12,color: Colors.grey,))
                                      ],),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  padding: const EdgeInsets.symmetric(horizontal: 14),
                                  decoration:  ShapeDecoration(
                                      shadows: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 1),
                                          color: Colors.black.withOpacity(0.25),
                                        )
                                      ],
                                      shape: const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      color: ThemeColors().mainColor),
                                  // child:   Icon(Icons.arrow_back_ios, size: 15,color: blackColor),
                                  child: Image.asset(Images.icFilter,color: orangeColor,),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              //
                              // IconAppTextField(
                              //   textController: _searchTextField,
                              //   icon: Icons.search_outlined,
                              //   hintText: "Find for food or restaurant...",
                              // ),
                              // Expanded(child: Container()),

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
                                    crossAxisSpacing: 10,
                                    tileBottomSpace: 20,
                                    pattern: [
                                      WovenGridTile(1),
                                      const WovenGridTile(
                                        5 / 6,
                                        crossAxisRatio: 1,
                                        alignment: AlignmentDirectional.topEnd,
                                      ),
                                    ],
                                  ),
                                  childrenDelegate: SliverChildBuilderDelegate(
                                      childCount: controller.popularItemRating.length,
                                          (context, index) => const FindResurentCard()
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