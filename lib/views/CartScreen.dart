import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/MainScreen/MainScreenController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/MainScreen/CartScreenController.dart';
import '../themecolor/ThemeColors.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/CustomCard.dart';
import '../widgets/big_text.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/cart_screen_card.dart';
import '../widgets/small_text.dart';


class CartScreen extends GetView<CartScreenController>
{
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() =>CartScreenController());
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor:  ThemeColors().mainBgColor, // Navigation bar
        statusBarColor:  ThemeColors().statusBarColor,
        statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
        statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark,
          // Status bar
      ),
      child: Scaffold(
        backgroundColor: ThemeColors().mainBgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
            GestureDetector(
            // onTap: navigateToHomeScreen,
            child: GestureDetector(
                onTap: (){
          var cm = Get.find<MainScreenController>();

          cm.navigationTapped(0);
          cm.currentIndex.value = 0 ;
          cm.currentIndex.refresh();
          },
            child: Container(
              width: 38,
              height: 38,
              margin: getMargin(left: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration:  ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                      color: Colors.black.withOpacity(0.25),
                    )
                  ],
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  color: ThemeColors().mainColor),
              // child:   Icon(Icons.arrow_back_ios, size: 15,color: blackColor),
              child:   Image.asset(Images.icBack,color: ThemeColors().lightDark,),
            ),
          ),
        ),



                    Expanded(child: Center(child: BigText(text: "Cart", size: 20.sp,color: ThemeColors().lightDark,))),
                    Container(
                      width: 38,
                      height: 38,
                      margin: getMargin(left: 15,top: 15,bottom: 10),
                      // padding: EdgeInsets.symmetric(horizontal: 15),


                    ),
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index){
                        return  const CartScreenCard();

                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.018,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 90.2,
                      right: MediaQuery.of(context).size.height / 90.2),
                  decoration: BoxDecoration(
                    color: ThemeColors().mainColor,
                    borderRadius: BorderRadius.circular(50.r),
                    boxShadow: const [
                      BoxShadow(
                        color: greyColor,
                      ),
                      BoxShadow(
                        color: greyColor,
                        spreadRadius: -12.0,
                        blurRadius: 13.0,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: controller.promoCodeTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              // height: MediaQuery.of(context).size.height * 0.06,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(22))),
                                  color: orangeColor),
                              child: BigText(
                                text: "Apply",
                                size: 15,
                                color: Colors.white,

                              )),
                        ),
                      ),
                      hintStyle: TextStyle(
                          color: hintTextColor,
                          fontSize: MediaQuery.of(context).size.height / 52.75),
                      hintText: "Promo Code",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            50.r),
                        borderSide:  BorderSide(
                          width: 2.0,
                          color: ThemeColors().mainColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            50.r),
                        borderSide:  BorderSide(
                          width: 2.0,
                          color: ThemeColors().mainColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height / 75.27),
                        borderSide:  BorderSide(
                          width: 2.0,
                          color: ThemeColors().mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                        text: "Subtotal",
                        color: ThemeColors().lightDark,
                        size: 16.sp,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "\$27.30",
                            color: ThemeColors().lightDark,
                            size: 21.sp,
                          ),
                          SmallText(text: "USD",color: loginPageLabelColor),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
                    height: 1,
                    color: hintTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                        text: "Tax and Fees",
                        color: ThemeColors().lightDark,
                        size: 16.sp,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "\$7.30",
                            color: ThemeColors().lightDark,
                            size: 21.sp,
                          ),
                          SmallText(text: "USD",color: loginPageLabelColor),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
                    height: 1,
                    color: hintTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                        text: "Delivery",
                        color: ThemeColors().lightDark,
                        size: 16.sp,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "\$2.30",
                            color: ThemeColors().lightDark,
                            size: 21.sp,
                          ),
                          SmallText(text: "USD",color: loginPageLabelColor),
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
                    height: 1,
                    color: hintTextColor,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SmallText(
                            text: "Total",
                            color: ThemeColors().lightDark,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4,),
                          SmallText(
                            text: "(2 items)",
                            color: loginPageLabelColor,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "\$2.30",
                            color: ThemeColors().lightDark,
                            size: 21.sp,
                          ),
                          SmallText(text: "USD",color: loginPageLabelColor),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.paymentScreen);
                    },

                    child: Container(

                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.06,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration:  const ShapeDecoration(
                            shadows: [
                              BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: Offset(1, 1),
                                color: shadowOrangeColor,
                              )
                            ],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            color: orangeColor),
                        child: BigText(
                          text: "CHECKOUT",
                          size: 15,
                          color: Colors.white,
                        )),
                  ),
                )



              ],
            ),
          ),
        ),
      ),
    );;
  }

}