import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Route/Routes.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../util/colors.dart';
import 'package:lottie/lottie.dart';
import '../util/images.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class DrawerScreen extends GetView<HomeScreenController>
{
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      Images.icUserPlaceHolder,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.067),
                  child: BigText(
                    text: "Farion Wick",
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.067),
                  child: SmallText(
                    text: "farionwick@gmail.com",
                    color: loginPageLabelColor,
                    size: MediaQuery.of(context).size.height * 0.0177,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                         onTap: () => Get.toNamed(Routes.myorderScreen),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Image.asset(
                              Images.icWallet,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "My Orders",
                              color: Colors.black,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Pressed");
                        Get.toNamed(Routes.profileScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              Images.icProfile,
                              height: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "My Profile",
                              color: Colors.black,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.addressListScreen),
                        child: Row(
                          children: [

                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(

                              Images.icLocation,
                              height: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "Delivery Address",
                              color: Colors.black,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          //navigateToPaymentMethodScreen();
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Image.asset(
                              Images.icWallet,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "Payment Methods",
                              color: Colors.black,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          Image.asset(
                            Images.icWallet,
                            height: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "Contact Us",
                            color: Colors.black,
                            size: MediaQuery.of(context).size.height / 52.75,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // navigateToSettingsScreen();
                          Get.toNamed(Routes.settingScreen);
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              Images.icSetting,
                              height: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "Settings",
                              color: Colors.black,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          Image.asset(
                            Images.icWallet,
                            height: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "Helps & FAQs",
                            color: Colors.black,
                            size: MediaQuery.of(context).size.height / 52.75,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/logo_side_menu.png", width: 125,),
                    ),

                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.076,
                    // ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 10),
        child: Container(
            width: 117,
            height: 43,
            // height: MediaQuery.of(context).size.height * 0.06,
            alignment: Alignment.center,
            // padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(1, 10),
                color: shadowOrangeColor,
              )
            ], borderRadius: BorderRadius.circular(100), color: orangeColor),
            child: controller.isLoading.value
                ? Lottie.asset('assets/loader2.json', height: 200)
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logout_logo.png", width: 26,),
                SizedBox(height: 10,),
                SmallText(
                  text: "Log Out",
                  size: 15,
                  color: Colors.white,
                ),

              ],
            )

          // Text(
          //   'LOGIN',
          //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
          // ),
        ),
      ),
    );
  }

}