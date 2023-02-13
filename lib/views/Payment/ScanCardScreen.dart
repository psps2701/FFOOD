import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/payment/PaymentController.dart';
import '../../themecolor/ThemeColors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/get_storage_key.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/CustomCard.dart';

import '../../widgets/big_text.dart';



class ScanCardScreen extends GetView<PaymentController>
{
  const ScanCardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
          systemNavigationBarColor: ThemeColors().mainBgColor, // Navigation bar
          statusBarColor: ThemeColors().statusBarColor,
          statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ? Brightness.light:  Brightness.dark,
          statusBarIconBrightness:  GetStorage().read(GetStorageKey.IS_DARK_MODE) ? Brightness.light:  Brightness.dark,
          // Status bar
      ),
      child:SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        margin: getMargin(left: 15,top: 15,bottom: 10),
                        // padding: EdgeInsets.symmetric(horizontal: 15),

                        child: CustomCard(
                          margin: 0,
                          child: Image.asset(Images.icBack, color: false ? Colors.white :Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),


                  Expanded(child: Center(child: BigText(text: "Payment", size: 20.sp,))),
                  Container(
                    width: 38,
                    height: 38,
                    margin: getMargin(left: 15,top: 15,bottom: 10),
                    // padding: EdgeInsets.symmetric(horizontal: 15),


                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 51.0),
                child: Center(child: Text("Please hold the card inside the frame to start scaning",style: GoogleFonts.poppins(color: scanCardTextColor, fontSize: 16.sp, fontWeight: FontWeight.w400,),textAlign: TextAlign.center,)),
              ),

              Image.asset("assets/scan_card.png"),
              Center(
                child: GestureDetector(

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
                      child: BigText(text: "SCANNING...",size: 15.sp, color: Colors.white,)

                    // Text(
                    //   'LOGIN',
                    //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                    // ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ) ,
    );
  }

}