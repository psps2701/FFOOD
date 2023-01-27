import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/orders/OrdersEmptyController.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../widgets/big_text.dart';



class OrdersEmptyScreen extends GetView<OrdersEmptyController>

{
  const OrdersEmptyScreen({super.key});

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
      child: SafeArea(child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

          Image.asset("assets/order_empty_logo.png", height: 110.h,),
          SizedBox(
            height: 43.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10.w,),
              BigText(text: "No upcoming orders ", size: 20.sp,),
            ],
          ),

          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10.w,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 10).r,
                    child: Text("No upcoming orders have been placed yet. Discover and order now!", style: TextStyle(fontSize: 14.sp, color: loginPageLabelColor),maxLines: 2,textAlign: TextAlign.center,)
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),

          Center(
            child: GestureDetector(
               onTap: () => Get.toNamed(Routes.orderDetailScreen),

              child: Container(
                  width: 248.w,
                  height: 60.h,
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

//36


        ],
      )),
    );;
  }

}