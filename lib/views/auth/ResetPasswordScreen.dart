import 'package:ffood/controllers/AuthController/ResetPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Route/Routes.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/get_storage_key.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_back_button.dart';
import 'package:get_storage/get_storage.dart';
class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ThemeColors().mainBgColor,
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 10).r,
            child: Image.asset(
              "assets/f_logo.png",
              height: 50,
            ),
          ),
          body: Stack(
            // fit: StackFit.passthrough,
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                      width: 150.w, child: Image.asset("assets/top_left.png")),
                ),
              ),
              Positioned(
                top: 0.h,
                right: 0.w,
                child: SizedBox(
                    width: 100, child: Image.asset("assets/top_right.png")),
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [CustomBackButton()],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          BigText(
                            text: "Reset Password",
                            size: 36.sp,
                            color: ThemeColors().kPrimaryTextColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 10).r,
                                child: Text(
                                  "Please enter your email address to request a password reset",
                                  style: TextStyle(
                                      fontFamily: 'Sofiapro',
                                      fontSize: 14.sp,
                                      color: ThemeColors().kSecondaryTextColor),
                                  maxLines: 2,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppTextField(
                        textController: controller.emailController,
                        hintText: "Type your Email",
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      /* Row(
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
                      ),*/

                      Center(
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.registrationScreen),
                          child: Container(
                              width: 248.w,
                              height: 60.h,
                              // height: MediaQuery.of(context).size.height * 0.06,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100.r))),
                                  color: orangeColor),
                              child: BigText(
                                text: "Send new password",
                                size: 15.sp,
                                color: Colors.white,
                              )

                              // Text(
                              //   'LOGIN',
                              //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                              // ),
                              ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
