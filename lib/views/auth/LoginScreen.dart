import 'package:ffood/controllers/AuthController/LoginController.dart';
import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:ffood/util/images.dart';
import 'package:ffood/util/size_utils.dart';
import 'package:ffood/widgets/app_text_field.dart';
import 'package:ffood/widgets/big_text.dart';
import 'package:ffood/widgets/custom_back_button.dart';
import 'package:ffood/widgets/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Route/Routes.dart';
import '../../util/colors.dart';
import '../../util/get_storage_key.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor:  ThemeColors().mainBgColor, // Navigation bar
        statusBarColor:  Colors.transparent,
        statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
        statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,

        // Status bar
      ),
      child: Scaffold(
        backgroundColor: ThemeColors().mainBgColor,
        body: Container(
          height: size.height,
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
                    width: 100, child: Image.asset("assets/top_right.png")),
              ),
              // Positioned(
              //     top: -10,
              //     left: 30,
              //     child: CustomBackButton()),

              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          CustomBackButton()
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        children: [
                          BigText(
                            text: "Login",
                            color: ThemeColors().lightDark,
                            size: 36.sp,
                          ),
                        ],
                      ), //36
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(bottom: 10, left: 10).r,
                            child: SmallText(
                              text: "E-mail",
                              size: 16.sp,
                              color: loginPageLabelColor,
                            ),
                          ),
                        ],
                      ),
                      AppTextField(
                        textController: controller.numberController,
                        hintText: "Your email or phone",
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 10.0, bottom: 10)
                                .r,
                            child: SmallText(
                              text: "Password",
                              size: 16.sp,
                              color: loginPageLabelColor,
                            ),
                          ),
                        ],
                      ),
                      AppTextField(
                          textController: controller.passwordController,
                          hintText: "Password",
                          textInputType: TextInputType.emailAddress,
                          isPass: true,
                          isObscure: true),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                          child: GestureDetector(
                              onTap: () =>
                                  Get.toNamed(Routes.resetPasswordScreen),
                              child: SmallText(
                                text: "Forgot password?",
                                size: 14.sp,
                                color: orangeColor,
                              ))),

                      SizedBox(
                        height: 20.h,
                      ),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            //Get.toNamed(Routes.mainScreen);
                            FocusManager.instance.primaryFocus?.unfocus();
                            //Get.toNamed(Routes.mainScreen);


                            controller.login();

                          },
                          child: /*Container(
                              width: 248.w,
                              height: 60.h,
                              // height: MediaQuery.of(context).size.height * 0.06,
                              alignment: Alignment.center,
                              padding:
                              const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: Offset(1, 10),
                                      color: shadowOrangeColor,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: orangeColor),
                              child: BigText(
                                text: "LOGIN",
                                size: 15.sp,
                                color: Colors.white,
                              )

                            // Text(
                            //   'LOGIN',
                            //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                            // ),
                          ),*/
                          loginCustomButton()
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "Don't have an account? ",
                            color: ThemeColors().lightDark,
                            size: 14.sp,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(Routes.registerScreen),
                                  child: SmallText(
                                    text: "Sign Up ",
                                    color: orangeColor,
                                    size: 14.sp,
                                  )),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 60.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: 102.w,
                              height: 2,
                              color: loginScreenLineColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: SmallText(
                              text: "sign in with",
                              size: 16,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 102.w,
                              height: 2,
                              color: loginScreenLineColor,
                            ),
                          ),
                        ],
                      ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 147.w,
                              height: 57.h,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                  color: ThemeColors().mainColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(100.r)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(0.25),
                                    )
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/ic_fb.png",
                                    width: 38.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      SmallText(
                                        text: "FACEBOOK",
                                        size: 13.sp,
                                        color: ThemeColors().lightDark,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 147.w,
                              height: 57.h,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                  color: ThemeColors().mainColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(100.r)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(0.25),
                                    )
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/google_logo.png",
                                    width: 38.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      SmallText(
                                        text: "GOOGLE",
                                        size: 13.sp,
                                        color: ThemeColors().lightDark,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginCustomButton() {
    return GetX<LoginController>(
      builder: (controller) {
        return ProgressButton.icon(
            iconedButtons: {
          ButtonState.idle: IconedButton(
              text: "Login",
              icon: const Icon(Icons.send, color: Colors.white),
              color: orangeColor),
          ButtonState.loading:
          IconedButton(text: "Loading", color: orangeColor),
          ButtonState.fail: IconedButton(
              text: "Failed",
              icon: const Icon(Icons.cancel, color: Colors.white),
              color: Colors.red.shade300),
          ButtonState.success: IconedButton(
              text: "success",
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              color: Colors.green.shade400)
        }, onPressed: ()
            {
              FocusManager.instance.primaryFocus?.unfocus();
              //Get.toNamed(Routes.mainScreen);

              controller.login();
            }, state: controller.loginState.value);
      }
    );
  }



}
