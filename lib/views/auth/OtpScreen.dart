import 'package:ffood/controllers/AuthController/OtpController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../Route/Routes.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/get_storage_key.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/small_text.dart';
import 'package:get_storage/get_storage.dart';
class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor:  ThemeColors().mainBgColor, // Navigation bar
        statusBarColor:  ThemeColors().statusBarColor,
        statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
        statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,

        // Status bar
      ),
      child: Scaffold(
        backgroundColor: ThemeColors().mainBgColor,
        body:SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                      width: 150.w,

                      child: Image.asset("assets/top_left.png")),
                ),
              ),
              Positioned(
                top: 0.h,
                right: 0.w,
                child: SizedBox(
                    width: 100,
                    child: Image.asset("assets/top_right.png")),
              ),
              Positioned(
                  top: 40,
                  left: 30,
                  child: CustomBackButton()),
              controller.isLoading ?Center(child: Lottie.asset('assets/full_screen_loader.json',)) :
              Padding(padding: EdgeInsets.only(left: 8.0, right: 8.0, top: MediaQuery.of(context).size.height * 0.2 ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Row(
                      children: [
                        SizedBox(width: 10.w,),
                        BigText(text: "Verification Code", size: 36.sp,),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10.w,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 10).r,
                              child: Text("Please type the verification code sent to ${controller.email} / ${controller.phone}", style: TextStyle(fontFamily: 'Sofiapro',fontSize: 14.sp,color: loginPageLabelColor),maxLines: 2,)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),


                    Center(
                      child: OTPTextField(
                          controller: controller.otpController,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 45,
                          otpFieldStyle: OtpFieldStyle(backgroundColor: AppColors.white, focusBorderColor: orangeColor ),
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 8,
                          style: TextStyle(fontSize: 17, color: orangeColor),
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            print("Completed:"+pin);
                            Get.toNamed(Routes.homeScreen);
                          }),
                    ),

                    SizedBox(height: 20.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmallText(text: "I didn’t receive a code! ", color: blackColor,size: MediaQuery.of(context).size.height/52.75,),
                        Column(
                          children: [
                            GestureDetector(
                              // onTap: ()=>navigateToSignUpScreen(),
                                child: SmallText(text: "Please resend", color: orangeColor,size: MediaQuery.of(context).size.height/52.75,)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.16,
                              height: 2,
                              color: transparentWhiteColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(child: Container()),


                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/f_logo.png", height: 40.h, width: 40.w,))



                  ],),
              ),


            ],
          ),
        ),
      ),
    );
    ;
  }
}

