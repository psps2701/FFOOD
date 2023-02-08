import 'package:ffood/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/SideMenu/PaymentMethodController.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/big_text.dart';



class PaymentMethodScreen extends GetView<PaymentMethodController> {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.white, // Navigation bar
        statusBarColor: AppColors.statusBarGrey,
          statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark


        // Status bar
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor:ThemeColors().mainBgColor,
          body: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: getMargin(left: 10),
                      child: CustomBackButton()),
                  Expanded(child: Center(child: BigText(text: "Payment Method",color: ThemeColors().kPrimaryTextColor,))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    child: Container(
                      height: 38,
                      width: 38,

                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    width: 323,
                    height: 90,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ThemeColors().greyBlack),
                    child:                Center(child: BigText(text: "PAY WITH", size: 16,color: ThemeColors().lightDark,)),
                  ),

                  Positioned(
                    right: -0,
                    bottom: -15,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 70,
                      height: 55,
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: ThemeColors().outline),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: SizedBox(
                              width:19,
                              height: 19,
                              child: Image.asset("assets/payment_method_logo.png",)),
                        ),
                      ),

                    ),
                  ),

                  Positioned(
                    bottom: -20,
                    left: -10,
                    // right: 0,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 290,
                      height: 55,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: ThemeColors().mainBgColor,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: ThemeColors().themeBlack),
                      ),

                      child: GetX<PaymentMethodController>(

                        builder: (controller) {
                          return TabBar(

                              onTap: (value){
                                controller.index.value = value;
                                controller.index.refresh();
                              },
                              indicator: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(25.0)),
                              // labelColor: orangeColor,
                              unselectedLabelColor: orangeColor,
                              controller: controller.tabController,
                              tabs:  [
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: BigText(text: "Card", color: controller.index.value == 0 ? ThemeColors().kPrimaryTextColor:ThemeColors().kPrimaryTextColor,size: 14,),
                                      ),
                                      Image.asset("assets/pay_card_logo.png", width: 19,color: controller.index.value == 0 ? ThemeColors().kPrimaryTextColor:ThemeColors().kPrimaryTextColor,),


                                    ],),
                                ),
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: BigText(text: "Cash", color: controller.index.value == 1 ? ThemeColors().kPrimaryTextColor:ThemeColors().kPrimaryTextColor,size: 14,),
                                      ),
                                      Image.asset("assets/cash_logo.png", height: 14,color: controller.index.value == 1? ThemeColors().kPrimaryTextColor:ThemeColors().kPrimaryTextColor,),


                                    ],),
                                ),
                              ]);
                        }
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 75,),


              Expanded(child: Container()),

              Image.asset("assets/foodoma_bottom_logo.png",height: 44,),
              SizedBox(height: 10,)


            ],
          ),
        ),
      )
      ,
    );;
  }

}