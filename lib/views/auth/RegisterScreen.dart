import 'package:ffood/controllers/AuthController/RegisterController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Route/Routes.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/images.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.white, // Navigation bar
        statusBarColor: AppColors.themeColor, //
        // Status bar
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            // fit: StackFit.passthrough,
            children: [
              // Positioned(
              //   top: 10,
              //   left: 0,
              //   child: Align(
              //     alignment: Alignment.topLeft,
              //     child: SizedBox(
              //         width: 40.w,
              //         child: Image.asset("assets/top_left.png")),
              //   ),
              // ),
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
              // Padding(
              //   padding: EdgeInsets.only(left: 20).r,
              //   child: CustomBackButton(),
              // ),


              Container(
                padding: EdgeInsets.only(top: 100).r,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Row(
                            children: [
                              BigText(text: "Sign Up", size: 36.sp,color: blackColor),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10,left: 10).r,
                                child: SmallText(text: "Full name", size: 16.sp, color:  darkThemeLabelColor,),
                              ),
                            ],
                          ),
                          AppTextField(textController: controller.nameController, hintText: "Your Full name", textInputType:TextInputType.emailAddress, ),
//36
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10,left: 10).r,
                                child: SmallText(text: "E-mail", size: 16.sp, color: loginPageLabelColor),
                              ),
                            ],
                          ),
                          AppTextField(textController: controller.numberController, hintText: "Your email or phone", textInputType:TextInputType.emailAddress, ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only( bottom: 10,left: 10).r,
                                child: SmallText(text: "Password", size: 16.sp, color: loginPageLabelColor),
                              ),
                            ],
                          ),
                          AppTextField(textController:controller.passwordController, hintText: "Password", textInputType:TextInputType.emailAddress, isPass: true,isObscure: true),
                          SizedBox(
                            height: 10.h,
                          ),

                          Center(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.registerScreen),

                              child: Container(
                                  width: 248.w,
                                  height: 60.h,
                                  // height: MediaQuery.of(context).size.height * 0.06,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration:  BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: const Offset(1, 10),
                                          color: shadowOrangeColor,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(100.r),
                                      color: orangeColor),
                                  child:controller.isLoading ? Lottie.asset('assets/loader2.json', height: 200):BigText(text: "Signup",size: 15.sp, color: Colors.white,)

                                // Text(
                                //   'LOGIN',
                                //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                                // ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SmallText(text: "Already have an account?", color: loginPageLabelColor,size: MediaQuery.of(context).size.height/52.75,),
                              SizedBox(width: 5,),
                              Column(
                                children: [
                                  GestureDetector(
                                     onTap: ()=>Get.toNamed(Routes.loginScreen),
                                      child: SmallText(text: "Login", color: orangeColor,size: MediaQuery.of(context).size.height/52.75,)),

                                ],
                              ),
                            ],
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
                                child: SmallText(text: "sign up with", size: 16,),
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

                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                          offset: const Offset(1, 10),
                                          color: Colors.grey.withOpacity(0.1),
                                        )
                                      ]
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/fb_logo.png", width: 39.w,),
                                      SizedBox(width: 5.w,),
                                      Column(
                                        children: [
                                          SmallText(text: "FACEBOOK", size: 13.sp,color: Colors.black,),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 147.w,
                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                          offset: const Offset(1, 10),
                                          color: Colors.grey.withOpacity(0.1),
                                        )
                                      ]
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/google_logo.png", width: 36.w,),
                                      SizedBox(width: 5.w,),
                                      Column(
                                        children: [
                                          SmallText(text: "GOOGLE", size: 13.sp,color: Colors.black,),
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
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
