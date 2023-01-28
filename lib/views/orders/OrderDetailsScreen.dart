import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/controllers/orders/OrderDetailController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/orders/OrdersEmptyController.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/back_button.dart';
import '../../widgets/big_text.dart';
import '../../widgets/order_screens_widgets/order_detail_header_card.dart';
import '../../widgets/order_screens_widgets/order_food_card.dart';
import '../../widgets/order_screens_widgets/user_detail_card.dart';
import '../../widgets/small_text.dart';



class OrderDetailsScreen extends GetView<OrderDetailController>

{
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.white, // Navigation bar
          statusBarColor: AppColors.statusBarGrey,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
        // Status bar
      ),
      child: SafeArea(child:
      Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  // onTap: navigateToHomeScreen,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      width: 38,
                      height: 38,
                      margin: getMargin(left: 15,top: 10,bottom: 10),
                      // padding: EdgeInsets.symmetric(horizontal: 15),

                      child: CustomCard(
                        margin: 0,
                        child: Image.asset(Images.icBack, color: false ? Colors.white :Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Center(child: BigText(text: "My Orders"))),
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
// Header card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: HearderCard(),
            ),

            SizedBox(height: 30.h,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: UserDetailCard(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BigText(text: "Orders food", size: 18.sp,),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.h),
              child: OrderFoodCard(),
            ),
            Container(
              child: Image.asset("assets/card_image.png"),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.h),
              child: Row(
                children: [
                  SmallText(text: "Total",size: 16.sp,fontWeight: FontWeight.w600,color: orderDetailTextColor,),
                  Expanded(child: Container()),

                  BigText(text: "€59.08", size: 18.sp,),
                  SmallText(text: "EUR",size: 14.sp,color: loginPageLabelColor,),


                ],
              ),
            ),
            SizedBox(height: 50.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.orderDetailScreen),

                    child: Container(
                        width: 150.w,
                        height: 70.h,
                        // height: MediaQuery.of(context).size.height * 0.06,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration:  BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: orangeColor,
                                ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r)),
                            color: AppColors.white),
                        child: BigText(text: "DISCOVER NOW",size: 15.sp, color: orangeColor,)

                      // Text(
                      //   'LOGIN',
                      //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                      // ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.orderDetailScreen),

                    child: Container(
                        width: 150.w,
                        height: 70.h,
                        // height: MediaQuery.of(context).size.height * 0.06,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration:  ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(100.r))),
                            color: orangeColor),
                        child: BigText(text: "DISCOVER NOW",size: 15.sp, color: Colors.white,)

                      // Text(
                      //   'LOGIN',
                      //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

}