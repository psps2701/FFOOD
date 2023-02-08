import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/controllers/orders/OrderDetailController.dart';
import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:ffood/widgets/custom_back_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/orders/OrdersEmptyController.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/get_storage_key.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/big_text.dart';
import '../../widgets/order_screens_widgets/order_detail_header_card.dart';
import '../../widgets/order_screens_widgets/order_food_card.dart';
import '../../widgets/order_screens_widgets/user_detail_card.dart';
import '../../widgets/small_text.dart';
import 'package:get_storage/get_storage.dart';


class OrderDetailsScreen extends GetView<OrderDetailController>

{
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
          systemNavigationBarColor:  ThemeColors().mainBgColor  , // Navigation bar
          statusBarColor:  ThemeColors().statusBarColor,
          statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
          statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark

        // Status bar
      ),
      child: SafeArea(child:
      Scaffold(
        backgroundColor: ThemeColors().mainBgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 15,),
                CustomBackButton(),
                SizedBox(width: 10,),
                Expanded(child: Center(child: BigText(text: "Order Details",color: ThemeColors().kPrimaryTextColor))),
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
              child: BigText(text: "Orders food", size: 18.sp,color: ThemeColors().kPrimaryTextColor),
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
                  SmallText(text: "Total",size: 16.sp,fontWeight: FontWeight.w600,color:  ThemeColors().kPrimaryTextColor,),
                  Expanded(child: Container()),

                  BigText(text: "€59.08", size: 18.sp,color: ThemeColors().kPrimaryTextColor),
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
                                 color: ThemeColors().orangeWhiteColorunSelected,
                                ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r)),
                            color:ThemeColors().greyBlack),
                        child: BigText(text: "RATE",size: 15.sp, color:  ThemeColors().orangeWhiteColorunSelected,)

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
                            color: ThemeColors().btntxtColorUnSelected),
                        child: BigText(text: "RE-ORDER",size: 15.sp, color:ThemeColors().kWhiteColor,)

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