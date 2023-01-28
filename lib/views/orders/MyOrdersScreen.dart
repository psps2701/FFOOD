
import 'package:ffood/views/orders/OrdersEmptyScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/orders/MyOrdersController.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/back_button.dart';
import '../../widgets/big_text.dart';
import '../../widgets/order_screens_widgets/history_card.dart';
import '../../widgets/order_screens_widgets/my_order_card.dart';



class MyOrdersScreen extends GetView<MyOrdersController>

{
  const MyOrdersScreen({super.key});

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
      child: SafeArea(child: Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        // onTap: navigateToHomeScreen,
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            width: 38,
                            height: 38,
                            margin: getMargin(left: 15,top: 10,bottom: 10),
                            // padding: EdgeInsets.symmetric(horizontal: 15),

                            child: CustomCard(
                              margin: 0,
                              child: Image.asset(Images.icBack, color: false ? Colors.white :Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: BigText(text: "My Orders"))),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
                        child: Container(
                          height: 38.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage(
                                "assets/sidemenuuser.png",
                              ),)
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: 55.h,
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: tabBorderColor),
                    ),
                    child: TabBar(
                        onTap: (index){
                          print(index);
                        },
                        indicator: BoxDecoration(
                            color: orangeColor,
                            borderRadius: BorderRadius.circular(25.0)),
                        // labelColor: orangeColor,
                        unselectedLabelColor: orangeColor,
                        controller: controller.tabController,
                        tabs: const [
                          Tab(
                            text: "Upcoming",
                          ),
                          Tab(
                            text: "History",
                          )
                        ]),
                  ),
                  controller.orders == 0 ?  const Expanded(child: OrdersEmptyScreen()):Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: (){
                                      // navigateToOrderDetail();

                                    },
                                    child: MyOrderCard()),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                                child: BigText(
                                  text: "Latest Orders",
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          child: HistoryCard()),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))),
    );;
  }

}