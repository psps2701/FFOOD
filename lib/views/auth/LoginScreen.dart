import 'package:ffood/controllers/AuthController/LoginController.dart';
import 'package:ffood/util/images.dart';
import 'package:ffood/widgets/app_text_field.dart';
import 'package:ffood/widgets/big_text.dart';
import 'package:ffood/widgets/custom_back_button.dart';
import 'package:ffood/widgets/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Route/Routes.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
        // Positioned(
        //     top: -10,
        //     left: 30,
        //     child: CustomBackButton()),


        ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only( right: 20, left: 20,top: 20),
        children: [

        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Row(
        children: [
          CustomBackButton()
        ],
        ),
        SizedBox(height: 60.h,),
        Row(
        children: [
        BigText(text: "Login", size: 36.sp,),
        ],
        ),//36
        SizedBox(
        height: 10.h,
        ),
        Row(
        children: [
        Padding(
        padding: const EdgeInsets.only(bottom: 10,left: 10).r,
        child: SmallText(text: "E-mail", size: 16.sp, color: loginPageLabelColor,),
        ),
        ],
        ),
        AppTextField(textController: controller.numberController, hintText: "Your email or phone", textInputType:TextInputType.emailAddress, ),
        SizedBox(
        height: 29.h,
        ),
        Row(
        children: [
        Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10).r,
        child: SmallText(text: "Password", size: 16.sp, color: loginPageLabelColor,),
        ),
        ],
        ),
        AppTextField(textController: controller.passwordController, hintText: "Password", textInputType:TextInputType.emailAddress, isPass: true,isObscure: true),
        SizedBox(
        height: 20.h,
        ),
        Center(child: GestureDetector(
        onTap: () => Get.toNamed(Routes.resetPasswordScreen),
        child: SmallText(text: "Forgot password?", size: 14.sp, color: orangeColor,))),

        SizedBox(height: 20.h,),

        Center(
        child: GestureDetector(
        onTap: () => Get.toNamed(Routes.homeScreen),

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
        child: controller.isLoading ? Lottie.asset('assets/loader2.json', height: 200):BigText(text: "LOGIN",size: 15.sp, color: Colors.white,)

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
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(width: 10,),
        SmallText(text: "Don't have an account? ", color: blackColor,size: 14.sp,),
        Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        GestureDetector(
        onTap: ()=>Get.toNamed(Routes.registerScreen),
        child: SmallText(text: "Sign Up ", color: orangeColor,size: 14.sp,)),

        ],
        ),
        ],
        ),

        SizedBox(height: 60.h,),

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
        child: SmallText(text: "sign in with", size: 16,),
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
        Image.asset("assets/fb_logo.png", width: 38.w,),
        SizedBox(width: 5.w,),
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SmallText(text: "FACEBOOK", size: 13.sp,color: Colors.black,),
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
    Image.asset("assets/google_logo.png", width: 38.w,),
    SizedBox(width: 5.w,),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
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
    SizedBox(height: 10.h,)

    ],
    ),
    ],
    ),
      ),
    ));
  }
}
