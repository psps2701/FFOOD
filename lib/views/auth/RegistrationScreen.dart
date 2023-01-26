import 'package:country_list_pick/country_list_pick.dart';
import 'package:ffood/controllers/AuthController/RegistrationController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Route/Routes.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../widgets/back_button.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.white, // Navigation bar
          statusBarColor: AppColors.themeColor, //
          // Status bar
        ),
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                // ,
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
                Positioned(top: 40, left: 30, child: CustomBackButton()),

                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 20.w,
                        right: 20.w),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Row(
                          children: [
                            BigText(
                              text: "Registration",
                              size: 36.sp,
                              color: fontColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: SmallText(
                                  text:
                                      "Enter your phone number to verify your account ",
                                  size: 14.sp,
                                  color: loginPageLabelColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: orangeColor)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: CountryListPick(
                                    appBar: AppBar(
                                      backgroundColor: orangeColor,
                                      title: Text('Country code'),
                                    ),

                                    // if you need custome picker use this
                                    // pickerBuilder: (context, CountryCode countryCode){
                                    //   return Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         countryCode.flagUri,
                                    //         package: 'country_list_pick',
                                    //       ),
                                    //       Text(countryCode.code),
                                    //       Text(countryCode.dialCode),
                                    //     ],
                                    //   );
                                    // },

                                    // To disable option set to false
                                    theme: CountryTheme(
                                      isShowFlag: true,
                                      isShowTitle: false,
                                      isShowCode: false,
                                      isDownIcon: true,
                                      showEnglishName: true,
                                    ),
                                    // Set default value

                                    initialSelection: 'US',
                                    onChanged: (CountryCode? code) {
                                      print(code!.name);
                                      print(code.code);
                                      print(code.dialCode);
                                      print(code.flagUri);

                                      controller.dialcode = code.dialCode!;
                                    },
                                    // Whether to allow the widget to set a custom UI overlay
                                    useUiOverlay: true,
                                    // Whether the country list should be wrapped in a SafeArea
                                    useSafeArea: false),
                              ),
                              Expanded(
                                child: TextField(
                                  controller:
                                      controller.numberTextFieldController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "Enter your number",
                                      border: InputBorder.none),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 51.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.otpScreen);
                          },
                          child: Container(
                              width: 248.w,
                              height: 60.h,
                              // height: MediaQuery.of(context).size.height * 0.06,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
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
                              child: controller.isLoading
                                  ? Lottie.asset('assets/loader2.json',
                                      height: 200)
                                  : BigText(
                                      text: "SEND",
                                      size: 15.sp,
                                      color: Colors.white,
                                    )

                              // Text(
                              //   'LOGIN',
                              //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                              // ),
                              ),
                        ),
                        Expanded(child: Container()),
                        Image.asset(
                          "assets/f_logo.png",
                          height: 40.h,
                          width: 40.w,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
