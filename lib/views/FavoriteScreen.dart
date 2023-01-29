import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/MainScreen/CartScreenController.dart';
import '../controllers/MainScreen/FavoriteScreenController.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/MainScreen/MainScreenController.dart';
import '../themecolor/ThemeColors.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/CustomCard.dart';
import '../widgets/big_text.dart';
import '../widgets/category_screen_food_container.dart';
import '../widgets/common_image_view.dart';
import '../widgets/small_text.dart';


class FavoriteScreen extends GetView<FavoriteScreenController>
{
  const FavoriteScreen({super.key});



  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => FavoriteScreenController());

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor:  ThemeColors().mainBgColor, // Navigation bar
        statusBarColor:  ThemeColors().statusBarColor,
        statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
        statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark,

        // Status bar
      ),
 child:SafeArea(child: Column(
   children: [
     Row(

       mainAxisAlignment: MainAxisAlignment.spaceAround,
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
               margin: getMargin(left: 15,top: 10,bottom: 10),
               // padding: EdgeInsets.symmetric(horizontal: 15),

               child: CustomCard(
                 margin: 0,
                 bgColor: ThemeColors().mainColor,
                 color: ThemeColors().shadow,
                 child: Image.asset(Images.icBack, color: ThemeColors().lightDark,
                 ),
               ),
             ),
           ),
         ),
         Expanded(child: Center(child: BigText(text: "Favorites"))),
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
     Container(
       margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
       width: MediaQuery.of(context).size.width,
       padding: EdgeInsets.all(3.w),
       height: 55.h,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(25.0.r),
         border: Border.all(color: orangeColor),
       ),
       child: TabBar(
           indicator: BoxDecoration(
               color: orangeColor,
               borderRadius: BorderRadius.circular(30.0.r)),
           // labelColor: orangeColor,
           unselectedLabelColor: orangeColor,
           controller: controller.tabController,
           tabs: const [
             Tab(
               text: "Food Items",
             ),
             Tab(
               text: "Resturents",
             )
           ]),
     ),

     Expanded(child: Container(
       child: TabBarView(
         controller: controller.tabController,
         children: [
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: ListView.builder(
                 shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                 physics: AlwaysScrollableScrollPhysics(),
                 itemCount: controller.name.length,
                 itemBuilder: (context, index) => Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: GestureDetector(
                     // onTap: () => navigateToFoodDetail(),
                       child: CategoryScreenFoodContainer(
                         name: controller.name[index],
                         details: controller.details[index],
                         rating: controller.rating[index],
                         imageUrl: controller.imageUril[index],
                         price: controller.price[index],
                         reviewsCount: controller.reviewCount[index],
                       )),
                 )),
           ),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: ListView.builder(
                 shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                 physics: AlwaysScrollableScrollPhysics(),
                 itemCount: controller.name.length,
                 itemBuilder: (context, index) => Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: GestureDetector(
                     // onTap: () => navigateToFoodDetail(),
                       child: CategoryScreenFoodContainer(
                         name: controller.name[index],
                         details: controller.details[index],
                         rating: controller.rating[index],
                         imageUrl: controller.favResList[index],
                         price: controller.price[index],
                         reviewsCount: controller.reviewCount[index],
                       )),
                 )),
           ),
         ],
       ),
     ))

   ],
 )),
    );;
  }

}