import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/common_image_view.dart';
import '../widgets/small_text.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.themeColor, // Navigation bar
        statusBarColor: ThemeColors().statusBarColor,
          statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark

        // Status bar
      ),
      child: Scaffold(
        backgroundColor: ThemeColors().mainBgColor,
        body: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Center(
                    child:
                    CommonImageView(
                      imagePath:
                      Images.startBackground,
                      height: size.height,
                      fit: BoxFit.cover,
                      width: size.width,
                    )),

                Positioned(
                    right: 20,
                    top: 10,
                    child: Image.asset(GetStorage().read(GetStorageKey.IS_DARK_MODE)  ? "assets/skip_btn_n.png" : "assets/skip_btn.png", height: 37.h,)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 80.h,),
                    Image.asset(GetStorage().read(GetStorageKey.IS_DARK_MODE) ? "assets/start_screen_logo_back.png":"assets/start_screen_logo.png" ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Expanded(child: Container()),

                    Container(
                      // margin: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 84.w,
                            height: 2.h,
                            color: transparentWhiteColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0).w,
                            child: SmallText(
                              text: "sign in with",
                              size: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 84.w,
                            height: 2.h,
                            color: transparentWhiteColor,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          width: 139.w,
                          height: 44.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: ShapeDecoration(
                              image:  DecorationImage(image: AssetImage( GetStorage().read(GetStorageKey.IS_DARK_MODE) ? Images.icFacebookB :"assets/facebook_button.png")),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35.r))),
                              color: ThemeColors().mainBgColor),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 139.w,
                          height: 44.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: ShapeDecoration(
                              image: DecorationImage(image: AssetImage(GetStorage().read(GetStorageKey.IS_DARK_MODE) ? Images.icGoogleB : "assets/google_button.png")),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35.r))),
                              color: ThemeColors().mainBgColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          /*=>
                           navigateToOnboardingScreen()*/
                          Get.toNamed(Routes.registerScreen);
                        },
                        child: Container(
                          width: 293.w,
                          height: 54.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: ShapeDecoration(
                              image: DecorationImage(image: AssetImage(GetStorage().read(GetStorageKey.IS_DARK_MODE) ? Images.icRegisterB : Images.icRegisterA )),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35.r))),
                              ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text:  TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(

                            text: 'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              print('Tapped on hyperlink');
                              Get.toNamed(Routes.loginScreen);
                             // navigateToSignIn();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );;
  }

}