
import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:ffood/util/app_colors.dart';
import 'package:ffood/util/colors.dart';
import 'package:ffood/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/CustomShadow.dart';
import '../../widgets/big_text.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/custom_back_button.dart';

class MapViewScreen extends StatelessWidget {
  MapViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: Get.height,
                decoration:  BoxDecoration(

                  image: DecorationImage(
                      image: AssetImage(Images.icMap), fit: BoxFit.cover),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Expanded(
                        child: Container(
                          margin: getMargin(left: 10,right: 10),
                          child: CustomShadow(
                            blur:  2,
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(1, 1),
                            child: Container(
                              decoration:   BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: ThemeColors().greyBlack,
                              ),
                              height: 50,

                              child: Row(children: [
                                SizedBox(width: 10,),
                                Icon(Icons.arrow_back_ios, color: ThemeColors().kPrimaryTextColor,),
                                SizedBox(width: 5,),
                                Expanded(child: BigText(text: "Find for food or restaurant...",size: 12,color: ThemeColors().kSecondaryTextColor,))
                              ],),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 43,
                          height: 43,
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          decoration:  ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                  color: Colors.black.withOpacity(0.1),
                                )
                              ],
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              color: ThemeColors().mainColor),
                          // child:   Icon(Icons.arrow_back_ios, size: 15,color: blackColor),
                          child:   Image.asset(Images.locationPoint,),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top : 10  , left: 30,right: 30,bottom: 30),
                    child: CommonImageView(
                      imagePath: Images.topMap,
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.height * 0.40,
                decoration: BoxDecoration(
                    color: ThemeColors().containerColor,
                    borderRadius: BorderRadius.circular(40)),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {

                          },
                          child: CustomShadow(
                            blur:  5,
                            color: Colors.grey.withOpacity(0.3),
                            offset:  const Offset(1, 1),
                            child: Container(
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color:  ThemeColors().kPrimaryTextColor,
                              ),
                              height: 48,
                              width: 48,
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(Images.icPizza,)),
                            ),
                          ),),

                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Pizza Hut',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ThemeColors().whiteGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SmallText(
                                text: "4102  Pretty View Lane ",
                                size: 12,
                                color: ThemeColors().whiteGrey,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child:  Container(
                                padding : EdgeInsets.all(2),
                                child: Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: Get.height / 18,

                          child: Card(
                            color: ThemeColors().whiteBlack,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: SmallText(
                                  text: "PIZZA",
                                  size: 10,
                                  color: ThemeColors().kPrimaryTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 18,
                          child: Card(
                            color: ThemeColors().whiteBlack,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: SmallText(
                                  text: "CHICKEN",
                                  size: 10,
                                  color: ThemeColors().kPrimaryTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 18,
                          child: Card(
                            color: ThemeColors().whiteBlack,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: SmallText(
                                  text: "FAST FOOD",
                                  size: 10,
                                  color: ThemeColors().kPrimaryTextColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            Images.icBike,
                            height: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "Free Delivery",
                            size: 14,
                            color: ThemeColors().textColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            Images.icClock,
                            height: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "10 - 15 mins",
                            size: 14,
                            color: ThemeColors().textColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/resurent_profile_star.png',
                            height: Get.height / 20,
                            width: Get.width / 8,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ThemeColors().whiteBlackColor,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(30+)',
                            style: TextStyle(
                              color: ThemeColors().textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'See Review',
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: Get.height / 15.5,
                      width: Get.width * 0.60,
                      decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: SmallText(
                          text: "More Details",
                          size: 15,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
